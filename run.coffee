Yadda = require 'yadda'
chai = require 'chai'

global.expect = chai.expect
global.assert = chai.assert
global.should = chai.should()
Yadda.plugins.mocha.StepLevelPlugin.init()

dictionary = (new Yadda.Dictionary)
.define 'string', /"([^"]*)"/
.define 'element', /'([^']*)'/
.define 'constant', /([A-Z_]*)/
.define 'number', /(\d+)/, Yadda.converters.integer
.define 'list', /([^\u0000]*)/, Yadda.converters.list
.define 'table', /([^\u0000]*)/, Yadda.converters.table

library = Yadda.localisation.English.library dictionary
new (Yadda.FileSearch)('steps').each (file) ->
  require('./' + file).call library
new (Yadda.FeatureFileSearch)('features').each (file) ->
  featureFile file, (feature) ->
    scenarios feature.scenarios, (scenario) ->
      return unless scenario.annotations.define
      stepDefinition = new RegExp '^' + scenario.title + '$'
      library.define stepDefinition, (args..., done) ->
        steps = scenario.steps.map (step) ->
          step.replace /\$(\d)+/g, (match, number) ->
            args[number-1]
        yadda.run steps, done

yadda = Yadda.createInstance library

global.yadda = yadda
global.BASE_URL = process.env.BASE_URL || 'http://127.0.0.1'
global.BROWSER = process.env.BROWSER || 'chrome'

new (Yadda.FeatureFileSearch)('features').each (file) ->
  featureFile file, (feature) ->
    before require './hooks/before'
    beforeEach require './hooks/before-each'
    scenarios feature.scenarios, (scenario) ->
      return if scenario.annotations.define
      steps scenario.steps, (step, done) ->
        yadda.run step, done
    afterEach require './hooks/after-each'
    after require './hooks/after'
