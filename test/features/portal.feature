Feature: Matchpint Portal
  As a Pub, I should be able to login and add fixtures

Scenario:
  #Then  I should see "1" in ".notifications-badge"
  Given I am logged in with "dom@matchpint.co.uk" "matchpint"
  #Then  I should see "AVAILABLE FIXTURES"
  #When  I click on ".fixtures-list__fixture:nth-child(3) .action-button--plus:nth-child(1)"
  #Then  I should see "1" in ".notifications-badge"
  #And   I wait 5s
  #Then  I should be redirected to "/login"
  #And   I expect that the title is "Matchpint Portal"
  #When  I add "dom@matchpint.co.uk" to the inputfield "[name="email"]"
  #And   I add "matchpint" to the inputfield "[name="password"]"
  #And   I submit the form "form"
  #Then  I expect that the url is "http://portal.matchpint.co.uk/available-fixtures"
  #And   I pause for 5000ms
