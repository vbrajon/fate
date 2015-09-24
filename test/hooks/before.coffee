WebdriverIO = require('webdriverio')

module.exports = (done) ->
  @browser = WebdriverIO.remote @webdriverOptions
  @browser.init().call done
