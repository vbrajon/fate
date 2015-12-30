pkg = require './package.json'
program = require 'commander'
program
.version pkg.version
.option '-t, --timeout [time]', 'Maximum timeout', parseInt, 20000
.option '-u, --url [url]', 'Base URL', '127.0.0.1'
.option '-b, --browser [browser]', 'Browser', 'firefox'
.option '-o, --browser-options [path]', 'Browser options'
.option '-f, --feature-folder [path]', 'Feature folder', 'test/features'
.parse process.argv

selenium = require 'selenium-standalone'
WebdriverIO = require 'webdriverio'
chai = require 'chai'
Mocha = require 'mocha'
mocha = new Mocha
  timeout: program.timeout
  slow: 200

if 'install' in program.args
  return selenium.install {}, (err, res) ->
    return console.error err if err
    return console.log 'Selenium driver installed: %s', Object.keys res

if program.featureFolder
  program.featureFolder = process.cwd() + '/' + program.featureFolder
if program.browser
  browserOptions =
    desiredCapabilities:
      browserName: program.browser
if program.browserOptions
  program.browserOptions = process.cwd() + '/' + program.browserOptions
  browserOptions = require program.browserOptions
if browserOptions.url
  program.url = browserOptions.url
if !/^http/.test program.url
  program.url = 'http://' + program.url

global.expect = chai.expect
global.assert = chai.assert
global.should = chai.should()
global.browser = WebdriverIO.remote browserOptions
global.program = program

if !browserOptions.host
  console.log 'Starting selenium'
  selenium.start {}, (err, child) ->
    mocha.addFile(__dirname + '/run').run (failures) ->
      child.kill()
else
  mocha.addFile(__dirname + '/run').run()
