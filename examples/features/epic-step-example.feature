Feature: Epic step examples
  As a tester, I can see how to define a sub step

@exclude
Scenario: Run stuff
  Given I am on [1]
  Then I should not see [3] in [4]
  Then I should see [2] in [4]

Scenario: Epic steps - Excluded step with fixed parameters
  Run stuff with
  ---
  [1] - "/"
  [2] - "HTML5 Test Page"
  [3] - "blublu"
  [4] - '#top > header > h1'
  ---

Scenario: Basic Form submission
  Given I am on the homepage
  When I click on 'a[href="#forms__input"]'
  When I submit 'form' with
  ---
  '[type="password"]' - "secret"
  '[type="url"]' - "http://me.com"
  '[type="tel"]' - "0123456789"
  ---
  Then I should not see "?" in the url

Scenario: Basic Form submission - Multiple times
  Basic Form submission with secret - this is a super complex password
  Basic Form submission with
  ---
  secret - this is a super complex password too
  [type="password"] - [type="search"]
  Then I should not see "?" in the url - When I wait 100ms
  ---
