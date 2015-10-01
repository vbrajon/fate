module.exports = ->
  @when /^I fill $element with $string$/, (element, value, done) ->
    browser
    .setValue element, value
    .call done
