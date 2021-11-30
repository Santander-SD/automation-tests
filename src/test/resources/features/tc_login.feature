#language: en
#enconding: UTF-8
@login
Feature: Login

  Background:
    Given are on the application's login page

  Scenario Outline: Login into the application
    When select the country <country>
    And select if the option <optionAcess>
    And fill in the documentation field with the document number <documentation>
    And click on button ingressar
    And and when loading a page I inform the <password>
    Then check if the login to the application was performed, observing the following <message>

    Examples:
      | country     | optionAcess               | documentation | password | message                         |
      | 'Argentina' | "I ready have an account" | "33850984"    | "123456" | "¡Atención, datos incorrectos!" |
      | 'Argentina' | "I ready have an account" | "33850984"    | "192837" | "Saldo actual" |

