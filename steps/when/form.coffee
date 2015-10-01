module.exports = ->
  @when /^I submit the form$/, (done) ->
    browser
    .submitForm 'form'
    .call done
