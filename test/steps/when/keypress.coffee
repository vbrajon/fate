module.exports = ->
  @when /^I press "$string"$/, (key, done) ->
    browser.actions().sendKeys(protractor.Key[key]).perform().then done
