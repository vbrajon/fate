Feature: Matchpint Portal
  As a Pub, I should be able to login and add fixtures

Scenario:
  Given I am logged in with "francew@theodo.co.uk" "theodo"
  Then  I should see "Portal" in the title
  And   I should see "/available-fixtures" in the url
  And   I should see "AVAILABLE FIXTURES"
  When  I click on ".fixtures-list__fixture:nth-child(3) .action-button--plus:nth-child(1)"
  Then  I should see "1" in ".notifications-badge"
  When  I click on ".js-save"
  And   I wait 1s
  Then  I should see "/my-fixtures" in the url
