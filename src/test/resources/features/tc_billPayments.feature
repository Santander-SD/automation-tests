#language: en
#enconding: UTF-8
@billPayments
Feature: Bill Payments

  Background:
    Given are on the application's login page

	@tc109_BillPayments_standard_flow_of_success
  Scenario Outline: BillPayments - TC - 109 - [WEB] - [AR] Success Flow I - Standard Flow of Success
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
    And fill in the Company field with <company>		
		And I select the company
		And fill in the payment code field with <code>
		And I insert the value <value>
		And I click on 'Continue'
		And I click on 'Sí, están correctos'
		When I confirm operation on my mobile app 
		Then the payment is made

    Examples:
      | country     | documentation | password  | menu    | value   | company                | code          |
      | "Argentina" | "29709517"    | "192837"  | "Pagar" | "1,12"  | "ASDRA ASOC SIND DOWN" | "20020022214" |

	@tc110_BillPayments_typing_the_barcode
  Scenario Outline: BillPayments - TC - 110 - [WEB] - [AR] Success Flow III - Typing the barcode
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I click on 'Ingresar código de barras'
    When fill in the barCode field with <code>
		And I click on 'Continuar'
		And I click on 'Sí, están correctos'
		And I confirm operation on my mobile app 
		Then the payment is made
	
    Examples:
      | country     | documentation | password  | menu    | code                                                 |
      | "Argentina" | "29709517"    | "192837"  | "Pagar" | "63500806973446601000097646000098491511041610129103" |

	@tc111_BillPayments_validate_voucher_information
  Scenario Outline: BillPayments - TC - 111 - [WEB] - [AR] Success Flow IV - Validate Voucher Information
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
    And fill in the Company field with <company>		
		And I select the company
		And fill in the payment code field with <code>
		And I insert the value <value>
		And I click on 'Continue'
		And I click on 'Sí, están correctos'
		When I confirm operation on my mobile app
		Then voucher information is displayed

    Examples:
      | country     | documentation | password  | menu    | value   | company                | code          |
      | "Argentina" | "29709517"    | "192837"  | "Pagar" | "1,12"  | "ASDRA ASOC SIND DOWN" | "20020022214" |

	@tc112_BillPayments_share_voucher_successfully
  Scenario Outline: BillPayments - TC - 112 - [WEB] - [AR] Success Flow V - Share voucher successfully
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
    And fill in the Company field with <company>		
		And I select the company
		And fill in the payment code field with <code>
		And I insert the value <value>
		And I click on 'Continue'
		And I click on 'Sí, están correctos'
		When I confirm operation on my mobile app
		And I click the "Ver comprobante" button
		And should display the message 'Pago realizado!' on the screen	
		Then a screen shows the sharing options for the vouncher information

    Examples:
      | country     | documentation | password  | menu    | value   | company                | code          |
      | "Argentina" | "29709517"    | "192837"  | "Pagar" | "1,12"  | "ASDRA ASOC SIND DOWN" | "20020022214" |


	@tc113_BillPayments_payment_between_the_minimum_and_maximum_amount_of_the_bank_slip
  Scenario Outline: BillPayments - TC - 113 - [WEB] - [AR] Success Flow VI - Payment between the minimum and maximum amount of the bank slip
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
    And fill in the Company field with <company>
		And I select the company
		When fill in the payment code field with <code>
		And I insert the value <value>
		And I click on 'Continue'
		Then the payment information is between the minimum and the maximum amount established by the bank:
    	| ¿Los datos del pago están correctos?												|
    	| PAGO SERVICIOS-COBRANZA ABIERTA (PAGO DIRECTO SIN CONSULTA) |
    	| 1000111                                                     |
    	| $ 11,12                                                     |
	
    Examples:
      | country     | documentation | password  | menu    | value    | company                | code          |
      | "Argentina" | "29709517"    | "192837"  | "Pagar" | "11,12"  | "ASDRA ASOC SIND DOWN" | "20020022214" |

	@tc114_BillPayments_insufficient_account_balance
  Scenario Outline: BillPayments - TC - 114 - [WEB] - [AR] Exception Flow I - Insufficient account balance
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
    And fill in the Company field with <company>
		And I select the company
		When fill in the payment code field with <code>
		And I insert the value <value>
		Then Should not continue the flow

    Examples:
      | country     | documentation | password  | menu    | value      | company                | code          |
      | "Argentina" | "09780458"    | "192837"  | "Pagar" | "50,00002" | "ASDRA ASOC SIND DOWN" | "20020022214" |

	@tc115_BillPayments_wrong_bank_slip_number
  Scenario Outline: BillPayments - TC - 115 - [WEB] - [AR] Exception Flow II - Wrong bank slip number
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I click on 'Ingresar código de barras'
    When fill in the barCode field with <code>
		And I click on 'Continuar'    
		Then it should display all the messages below:
    	| ¡Atención!													                                                                   | 
    	| No pudimos validar el código de barras. Puede ingresar los datos en la opción de búsqueda de empresas. |

    Examples:
      | country     | documentation | password  | menu    | code                                                 |
      | "Argentina" | "09780458"    | "192837"  | "Pagar" | "63500806973446601000097646000098491511041610121111" |

	@tc116_BillPayments_invalid_bank_slip
  Scenario Outline: BillPayments - TC - 116 - [WEB] - [AR] Exception Flow III - Invalid bank slip
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I click on 'Ingresar código de barras'
    When fill in the barCode field with <code>
		And I click on 'Continuar'    
		Then it should display all the messages below:
    	| ¡Atención!													                                                                   | 
    	| No pudimos validar el código de barras. Puede ingresar los datos en la opción de búsqueda de empresas. |

    Examples:
      | country     | documentation | password  | menu    | code                                                 |
      | "Argentina" | "09780458"    | "192837"  | "Pagar" | "00000000000000000000000000000000000000000000000111" |

	@tc117_BillPayments_bank_slip_out_of_due_date
  Scenario Outline: BillPayments - TC - 117 - [WEB] - [AR] Exception Flow IV - Bank slip out of due date
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I click on 'Ingresar código de barras'
    When fill in the barCode field with <code>
		And I click on 'Continuar'
		Then the application show a message saying that I have a out of date bank slip

    Examples:
      | country     | documentation | password  | menu    | code                                                 |
      | "Argentina" | "09780458"    | "192837"  | "Pagar" | "63500806973446601000097646000098491511041610129103" |

	@tc118_BillPayments_bank_slip_with_payment_already_made
  Scenario Outline: BillPayments - TC - 118 - [WEB] - [AR] Exception Flow V - Bank slip with payment already made
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I click on 'Ingresar código de barras'
    When fill in the barCode field with <code>
		And I click on 'Continuar'
		Then the application displays a message saying the payment has already been made.

    Examples:
      | country     | documentation | password  | menu    | code                         |
      | "Argentina" | "09780458"    | "192837"  | "Pagar" | "01092003442744500000104577" |

	@tc119_BillPayments_bank_slip_paid_by_another_user
  Scenario Outline: BillPayments - TC - 119 - [WEB] - [AR] Exception Flow VI - Bank slip paid by another user
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I click on 'Ingresar código de barras'
    When fill in the barCode field with <code>
		And I click on 'Continuar'
		Then the aplication show a message saying that I have bank slip with payment already made by another user.

    Examples:
      | country     | documentation | password  | menu    | code                         |
      | "Argentina" | "39720299"    | "192837"  | "Pagar" | "01092003442744500000104577" |

	@tc120_BillPayments_invalid_barcode
  Scenario Outline: BillPayments - TC - 120 - [WEB] - [AR] Exception Flow VII - Invalid barcode
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I click on 'Ingresar código de barras'
    When fill in the barCode field with <code>
		And I click on 'Continuar'    
		Then it should display all the messages below:
    	| ¡Atención!													                                                                   | 
    	| No pudimos validar el código de barras. Puede ingresar los datos en la opción de búsqueda de empresas. |

    Examples:
      | country     | documentation | password  | menu    | code                                                 |
      | "Argentina" | "09780458"    | "192837"  | "Pagar" | "00000000000000000000000000000000000000000000000111" |

	@tc121_BillPayments_invalid_pin
  Scenario Outline: BillPayments - TC - 121 - [WEB] - [AR] Exception Flow VIII - Invalid PIN
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I click on 'Ingresar código de barras'
    When fill in the barCode field with <code>
		And I click on 'Continuar'
		And I click on 'Sí, están correctos'
		And I confirm operation on my mobile app 
		And I click on confirm in the pop-up
		And I enter a invalid PIN number
		Then a message appears saying I have a invalid PIN number
	
    Examples:
      | country     | documentation | password  | menu    | code                                                 |
      | "Argentina" | "29709517"    | "192837"  | "Pagar" | "63500806973446601000097646000098491511041610129103" |

	@tc122_BillPayments_payment_above_the_total_bill_amount
  Scenario Outline: BillPayments - TC - 121 - [WEB] - [AR] Exception Flow IX - Payment above the total bill amount
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I click on 'Ingresar código de barras'
    When fill in the barCode field with <code>
		And I click on 'Continuar'
		Then the payment screen  is loaded but the payment is above the total bill amount amount making it impossible to continue the flow
	
    Examples:
      | country     | documentation | password  | menu    | code                                           |
      | "Argentina" | "39720299"    | "192837"  | "Pagar" | "05700294232090003814554482101160000035000003" |

	@tc123_BillPayments_payment_with_zero_value
  Scenario Outline: BillPayments - TC - 123 - [WEB] - [AR] Exception Flow X - Payment with zero value
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I click on 'Ingresar código de barras'
    When fill in the barCode field with <code>
		And I click on 'Continuar'
		Then the payment screen  is loaded but the payment is is shown to be zero amount making it impossible to continue the flow
	
    Examples:
      | country     | documentation | password  | menu    | code                                                 |
      | "Argentina" | "39720299"    | "192837"  | "Pagar" | "00000000000000000000000000000000000000000000000000" |

	@tc124_BillPayments_payment_over_the_security_threshold
  Scenario Outline: BillPayments - TC - 124 - [WEB] - [AR] Exception Flow XI - Payment over the security threshold
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I click on 'Ingresar código de barras'
    When fill in the barCode field with <code>
    And I click on 'Continuar'
		And I insert the value <value>
		Then should display a screen with the message 'Valor máximo: $ 2.000,00'
	
    Examples:
      | country     | documentation | password  | menu    | code                                         | value      | 
      | "Argentina" | "39720299"    | "192837"  | "Pagar" | "000000000008032021027219982130000003930032" | "20,00000" |

	@tc125_BillPayments_timeout
  Scenario Outline: BillPayments - TC - 125 - [WEB] - [AR] Exception Flow XII - Continue the flow after exceeding the session time limit
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
    And fill in the Company field with <company>		
		And I select the company
		And fill in the payment code field with <code>
		And I insert the value <value>
		And I click on 'Continue'
		And I click on 'Sí, están correctos'
		And I don't validate the operation on the app
    Then I see the messages:
    	| El pago no fue realizado  																														|
    	| El tiempo para realizar el pago ha terminado. Puedes volver a realizar la validación  |

    Examples:
      | country     | documentation | password  | menu    | value   | company                | code          |
      | "Argentina" | "29709517"    | "192837"  | "Pagar" | "1,12"  | "ASDRA ASOC SIND DOWN" | "20020022214" |

