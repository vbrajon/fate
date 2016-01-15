pkg = require './package'
program = require 'commander'
colors = require 'colors'

program
.version pkg.version
.option '-v, --verbose', 'Verbose'
.option '-c, --config <path>', 'Config file', 'test/fate-config'
.option '-f, --features <path>', 'Features folder', 'test/features'
.option '-s, --steps <path>', 'Steps folder', 'test/steps'
.option '-hk, --hooks <path>', 'Hooks folder', 'test/hooks'
.option '-u, --base-url [url]', 'Base URL', '127.0.0.1'
.option '-b, --browser [browser]', 'Browser', 'firefox'
.option '-t, --timeout [time]', 'Maximum timeout', parseInt, 20000
.on '--help', ->
  console.log """
  \  Commands:

      # Install [Global]
      sudo npm install -g fatest
      sudo fate # 1st time it will download selenium then you are good to go

      # Install [Local]
      npm install fatest

      # Default options:
      fate -f test/features/ -s test/steps -hk /test/hooks -u 127.0.0.1 -b firefox -t 20000

      # Simple example:
      mkdir -p test/features/
      cd test/features/
      curl -O https://raw.githubusercontent.com/vbrajon/fate/master/examples/features/google.feature
      cd -
      fate -b chrome

  """
.parse process.argv

error = (txt, args...) ->
  console.error colors.red(txt), args
log = (txt, args...) ->
  if program.verbose
    console.log colors.yellow(txt), args

sh = require 'shelljs'
sh.config.silent = true
sh.ls program.features
if sh.error()
  error 'Your feature folder %s is empty !', program.features
  return program.help()

# Normalize Config
try
  config = require program.config
catch
  config = {}

config.features ?= program.features
config.steps ?= program.steps
config.hooks ?= program.hooks
config.timeout ?= program.timeout
config.baseUrl ?= program.baseUrl
config.baseUrl = 'http://' + config.baseUrl unless /^http/.test config.baseUrl
config.desiredCapabilities ?=
  browserName: program.browser

log 'config', config

selenium = require 'selenium-standalone'
WebdriverIO = require 'webdriverio'
chai = require 'chai'
Mocha = require 'mocha'
mocha = new Mocha
  timeout: config.timeout
  slow: 200

global.expect = chai.expect
global.assert = chai.assert
global.should = chai.should()
global.browser = WebdriverIO.remote config
global.config = config

if config.host
  log 'Running tests'
  return mocha.addFile(__dirname + '/run').run()

log 'Installing selenium'
selenium.install {}, (err, res) ->
  return error err if err
  log 'Starting selenium'
  selenium.start {}, (err, child) ->
    return error err if err
    log 'Running tests'
    return mocha.addFile(__dirname + '/run').run (failures) ->
      child.kill()
