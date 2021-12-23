#language: en
#enconding: UTF-8
@Recharge @CellPhone_Recharge
Feature: Cell Phone Recharge

  Background: 
    Given i'm logged into the application
    When click on Recargar

  @pending_mobile @Recharge_flow_of_success
  Scenario Outline: Recargas de Celular - TC - 0001 - [WEB] - 113 - Success Flow I - Standard Flow of Success
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de celular
    And select company with <companyValue>
    And I set the Cell number field with <cellPhoneNumber>
    And click on button Continuar
    And set recharge value with <rechargeValue>
    And click on button Continuar
    And confirm process
    Then I see the confirmation message with <message>

    Examples: 
      | companyValue | cellPhoneNumber | rechargeValue | message                                    |
      | "Claro"      | "541122027878"  | "50"          | "Confirma esta operación desde tu celular" |

  @pending_mobile @Recharge_validate_voucher_information
  Scenario Outline: Recargas de Celular TC - 0002 - [WEB]  - 114 - Success Flow II - Validate Voucher Information
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de celular
    And select company with <companyValue>
    And I set the Cell number field with <cellPhoneNumber>
    And click on button Continuar
    And set recharge value with <rechargeValue>
    And click on button Continuar
    And confirm process
    Then I see the confirmation message with <message>

    Examples: 
      | companyValue | cellPhoneNumber | rechargeValue | message                                    |
      | "Claro"      | "541122027878"  | "50"          | "Confirma esta operación desde tu celular" |

  @pending_mobile @Recharge_share_voucher_successfully
  Scenario Outline: Recargas de Celular TC - 0003 - [WEB] - 115 - Success Flow III - Share voucher successfully
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de celular
    And select company with <companyValue>
    And I set the Cell number field with <cellPhoneNumber>
    And click on button Continuar
    And set recharge value with <rechargeValue>
    And click on button Continuar
    And confirm process
    Then I see the confirmation message with <message>

    Examples: 
      | companyValue | cellPhoneNumber | rechargeValue | message                                    |
      | "Claro"      | "541122027878"  | "50"          | "Confirma esta operación desde tu celular" |

  @pending_mobile @Recharge_validate_perform_new_reload_button
  Scenario Outline: Recargas de Celular TC - 0004 - [WEB] - 116 - Success Flow IV - Validate "perform new reload" button
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de celular
    And select company with <companyValue>
    And I set the Cell number field with <cellPhoneNumber>
    And click on button Continuar
    And set recharge value with <rechargeValue>
    And click on button Continuar
    And confirm process
    Then I see the confirmation message with <message>

    Examples: 
      | companyValue | cellPhoneNumber | rechargeValue | message                                    |
      | "Claro"      | "541122027878"  | "50"          | "Confirma esta operación desde tu celular" |

  @pending_mobile @Recharge_validate_company_logo
  Scenario Outline: Recargas de Celular - 0005 - [WEB] - 137 - Flow V - Validate company logo
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de celular
    And select company with <companyValue>
    And I set the Cell number field with <cellPhoneNumber>
    And click on button Continuar
    And set recharge value with <rechargeValue>
    And click on button Continuar
    And confirm process
    Then I see the confirmation message with <message>

    Examples: 
      | companyValue | cellPhoneNumber | rechargeValue | message                                    |
      | "Claro"      | "541122027878"  | "50"          | "Confirma esta operación desde tu celular" |

  @exceptionFlow @Recharge_invalid_DDI
  Scenario Outline: Recargas de Celular - 0006 - [WEB] - 117 - Exception Flow I - Invalid DDI
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de celular
    And select company with <companyValue>
    And I set the Cell number field with <cellPhoneNumber>
    Then I see the continue button disabled

    Examples: 
      | companyValue | cellPhoneNumber |
      | "Claro"      | "991122027878"  |

  @exceptionFlow @Recharge_invalid_DDD
  Scenario Outline: Recargas de Celular - 0007 - [WEB] - 118 - Exception Flow II - Invalid DDD
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de celular
    And select company with <companyValue>
    And I set the Cell number field with <cellPhoneNumber>
    Then I see the continue button disabled

    Examples: 
      | companyValue | cellPhoneNumber |
      | "Claro"      | "549922027878"  |

  @exceptionFlow @Recharge_invalid_phoneNumber
  Scenario Outline: Recargas de Celular - 0008 - [WEB] - 119 - Exception Flow III - Invalid Phone Number
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de celular
    And select company with <companyValue>
    And I set the Cell number field with <cellPhoneNumber>
    Then I see the continue button disabled

    Examples: 
      | companyValue | cellPhoneNumber |
      | "Claro"      | "541199999999"  |

  @Recharge_Insufficient_account_balance
  Scenario Outline: Recargas de Celular - 0009 - [WEB] - 120 - Flow IV - Insufficient account balance
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de celular
    And select company with <companyValue>
    And I set the Cell number field with <cellPhoneNumber>
    And click on button Continuar
    And set recharge value with <rechargeValue>
    And I see an alert icone about over balance

    Examples: 
      | companyValue      | cellPhoneNumber | rechargeValue |
      | "Telecom Persona" | "541122027878"  | "99999999999" |

  Scenario Outline: Recargas de Celular - 0010 - [WEB] - 134 - Exception Flow V - Incorrect company
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de celular
    And select company with <companyValue>
    And I set the Cell number field with <cellPhoneNumber>
    Then I see the continue button disabled

    Examples: 
      | companyValue | cellPhoneNumber | rechargeValue |
      | "Claro"      | "55993976440"   | "50"          |

  @pending_mobile @Recharge_validate_perform_new_reload_button
  Scenario Outline: Recargas de Celular - 0011 - [WEB] - 135	- Exception Flow VI - Invalid PIN
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de celular
    And select company with <companyValue>
    And I set the Cell number field with <cellPhoneNumber>
    And click on button Continuar
    And set recharge value with <rechargeValue>
    And click on button Continuar
    And confirm process
    Then I see the confirmation message with <message>

    Examples: 
      | companyValue | cellPhoneNumber | rechargeValue | message                                    |
      | "Claro"      | "541122027878"  | "99"          | "Confirma esta operación desde tu celular" |

  @Recharge_exceeding_time_out
  Scenario Outline: Recargas de Celular - 0012 - [WEB] - 136 - Exception Flow VII - Continue the flow after exceeding the session time limit
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de celular
    And select company with <companyValue>
    And I set the Cell number field with <cellPhoneNumber>
    And click on button Continuar
    And set recharge value with <rechargeValue>
    And click on button Continuar
    And confirm process
    And I wait to exceed the time out for confirmation
    Then I see the confirmation message with <message>

    Examples: 
      | companyValue | cellPhoneNumber | rechargeValue | message                    |
      | "Claro"      | "541122027878"  | "100"         | "El pago no fue realizado" |
