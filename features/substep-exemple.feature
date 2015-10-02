Feature: Substep Exemple
  As a tester, I can see how to define a sub step

@define
Scenario: Given I am on $1 seing $2 but not $3 inside $4
  Given I am on $1
  Then I should not see $3 in $4
  Then I should see $2 in $4
