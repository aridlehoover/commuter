Feature:
  So I may plan my trip
  As a passenger
  I want to see station and departure information

  Background:
    Given I request a list of stations

  Scenario: Station List
    Then I see a list of stations

  Scenario: Station Departures
    When I request a list of departures for "EMBR"
    Then I should see the list of departures
