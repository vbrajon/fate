Yadda = require 'yadda'
chai = require 'chai'

global.expect = chai.expect
global.assert = chai.assert
global.should = chai.should()
Yadda.plugins.mocha.StepLevelPlugin.init()

dictionary = (new Yadda.Dictionary)
.define 'string', /"([^"]*)"/
.define 'number', /(\d+)/, Yadda.converters.integer
.define 'list', /([^\u0000]*)/, Yadda.converters.list
.define 'table', /([^\u0000]*)/, Yadda.converters.table

library = Yadda.localisation.English.library dictionary
new (Yadda.FileSearch)('test/steps').each (file) ->
  require(__dirname + '/../' + file).call library

yadda = Yadda.createInstance library

global.yadda = yadda
global.BASE_URL = process.env.BASE_URL || 'http://127.0.0.1'
global.BROWSER = process.env.BROWSER || 'chrome'

new (Yadda.FeatureFileSearch)('test/features').each (file) ->
  featureFile file, (feature) ->
    before require './hooks/before'
    beforeEach require './hooks/before-each'
    scenarios feature.scenarios, (scenario) ->
      steps scenario.steps, (step, done) ->
        yadda.run step, done
    afterEach require './hooks/after-each'
    after require './hooks/after'
