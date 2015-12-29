module.exports =
  host: 'ondemand.saucelabs.com'
  port: 80
  user: process.env.SAUCE_USERNAME
  key: process.env.SAUCE_ACCESS_KEY
  logLevel: 'silent'
  desiredCapabilities:
    # platform: 'Windows 7'
    # browserName: 'chrome'
    # version: '45'
    # name: feature.title
    # tags: []
    platform: 'Windows XP'
    browserName: 'internet explorer'
    version: '8.0'
    name: feature.title
    tags: []
    # platform: 'OS X 10.10'
    # browserName: 'firefox'
    # version: '40.0'
    # name: feature.title
    # tags: []
    # TODO: make it work on iphone (appium required ?)
    # platform: 'OS X 10.10'
    # browserName: 'iphone'
    # deviceName: 'iPhone 6 Plus'
    # deviceOrientation: 'portrait'
    # version: '9.0'
    # name: feature.title
    # tags: []
