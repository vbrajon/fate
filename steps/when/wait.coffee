module.exports = ->
  @when /^I wait $number(s|ms)$/, (time, unit, done) ->
    time = time * 1000 if unit == 's'
    browser
    .pause time
    .call done
