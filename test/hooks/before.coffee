WebdriverIO = require('webdriverio')

module.exports = (done) ->
  if BROWSER == 'SAUCE'
    webdriverOptions =
      logLevel: 'silent'
      host: 'ondemand.saucelabs.com'
      port: 80
      user: process.env.SAUCE_USERNAME
      key: process.env.SAUCE_ACCESS_KEY
      desiredCapabilities:
        platform: 'Windows 7'
        browserName: 'chrome'
        version: '45'
        name: process.env.SAUCE_TESTNAME
        tags: []
  else
    webdriverOptions =
      logLevel: 'silent'
      desiredCapabilities:
        browserName: BROWSER

  global.browser = WebdriverIO.remote webdriverOptions
  global.browser.init().call done
