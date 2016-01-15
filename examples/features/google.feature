Feature: Google
  As a fate user, I can find fate on google and install it quickly

Scenario: I can find fate on the first page using simple keywords
  Given I am on "http://google.com"
  When I fill 'input[name=q]' with "vbrajon fate github"
  When I press ENTER
  When I wait 1s
  Then I should see "vbrajon/fate"

Scenario: I can navigate to the README
  When I click on '//*[text()="vbrajon/fate · GitHub"]'
  When I wait 1s
