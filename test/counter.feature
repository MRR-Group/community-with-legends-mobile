Feature: Counter
  Scenario: Initial counter value is 0
    Given The app is running
    Then I see {"0"} text

  Scenario: Counter increments value on click
    Given The app is running
    Then I see {"0"} text
    Then I tap {Icons.add} icon
    Then I see {"1"} text
    Then I tap {'Increment'} tooltip
    Then I see {"2"} text
