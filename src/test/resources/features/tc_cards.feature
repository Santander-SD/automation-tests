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
    And the physical card has tracking on it
		When I click on 'Seguir la entrega'    
    Then I have to be informed of delivery states of the physical card in any moment with the labels:
    	| ¡Entregada! 																					                           |
    	| Entregamos tu tarjeta en la dirección que ingresaste.                            |
    	| ¡Tarjeta enviada!                                                                |
    	| Enviamos tu tarjeta física Superdigital por Andreani                             |
    	| ¡Ya registramos tu pedido!                            													 |
    	| ¡Que bueno! En breve recibirás tu tarjeta física en la dirección que ingresaste. |
    	
    Examples:
      | country     | documentation | password  | menu       | typeCard  |
      | "Argentina" | "41369741"    | "192837"  | "Tarjetas" | "main"    |  

	@tc002_Validate_main_card_replacement
  Scenario Outline: Cards - TC - 002 - [WEB] - happy path - Validate layout for Main Card Replacement
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
      		
	@tc003_Validate_forgot_PIN
  Scenario Outline: Cards - TC - 003 - [WEB] - happy path - Validate forgot PIN
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

	@tc004_Validate_Cancel_Virtual_Card
  Scenario Outline: Cards - TC - 004 - [WEB] - happy path - Validate layout for Cancel Virtual Card
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I select 'Menú tarjeta' for my <typeCard> card
		When I click on 'Botón de baja'
		And accept the terms
		And I confirm operation on the mobile app
		Then I should see the message 'Listo! Tu tarjeta fue dada de baja'
		And the virtual card should be cancelled
		And I should be redirected to the [Home] page
		And the cancelled virtual card on [Tarjetas] page should display message 'Tarjeta dada de baja'

    Examples:
      | country     | documentation | password  | menu       | typeCard  |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "virtual" |
      	     
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
		When I select 'Movimientos' for my last <typeCard> card
		Then should be displayed all purchasing transactions from my virtual card
		
    Examples:
      | country     | documentation | password  | menu       | typeCard  |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "virtual" |
	
	@tc007_Validate_view_from_virtual_card_details
  Scenario Outline: Cards - TC - 007 - [WEB] - happy path - Validate view from virtual card details
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I select 'Menú tarjeta' for my <typeCard> card
		When I click on "Ver datos de la tarjeta"
		And I confirm operation on the mobile app
		Then I should see all virtual card details

    Examples:
      | country     | documentation | password  | menu       | typeCard  |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "virtual" |		
		
	@tc008_Validate_withdraw_money_from_virtual_card @Flaky
  Scenario Outline: Cards - TC - 008 - [WEB] - happy path - Validate withdraw money from virtual card
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I select 'Menú tarjeta' for my last <typeCard> card
		And I already have money on my virtual card
		When I click on 'Enviar saldo a tu cuenta'
		And I insert a withdraw value <value>
		And I confirm operation on the mobile app
		Then a voucher with message 'Dinero enviado a tu cuenta!' should be displayed
		And Card balance should be updated
		And withdraw voucher should exists on <Movimientos>
		
    Examples:
      | country     | documentation | password  | menu       | typeCard  	| value  |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "virtual"  |	"0,11" |	

	@tc009_Validate_recharge_virtual_card
  Scenario Outline: Cards - TC - 009 - [WEB] - happy path - Validate layout for Recharge Virtual Card
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I select 'Menú tarjeta' for my last <typeCard> card
		When I click on 'Recargar tarjeta'
		And I insert a recharge value <value>
		And I confirm operation on the mobile app
		Then display the voucher with message 'Recarga Realizada!'
		And Card balance should be updated
		And recharge voucher should exists on <Movimientos>

    Examples:
      | country     | documentation | password  | menu       | typeCard  | value   |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "virtual" |	"1,13" |

	@tc010_Validate_Ask_for_a_Virtual_Cards
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

	@tc011_Validate_block_virtual_card
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
		
    Examples:
      | country     | documentation | password  | menu       | typeCard  |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "virtual" |
      		      
	@tc013_Validate_Ask_for_a_Main_Card
  Scenario Outline: Cards - TC - 013 - [WEB] - happy path - Validate layout for Ask for a Main Card
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I click on 'Entendido'
		When I click on 'Pedir tarjeta física'
		And I click on 'Continuar'
		And I click on 'Confirmar'				
		Then should display a screen with the message '¡Listo! En breve recibirás tu tarjeta física'

    Examples:
      | country      | documentation | password  | menu       |
      | "Argentina"  | "25029218"    | "192837"  | "Tarjetas" |

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

 ################# -- SEGUNDA ENTREGA -- #################

	@tc015_Validate_layout_for_activate_main_card
  Scenario Outline: Cards - TC - 015 - [WEB] - happy path - Validate layout for activate main card
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And already received the main/physical card
		When I click on 'Activar tarjeta'
		And I inform the expiration date
	  And I click on 'Continuar'
		And I confirm operation on the mobile app
		Then main card should be activated
	  And should display a success screen with messages: 'Listo! Tu tarjeta ya está activada!'
		
    Examples:
      | country     | documentation | password  | menu       |
      | "Argentina" | "95812697"    | "192837"  | "Tarjetas" |

	@tc016_Validate_information_about_vencimiento_de_mi_tarjeta
  Scenario Outline: Cards - TC - 016 - [WEB] - Validate information about vencimiento de mi tarjeta
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And already received the main/physical card
		When I click on 'Activar tarjeta'
		And I click on information icon
		Then should display informations about the vencimiento de la tarjeta
		
    Examples:
      | country     | documentation | password  | menu       |
      | "Argentina" | "95812697"    | "192837"  | "Tarjetas" |		

	@tc017_Validate_eye_button_to_view_the_entered_balance_card_for_main_card
  Scenario Outline: Cards - TC - 017 - [WEB] - Validate eye button to view the entered balance card for main card
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I select 'Menú tarjeta' for my <typeCard> card
		When I click on eye opened button for the main card
		Then should display the card Balance
		
    Examples:
      | country     | documentation | password  | menu       | typeCard |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "main"   |	
      
	@tc018_Validate_eye_fom_balance_cards_for_virtual_card
  Scenario Outline: Cards - TC - 018 - [WEB] - Validate eye button to view the entered balance card for virtual card
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I select 'Menú tarjeta' for my last <typeCard> card
		When I click on eye opened button for the virtual card
		Then should display the card Balance
		
    Examples:
      | country     | documentation | password  | menu       | typeCard  |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "virtual" |	
	
	@tc019_Validate_buscar_comprobante_for_main_card
  Scenario Outline: Cards - TC - 019 - [WEB] - Validate 'buscar comprobante' for main card
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I select 'Movimientos' for my <typeCard> card
		When I search for 'Compra'
		Then should display all the information about the search
		
    Examples:
      | country     | documentation | password  | menu       | typeCard |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "main"   | 
	
	 @tc020_Validate_virtual_card_without_operation
  Scenario Outline: Cards - TC - 020 - [WEB] - Validate virtual card without operation
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I select 'Movimientos' for my <typeCard> card
		When I search for 'Compra'
		Then should display a screen with the message 'Todavía no hiciste ninguna operación con esta tarjeta'
		
    Examples:
      | country     | documentation | password  | menu       | typeCard  |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "virtual" | 
      
	@tc021_Validate_buscar_comprobante_for_virtual_card
  Scenario Outline: Cards - TC - 021 - [WEB] - Validate 'buscar comprobante' for virtual card
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I select 'Movimientos' for my last <typeCard> card
		When I search for 'Compra'
		Then should display all the information about the virtual card transactions
		
    Examples:
      | country     | documentation | password  | menu       | typeCard  |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "virtual" | 
            
	@tc022_Validate_ningun_movimiento_for_main_card
  Scenario Outline: Cards - TC - 022 - [WEB] - Validate buscar comprobante - ningún movimiento for main card
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I select 'Movimientos' for my <typeCard> card
		When I search for 'asdf'
    Then I see the messages:
    	| ¡Ups! No se encontró ningún movimiento 		  					                            |
    	| Por favor, revisa lo que escribiste o realiza otra búsqueda usando otras palabras |

    Examples:
      | country     | documentation | password  | menu       | typeCard |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "main"   |
      
	@tc023_Validate_layout_for_limit_of_virtual_Card
  Scenario Outline: Cards - TC - 023 - [WEB] - Validate layout for limit of virtual Card
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I select 'Menú tarjeta' for my <typeCard> card
		And I click on plus button
		When I click on 'Pedir tarjeta virtual'
		And I insert virtual card name
		And I click on 'Continuar'
		And I confirm virtual card data by clicking on 'Confirmar'
		Then should display a screen with the message '¡Ups! Hubo un error al solicitar la tarjeta'

    Examples:
      | country     | documentation | password  | menu       | typeCard  |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "virtual" |
      
	@tc024_Validate_ningun_movimiento_for_virtual_card
  Scenario Outline: Cards - TC - 024 - [WEB] - Validate buscar comprobante - ningún movimiento for virtual card
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I select 'Movimientos' for my last <typeCard> card
		When I search for 'asdf'
    Then I see the messages:
    	| ¡Ups! No se encontró ningún movimiento 		  					                            |
    	| Por favor, revisa lo que escribiste o realiza otra búsqueda usando otras palabras |
		
    Examples:
      | country     | documentation | password  | menu       | typeCard  |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "virtual" |

	@tc025_Validate_boton_de_baja_TimeOut_for_virtual_card
  Scenario Outline: Cards - TC - 025 - [WEB] - Validate botón de baja timeOut for virtual card
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I select 'Menú tarjeta' for my last <typeCard> card
		When I click on 'Botón de baja'
		And accept the terms
		And I don't validate the operation on the app
    Then I see the messages:
    	| El tiempo para realizar la operación ha terminado. Puedes volver a realizar la validación  |
    	| La solicitación no fue realiza                                                             |
		
    Examples:
      | country     | documentation | password  | menu       | typeCard  |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "virtual" |

	@tc026_Validate_boton_de_baja_timeOut_for_main_card
  Scenario Outline: Cards - TC - 026 - [WEB] - Validate botón de baja timeOut for main card
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I select 'Menú tarjeta' for my <typeCard> card
		When I click on 'Botón de baja'
		And accept the terms for the main card
		And I don't validate the operation on the app
    Then I see the messages:
    	| El tiempo para realizar la operación ha terminado. Puedes volver a realizar la validación  |
    	| La solicitación no fue realiza                                                             |
		
    Examples:
      | country     | documentation | password  | menu       | typeCard |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "main"   |
      
	@tc027_Validate_back_to_the_main_screen_cards
  Scenario Outline: Cards - TC - 027 - [WEB] - Validate back to the main screen cards from the recargar tarjeta screen
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I select 'Menú tarjeta' for my <typeCard> card
		When I click on 'Recargar tarjeta'
	  And I click on button back
    Then should back to the main screen cards
		
    Examples:
      | country     | documentation | password  | menu       | typeCard  |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "virtual" |
      
	@tc028_Validate_back_to_the_main_screen_from_tarjetas_Screen
  Scenario Outline: Cards - TC - 028 - [WEB] - Validate back to the main screen from tarjetas Screen
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
	  When I click on main button back
    Then should back to the main screen
		
    Examples:
      | country     | documentation | password  | menu       | typeCard  |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "virtual" |
