Feature: List Step Definitions
  As a tester, I can see steps that I can use in my test case

Scenario: Steps
  Given I am on "http://127.0.0.1:8000"
  Given I am on "/html5"
  Given I am on the homepage
  When I click on 'a[href="#forms__input"]'
  When I fill '#input__text' with "Text"
  When I press ENTER
  When I go fullscreen
  When I set the window size to "1024x800"
  When I set the page size to "1024x800"
  When I wait 1s
  When I wait 10ms
  Then I should see "HTML5 Test" in the title
  Then I should not see /^HTML5 Test$/ in 'h1'
  Then I should see /HTML5 T.../
  Then I should not see /This doesn't match/ in 'header'
  # Spaces in regex are automatically transformed by [\s\S]
