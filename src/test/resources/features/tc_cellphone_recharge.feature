#language: en
#enconding: UTF-8
@Recharge @CellPhone_Recharge
Feature: Cell Phone Recharge

  Background: 
    Given i'm logged into the application
    When click on Recargar

  Scenario Outline: Recargas de Celular - TC 113 - Success Flow I - Standard Flow of Success
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de celular
    And select company with <companyValue>
    And I set the Cell number field with <cellPhoneNumber>
    And click on button Continuar
    And set recharge value with <rechargeValue>
    And click on button Continuar
    And confirm process
    Then I see the confirmation message with <message>
    And I confirm the transaction on Mobile

    @Recharge_flow_of_success
    Examples: 
      | companyValue | cellPhoneNumber | rechargeValue | message                                    |
      | "Claro"      | "541122027878"  | "50"          | "Confirma esta operación desde tu celular" |


  Scenario Outline: Recargas de Celular - TC 114 - Success Flow II - Validate Voucher Information
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de celular
    And select company with <companyValue>
    And I set the Cell number field with <cellPhoneNumber>
    And click on button Continuar
    And set recharge value with <rechargeValue>
    And click on button Continuar
    And confirm process
    Then I see the confirmation message with <message>
    And I confirm the transaction on Mobile
    
    @Recharge_validate_voucher_information
    Examples: 
      | companyValue | cellPhoneNumber | rechargeValue | message                                    |
      | "Claro"      | "541122027878"  | "50"          | "Confirma esta operación desde tu celular" |

  Scenario Outline: Recargas de Celular - TC 115 - Success Flow III - Share voucher successfully
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de celular
    And select company with <companyValue>
    And I set the Cell number field with <cellPhoneNumber>
    And click on button Continuar
    And set recharge value with <rechargeValue>
    And click on button Continuar
    And confirm process
    Then I see the confirmation message with <message>
    And I confirm the transaction on Mobile
    
    @Recharge_share_voucher_successfully
    Examples: 
      | companyValue | cellPhoneNumber | rechargeValue | message                                    |
      | "Claro"      | "541122027878"  | "50"          | "Confirma esta operación desde tu celular" |

  Scenario Outline: Recargas de Celular - TC 116 - Success Flow IV - Validate "perform new reload" button
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de celular
    And select company with <companyValue>
    And I set the Cell number field with <cellPhoneNumber>
    And click on button Continuar
    And set recharge value with <rechargeValue>
    And click on button Continuar
    And confirm process
    Then I see the confirmation message with <message>
    And I confirm the transaction on Mobile
    
    @Recharge_validate_perform_new_reload_button
    Examples: 
      | companyValue | cellPhoneNumber | rechargeValue | message                                    |
      | "Claro"      | "541122027878"  | "50"          | "Confirma esta operación desde tu celular" |

  Scenario Outline: Recargas de Celular - TC 116 - Flow V - Validate company logo
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de celular
    And select company with <companyValue>
    And I set the Cell number field with <cellPhoneNumber>
    And click on button Continuar
    And set recharge value with <rechargeValue>
    And click on button Continuar
    And confirm process
    Then I see the confirmation message with <message>
    And I confirm the transaction on Mobile
    
    @Recharge_validate_company_logo
    Examples: 
      | companyValue | cellPhoneNumber | rechargeValue | message                                    |
      | "Claro"      | "541122027878"  | "50"          | "Confirma esta operación desde tu celular" |

  @exceptionFlow
  Scenario Outline: Cell Phone Recharge - TC - 117 - Exception Flow I - Invalid DDI
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de celular
    And select company with <companyValue>
    And I set the Cell number field with <cellPhoneNumber>
    Then I see the continue button disabled

    @Recharge_invalid_DDI
    Examples: 
      | companyValue | cellPhoneNumber |
      | "Claro"      | "991122027878"  |

  @exceptionFlow
  Scenario Outline: Cell Phone Recharge - TC - 118 - Exception Flow II - Invalid DDD
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de celular
    And select company with <companyValue>
    And I set the Cell number field with <cellPhoneNumber>
    Then I see the continue button disabled
    
    @Recharge_invalid_DDD
    Examples: 
      | companyValue | cellPhoneNumber |
      | "Claro"      | "549922027878"  |

  @exceptionFlow
  Scenario Outline: Cell Phone Recharge - TC - 119 - Exception Flow III - Invalid Phone Number
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de celular
    And select company with <companyValue>
    And I set the Cell number field with <cellPhoneNumber>
    Then I see the continue button disabled
    
    @Recharge_invalid_phoneNumber
    Examples: 
      | companyValue | cellPhoneNumber |
      | "Claro"      | "541199999999"  |

  Scenario Outline: Cell Phone Recharge - TC - 120 - Flow IV - Insufficient account balance
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de celular
    And select company with <companyValue>
    And I set the Cell number field with <cellPhoneNumber>
    And click on button Continuar
    And set recharge value with <rechargeValue>
    And I see an alert icone about over balance

    @Recharge_Insufficient_account_balance
    Examples: 
      | companyValue | cellPhoneNumber | rechargeValue |
      | "Claro"      | "541122027878"  | "99999999999" |