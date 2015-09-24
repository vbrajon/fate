module.exports = ->
  @when /^I execute "$string"$/, (script, done) ->
    browser
    .executeScript script
    .then done
