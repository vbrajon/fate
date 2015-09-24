Yadda = require 'yadda'
chai = require 'chai'

global.expect = chai.expect
global.assert = chai.assert
global.should = chai.should()
Yadda.plugins.mocha.StepLevelPlugin.init()

dictionary = (new Yadda.Dictionary)
.define 'number', /(\d+)/, Yadda.converters.integer
.define 'list', /([^\u0000]*)/, Yadda.converters.list
.define 'table', /([^\u0000]*)/, Yadda.converters.table

library = Yadda.localisation.English.library dictionary
new (Yadda.FileSearch)('test/steps').each (file) ->
  require(__dirname + '/../' + file).call library

yadda = Yadda.createInstance library

global.context =
  BASE_URL: process.env.BASE_URL || 'http://127.0.0.1'
  yadda: yadda
  webdriverOptions:
    logLevel: 'silent'
    desiredCapabilities:
      browserName: process.env.BROWSER || 'chrome'

new (Yadda.FeatureFileSearch)('test/features').each (file) ->
  featureFile file, (feature) ->
    before (done) ->
      require(__dirname + '/hooks/before').call global.context, done

    beforeEach (done) ->
      require(__dirname + '/hooks/before-each').call global.context, done

    scenarios feature.scenarios, (scenario) ->
      steps scenario.steps, (step, done) ->
        yadda.run step, global.context, done

    afterEach (done) ->
      require(__dirname + '/hooks/after-each').call global.context, done

    after (done) ->
      require(__dirname + '/hooks/after').call global.context, done
