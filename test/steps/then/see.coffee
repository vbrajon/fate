module.exports = ->
  @then /^I should( not)? see $string$/, (negative, text, done) ->
    yadda.run step + " in 'body'", done

  @then /^I should( not)? see $string in $element$/, (negative, text, element, done) ->
    re = new RegExp text
    browser
    .waitForExist element, 2000
    .getText element
    .then (result) ->
      if negative
        result.should.not.match re
      else
        result.should.match re
    .call done

  @then /^I should( not)? see $string in the url$/, (negative, path, done) ->
    if /^http/.test path
      url = path
    else
      url = BASE_URL + path

    browser
    .url (err, result) ->
      should.not.exist err
      if negative
        result.value.should.not.equal url
      else
        result.value.should.equal url
    .call done

  @then /^I should( not)? see $string in the title$/, (negative, title, done) ->
    browser
    .getTitle (err, result) ->
      should.not.exist(err);
      if negative
        result.should.not.equal title
      else
        result.should.equal title
    .call done
