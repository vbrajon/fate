module.exports = ->
  @when /^I press ENTER$/, (constant, done) ->
    browser
    .keys 'ENTER'
    .call done
