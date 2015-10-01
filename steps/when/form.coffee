module.exports = ->
  @when /^I submit $element$/, (element, done) ->
    browser
    .submitForm element
    .call done