########### new scenarios ###########
	@tc263_BillPayments_company_not_found
  Scenario Outline: BillPayments - TC - 263 - [WEB] - [AR] Exception Flow - Company not found
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
    When fill in the Company field with <company>		
		Then should display a screen with the message 'No se encontraron resultados'

    Examples:
      | country     | documentation | password  | menu    | company  |
      | "Argentina" | "29709517"    | "192837"  | "Pagar" | "F123fd" |

	@tc264_BillPayments_payment_with_zero_value
  Scenario Outline: BillPayments - TC - 264 - [WEB] - [AR] Exception Flow - Payment with zero value
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		When I click on 'Ingresar código de barras'
		And I click on help button
		Then it should display all the messages below:
    	| Números del código de barras			                                     |
    	| Es el número que está siempre cerca del código de barras de tu factura |
	
    Examples:
      | country     | documentation | password  | menu    |
      | "Argentina" | "39720299"    | "192837"  | "Pagar" |

	@tc265_BillPayments_Return_to_main_screen_from_an_invalid_barcode
  Scenario Outline: BillPayments - TC - 265 - [WEB] - [AR] Exception Flow - Return to main screen from an invalid barcode
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I click on 'Ingresar código de barras'
    When fill in the barCode field with <code>
		And I click on 'Continuar'    
		And I click on 'Volver al inicio'    
		Then it should display all the messages below:
    	| Cargar dinero		   | 
    	| Buscar movimientos |

    Examples:
      | country     | documentation | password  | menu    | code                                                 |
      | "Argentina" | "09780458"    | "192837"  | "Pagar" | "00000000000000000000000000000000000000000000000111" |

	@tc266_BillPayments_clear_the_field_company
  Scenario Outline: BillPayments - TC - 266 - [WEB] - [AR] Exception Flow - Clear the field company
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
    And fill in the Company field with <company>		
    When I click on clear button
		Then the field is clean 
		
    Examples:
      | country     | documentation | password  | menu    | company  |
      | "Argentina" | "29709517"    | "192837"  | "Pagar" | "F123fd" |

	@tc267_BillPayments_validate_the_main_payment_screen
  Scenario Outline: BillPayments - TC - 267 - [WEB] - [AR] Validate the main payment screen
		And I'm logged in with the data <country>,<documentation> and <password>
		When I'm on the <menu> page
		Then it should display all the messages below:
    	| ¿A qué empresa vas a pagarle?	   | 
    	| Ingresar código de barras        |

    Examples:
      | country     | documentation | password  | menu    |
      | "Argentina" | "29709517"    | "192837"  | "Pagar" |

	@tc268_BillPayments_validate_barcode_screen
  Scenario Outline: BillPayments - TC - 268 - [WEB] - [AR] Validate barcode screen
		And I'm logged in with the data <country>,<documentation> and <password>
		When I'm on the <menu> page
		And I click on 'Ingresar código de barras'
		Then should display a screen with the message 'Ingrese los números del código de barras'
    Examples:
      | country     | documentation | password  | menu    |
      | "Argentina" | "29709517"    | "192837"  | "Pagar" |

	@tc269_BillPayments_search_company_from_the_barcode_screen
  Scenario Outline: BillPayments - TC - 269 - [WEB] - [AR] Exception Flow - Search company from the barcode screen
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I click on 'Ingresar código de barras'
    When fill in the barCode field with <code>
		And I click on 'Continuar'
		And I click on 'Ok, busca empresas' 
		Then should display a screen with the message '¿A qué empresa vas a pagarle?'

    Examples:
      | country     | documentation | password  | menu    | code                                                 |
      | "Argentina" | "09780458"    | "192837"  | "Pagar" | "00000000000000000000000000000000000000000000000111" |

	@tc270_BillPayments_back_to_the_main_screen_from_the_barcode_screen
  Scenario Outline: BillPayments - TC - 270 - [WEB] - [AR] Exception Flow - Back to the main screen from the barcode screen
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I click on 'Ingresar código de barras'
	  When I click on button arrow back
		Then it should display all the messages below:
    	| Cargar dinero		   |
    	| Buscar movimientos |

    Examples:
      | country     | documentation | password  | menu    |
      | "Argentina" | "09780458"    | "192837"  | "Pagar" |

	@tc271_BillPayments_validade_payment_screen
  Scenario Outline: BillPayments - TC - 271 - [WEB] - [AR] Exception Flow - Validade payment screen 
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
    And fill in the Company field with <company>
		When I select the company
		Then it should display all the messages below:
    	| ASDRA ASOC SIND DOWN	                                      |
    	| PAGO SERVICIOS-COBRANZA ABIERTA (PAGO DIRECTO SIN CONSULTA) |
	
    Examples:
      | country     | documentation | password  | menu     | company                |
      | "Argentina" | "09780458"    | "192837"  | "Pagar"  | "ASDRA ASOC SIND DOWN" |

	@tc272_BillPayments_back_to_the_payment_screen_from_the_second_payment_screen
  Scenario Outline: BillPayments - TC - 272 - [WEB] - [AR] Exception Flow - Back to the payment screen from the second payment screen
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
    And fill in the Company field with <company>
		When I select the company
	  And I click on button arrow back
		Then should display a screen with the message '¿A qué empresa vas a pagarle?'
	
    Examples:
      | country     | documentation | password  | menu     | company                |
      | "Argentina" | "09780458"    | "192837"  | "Pagar"  | "ASDRA ASOC SIND DOWN" |

	@tc273_BillPayments_correct_payment_data
  Scenario Outline: BillPayments - TC - 273 - [WEB] - [AR] Exception Flow - Correct payment data
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I click on 'Ingresar código de barras'
    When fill in the barCode field with <code>
		And I click on 'Continuar'
		And I click on 'No están correctos, corregir'
		Then should display a screen with the message 'Ingrese los números del código de barras'
	
    Examples:
      | country     | documentation | password  | menu    | code                                                 |
      | "Argentina" | "29709517"    | "192837"  | "Pagar" | "63500806973446601000097646000098491511041610129103" |
      
  @tc274_BillPayments_back_to_the_barcode_payment
  Scenario Outline: BillPayments - TC - 274 - [WEB] - [AR] Exception Flow - Back to the barcode payment
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I click on 'Ingresar código de barras'
    When fill in the barCode field with <code>
		And I click on 'Continuar'
	  And I click on back arrow
		Then should display a screen with the message 'Ingrese los números del código de barras'
	
    Examples:
      | country     | documentation | password  | menu    | code                                                 |
      | "Argentina" | "29709517"    | "192837"  | "Pagar" | "63500806973446601000097646000098491511041610129103" |

	@tc275_BillPayments_timeout_payment_barcode
  Scenario Outline: BillPayments - TC - 275 - [WEB] - [AR] Exception Flow - Timeout payment barcode
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I click on 'Ingresar código de barras'
    And fill in the barCode field with <code>
		And I click on 'Continuar'		
		When I click on 'Sí, están correctos'
		And I don't validate the operation on the app
    Then I see the messages:
    	| El pago no fue realizado  																														|
    	| El tiempo para realizar el pago ha terminado. Puedes volver a realizar la validación  |

    Examples:
      | country     | documentation | password  | menu     | code                                                  |
      | "Argentina" | "29709517"    | "192837"  | "Pagar"  | "A63500806973446601000097646000098491511041610129103" |
    
	@tc276_BillPayments_validate_fill_in_the_value_field_only_with_numbers
  Scenario Outline: BillPayments - TC - 276 - [WEB] - [AR] Exception Flow - Validate fill in the value field only with numbers
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
    And fill in the Company field with <company>		
		And I select the company
		And fill in the payment code field with <code>
		When insert the value <value>
		Then the field does not allow entering the value 

    Examples:
      | country     | documentation | password  | menu    | value   | company                | code          |
      | "Argentina" | "29709517"    | "192837"  | "Pagar" | "abc"   | "ASDRA ASOC SIND DOWN" | "20020022214" |   

	@tc277_BillPayments_validate_fill_in_the_value_field_only_with_numbers_on_barcode
  Scenario Outline: BillPayments - TC - 277 - [WEB] - [AR] Exception Flow - Validate fill in the value field only with numbers on barcode
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I click on 'Ingresar código de barras'
    When fill in the barCode field with <code>
    And I click on 'Continuar'
		And insert the value <value>
		Then the field does not allow entering the value 
	
    Examples:
      | country     | documentation | password  | menu    | code                                         | value  | 
      | "Argentina" | "39720299"    | "192837"  | "Pagar" | "000000000008032021027219982130000003930032" | "abc"  |         