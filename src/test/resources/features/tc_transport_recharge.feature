#language: en
#enconding: UTF-8
@Recharge @TransportRecharge
Feature: Transport Recharge

  Background: 
    Given i'm logged into the application
    When click on Recargar

  @pending_mobile
  Scenario Outline: Transporte Recharge - TC - 0001 - [WEB] - 125 - Success Flow I - Standard Flow of Success
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

  @pending_mobile
  Scenario Outline: Transporte Recharge - TC - 0002 - [WEB] - 126 - Success Flow II - Validate Voucher Information
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

  @pending_mobile
  Scenario Outline: Transporte Recharge - TC - 0003 - [WEB] - 127 - Success Flow III - Share voucher successfully
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

  @pending_mobile
  Scenario Outline: Transporte Recharge - TC - 0004 - [WEB] - 128 - Success Flow IV - Validate "perform new reload" button
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

  @pending_mobile
  Scenario Outline: Transporte Recharge - TC - 0005 - [WEB] - 138 - Success Flow VII - Change card tag name
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

  Scenario Outline: Transporte Recharge - TC - 0006 - [WEB] - 142	- Exception Flow I - Incorrect Company
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de transporte
    And click on Registrar nueva tarjeta
    And I set value on Alias with <alias>
    And I set value onNúmero de tarjea with <tarjeta>
    And click on button Continuar
    Then I see the confirmation message with <message>

    Examples: 
      | alias   | tarjeta            | message                          |
      | "teste" | "1525354565758595" | "Esta tarjeta ya fue registrada" |

  Scenario Outline: Transporte Recharge - TC - 0007 - [WEB] - 143	- Exception Flow II - Insufficient account balance
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de transporte
    And select the registered cards
    And Click on button Recargar tarjeta
    And select the value <valueSelect>
    Then I see the confirmation message with <message>

    Examples: 
      | valueSelect | message              |
      | "1.400,00"  | "Saldo insuficiente" |

  Scenario Outline: Transporte Recharge - TC - 0008 - [WEB] - 144	- Exception Flow III - Payment above the total bill amount
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de transporte
    And select the registered cards
    And Click on button Recargar tarjeta
    And select the value <valueSelect>
    Then I see the confirmation message with <message>

    Examples: 
      | valueSelect | message              |
      | "1.400,00"  | "Saldo insuficiente" |

  Scenario Outline: Transporte Recharge - TC - 0009 - [WEB] - 145	- Exception Flow IV - Payment with zero value
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de transporte
    And select the registered cards
    And Click on button Recargar tarjeta
    Then I see the continue button disabled

  Scenario Outline: Transporte Recharge - TC - 0010 - [WEB] - 146	- Exception Flow V - Payment over the security threshold
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de transporte
    And select the registered cards
    And Click on button Recargar tarjeta
    And select the value <valueSelect>
    Then I see the confirmation message with <message>

    Examples: 
      | valueSelect | message              |
      | "1.400,00"  | "Saldo insuficiente" |

  Scenario Outline: Transporte Recharge - TC - 0011 - [WEB] - 147	- Exception Flow VI -  Incorrect shipping card number
    Given I see page with ¿Qué recarga vas a hacer?
    When click on card Realizar una recarga de transporte
    And click on Registrar nueva tarjeta
    And I set value on Alias with <alias>
    And I set value onNúmero de tarjea with <tarjeta>
    And click on button Continuar
    Then I see the confirmation message with <message>

    Examples: 
      | alias   | tarjeta            | message                          |
      | "teste" | "1525354565758595" | "Esta tarjeta ya fue registrada" |
	
	@timeout
  Scenario Outline: Transporte Recharge - TC - 0012 - [WEB] - 148	- Exception Flow VII - Continue the flow after exceeding the session time limit
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

  @pending_mobile
  Scenario Outline: Transporte Recharge - TC - 0013 - [WEB] - 149	- Exception Flow VIII - Perform a new recharge immediately after completing a recharge
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

  @pending_mobile
  Scenario Outline: Transporte Recharge - TC - 0014 - [WEB] - 151	- Success Flow VI - Perform a new recharge after the SUBE break period
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

  @pending_mobile
  Scenario Outline: Transporte Recharge - TC - 0015 - [WEB] - 153	- Happy Path - Validate recharge with unregistered card
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

  @pending_mobile
  Scenario Outline: Transporte Recharge - TC - 0016 - [WEB] - 154	- Validate recharge with unregistered card
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
