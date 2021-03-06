#language: en
#enconding: UTF-8
@cards
Feature: Cards

  Background:
    Given are on the application's login page
    
 ################# -- FIRST DELIVERY -- #################  
     
	@tc001_Cards_Validate_that_the_card_has_been_delivered
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

	@tc002_Cards_Validate_main_card_replacement
  Scenario Outline: Cards - TC - 002 - [WEB] - happy path - Validate layout for main card Replacement
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
      		
	@tc003_Cards_Validate_forgot_PIN
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

	@tc004_Cards_Validate_cancel_virtual_card
  Scenario Outline: Cards - TC - 004 - [WEB] - happy path - Validate layout for cancel virtual card
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I select 'Menú tarjeta' for my last <typeCard> card
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
	
	@tc007_Cards_Validate_view_from_virtual_card_details
  Scenario Outline: Cards - TC - 007 - [WEB] - happy path - Validate view from virtual card details
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I select 'Menú tarjeta' for my last <typeCard> card
		When I click on "Ver datos de la tarjeta"
		And I confirm operation on the mobile app
		Then I should see all virtual card details

    Examples:
      | country     | documentation | password  | menu       | typeCard  |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "virtual" |		
		
	@tc008_Cards_Validate_withdraw_money_from_virtual_card
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
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "virtual"  |	"1,11" |	

	@tc009_Cards_Validate_recharge_virtual_card
  Scenario Outline: Cards - TC - 009 - [WEB] - happy path - Validate layout for recharge virtual card
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

	@tc010_Cards_Validate_Ask_for_a_virtual_cards
  Scenario Outline: Cards - TC - 010 - [WEB] - happy path - Validate layout for Ask virtual card
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
      | country     | documentation | password  | menu       | typeCard  |
      | "Argentina" | "22735256"    | "192837"  | "Tarjetas" | "virtual" |

	@tc011_Cards_Validate_block_virtual_card
  Scenario Outline: Cards - TC - 011 - [WEB] - happy path - Validate layout for block virtual card
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And already activate my virtual card
		And I select 'Menú tarjeta' for my <typeCard> card
		When I click on 'Bloqueo Temporal'
		And I accept the terms to block the card
		Then the virtual card should be blocked
		And the switch button should be updated
		
    Examples:
      | country     | documentation | password  | menu       | typeCard  |
      | "Colombia"  | "22735256"    | "192837"  | "Tarjetas" | "virtual" |

	@tc012_Cards_Validate_unblock_virtual_card
  Scenario Outline: Cards - TC - 012 - [WEB] - happy path - Validate layout for Unblock virtual card
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I select 'Menú tarjeta' for my last <typeCard> card
		When I click on 'Bloqueo Temporal'
		And I confirm operation on the mobile app
		Then should display the screen with message: 'Listo! Tu tarjeta está ya está desbloqueada'
		And the virtual card should be unblocked
		
    Examples:
      | country     | documentation | password  | menu       | typeCard  |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "virtual" |
      		      
	@tc013_Cards_Validate_ask_for_a_main_card
  Scenario Outline: Cards - TC - 013 - [WEB] - happy path - Validate layout for ask for a main card
		And I'm logged in with the data <country> and <password> for asking a new card
		And I'm on the <menu> page
		And I click on 'Entendido'
		When I click on 'Pedir tarjeta física'
		And I click on 'Continuar'
		And I click on 'Confirmar'				
		Then should display a screen with the message '¡Listo! En breve recibirás tu tarjeta física'

    Examples:
      | country     | password  | menu       |
      | "Argentina" | "192837"  | "Tarjetas" |

	@tc014_Cards_Validate_cancel_main_card
  Scenario Outline: Cards - TC - 0014 - [WEB] - happy path - Validate layout for cancel main card
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

 ################# -- SECOND DELIVERY -- #################

	@tc015_Cards_Validate_layout_for_activate_main_card
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

	@tc162_Cards_Validate_information_about_vencimiento_de_mi_tarjeta
  Scenario Outline: Cards - TC - 162 - [WEB] - Validate information about vencimiento de mi tarjeta
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And already received the main/physical card
		When I click on 'Activar tarjeta'
		And I click on information icon
		Then should display informations about the vencimiento de la tarjeta
		
    Examples:
      | country     | documentation | password  | menu       |
      | "Argentina" | "95812697"    | "192837"  | "Tarjetas" |		

	@tc163_Cards_Validate_eye_button_to_view_the_entered_balance_card_for_main_card
  Scenario Outline: Cards - TC - 163 - [WEB] - Validate eye button to view the entered balance card for main card
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I select 'Menú tarjeta' for my <typeCard> card
		When I click on eye opened button for the main card
		Then should display the card Balance
		
    Examples:
      | country     | documentation | password  | menu       | typeCard |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "main"   |	
      
	@tc0164_Cards_Validate_eye_fom_balance_cards_for_virtual_card
  Scenario Outline: Cards - TC - 164 - [WEB] - Validate eye button to view the entered balance card for virtual card
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I select 'Menú tarjeta' for my last <typeCard> card
		When I click on eye opened button for the virtual card
		Then should display the card Balance
		
    Examples:
      | country     | documentation | password  | menu       | typeCard  |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "virtual" |	
	
	@tc165_Cards_Validate_buscar_comprobante_for_main_card
  Scenario Outline: Cards - TC - 165 - [WEB] - Validate 'buscar comprobante' for main card
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I select 'Movimientos' for my <typeCard> card
		When I search for 'Compra'
		Then should display all the information about the search
		
    Examples:
      | country     | documentation | password  | menu       | typeCard |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "main"   | 
	
	@tc166_Cards_Validate_virtual_card_without_operation
  Scenario Outline: Cards - TC - 166 - [WEB] - Validate virtual card without operation
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I select 'Movimientos' for my enabled <typeCard> card
		When I search for 'Compra'
		Then should display a screen with the message 'Todavía no hiciste ninguna operación con esta tarjeta'
		
    Examples:
      | country     | documentation | password  | menu       | typeCard  |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "virtual" | 
      
	@tc167_Cards_Validate_buscar_comprobante_for_virtual_card
  Scenario Outline: Cards - TC - 167 - [WEB] - Validate 'buscar comprobante' for virtual card
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I select 'Movimientos' for my last <typeCard> card
		When I search for 'Compra'
		Then should display all the information about the virtual card transactions
		
    Examples:
      | country     | documentation | password  | menu       | typeCard  |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "virtual" | 
            
	@tc168_Cards_Validate_ningun_movimiento_for_main_card
  Scenario Outline: Cards - TC - 168 - [WEB] - Validate buscar comprobante - ningún movimiento for main card
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I select 'Movimientos' for my last <typeCard> card
		When I search for 'asdf'
    Then I see the messages:
    	| ¡Ups! No se encontró ningún movimiento 		  					                            |
    	| Por favor, revisa lo que escribiste o realiza otra búsqueda usando otras palabras |

    Examples:
      | country     | documentation | password  | menu       | typeCard |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "main"   |
      
	@tc169_Cards_Validate_layout_for_limit_of_virtual_Card
  Scenario Outline: Cards - TC - 169 - [WEB] - Validate layout for limit of virtual Card
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I select 'Menú tarjeta' for my first <typeCard> card
		And I click on plus button
		When I click on 'Pedir tarjeta virtual'
		And I insert virtual card name
		And I click on 'Continuar'
		And I confirm virtual card data by clicking on 'Confirmar'
		Then should display a screen with the message '¡Ups! Hubo un error al solicitar la tarjeta'

    Examples:
      | country     | documentation | password  | menu       | typeCard  |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "virtual" |
      
	@tc170_Cards_Validate_ningun_movimiento_for_virtual_card
  Scenario Outline: Cards - TC - 170 - [WEB] - Validate buscar comprobante - ningún movimiento for virtual card
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

	@tc171_Cards_Validate_boton_de_baja_TimeOut_for_virtual_card
  Scenario Outline: Cards - TC - 171 - [WEB] - Validate botón de baja timeOut for virtual card
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

	@tc172_Cards_Validate_boton_de_baja_timeOut_for_main_card
  Scenario Outline: Cards - TC - 172 - [WEB] - Validate botón de baja timeOut for main card
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
      
	@tc173_Cards_Validate_back_to_the_main_screen_cards
  Scenario Outline: Cards - TC - 173 - [WEB] - Validate back to the main screen cards from the recargar tarjeta screen
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I select 'Menú tarjeta' for my last <typeCard> card
		When I click on 'Recargar tarjeta'
	  And I click on button back
    Then should back to the main screen cards
		
    Examples:
      | country     | documentation | password  | menu       | typeCard  |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "virtual" |
      
	@tc174_Cards_Validate_back_to_the_main_screen_from_tarjetas_Screen
  Scenario Outline: Cards - TC - 174 - [WEB] - Validate back to the main screen from tarjetas Screen
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
	  When I click on main button back
    Then should back to the main screen
		
    Examples:
      | country     | documentation | password  | menu       | typeCard  |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "virtual" |
      
 ################# -- THIRD DELIVERY -- #################

 	@tc175_Cards_Validate_report_international_travel
  Scenario Outline: Cards - TC - 175 - [WEB] - Validate report international travel for main card
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I select 'Menú tarjeta' for my <typeCard> card
		When I click on 'Informar viaje internacional'
		And I click on 'Registrar aviso de viaje'
		And I selec the country <selectCountry>
		And I select the arrival date to 1 day +
		And I click on 'Crear aviso'
    Then should display a new repot
		
    Examples:
      | country     | documentation | password  | menu       | typeCard | selectCountry |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "main"   | "Argentina"   |
      
 	@tc176_Cards_Validate_invalid_date_Format_for_report_international_travel
  Scenario Outline: Cards - TC - 176 - [WEB] - Validate invalid date Format for report international travel
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I select 'Menú tarjeta' for my <typeCard> card
		And I click on 'Informar viaje internacional'
		And I click on 'Registrar aviso de viaje'
		And I selec the country <selectCountry>
		When I select the departure date "11/51/1111"
    Then should display a screen with the message 'Invalid Date Format'
		
    Examples:
      | country     | documentation | password  | menu       | typeCard | selectCountry |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "main"   | "Argentina"   |
      
 	@tc177_Cards_Validate_return_date_earlier_than_the_departure_date
  Scenario Outline: Cards - TC - 177 - [WEB] - Validate return date earlier than the departure date
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I select 'Menú tarjeta' for my <typeCard> card
		And I click on 'Informar viaje internacional'
		And I click on 'Registrar aviso de viaje'
		And I selec the country <selectCountry>
		When I select the departure date to 1 day +
    Then should display a screen with the message 'La fecha de regreso no puede ser anterior a la fecha de salida'
		
    Examples:
      | country     | documentation | password  | menu       | typeCard | selectCountry |
      | "Argentina" | "29709517"    | "192837"  | "Tarjetas" | "main"   | "Argentina"   |

	@tc178_Cards_Validate_timeOut_activate_card_for_main_card
  Scenario Outline: Cards - TC - 178 - [WEB] - Validate timeOut activate card for main card
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I click on 'Activar tarjeta'
		When I fill in the Vencimiento field
		And I click on 'Continuar'		
		And I don't validate the operation on the app
    Then I see the messages:
    	| El tiempo para realizar la operación ha terminado. Puedes volver a realizar la validación  |
    	| La solicitación no fue realiza                                                             |
		
    Examples:
      | country     | documentation | password  | menu       |
      | "Argentina" | "46665484"    | "192837"  | "Tarjetas" |

 ################# -- FOURTH DELIVERY -- #################
 
	@tc247_Cards_Validate_layout_for_block_main_card
  Scenario Outline: Cards - TC - 247 - [WEB] - happy path - Validate layout for block main card
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And already activate my main card
		And I select 'Menú tarjeta' for my <typeCard> card
		When I click on 'Bloqueo temporal'
		And I accept the terms to block the card
		Then the main card should be blocked
		And the switch button should be updated
		
    Examples:
      | country     | documentation | password  | menu       | typeCard  |
      | "Argentina" | "09780458"    | "192837"  | "Tarjetas" | "main"    |
      
	@tc248_Cards_Validate_layout_for_unblock_main_Card
  Scenario Outline: Cards - TC - 248 - [WEB] - happy path - Validate layout for unblock main card
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And already blocked my main card
		When I click on 'Bloqueo temporal'
		And I confirm operation on the mobile app		
		Then should display the screen with message: 'Listo! Tu tarjeta está ya está desbloqueada'
		And the main card should be unblocked
		And the switch button should be updated
		
    Examples:
      | country     | documentation | password  | menu       | typeCard |
      | "Argentina" | "09780458"    | "192837"  | "Tarjetas" | "main"   |     
      