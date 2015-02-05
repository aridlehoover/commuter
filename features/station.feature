Feature:
  So I may plan my trip
  As a passenger
  I want to see station information

  Scenario: Station List
    When I request a list of stations
    Then I see a list of stations

  Scenario: Station Information
    When I request station information for "PHIL"
    Then I see station information for "PHIL"
