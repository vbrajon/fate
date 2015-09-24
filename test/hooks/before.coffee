WebdriverIO = require('webdriverio')

module.exports = (done) ->
  webdriverOptions =
    logLevel: 'silent'
    desiredCapabilities:
      browserName: BROWSER

  global.browser = WebdriverIO.remote webdriverOptions
  global.browser.init().call done
