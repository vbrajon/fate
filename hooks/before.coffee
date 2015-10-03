WebdriverIO = require 'webdriverio'

module.exports = (done) ->
  if BROWSER == 'SAUCE'
    options = require './browser/sauce-options'
  else
    options = require './browser/options'
  global.browser = WebdriverIO.remote options
  browser.init().call done
