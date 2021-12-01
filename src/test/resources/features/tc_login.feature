#language: en
#enconding: UTF-8
@login
Feature: Login

  Background:
    Given are on the application's login page

  Scenario Outline: Login - TC - 001 .. 003 - Into the application
    When select the country <country>
    And select if the option <optionAcess>
    And fill in the documentation field with the document number <documentation>
    And click on button ingressar
    And and when loading a page I inform the <password>
    Then check if the login to the application was performed, observing the following <message>

    @Success_Flow_I_Standard_Flow_of_Success
    Examples:
      | country     | optionAcess               | documentation | password | message        |
      | 'Argentina' | "I ready have an account" | "33850984"    | "192837" | "Saldo actual" |

    @Exception_Flow_I_Incorrect_password
    Examples:
      | country     | optionAcess               | documentation | password | message                         |
      | 'Argentina' | "I ready have an account" | "33850984"    | "123456" | "¡Atención, datos incorrectos!" |

    @Exception_Flow_II_Incorrect_Document_number
    Examples:
      | country     | optionAcess               | documentation | password | message                         |
      | 'Argentina' | "I ready have an account" | "00001111"    | "123456" | "¡Atención, datos incorrectos!" |

  @Exception_Flow_III_Incorrect_Country
  Scenario Outline: Login - TC - 004 - Exception Flow III Incorrect Country
    When select the country <country>
    And select if the option <optionAcess>
    And fill in the documentation field with the document number <documentation>
    And click on button ingressar
    Then the operation will not be continued, as the igress button will not be enabled <button enabled>

    Examples:
      | country   | optionAcess               | documentation | button enabled |
      | 'Uruguay' | "I ready have an account" | "00001111"    | "false"        |

  @Validate_"eye"_button_to_view_the_entered_password
  Scenario Outline: Login - TC - 005 - Validate "eye" button to view the entered password
    When select the country <country>
    And select if the option <optionAcess>
    And fill in the documentation field with the document number <documentation>
    And click on button ingressar
    And ienter the <password> and click on the eye <show password>
    Then the password entered will be displayed to verify <password_entered>

    Examples:
      | country     | optionAcess               | documentation | password | show password | password_entered |
      | 'Argentina' | "I ready have an account" | "33850984"    | "12345"  | "true"        | "12345"          |

  @Remember_my_password
  Scenario Outline: Login - TC - 006 - Remember my password
    When select the country <country>
    And select if the option <optionAcess>
    And fill in the documentation field with the document number <documentation>
    And enable the button Remember my password
    Then the button will be enabled <enableButton>

    Examples:
      | country     | optionAcess               | documentation | enableButton |
      | 'Argentina' | "I ready have an account" | "33850984"    | 'true'       |

  @Validate_"I_forgot_my_password"_button
  Scenario Outline: Login - TC - 007 - Validate "I forgot my password" button
    When select the country <country>
    And select if the option <optionAcess>
    And fill in the documentation field with the document number <documentation>
    And click on button ingressar
    And password, an iteration will be performed with a click on I forgot my password button
    Then a popup opens and displays the <message>

    Examples:
      | country     | optionAcess               | documentation | message                        |
      | 'Argentina' | "I ready have an account" | "33850984"    | '¿No recuerdas tu contraseña?' |
