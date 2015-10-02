Feature: List Step Definitions

Scenario:
  Given I am on "http://cbracco.github.io/html5-test-page/"
  Given I am on the homepage
  Given I am on "/html5-test-page"
  When I click on 'a[href="#forms__input"]'
  When I fill '#input__text' with "Text"
  When I press ENTER
  When I fill the form 'form' with
  ------------
  element | value
  [type="password"] | secret
  [type="url"] | http://me.com
  [type="tel"] | 0123456789
  #input__text3 | Error! This line is considered a comment
  ------------
  When I submit the form 'form'
  When I go fullscreen
  When I set the window size to "1024x800"
  When I set the page size to "1024x800"
  When I wait 1s
  When I wait 100ms
  # Partial match
  Then I should see "HTML5 T"
  Then I should not see "This doesn't match" in 'header'
  # Exact match
  Then I should not see "/html5-test-page/?" in the url
  Then I should see "HTML5 Test Page" in the title
