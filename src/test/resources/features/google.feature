#language: en
#enconding: UTF-8
Feature: Google

  Scenario: Access Google Page
    Given I open google page
    When set search field
    And click on button search
    Then I see results of search
