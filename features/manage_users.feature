Feature: Manage Users
  In order to Increase Revenue from mullets & sponsors
  As a Board
  I want guests
  To be able to log in and create profiles to participate in MyMullet

Scenario: Sign up user
  Given I am on the homepage
  And I follow "Sign Up"
  Then I should see "Join MyMullets.org"
  
Scenario Outline: title
  Given I am on the new user page
  When I fill in "Login" with "<login>"
  When I fill in "Email" with "<email>"
  And I fill in "Password" with "<password>"
  And I fill in "Password Confirmation" with "<confirmation>"
  And I press "Register"
  Then I should <action>
  
  Examples:
      | login | email               | password | confirmation | action              |
      |       | glenn@glenn.com     | password | password     | not see "Dashboard" |
      | glenn |                     | password | password     | not see "Dashboard" |
      | glenn | glenn@glenn.com     |          | password     | not see "Dashboard" |
      | glenn | glenn@glenn.com     | password |              | not see "Dashboard" |
      | glenn | glenn@glenn.com     | pass     | pass         | not see "Dashboard" |
      | glenn | glenn_invalid_email | password | password     | not see "Dashboard" |
      | glenn | glenn@glenn.com     | password | password     | see "Dashboard"     |