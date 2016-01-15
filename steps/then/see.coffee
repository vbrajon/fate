module.exports = ->
  @then /^I should( not)? see $string$/, (negative, text, done) ->
    yadda.run @step + " in 'body'", done

  @then /^I should( not)? see $regex$/, (negative, text, done) ->
    yadda.run @step + " in 'body'", done

  @then /^I should( not)? see $string in $element$/, (negative, text, element, done) ->
    step = @step.replace '"' + text + '"', new RegExp text
    yadda.run step, done

  @then /^I should( not)? see $string in the url$/, (negative, path, done) ->
    if /^http/.test path
      url = path
    else
      url = config.baseUrl + path
    step = @step.replace '"' + path + '"', new RegExp url
    yadda.run step, done

  @then /^I should( not)? see $string in the title$/, (negative, title, done) ->
    step = @step.replace '"' + title + '"', new RegExp title
    yadda.run step, done

  @then /^I should( not)? see $regex in $element$/, (negative, regex, element, done) ->
    browser
    .waitForExist element, 2000
    .getText element
    .then (result) ->
      if negative
        result.should.not.match regex
      else
        result.should.match regex
    .call done

  @then /^I should( not)? see $regex in the url$/, (negative, regex, done) ->
    browser
    .url (err, result) ->
      should.not.exist err
      return result.value
    .then (result) ->
      if negative
        result.should.not.match regex
      else
        result.should.match regex
    .call done

  @then /^I should( not)? see $regex in the title$/, (negative, regex, done) ->
    browser
    .getTitle (err, result) ->
      should.not.exist err
      return result
    .then (result) ->
      if negative
        result.should.not.match regex
      else
        result.should.match regex
    .call done
