module.exports = ->
  @given /^I am on the homepage$/, (done) ->
    browser
    .url program.url
    .call done

  @given /^I am on $string$/, (path, done) ->
    if /^http/.test path
      url = path
    else
      url = program.url + path
    browser
    .url url
    .call done
