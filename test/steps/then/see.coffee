module.exports = ->
  see = (text, element = 'body') ->
    re = new RegExp text
    browser
    .waitForExist element
    .getText element
    .then (result) ->
      result.should.match re
    .call done

  @then /^I should see $string$/, (text, done) ->
    see text, null, done

  @then /^I should see $string in $string$/, (text, element, done) ->
    see text, element, done
