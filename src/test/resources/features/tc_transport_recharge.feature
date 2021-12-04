#language: en
#enconding: UTF-8
@Recharge @TransportRecharge
Feature: Transport Recharge

  Background: 
    Given i'm logged into the application
    When click on Recargar

  Scenario Outline: Transporte Recharge - TC - 001 .. 005 - Standard Flow of Success
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de transporte
    And select the registered cards
    And Click on button Recargar tarjeta
    And select the value <valueSelect>
    And click on button Continuar
    And confirm process
    Then I see the confirmation message with <message>

    @Recharge_flow_of_success
    Examples: 
      | valueSelect | message                                    |
      | "60,00"     | "Confirma esta operación desde tu celular" |

    @Recharge_validate_voucher_information
    Examples: 
      | valueSelect | message                                    |
      | "60,00"     | "Confirma esta operación desde tu celular" |

    @Recharge_share_voucher_successfully
    Examples: 
      | valueSelect | message                                    |
      | "60,00"     | "Confirma esta operación desde tu celular" |

    @Recharge_validate_perform_new_reload_button
    Examples: 
      | valueSelect | message                                    |
      | "60,00"     | "Confirma esta operación desde tu celular" |

    @Recharge_Change_card_tag_name
    Examples: 
      | valueSelect | message                                    |
      | "60,00"     | "Confirma esta operación desde tu celular" |
