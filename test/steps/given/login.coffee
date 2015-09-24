module.exports = ->
  # @context is an instance of Yadda.Library
  @given /^I am logged in with "$string" "$string"$/, (username, password, done) ->
    # @context is an object with a browser property instanciated during before hook
    @yadda.run 'Given I am on the homepage', @, ->

    browser
    # Check is already logged
    .url (err, result) =>
      unless result.value == BASE_URL + '/login'
        @yadda.run 'Given I am logged out"', @, ->
    # User logged out and on the login page
    .setValue '[name="email"]', username
    .setValue '[name="password"]', password
    .submitForm 'form'
    .call done
