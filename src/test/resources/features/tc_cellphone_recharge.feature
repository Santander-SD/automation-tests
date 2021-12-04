#language: en
#enconding: UTF-8
@Recharge @CellPhone_Recharge
Feature: Cell Phone Recharge

  Background: 
    Given i'm logged into the application
    When click on Recargar

  Scenario Outline: Cell Phone Recharge - TC - 001 .. 005 - Standard Flow of Success
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de celular
    And select company with <companyValue>
    And I set the Cell number field with <cellPhoneNumber>
    And click on button Continuar
    And set recharge value with <rechargeValue>
    And click on button Continuar
    And confirm process
    Then I see the confirmation message with <message>

    @Recharge_flow_of_success
    Examples: 
      | companyValue | cellPhoneNumber | rechargeValue | message                                    |
      | "Claro"      | "541122027878"  | "50"          | "Confirma esta operación desde tu celular" |

    @Recharge_validate_voucher_information
    Examples: 
      | companyValue | cellPhoneNumber | rechargeValue | message                                    |
      | "Claro"      | "541122027878"  | "50"          | "Confirma esta operación desde tu celular" |

    @Recharge_share_voucher_successfully
    Examples: 
      | companyValue | cellPhoneNumber | rechargeValue | message                                    |
      | "Claro"      | "541122027878"  | "50"          | "Confirma esta operación desde tu celular" |

    @Recharge_validate_perform_new_reload_button
    Examples: 
      | companyValue | cellPhoneNumber | rechargeValue | message                                    |
      | "Claro"      | "541122027878"  | "50"          | "Confirma esta operación desde tu celular" |

    @Recharge_validate_company_logo
    Examples: 
      | companyValue | cellPhoneNumber | rechargeValue | message                                    |
      | "Claro"      | "541122027878"  | "50"          | "Confirma esta operación desde tu celular" |

  @exceptionFlow
  Scenario Outline: Cell Phone Recharge - TC - 006 .. 008 - Exception Flow
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de celular
    And select company with <companyValue>
    And I set the Cell number field with <cellPhoneNumber>
    Then I see the continue button disabled

    @Recharge_invalid_DDI
    Examples: 
      | companyValue | cellPhoneNumber |
      | "Claro"      | "991122027878"  |

    @Recharge_invalid_DDD
    Examples: 
      | companyValue | cellPhoneNumber |
      | "Claro"      | "549922027878"  |

    @Recharge_invalid_phoneNumber
    Examples: 
      | companyValue | cellPhoneNumber |
      | "Claro"      | "541199999999"  |

  Scenario Outline: Cell Phone Recharge - TC - 009 - Insufficient account balance
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