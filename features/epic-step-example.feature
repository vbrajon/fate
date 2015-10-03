Feature: Epic step example
  As a tester, I can see how to define a sub step

Scenario: Epic steps
  Run stuff with
  ---
  [1] - "/"
  [2] - "HTML5 Test Page"
  [3] - "blublu"
  [4] - '#top > header > h1'
  ---
  Run Sophie's step with secret - this is a super complex password
  Run Sophie's step with
  ---
  secret - this is a super complex password
  [type="password"] - [type="search"]
  Then I should not see "?" in the url - When I wait 100ms
  ---

@exclude
Scenario: Run stuff
  Given I am on [1]
  Then I should not see [3] in [4]
  Then I should see [2] in [4]

Scenario: Run Sophie's step
  Given I am on the homepage
  When I click on 'a[href="#forms__input"]'
  When I fill the form 'form' with
  ---
  '[type="password"]' - "secret"
  '[type="url"]' - "http://me.com"
  '[type="tel"]' - "0123456789"
  ---
  Then I should not see "?" in the url
