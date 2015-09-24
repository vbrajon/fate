module.exports = ->
  @when /^I fill "$string" with "$string"$/, (element, value, done) ->
    browser
    .setValue element, value
    .call done
