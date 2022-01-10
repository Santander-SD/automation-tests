#language: en
#enconding: UTF-8
@internalTransfer
Feature: Internal Transfer

  Background:
    Given are on the application's login page
    
	@tc059_InternalTransfer_by_favorites_happy_path
  Scenario Outline: Internal Transfer - TC - 059 - [WEB] - [AR] Internal Transfer - Transfer between SD accounts - By favorites - Happy Path
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And Select name of favorite	
		And I insert the value <transferValue>
    And click on button Continuar
    And click on button Confirmar transferencia    
		When I confirm operation on my mobile app 
		Then should display on screen the message 'Transferencia realizada!'
		
    Examples:
      | country     | documentation | password  | menu         | transferValue |
      | "Argentina" | "63059864"    | "192837"  | "Transferir" | "11"          |

	@tc060_InternalTransfer_by_favorites_insufficient_balance
  Scenario Outline: Internal Transfer - TC - 060 - [WEB] - [AR] Internal Transfer - Transfer between SD accounts - By favorites - Insufficient balance
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And Select name of favorite	
		When I insert the value <transferValue>
		Then should display the message 'Esta cantidad es mayor que su saldo actual'
		
    Examples:
      | country     | documentation | password  | menu         | transferValue  |
      | "Argentina" | "63059864"    | "192837"  | "Transferir" | "110,01111"    |

	@tc061_InternalTransfer_by_favorites_negative_result_from_security_process
  Scenario Outline: Internal Transfer - TC - 061 - [WEB] - [AR] Internal Transfer - Transfer between SD accounts - By favorites - Negative result from security process
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And Select name of favorite	
		And I insert the value <transferValue>
    And click on button Continuar
    And click on button Confirmar transferencia    
		When I confirm operation on my mobile app 
		Then should display on screen the message '¡Ups! Ocurrió un error y no pudimos realizar la transferencia'
		
    Examples:
      | country     | documentation | password  | menu         | transferValue   |
      | "Argentina" | "63059864"    | "192837"  | "Transferir" | "1,11"          |

	@tc062_InternalTransfer_by_favorites_an_occasional_service_call_failure
  Scenario Outline: Internal Transfer - TC - 062 - [WEB] - [AR] Internal Transfer - Transfer between SD accounts - By favorites - An occasional service call failure 
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And Select name of favorite	
		And I insert the value <transferValue>
    And click on button Continuar
    And click on button Confirmar transferencia    
		When I confirm operation on my mobile app 
    Then should display on screen the messages:
    	| ¡Ups! Hubo un error y no pudimos realizar la transferencia  |
    	| ¿Podrías intentarlo de nuevo más tarde?                     |
		
    Examples:
      | country     | documentation | password  | menu         | transferValue  |
      | "Argentina" | "63059864"    | "192837"  | "Transferir" | "1,11"         |

	@tc063_InternalTransfer_by_document_happy_path 
  Scenario Outline: Internal Transfer - TC - 063 - [WEB] - [AR] Internal Transfer - Transfer between SD accounts - By document - Happy Path 
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I click on 'Buscar por número de documento'
    And fill in the field with <document>
    And click on button Continuar
		And I insert the value <transferValue>
    And click on button Continuar
    And click on button Confirmar transferencia
		When I confirm operation on my mobile app 
		Then should display on screen the message 'Transferencia realizada!'
		
    Examples:
      | country     | documentation | password  | menu         | document   | transferValue  |
      | "Argentina" | "63059864"    | "192837"  | "Transferir" | "61508714" | "1,11"         |

	@tc064_InternalTransfer_by_document_insufficient_balance
  Scenario Outline: Internal Transfer - TC - 064 - [WEB] - [AR] Internal Transfer - Transfer between SD accounts - By document - Insufficient balance
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I click on 'Buscar por número de documento'
    And fill in the field with <document>
    And click on button Continuar
		When I insert the value <transferValue>
		Then should display the message 'Esta cantidad es mayor que su saldo actual'
		
    Examples:
      | country     | documentation | password  | menu         | document   | transferValue |
      | "Argentina" | "63059864"    | "192837"  | "Transferir" | "61508714" | "110,01111"   |

	@tc065_InternalTransfer_by_document_negative_result_from_security_process
  Scenario Outline: Internal Transfer - TC - 065 - [WEB] - [AR] Internal Transfer - Transfer between SD accounts - By document - Negative result from security process
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I click on 'Buscar por número de documento'
    And fill in the field with <document>
    And click on button Continuar    
		And I insert the value <transferValue>
    And click on button Continuar
    And click on button Confirmar transferencia    
		When I confirm operation on my mobile app 
		Then should display on screen the message '¡Ups! Ocurrió un error y no pudimos realizar la transferencia'
		
    Examples:
      | country     | documentation | password  | menu         | document   | transferValue |
      | "Argentina" | "63059864"    | "192837"  | "Transferir" | "61508714" | "1,11"        |

	@tc066_InternalTransfer_by_document_denied_and_Held
  Scenario Outline: Internal Transfer - TC - 066 - [WEB] - [AR] Internal Transfer - Transfer between SD accounts - By document - Denied and Held
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I click on 'Buscar por número de documento'
    And fill in the field with <document>
    And click on button Continuar    
		And I insert the value <transferValue>
		And should display the message 'Puedes transferir hasta $ 50.000,00 por vez'	
		And I click on main button back
    And fill in the field with <document>
    And click on button Continuar    
		When I insert the value <transferValue2>
		Then should display the message 'Puedes transferir hasta $ 50.000,00 por vez'			

    Examples:
      | country     | documentation | password  | menu         | document   | transferValue |transferValue2 |
      | "Argentina" | "63059864"    | "192837"  | "Transferir" | "61508714" | "80000,06"   | "90000,06"     |

	@tc067_InternalTransfer_by_phonenumber_denied_and_Held
  Scenario Outline: Internal Transfer - TC - 067 - [WEB] - [AR] Internal Transfer - Transfer between SD accounts - By Phonenumber - Denied and Held
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I click on 'Buscar por número de celular'
    And fill in the field with <number>
    And click on button Continuar    
		And I insert the value <transferValue>
		And should display the message 'Puedes transferir hasta $ 50.000,00 por vez'	
		And I click on main button back
    And fill in the field with <number>
    And click on button Continuar    
		When I insert the value <transferValue2>
		Then should display the message 'Puedes transferir hasta $ 50.000,00 por vez'			

    Examples:
      | country     | documentation | password  | menu         | transferValue |transferValue2 | number        |
      | "Argentina" | "63059864"    | "192837"  | "Transferir" | "80000,06"   | "90000,06"     | "91186206663" |

	@tc068_InternalTransfer_by_phonenumber_happy_path
  Scenario Outline: Internal Transfer - TC - 068 - [WEB] - [AR] Internal Transfer - Transfer between SD accounts - By Phonenumber - Happy Path 
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I click on 'Buscar por número de celular'
    And fill in the field with <number>
    And click on button Continuar
		And I insert the value <transferValue>
    And click on button Continuar
    And click on button Confirmar transferencia
		When I confirm operation on my mobile app 
		Then should display on screen the message 'Transferencia realizada!'
		
    Examples:
      | country     | documentation | password  | menu         | number        | transferValue  |
      | "Argentina" | "63059864"    | "192837"  | "Transferir" | "91186206663" | "1,11"         |

	@tc069_InternalTransfer_by_phonenumber_the_cellphone_isnt_a_sds_user 
  Scenario Outline: Internal Transfer - TC - 069 - [WEB] - [AR] Internal Transfer - Transfer between SD accounts - By Phonenumber - The cellphone isn't a SD's user  
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I click on 'Buscar por número de celular'
    And fill in the field with <number>
    And click on button Continuar
		Then should display the message '¡Ups! Este número de celular no es Superdigital'
		And should display the message '¿Podrías buscar el usuario Superdigital por su número de documento?'
		
    Examples:
      | country     | documentation | password  | menu         | number        |
      | "Argentina" | "63059864"    | "192837"  | "Transferir" | "91186206662" |

	@tc070_InternalTransfer_by_phonenumber_insufficient_balance
  Scenario Outline: Internal Transfer - TC - 070 - [WEB] - [AR] Internal Transfer - Transfer between SD accounts - By Phonenumber - Insufficient balance  
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I click on 'Buscar por número de celular'
    And fill in the field with <number>
    And click on button Continuar
		When I insert the value <transferValue>
		Then should display the message 'Esta cantidad es mayor que su saldo actual'
		
    Examples:
      | country     | documentation | password  | menu         | number        | transferValue |
      | "Argentina" | "63059864"    | "192837"  | "Transferir" | "91186206663" | "110,01111"   |

	@tc071_InternalTransfer_by_phonenumber_negative_result_from_security_process
  Scenario Outline: Internal Transfer - TC - 071 - [WEB] - [AR] Internal Transfer - Transfer between SD accounts - By Phonenumber - Negative result from security process
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I click on 'Buscar por número de celular'
    And fill in the field with <number>
    And click on button Continuar    
		And I insert the value <transferValue>
    And click on button Continuar
    And click on button Confirmar transferencia    
		When I confirm operation on my mobile app 
		Then should display on screen the message '¡Ups! Ocurrió un error y no pudimos realizar la transferencia'
		
    Examples:
      | country     | documentation | password  | menu         | number        | transferValue |
      | "Argentina" | "63059864"    | "192837"  | "Transferir" | "91186206663" | "1,11"        |

	@tc072_InternalTransfer_by_phonenumber_number_entered_incomplete
  Scenario Outline: Internal Transfer - TC - 072 - [WEB] - [AR] Internal Transfer - Transfer between SD accounts - By Phonenumber - Number entered incomplete
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I click on 'Buscar por número de celular'
    And fill in the field with <number>   
		And should display the message 'El número ingresado está incompleto'	
		
    Examples:
      | country     | documentation | password  | menu         | number |
      | "Argentina" | "63059864"    | "192837"  | "Transferir" | "1111" |
      
	@tc278_InternalTransfer_validate_main_transfer_screen
  Scenario Outline: Internal Transfer - TC - 278 - [WEB] - [AR] Internal Transfer - Validate main transfer screen
		And I'm logged in with the data <country>,<documentation> and <password>
		When I'm on the <menu> page
		Then it should display all the messages below:
    	| ¿A quién vas a transferirle?     |
    	| A otra cuenta Superdigital       |
    	| Buscar por número de celular     |
    	| A otra cuenta bancaria o virtual |
    	| Buscar por CBU/CVU o Alias       |
    	| Favoritos                        |
		
    Examples:
      | country     | documentation | password  | menu         |
      | "Argentina" | "63059864"    | "192837"  | "Transferir" | 
      
	@tc279_InternalTransfer_validate_phone_screen
  Scenario Outline: Internal Transfer - TC - 279 - [WEB] - [AR] Internal Transfer - Validate phone screen
		And I'm logged in with the data <country>,<documentation> and <password>
	  And I'm on the <menu> page
		When I click on 'Buscar por número de celular'
		Then it should display all the messages below:
    	| Transferir a otra cuenta Superdigital                             |
    	| Ingresar el número de celular de quien recibirá la transferencia  |
    	| Argentina (+54)                                                   |
    	| Código de area sin 0 + número de teléfono sin 15                  |
		
    Examples:
      | country     | documentation | password  | menu         |
      | "Argentina" | "63059864"    | "192837"  | "Transferir" |           

	@tc280_InternalTransfer_validate_doc_screen
  Scenario Outline: Internal Transfer - TC - 280 - [WEB] - [AR] Internal Transfer - Validate doc screen
		And I'm logged in with the data <country>,<documentation> and <password>
	  And I'm on the <menu> page
		When I click on 'Buscar por número de documento'
		Then it should display all the messages below:
    	| Transferir a otra cuenta Superdigital                     |
    	| Ingresar el documento de quien recibirá la transferencia  |

    Examples:
      | country     | documentation | password  | menu         |
      | "Argentina" | "63059864"    | "192837"  | "Transferir" |
      
	@tc281_InternalTransfer_validate_other_accounts_screen
  Scenario Outline: Internal Transfer - TC - 281 - [WEB] - [AR] Internal Transfer - Validate other accounts screen
		And I'm logged in with the data <country>,<documentation> and <password>
	  And I'm on the <menu> page
		When I click on 'Buscar por CBU/CVU o Alias'
		Then it should display all the messages below:
    	| Transferir a otras cuentas                |
    	| Ingresa el CBU/CVU o Alias                |
    	| Para buscar por Alias, te recordamos que: |
    	| Para buscar por por CBU o CVU:            |

    Examples:
      | country     | documentation | password  | menu         |
      | "Argentina" | "63059864"    | "192837"  | "Transferir" |

	@tc282_InternalTransfer_only_numbers_on_phone_screen
  Scenario Outline: Internal Transfer - TC - 282 - [WEB] - [AR] Internal Transfer - Validate fill in the value field only with numbers on phone screen
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I click on 'Buscar por número de celular'
    And fill in the field with <number>
    And click on button Continuar
		When insert the value <value>
		Then the field does not allow entering the value
		
    Examples:
      | country     | documentation | password  | menu         | number        | value |
      | "Argentina" | "63059864"    | "192837"  | "Transferir" | "91186206663" | "asd" |  

	@tc283_InternalTransfer_phone_field_only_with_numbers_on_phone_screen
  Scenario Outline: Internal Transfer - TC - 283 - [WEB] - [AR] Internal Transfer - Validate fill in the phone field only with numbers on phone screen
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I click on 'Buscar por número de celular'
    When fill in the field with <number>
		Then the phone field does not allow entering the value

    Examples:
      | country     | documentation | password  | menu         | number   |
      | "Argentina" | "63059864"    | "192837"  | "Transferir" | "asdasd" |
      
	@tc284_InternalTransfer_validate_back_to_the_main_transfer_screen
  Scenario Outline: Internal Transfer - TC - 284 - [WEB] - [AR] Internal Transfer - Validate back to the main transfer screen
		And I'm logged in with the data <country>,<documentation> and <password>
		And I'm on the <menu> page
		And I click on 'Buscar por número de celular'
	  When I click on button arrow back
		Then it should display all the messages below:
    	| ¿A quién vas a transferirle?	|
    	| A otra cuenta Superdigital    |

    Examples:
      | country     | documentation | password  | menu         |
      | "Argentina" | "63059864"    | "192837"  | "Transferir" |     