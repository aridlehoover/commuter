Feature:
  So that I may plan my ride
  As a BART passenger
  I want to see a list of departures at a specific station

  Scenario:
    Given I request a list of stations
    When I request a list of departures for "EMBR"
    Then I should see the list of departures
