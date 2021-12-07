#language: en
#enconding: UTF-8
@cards
Feature: Cards

  Background:
    Given are on the application's login page
    
	@tc001_Validate_that_the_card_has_been_delivered
  Scenario Outline: Cards - TC - 001 - [WEB] - happy path - Validate that the card has been delivered
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I select 'Menú tarjeta' for my <typeCard> card
    And the physical card has tracking on it
    When I click on button <Seguir la Entrega>
    Then I have to be informed of delivery states of the physical card in any moment
 
    Examples:
      | country     | documentation | password  | menu       | typeCard  |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "main"    |  

	@tc002_Validate_Cancel_Virtual_Card
  Scenario Outline: Cards - TC - 002 - [WEB] - happy path - Validate layout for Cancel Virtual Card
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I select 'Menú tarjeta' for my <typeCard> card
		When I click on 'Botón de baja'
		And accept the terms
		And I see the message <message>
		And I confirm operation on the mobile app
		Then I should see the message 'Listo! Tu tarjeta fue dada de baja'
		And the virtual card should be cancelled
		And I should be redirected to the [Home] page
		And the cancelled virtual card on [Tarjetas] page should display message 'Tarjeta dada de baja'

    Examples:
      | country     | documentation | password  | menu       | typeCard  | message 															|
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "virtual" | "Validar la operación en tu celular" |	
      	
	@tc003_Validate_main_card_replacement
  Scenario Outline: Cards - TC - 003 - [WEB] - happy path - Validate layout for Main Card Replacement
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I select 'Menú tarjeta' for my <typeCard> card
		When I click on 'Solicitar reemplazo'
		And I inform the reason <reason> for replace card
		And I inform the delivery address
		And I confirm data to request a new card
		And I confirm operation on the mobile app
		Then the request should be successful displaying the voucher on the screen
		And a new card should be displayed on caroussel with tracking button name 'Seguir la entrega del reemplazo'
		
    Examples:
      | country     | documentation | password  | menu       | typeCard  | reason           |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "main"    | "Plástico roto"  |
      		
	@tc004_Validate_forgot_PIN
  Scenario Outline: Cards - TC - 004 - [WEB] - happy path - Validate forgot PIN
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I select 'Menú tarjeta' for my <typeCard> card		
		And the account have a physical card
		When I click on 'Olvidé mi contraseña'
		And I see the message <message>
		And inform my 6-digits password
		Then I should see my 4-digits password in the screen 

    Examples:
      | country     | documentation | password  | menu       | typeCard  | message                                         |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "main"    | "Esta operación solo se puede hacer por celular"|
      
	@tc005_Cards_Validate_view_from_main_card_statement
  Scenario Outline: Cards - TC - 005 - [WEB] - happy path - Validate view from main card statement
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		When I select 'Movimientos' for my <typeCard> card
		Then should be displayed all purchasing transactions from my main card
		
    Examples:
      | country     | documentation | password  | menu       | typeCard |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "main"   |       

	@tc006_Cards_Validate_view_from_virtual_card_statement
  Scenario Outline: Cards - TC - 006 - [WEB] - happy path - Validate view from virtual card statement
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		When I select 'Movimientos' for my enable <typeCard> card
		Then should be displayed all purchasing transactions from my virtual card
		
    Examples:
      | country     | documentation | password  | menu       | typeCard  |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "virtual" |
	
	@tc007_Validate_view_from_virtual_card_details @Flaky
  Scenario Outline: Cards - TC - 007 - [WEB] - happy path - Validate view from virtual card details
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I select 'Menú tarjeta' for my <typeCard> card
		When I click on "Ver datos de la tarjeta"
		And I see the message <message>
		And I confirm operation on the mobile app
		Then I should see all virtual card details

    Examples:
      | country     | documentation | password  | menu       | typeCard  | message 															|
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "virtual" | "Validar la operación en tu celular" |		
		
	@tc008_Validate_withdraw_money_from_virtual_card @Flaky
  Scenario Outline: Cards - TC - 008 - [WEB] - happy path - Validate withdraw money from virtual card
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I select 'Menú tarjeta' for my enable <typeCard> card
		And I already have money on my virtual card
		When I click on 'Enviar saldo a tu cuenta'
		And I insert a withdraw value <value>
		And I see the message <message>
		And I confirm operation on the mobile app
		Then a voucher with message 'Dinero enviado a tu cuenta!' should be displayed
		And Card balance should be updated
		And withdraw voucher should exists on <Movimientos>
		
    Examples:
      | country     | documentation | password  | menu       | typeCard  | message 															| value  |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "virtual" | "Validar la operación en tu celular" |	"1,11" |	

	@tc009_Validate_recharge_virtual_card
  Scenario Outline: Cards - TC - 009 - [WEB] - happy path - Validate layout for Recharge Virtual Card
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I select 'Menú tarjeta' for my <typeCard> card
		When I click on 'Recargar tarjeta'
		And I insert a recharge value <value>
		And I see the message <message>	
		And I confirm operation on the mobile app
		Then display the voucher with message 'Recarga Realizada!'
		And Card balance should be updated
		And recharge voucher should exists on <Movimientos>

    Examples:
      | country     | documentation | password  | menu       | typeCard  | message 															| value  |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "virtual" | "Validar la operación en tu celular" |	"1,13" |

	@tc010_Validate_Ask_for_a_Virtual_Cards @Flaky
  Scenario Outline: Cards - TC - 010 - [WEB] - happy path - Validate layout for Ask Virtual Card
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I select 'Menú tarjeta' for my <typeCard> card
		And I click on plus button
		When I click on 'Pedir tarjeta virtual'
		And I insert virtual card name
		And I click on 'Continuar'
		And I confirm virtual card data by clicking on 'Confirmar'
		Then should display a screen with the message 'Listo! Tu tarjeta virtual fue creada'

    Examples:
      | country    | documentation | password  | menu       | typeCard  |
      | "Colombia" | "74279144"    | "192837"  | "Tarjetas" | "virtual" |

	@tc011_Validate_block_virtual_card @Flaky
  Scenario Outline: Cards - TC - 011 - [WEB] - happy path - Validate layout for Block Virtual Card
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And already activate my virtual card
		And I select 'Menú tarjeta' for my <typeCard> card
		When I click on 'Bloqueo Temporal'
		And I accept the terms to block virtual card
		Then the virtual card should be blocked
		And the switch button should be updated
		
    Examples:
      | country      | documentation | password  | menu       | typeCard  |
      | "Argentina"  | "29709517"    | "192837"  | "Tarjetas" | "virtual" |

	@tc012_Validate_unblock_virtual_card
  Scenario Outline: Cards - TC - 012 - [WEB] - happy path - Validate layout for Unblock Virtual Card
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I select 'Menú tarjeta' for my <typeCard> card
		When I click on 'Bloqueo Temporal'
		And I confirm operation on the mobile app
		Then should display the screen with message: 'Listo! Tu tarjeta está ya está desbloqueada' 
		And the virtual card should be unblocked
		And the switch button should be updated
		
    Examples:
      | country     | documentation | password  | menu       | typeCard  |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "virtual" |
      		      
	@tc013_Validate_Ask_for_a_Main_Card @Flaky
  Scenario Outline: Cards - TC - 013 - [WEB] - happy path - Validate layout for Ask for a Main Card
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I click on 'Entendido'
		When I click on 'Pedir tarjeta física'
		And I click on 'Continuar'
		And I click on 'Confirmar'				
		Then should display a screen with the message '¡Listo! En breve recibirás tu tarjeta física'

    Examples:
      | country     | documentation | password  | menu       |
      | "Colombia"  | "70369703"    | "192837"  | "Tarjetas" |

	@tc014_Validate_Cancel_Main_Card
  Scenario Outline: Cards - TC - 0014 - [WEB] - happy path - Validate layout for Cancel Main Card
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I select 'Menú tarjeta' for my <typeCard> card
		When I click on 'Botón de baja'
		And I inform the reason for cancel card
		And I accept the terms
		And I confirm operation on the mobile app
		Then I should see the message 'Listo! Tu tarjeta fue dada de baja'
	  And the main card should be cancelled		
	  And I should be redirected to the [Home] page
	  And the cancelled main card on [Tarjetas] page should display message 'Tarjeta dada de baja'
		
    Examples:
      | country     | documentation | password  | menu       | typeCard |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "main"   |					
