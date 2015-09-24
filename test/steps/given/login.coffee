module.exports = ->
  @given /^I am logged out$/, (done) ->
    browser.deleteCookie().call done

  @given /^I am logged in with $string $string$/, (username, password, done) ->
    yadda.run 'Given I am logged out', ->
    yadda.run 'And I am on the homepage', ->

    browser
    # User logged out and on the login page
    .setValue '[name="email"]', username
    .setValue '[name="password"]', password
    .submitForm 'form'
    .call done
