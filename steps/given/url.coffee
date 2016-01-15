module.exports = ->
  @given /^I am on the homepage$/, (done) ->
    yadda.run 'Given I am on "/"', done

  @given /^I am on $string$/, (url, done) ->
    browser
    .url url
    .call done
