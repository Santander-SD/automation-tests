#language: en
#enconding: UTF-8
@CashOut
Feature: Cash Out

  Background:
    Given are on the application's login page

 ################# -- FOURTH DELIVERY -- #################
     
	@tc249_CashOut_Validate_retirar_efectivo_por_rapipago
  Scenario Outline: CashOut - TC - 249 - [WEB] - [AR] Cash Out - Without Card - Validate retirar efectivo por rapipago
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		When I click on Help button
		Then should be displayed the data bellow:
    	| Retirar efectivo por Rapipago													          |
    	| El mínimo es de $100 y el máximo de $10.000 en cualquier punto. |
    	| Deberás llevar tu DNI y tu celular para validar la operación.   |

    Examples:
      | country     | documentation | password  | menu      |
      | "Argentina" | "08203590"    | "192837"  | "Extraer" |

	@tc250_CashOut_Validate_the_modal_of_attention_where_it_displays_the_total_amount
  Scenario Outline: CashOut - TC - 250 - [WEB] - [AR] Cash Out - Without Card - Validate the modal of attention where it displays the total amount of serve added with taxes 
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		When I click on "Comisión por retiro: $108,90 (incluye IVA)"
		Then should be displayed the data bellow:
    	| Comisión por retiro												                                                                                                                                                             |
    	| Es necesario que tengas en tu cuenta Superdigital al menos $ 208,90, ya que el monto mínimo de retiro es de $ 100,00 y el costo de la operación es de $ 108,90 ($ 90,00 de comisión + $ 18,90 de IVA)  |

    Examples:
      | country     | documentation | password  | menu      |
      | "Argentina" | "08203590"    | "192837"  | "Extraer" |      


	@tc251_CashOut_Validate_activation_of_the_continue_button
  Scenario Outline: CashOut - TC - 251 - [WEB] - [AR] Cash Out - Generate OTP (FE Web) - Validate activation of the continue button
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		When I'm on the screen where I define the amount to be withdrawn, I put the value <value> which is released for withdrawal
		Then the Continue button is activated to give Cash Out procedure

    Examples:
      | country     | documentation | password  | menu      | value  |
      | "Argentina" | "08203590"    | "192837"  | "Extraer" | "105"  |

	@tc252_CashOut_Validate_serve_value_outside_allowed
  Scenario Outline: CashOut - TC - 252 - [WEB] - [AR] Cash Out - Generate OTP (FE Web) - Validate serve value outside allowed
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		When I'm on the screen where I define the amount to be withdrawn, I put the value <value> which is out of the allowed
		Then the Continue button is not enabled

    Examples:
      | country     | documentation | password  | menu      | value |
      | "Argentina" | "08203590"    | "192837"  | "Extraer" | "50"  |

	@tc253_CashOut_Validate_cancel_button_action_in_modal
  Scenario Outline: CashOut - TC - 253 - [WEB] - [AR] Cash Out - Without Card - Validate cancel button action in modal
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And on the effective retreat screen to define the value to be removed with <value>
		And I click on "Continuar"
		When I click the cancel button of an attention modal
		Then return to screen to choose value for serve

    Examples:
      | country     | documentation | password  | menu      | value |
      | "Argentina" | "08203590"    | "192837"  | "Extraer" | "123" |

	@tc254_CashOut_Validate_lash_rate_calculation_modal
  Scenario Outline: CashOut - TC - 254 - [WEB] - [AR] Cash Out - Without Card - Validate lash rate calculation modal
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And on the effective retreat screen to define the value to be removed with <value>
		When I click on "Continuar"		
		Then display a modal of attention informing:
    	| ¡Atención!				           |
    	| Retiro de efectivo $ 145,00  |
    	| Comisión por retiro $ 108,90 |
    	| Saldo necesario $ 253,90     |		

    Examples:
      | country     | documentation | password  | menu      | value |
      | "Argentina" | "08203590"    | "192837"  | "Extraer" | "145" |

	@tc255_CashOut_Validate_minimum_value_of_serve_on_super_digital_platform
  Scenario Outline: CashOut - TC - 255 - [WEB] - [AR] Cash Out - Without Card - Validate minimum value of serve on super digital platform
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		When on the effective retreat screen to define the value to be removed with <value>
		Then should display a screen with the message 'El mínimo permitido es $ 100,00'

    Examples:
      | country     | documentation | password  | menu      | value |
      | "Argentina" | "08203590"    | "192837"  | "Extraer" | "4"   |

	@tc256_CashOut_Validate_alert_toast_balance_color
  Scenario Outline: CashOut - TC - 256 - [WEB] - [AR] Cash Out - Without Card - Validate alert toast balance color
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		When on the effective retreat screen to define the value to be removed with <value>
		Then should display a toast balance with a new color

    Examples:
      | country     | documentation | password  | menu      | value    |
      | "Argentina" | "08203590"    | "192837"  | "Extraer" | "123456" |

	@tc257_CashOut_Validate_timeout_operation
  Scenario Outline: CashOut - TC - 257 - [WEB] - [AR] Cash Out - Without Card - Validate timeout operation
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And on the effective retreat screen to define the value to be removed with <value>
		When I click on "Continuar"		
		And I click on "Ok, continuar"				
		And I don't validate the operation on the app
    Then I see the messages:
    	| El pago no fue realizado                                                              |
    	| El tiempo para realizar el pago ha terminado. Puedes volver a realizar la validación  |

    Examples:
      | country     | documentation | password  | menu      | value |
      | "Argentina" | "08203590"    | "192837"  | "Extraer" | "145" |


	@tc258_CashOut_Validate_on_the_extraction_screen_the_total_account_value
  Scenario Outline: CashOut - TC - 258 - [WEB] - [AR] Cash Out - Without Card - Validate on the extraction screen the total account value
		And I'm logged in with the data <country>,<documentation> and <password>
		And check the balance on the main screen
		And I'm on the <menu> page
		When on the extacción screen where it defines the value to be withdrawn
		Then contain an infomative with the total account value

    Examples:
      | country     | documentation | password  | menu      |
      | "Argentina" | "08203590"    | "192837"  | "Extraer" |

	@tc259_CashOut_Validate_cash_out_uncompressed_when_requesting_authorization
  Scenario Outline: CashOut - TC - 259 - [WEB] - [AR] Cash Out - Without Card - Validate cash out uncompressed when requesting authorization in mobile for generation of the OTP code
		And I'm logged in with the data <country>,<documentation> and <password>
		And check the balance on the main screen		
		And I'm on the <menu> page
		And on the effective retreat screen to define the value to be removed with <value>
		And I click on "Continuar"		
		And I click on "Ok, continuar"				
		When should display a screen with the message 'Confirma esta operación desde tu celular'
		Then I click to close and return to home from the Super Digital application to validate that the serve operation was not performed

    Examples:
      | country     | documentation | password  | menu      | value |
      | "Argentina" | "08203590"    | "192837"  | "Extraer" | "145" |

	@tc260_CashOut_Validate_successful_drawing_value
  Scenario Outline: CashOut - TC - 260 - [WEB] - [AR] Cash Out - Without Card - Validate successful drawing value
		And I'm logged in with the data <country>,<documentation> and <password>
		And check the balance on the main screen		
		And I'm on the <menu> page
		And on the effective retreat screen to define the value to be removed with <value>
		And I click on "Continuar"		
		And I click on "Ok, continuar"				
		And should display a screen with the message 'Confirma esta operación desde tu celular'
		When logged in in Super Digital Application
		And click the button with the user's letters
		And a list containing the option "Validar Transactions"
		And click on the approving
		Then on the Super Digital Web screen The OTP coding generation is relized
		And at home will display the value of the serve
		
		    Examples:
      | country     | documentation | password  | menu      | value |
      | "Argentina" | "08203590"    | "192837"  | "Extraer" | "145" |

 ################# -- FIFTH DELIVERY -- #################
 
	@tc261_CashOut_Validate_maximum_value_of_serve_on_super_digital_platform
  Scenario Outline: CashOut - TC - 261 - [WEB] - [AR] Cash Out - Without Card - Validate maximum value of serve on super digital platform
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		When on the effective retreat screen to define the value to be removed with <value>
		Then should display a screen with the message 'El máximo es de $ 10.000,00'

    Examples:
      | country     | documentation | password  | menu      | value   | 
      | "Argentina" | "08203590"    | "192837"  | "Extraer" | "12345" |
      
	@tc262_CashOut_validate_fill_in_the_value_field_only_with_numbers_on_cashout
  Scenario Outline: CashOut - TC - 262 - [WEB] - [AR] Cash Out - Without Card - Validate fill in the value field only with numbers on cashout
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		When insert the value <value>
		Then the field does not allow entering the value 
	
    Examples:
      | country     | documentation | password  | menu      | value  |
      | "Argentina" | "08203590"    | "192837"  | "Extraer" | "abc"  |          