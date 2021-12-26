#language: en
#enconding: UTF-8
@Recharge @TransportRecharge
Feature: Transport Recharge

  Background: 
    Given I'm logged in with valid data
    When click on Recargar

  @transport_tc_0001
  Scenario Outline: Transporte Recharge - TC - 0001 - [WEB] - 246 - register new card
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de transporte
    And click on Registrar nueva tarjeta
    And set Alias value with <alias>
    And set number of card with "<cardNumber>"
    And click on button Continuar
    Then I see the confirmation message with <message>

    Examples: 
      | alias             | cardNumber       | message                        |
      | "automation_test" | 6061260864259182 | "¡Registro de tarjetas listo!" |

  @transport_tc_0002 @pending_mobile
  Scenario Outline: Transporte Recharge - TC - 0002 - [WEB] - 125 - Success Flow I - Standard Flow of Success
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de transporte
    And select the registered cards
    And Click on button Recargar tarjeta
    And select the value <valueSelect>
    And click on button Continuar
    And confirm process
    Then I see the confirmation message with <message>

    Examples: 
      | valueSelect | message                                    |
      | "60,00"     | "Confirma esta operación desde tu celular" |

  @transport_tc_0003 @pending_mobile
  Scenario Outline: Transporte Recharge - TC - 0003 - [WEB] - 126 - Success Flow II - Validate Voucher Information
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de transporte
    And select the registered cards
    And Click on button Recargar tarjeta
    And select the value <valueSelect>
    And click on button Continuar
    And confirm process
    Then I see the confirmation message with <message>

    Examples: 
      | valueSelect | message                                    |
      | "60,00"     | "Confirma esta operación desde tu celular" |

  @transport_tc_0004 @pending_mobile
  Scenario Outline: Transporte Recharge - TC - 0004 - [WEB] - 127 - Success Flow III - Share voucher successfully
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de transporte
    And select the registered cards
    And Click on button Recargar tarjeta
    And select the value <valueSelect>
    And click on button Continuar
    And confirm process
    Then I see the confirmation message with <message>

    Examples: 
      | valueSelect | message                                    |
      | "60,00"     | "Confirma esta operación desde tu celular" |

  @transport_tc_0005 @pending_mobile
  Scenario Outline: Transporte Recharge - TC - 0005 - [WEB] - 128 - Success Flow IV - Validate "perform new reload" button
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de transporte
    And select the registered cards
    And Click on button Recargar tarjeta
    And select the value <valueSelect>
    And click on button Continuar
    And confirm process
    Then I see the confirmation message with <message>

    Examples: 
      | valueSelect | message                                    |
      | "60,00"     | "Confirma esta operación desde tu celular" |

  @transport_tc_0006 @pending_mobile
  Scenario Outline: Transporte Recharge - TC - 0006 - [WEB] - 138 - Success Flow VII - Change card tag name
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de transporte
    And select the registered cards
    And Click on button Recargar tarjeta
    And select the value <valueSelect>
    And click on button Continuar
    And confirm process
    Then I see the confirmation message with <message>

    Examples: 
      | valueSelect | message                                    |
      | "60,00"     | "Confirma esta operación desde tu celular" |

  @transport_tc_0007
  Scenario Outline: Transporte Recharge - TC - 0007 - [WEB] - 142	- Exception Flow I - Incorrect Company
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de transporte
    And click on Registrar nueva tarjeta
    And I set value on Alias with <alias>
    And I set value onNúmero de tarjea with <tarjeta>
    And click on button Continuar
    Then I see the confirmation message with <message>

    Examples: 
      | alias   | tarjeta            | message                            |
      | "teste" | "1525354565758595" | "El número de tarjeta es inválido" |

  @transport_tc_0008
  Scenario Outline: Transporte Recharge - TC - 0008 - [WEB] - 143	- Exception Flow II - Insufficient account balance
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de transporte
    And select the registered cards
    And Click on button Recargar tarjeta
    And select the value <valueSelect>
    Then I see the confirmation message with <message>

    Examples: 
      | valueSelect | message              |
      | "1.400,00"  | "Saldo insuficiente" |

  @transport_tc_0009
  Scenario Outline: Transporte Recharge - TC - 0009 - [WEB] - 144	- Exception Flow III - Payment above the total bill amount
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de transporte
    And select the registered cards
    And Click on button Recargar tarjeta
    And select the value <valueSelect>
    Then I see the confirmation message with <message>

    Examples: 
      | valueSelect | message              |
      | "1.400,00"  | "Saldo insuficiente" |

  @transport_tc_0010
  Scenario Outline: Transporte Recharge - TC - 0010 - [WEB] - 145	- Exception Flow IV - Payment with zero value
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de transporte
    And select the registered cards
    And Click on button Recargar tarjeta
    Then I see the continue button disabled

  @transport_tc_0011
  Scenario Outline: Transporte Recharge - TC - 0011 - [WEB] - 146	- Exception Flow V - Payment over the security threshold
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de transporte
    And select the registered cards
    And Click on button Recargar tarjeta
    And select the value <valueSelect>
    Then I see the confirmation message with <message>

    Examples: 
      | valueSelect | message              |
      | "1.400,00"  | "Saldo insuficiente" |

  @transport_tc_0012
  Scenario Outline: Transporte Recharge - TC - 0012 - [WEB] - 147	- Exception Flow VI -  Incorrect shipping card number
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de transporte
    And click on Registrar nueva tarjeta
    And I set value on Alias with <alias>
    And I set value onNúmero de tarjea with <tarjeta>
    And click on button Continuar
    Then I see the confirmation message with <message>

    Examples: 
      | alias   | tarjeta            | message                            |
      | "teste" | "1525354565758595" | "El número de tarjeta es inválido" |

  @transport_tc_0013 @timeout
  Scenario Outline: Transporte Recharge - TC - 0013 - [WEB] - 148	- Exception Flow VII - Continue the flow after exceeding the session time limit
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de transporte
    And select the registered cards
    And Click on button Recargar tarjeta
    And select the value <valueSelect>
    And click on button Continuar
    And confirm process
    And I wait to exceed the time out for confirmation
    Then I see the confirmation message with <message>

    Examples: 
      | valueSelect | message                    |
      | "60,00"     | "El pago no fue realizado" |

  @transport_tc_0014 @pending_mobile
  Scenario Outline: Transporte Recharge - TC - 0014 - [WEB] - 149	- Exception Flow VIII - Perform a new recharge immediately after completing a recharge
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de transporte
    And select the registered cards
    And Click on button Recargar tarjeta
    And select the value <valueSelect>
    And click on button Continuar
    And confirm process
    Then I see the confirmation message with <message>

    Examples: 
      | valueSelect | message                                    |
      | "60,00"     | "Confirma esta operación desde tu celular" |

  @transport_tc_0015 @pending_mobile
  Scenario Outline: Transporte Recharge - TC - 0015 - [WEB] - 151	- Success Flow VI - Perform a new recharge after the SUBE break period
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de transporte
    And select the registered cards
    And Click on button Recargar tarjeta
    And select the value <valueSelect>
    And click on button Continuar
    And confirm process
    Then I see the confirmation message with <message>

    Examples: 
      | valueSelect | message                                    |
      | "60,00"     | "Confirma esta operación desde tu celular" |

  @transport_tc_0016 @pending_mobile
  Scenario Outline: Transporte Recharge - TC - 0016 - [WEB] - 153	- Happy Path - Validate recharge with unregistered card
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de transporte
    And select the registered cards
    And Click on button Recargar tarjeta
    And select the value <valueSelect>
    And click on button Continuar
    And confirm process
    Then I see the confirmation message with <message>

    Examples: 
      | valueSelect | message                                    |
      | "60,00"     | "Confirma esta operación desde tu celular" |

  @transport_tc_0017 @pending_mobile
  Scenario Outline: Transporte Recharge - TC - 0017 - [WEB] - 154	- Validate recharge with unregistered card
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de transporte
    And click on Recargar tarjeta no registrada
    And set number of card with "<cardNumber>"
    And select the value <valueSelect>
    And click on button Continuar
    And confirm process
    Then I see the confirmation message with <message>

    Examples: 
      | cardNumber       | valueSelect | message                                    |
      | 6061260273662281 | "60,00"     | "Confirma esta operación desde tu celular" |

  @transport_tc_0018 @pending_mobile
  Scenario Outline: Transporte Recharge - TC - 0018 - [WEB] - 161 - Validate recharge information before confirmation
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de transporte
    And select the registered cards
    And Click on button Recargar tarjeta
    And select the value <valueSelect>
    And click on button Continuar
    And confirm process
    Then I see the confirmation message with <message>

    Examples: 
      | valueSelect | message                                    |
      | "60,00"     | "Confirma esta operación desde tu celular" |

  @transport_tc_0019
  Scenario Outline: Transporte Recharge - TC - 0019 - [WEB] - 241 - Detail Card
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de transporte
    And select the card with alias <alias>
    Then I see the detail card

    Examples: 
      | alias        |
      | "automation" |

  @transport_tc_0020
  Scenario Outline: Transporte Recharge - TC - 0020 - [WEB] - 242 - Edit card data
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de transporte
    And select the card with alias <alias>
    And I click on Editar datos
    And set Alias value with <aliasValue>
    And I click on Guardar alteración
    Then I see the confirmation message with <message>

    Examples: 
      | alias        | aliasValue           | message            |
      | "automation" | "automation changed" | "¡Dados Editados!" |

  @transport_tc_0021
  Scenario Outline: Transporte Recharge - TC - 0021 - [WEB] - 243 - Edit card - check mandatory alias field
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de transporte
    And select the card with alias <alias>
    And I click on Editar datos
    And clear alias field
    Then I see the Guardar alteracion button disabled

    Examples: 
      | alias        |
      | "automation" |

  @transport_tc_0022
  Scenario Outline: Transporte Recharge - TC - 0022 - [WEB] - 244 - Cancel deletion card
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de transporte
    And select the card with alias <alias>
    And I click on Editar datos
    And I click on Eliminar alias
    And I cancel alias deletion
    Then I see the register card number

    Examples: 
      | alias        |
      | "automation" |

  @transport_tc_0023
  Scenario Outline: Transporte Recharge - TC - 0023 - [WEB] - 155 - Validate the deletion of a registered tag
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de transporte
    And select the card with alias <alias>
    And I click on Editar datos
    And I click on Eliminar alias
    And I confirm alias deletion
    Then I see the confirmation message with <message>

    Examples: 
      | alias        | message                             |
      | "automation" | "¡Tarjeta eliminada correctamente!" |

  @transport_tc_0024
  Scenario Outline: Transporte Recharge - TC - 0024 - [WEB] - 156	Validate mandatory alias field and card number
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de transporte
    And click on Registrar nueva tarjeta
    And set Alias value with <alias>
    And set number of card with "<cardNumber>"
    Then I see the continue button disabled

    Examples: 
      | alias | cardNumber |
      | ""    |            |

  @transport_tc_0025
  Scenario Outline: Transporte Recharge - TC - 0025 - [WEB] - 157 - Validate mandatory alias field
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de transporte
    And click on Registrar nueva tarjeta
    And set Alias value with <alias>
    And set number of card with "<cardNumber>"
    Then I see the continue button disabled

    Examples: 
      | alias | cardNumber       |
      | ""    | 6061260864259182 |

  @transport_tc_0026
  Scenario Outline: Transporte Recharge - TC - 0026 - [WEB] - 158 - Validate mandatory card number field
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de transporte
    And click on Registrar nueva tarjeta
    And set Alias value with <alias>
    And set number of card with "<cardNumber>"
    Then I see the continue button disabled

    Examples: 
      | alias             | cardNumber |
      | "automation_test" |            |

  @transport_tc_0027
  Scenario Outline: Transporte Recharge - TC - 0027 - [WEB] - 159 - Validate mandatory for the tag number field without registration
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de transporte
    And click on Recargar tarjeta no registrada
    And set number of card with "<cardNumber>"
    Then I see the continue button disabled

    Examples: 
      | cardNumber |
      |            |

  @transport_tc_0028
  Scenario Outline: Transporte Recharge - TC - 0028 - [WEB] - 160 - Validate if the value is required to recharge
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de transporte
    And click on Recargar tarjeta no registrada
    And set number of card with "<cardNumber>"
    And click on button Continuar
    Then I see the available values recharge
    When I not select the value
    Then I see the continue button disabled

    Examples: 
      | cardNumber       |
      | 6061260864259182 |

  @transport_tc_0029
  Scenario Outline: Transporte Recharge - TC - 0029 - [WEB] - 245 - Validate the panel of doubts about the card
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de transporte
    And click on Registrar nueva tarjeta
    And I click on doubts icon
    Then I see the confirmation message with <message>

    Examples: 
      | message                                        |
      | "¿Dónde puedo encontrar mi número de tarjeta?" |
