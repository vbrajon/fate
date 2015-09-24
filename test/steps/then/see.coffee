module.exports = ->
  @then /^I should see "$STRING"*$/, (text, done) ->
    element = 'body'
    re = new RegExp text

    @browser
    .waitForExist element
    .getText element
    .then (result) ->
      result.should.match re
    .call done
