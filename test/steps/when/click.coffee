module.exports = ->
  @when /^I click on $element$/, (element, done) ->
    browser
    .click element
    .call done
