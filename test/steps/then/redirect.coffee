module.exports = ->
  @then /^I should( not)* be redirected to "$string"$/, (negative, path, done) ->
    if /^http/.test path
      url = path
    else
      url = @BASE_URL + path

    @browser.url (err, result) ->
      should.not.exist err
      if negative
        result.value.should.not.equal url, 'expected url not to be ' + result.value
      else
        result.value.should.equal url, 'expected url to be "' + result.value + '"  but found "' + url + '"'
    .call done
