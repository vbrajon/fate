Yadda = require 'yadda'
Yadda.plugins.mocha.StepLevelPlugin.init()

# Dictionary
text2matrix = (text, next) ->
  Yadda.converters.list text, (err, list) ->
    next null, list.map (line) ->
      line.split(' - ')
text2regex = (text, next) ->
  next null, new RegExp text.replace(/ /g, '[\\s\\S]'), 'i'
dictionary = (new Yadda.Dictionary)
.define 'string', /"([^"]*)"/
.define 'element', /'([^']*)'/
.define 'constant', /([A-Z_]*)/
.define 'regex', /\/(.*)\//, text2regex
.define 'matrix', /[\ \n]?([^\u0000]*)/, text2matrix
.define 'number', /(\d+)/, Yadda.converters.integer

# Library
library = Yadda.localisation.English.library dictionary
new (Yadda.FileSearch)(__dirname + '/steps').each (file) ->
  require(file).call library
new (Yadda.FeatureFileSearch)(config.features).each (file) ->
  featureFile file, (feature) ->
    scenarios feature.scenarios, (scenario) ->
      stepDefinition = new RegExp '^' + scenario.title + ' with$matrix'
      library.define stepDefinition, (matrix, done) ->
        steps = scenario.steps.map (step) ->
          matrix.forEach (line) ->
            step = step.replace line[0], line[1]
          step
        yadda.run steps, done

global.yadda = Yadda.createInstance library

# Scenarios
new (Yadda.FeatureFileSearch)(config.features).each (file) ->
  featureFile file, (feature) ->
    before require __dirname + '/hooks/before'
    beforeEach require __dirname + '/hooks/before-each'
    scenarios feature.scenarios, (scenario) ->
      return if scenario.annotations.exclude
      steps scenario.steps, (step, done) ->
        yadda.run step, done
    afterEach require __dirname + '/hooks/after-each'
    after require __dirname + '/hooks/after'
