Feature: List Step Definitions
  As a tester, I can see steps that I can use in my test case

Scenario: Steps
  Given I am on "http://127.0.0.1"
  Given I am on "/html5"
  Given I am on the homepage
  When I click on 'a[href="#forms__input"]'
  When I fill '#input__text' with "Text"
  When I submit 'form' with
  ---
  '[type="password"]' - "secret"
  '[type="url"]' - "http://me.com"
  '[type="tel"]' - "0123456789"
  #input__text3 - Error! This line is considered a comment
  '#input__text3' - "This line is not considered a comment"
  ---
  When I submit 'form'
  When I press ENTER
  When I go fullscreen
  When I set the window size to "1024x800"
  When I set the page size to "1024x800"
  When I wait 1s
  When I wait 10ms
  # Partial match
  Then I should see /HTML5 T/
  Then I should see /127.0.0.1/ in the url
  Then I should not see /This doesn't match/ in 'header'
  # Exact match
  Then I should not see "HTML5 T"
  Then I should not see "/html5?" in the url
  Then I should see "HTML5 Test Page" in the title
