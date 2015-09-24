module.exports = ->
  see = (negative, text, element, done) ->
    re = new RegExp text
    browser
    .waitForExist element
    .getText element
    .then (result) ->
      if negative
        result.should.not.match re
      else
        result.should.match re
    .call done

  @then /^I should( not)* see $string$/, (negative, text, done) ->
    see negative, text, 'body', done

  @then /^I should( not)* see $string in $string$/, (negative, text, element, done) ->
    see negative, text, element, done

  @then /^I should( not)* see $string in the url$/, (negative, path, done) ->
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

  @then /^I should( not)* see $string in the title$/, (negative, title, done) ->
    browser
    .getTitle (err, result) ->
      should.not.exist(err);
      if negative
        result.should.not.equal title
      else
        result.should.equal title
    .call done
