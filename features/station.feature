Feature:
  So I may plan my trip
  As a passenger
  I want to see station information

  Scenario: All stations
    Given I request a list of stations
    Then I see a list of stations

  Scenario: One station
    Given I request station information for "PHIL"
    Then I see station information for "PHIL"
