module.exports = ->
  @when /^I click on $string$/, (element, done) ->
    browser
    .click element
    .call done
