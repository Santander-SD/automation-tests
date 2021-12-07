#language: en
#enconding: UTF-8
@login
Feature: Login

  Background:
    Given are on the application's login page

  Scenario Outline: Login - TC - 001 - 003 - ID60 - Success_Flow_I_Standard_Flow_of_Success - ID63 - Exception_Flow_I_Incorrect_password - ID64 - Exception_Flow_II_Incorrect_Document_number  
    When select the country <country>
    And select if the option <optionAcess>
    And fill in the documentation field with the document number <documentation>
    And click on button ingressar
    And loading a page I inform the <password>
    Then check if the login to the application was performed, observing the following <message>


    @ID63_Exception_Flow_I_Incorrect_password
    Examples:
      | country     | optionAcess               | documentation | password | message                         |
      | 'Argentina' | "I ready have an account" | "33850984"    | "123456" | "¡Atención, datos incorrectos!" |

    @ID64_Exception_Flow_II_Incorrect_Document_number
    Examples:
      | country     | optionAcess               | documentation | password | message                         |
      | 'Argentina' | "I ready have an account" | "00001111"    | "123456" | "¡Atención, datos incorrectos!" |

    @ID60_Success_Flow_I_Standard_Flow_of_Success
    Examples:
      | country     | optionAcess               | documentation | password | message        |
      | 'Argentina' | "I ready have an account" | "33850984"    | "192837" | "Saldo actual" |


  @ID65_Exception_Flow_III_Incorrect_Country
  Scenario Outline: Login - TC - 004 - ID65 - Exception Flow III Incorrect Country
    When select the country <country>
    And select if the option <optionAcess>
    And fill in the documentation field with the document number <documentation>
    And click on button ingressar
    Then the operation will not be continued, as the igress button will not be enabled <button enabled>

    Examples:
      | country   | optionAcess               | documentation | button enabled |
      | 'Uruguay' | "I ready have an account" | "00001111"    | "false"        |

  @ID69_Validate_"eye"_button_to_view_the_entered_password
  Scenario Outline: Login - TC - 005 - ID69 - Validate "eye" button to view the entered password
    When select the country <country>
    And select if the option <optionAcess>
    And fill in the documentation field with the document number <documentation>
    And click on button ingressar
    And enter the <password> and click on the eye <show password>
    Then the password entered will be displayed to verify <password_entered>

    Examples:
      | country     | optionAcess               | documentation | password | show password | password_entered |
      | 'Argentina' | "I ready have an account" | "33850984"    | "12345"  | "true"        | "12345"          |

  @ID70_Remember_my_password
  Scenario Outline: Login - TC - 006 -ID70 - Remember my password
    When select the country <country>
    And select if the option <optionAcess>
    And fill in the documentation field with the document number <documentation>
    And enable the button Remember my password
    Then the button will be enabled <enableButton>

    Examples:
      | country     | optionAcess               | documentation | enableButton |
      | 'Argentina' | "I ready have an account" | "33850984"    | 'true'       |

  @ID68_Validate_"I_forgot_my_password"_button
  Scenario Outline: Login - TC - 007 - ID68 - Validate "I forgot my password" button
    When select the country <country>
    And select if the option <optionAcess>
    And fill in the documentation field with the document number <documentation>
    And click on button ingressar
    And password, an iteration will be performed with a click on I forgot my password button
    Then a popup opens and displays the <message>

    Examples:
      | country     | optionAcess               | documentation | message                        |
      | 'Argentina' | "I ready have an account" | "33850984"    | '¿No recuerdas tu contraseña?' |

  @ID62_Success_Flow_III_Password_successfully_blocked_after_three_incorrect_attempts
  Scenario Outline: Login - TC - 008 - ID62 - Success Flow III - Password successfully blocked after three incorrect attempts
    When select the country <country>
    And select if the option <optionAcess>
    And fill in the documentation field with the document number <documentation>
    And click on button ingressar
    And loading a page I inform the <password>, incorrect three <repeatPassword> attempt
    Then the password will be locked <message>

    Examples:
      | country     | optionAcess               | documentation | password | repeatPassword | message |
      | 'Argentina' | "I ready have an account" | "33850984"    | "192536" | 3              | "true"  |

  @ID66_Success_Flow_IV_Data_successfully_recalled_after_first_login
  Scenario Outline: Login - TC - 009 - ID66 - Success Flow IV - Data successfully recalled after first login
    When select the country <country>
    And select if the option <optionAcess>
    And fill in the documentation field with the document number <documentation>
    And click on button ingressar
    And password, an iteration will be performed with a click on I forgot my password button
    And click button create a new password
    And an email will be sent containing information to create a new password <messageOmScreen>
    And entering the email, check if it was sent, click on the link and follow the steps
    Then the operation ends with the creation of a new password <new_password>

    Examples:
      | country     | optionAcess               | documentation | messageOmScreen                                     | new_password       |
      | 'Argentina' | "I ready have an account" | "33850984"    | "Te enviamos un email para que crees tu contraseña" | 'new_password.txt' |

  @ID67_Scenario:_Validate_show_ARG_password
  Scenario Outline: Login - TC - 010 - ID67 - Scenario:_Validate_show_ARG_password
    When select the country <country>
    And select if the option <optionAcess>
    And fill in the documentation field with the document number <documentation>
    And click on button ingressar
    And i enter the <password> and click on the eye <show password>
    Then check if the login to the application was performed, observing the following  <message>

    Examples:
      | country     | optionAcess               | documentation | password           | show password | message   |
      | 'Argentina' | "I ready have an account" | "33850984"    | "new_password.txt" | "true"        | "new_password.txt" |

  @ID61_Success_Flow_II_Login_successfully_after_unlocked_password
  Scenario Outline: Login - TC - 011 - ID61 - Success Flow II - Login successfully after unlocked password
    When select the country <country>
    And select if the option <optionAcess>
    And fill in the documentation field with the document number <documentation>
    And click on button ingressar
    And insert the new password
    Then check if the login to the application was performed, observing the following <message>

    Examples:
      | country     | optionAcess               | documentation | password         | message        |
      | 'Argentina' | "I ready have an account" | "33850984"    | new_password.txt | "Saldo actual" |

  @ID71_Create_alias
  Scenario Outline: Login - TC - 012 - ID71 - Create alias
    When select the country <country>
    And select if the option <optionAcess>
    And fill in the documentation field with the document number <documentation>
    And click on button ingressar
    And loading a page I inform the <password>
    And i access my browser profile until the nickname is created, I enter the <newNickname> and click on the create button
    And a message to validate the creation is sent to the cell phone <messageMobile>
    Then the nickname was created <nickname>

    Examples:
      | country     | optionAcess               | documentation | password | newNickname     | messageMobile                              | nickname        |
      | 'Argentina' | "I ready have an account" | "33850984"    | "192837" | "TestAutomated" | "Confirma esta operación desde tu celular" | "TestAutomated" |


  @ID72_Show_menu_alias_after_login
  Scenario Outline: Login - TC - 013 - ID72 - Show menu alias after login
    When select the country <country>
    And select if the option <optionAcess>
    And fill in the documentation field with the document number <documentation>
    And click on button ingressar
    And loading a page I inform the <password>
    Then check if the login to the application was performed, Show menu <nickName>

    Examples:
      | country     | optionAcess               | documentation | password | nickName        |
      | 'Argentina' | "I ready have an account" | "33850984"    | "192837" | "TestAutomated" |

  @logout
  Scenario Outline: Login - TC - 014 - 015 - ID73 - happy path logout - ID74 - logout_with_valid_user
    When select the country <country>
    And select if the option <optionAcess>
    And fill in the documentation field with the document number <documentation>
    And click on button ingressar
    And loading a page I inform the <password>
    And accessing the user profile menu and choosing the option to complete the assignment and <confirm> the request
    Then will be redirected to main page to login <messageHomeLogin>

    @ID74_happy_path_logout
    Examples:
      | country     | optionAcess               | documentation | password | confirm | messageHomeLogin                                |
      | 'Argentina' | "I ready have an account" | "33850984"    | "192837" | "true"  | "¡Hola! Llegamos para hacer tu vida más simple" |

    @ID75_logout_with_valid_user
    Examples:
      | country     | optionAcess               | documentation | password | confirm | messageHomeLogin      |
      | 'Argentina' | "I ready have an account" | "33850984"    | "192837" | "false" | "SC\nSilva Cristiano" |
