#language: en
#enconding: UTF-8
@CashIn
Feature: Cash In

  Background:
    Given are on the application's login page
    
	@tc179_CashIn_Validate_that_the_card_has_been_delivered
  Scenario Outline: CashIn - TC - 179 - [WEB] - Cash In - With out Card - Validation of CVU code layout
		And I'm logged in with the data <country>,<documentation> and <password>
		When I click on "Cargar dinero"
		Then should display the CVU code <cvu>

    Examples:
      | country     | documentation | password  | cvu                      |
      | "Argentina" | "46665484"    | "192837"  | "0000256300000000389815" |

	@tc180_CashIn_Validate_search_for_branches_rapipago
  Scenario Outline: CashIn - TC - 180 - [WEB] - Cash In - With out Card - Validate search for branches rapipago
		And I'm logged in with the data <country>,<documentation> and <password>
		And I click on "Cargar dinero"
		And I click on "Rapipago"
		And I click on "Buscar sucursales cercanas"
		When I search for 'Buenos Aires' in sucursales cercanas input
		Then you should display the rapipago points for the client
    
    Examples:
      | country     | documentation | password  |
      | "Argentina" | "46665484"    | "192837"  |
      
	@tc181_CashIn_Validate_minimum_and_maximum_limit_information 
  Scenario Outline: CashIn - TC - 181 - [WEB] - Cash In - With out Card - Validate minimum and maximum limit information of cash in in the stream of rapipago
		And I'm logged in with the data <country>,<documentation> and <password>
		And I click on "Cargar dinero"
		When I click on "Rapipago"
	  Then should display information that the minimum and maximum limit
	    | Te recordamos que en Rapipago puede cargar desde $100 a $30.000 |

    Examples:
      | country     | documentation | password  |
      | "Argentina" | "46665484"    | "192837"  |
      
	@tc182_CashIn_Validate_no_direction_in_sucursales_cercanas_input
  Scenario Outline: CashIn - TC - 182 - [WEB] - Cash In - With out Card - Validate no direction in sucursales cercanas input
		And I'm logged in with the data <country>,<documentation> and <password>
		And I click on "Cargar dinero"
		And I click on "Rapipago"
		And I click on "Buscar sucursales cercanas"
		When I search for just 'asdfgh13' in sucursales cercanas input
		Then should display a screen with the message 'No podemos encontrar la dirección ingresada.'
    
    Examples:
      | country     | documentation | password  |
      | "Argentina" | "46665484"    | "192837"  | 
      
	@tc183_CashIn_Validate_clear_sucursales_cercanas_input
  Scenario Outline: CashIn - TC - 183 - [WEB] - Cash In - With out Card - Validate clear sucursales cercanas input
		And I'm logged in with the data <country>,<documentation> and <password>
		And I click on "Cargar dinero"
		And I click on "Rapipago"
		And I click on "Buscar sucursales cercanas"
		When I search for just 'asdfgh13' in sucursales cercanas input
		And I click on button Close
		Then should display a screen with the label 'Buscar sucursales cercanas'
    
    Examples:
      | country     | documentation | password  |
      | "Argentina" | "46665484"    | "192837"  | 
      
	@tc184_CashIn_Validate_infomations_about_cargar_dinero
  Scenario Outline: CashIn - TC - 184 - [WEB] - Cash In - With out Card - Validate Infomations about 'Cargar dinero'
		And I'm logged in with the data <country>,<documentation> and <password>
		And I click on "Cargar dinero"
		When I click on Help button
	  Then I see the messages:
	    | Cargar dinero desde        																																																							|
	    | Otra cuenta Superdigital   																																																						  |
	    | Para que puedan enviarte dinero desde otra cuenta Superdigital, tendrás que informar tu nombre completo y número de DNI o de celular.   |
	    | Otra cuenta virtual o bancaria   																																																				|
	    | Para que puedan enviarte dinero desde una cuenta bancaria o virtual, tendrás que informar tu número de CVU o Alias.       		          | 
    
    Examples:
      | country     | documentation | password  |
      | "Argentina" | "46665484"    | "192837"  | 
      
	@tc185_CashIn_Data_sharing_validation_dni
  Scenario Outline: CashIn - TC - 185 - [WEB] - Cash In - With out Card - Data sharing validation DNI
		And I'm logged in with the data <country>,<documentation> and <password>
		And I click on "Cargar dinero"
		And display the customer data screen for user account
		When I click on the button Share My Data from DNI
		Then copy action is performed with success
			| Copiado al portapapeles |
			| Mi DNI                  |
			| Mi Celular              |
    
    Examples:
      | country     | documentation | password  |
      | "Argentina" | "46665484"    | "192837"  |
      
	@tc186_CashIn_Data_sharing_validation_cvu
  Scenario Outline: CashIn - TC - 186 - [WEB] - Cash In - With out Card - Data sharing validation CVU
		And I'm logged in with the data <country>,<documentation> and <password>
		And I click on "Cargar dinero"
		And display the customer data screen for user account
		When I click on the button Share My Data from CVU
		Then copy action is performed with success
			| Copiado al portapapeles |
			| Mi CVU                  |
			| Mi alias                |
    
    Examples:
      | country     | documentation | password  |
      | "Argentina" | "46665484"    | "192837"  |

	@tc187_CashIn_CVU_copy_validation
  Scenario Outline: CashIn - TC - 187 - [WEB] - Cash In - CVU copy validation
		And I'm logged in with the data <country>,<documentation> and <password>
		And I click on "Cargar dinero"
		When I click on the copy CVU button
		Then copy action is performed with success
			| ¡CVU copiado!            |
			| 0000256300000000389815   |
    
    Examples:
      | country     | documentation | password  |
      | "Argentina" | "46665484"    | "192837"  |

	@tc188_CashIn_alias_copy_validation
  Scenario Outline: CashIn - TC - 188 - [WEB] - Cash In - Alias copy validation
		And I'm logged in with the data <country>,<documentation> and <password>
		And I click on "Cargar dinero"
		When I click on the copy Alias button
		Then copy action is performed with success
			| ¡Alias copiado! |
			| E.PFEFFER.SD    |
    
    Examples:
      | country     | documentation | password  |
      | "Argentina" | "46665484"    | "192837"  |            
   