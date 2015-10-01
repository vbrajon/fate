module.exports = ->
  @when /^I press ENTER$/, (done) ->
    # U+E007
    browser
    .keys ''
    .call done
