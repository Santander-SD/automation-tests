#language: en
#enconding: UTF-8
@CashIn
Feature: Cash In

  Background:
    Given are on the application's login page
    
	@tc179_Validate_that_the_card_has_been_delivered
  Scenario Outline: Cards - TC - 179 - [WEB] - Cash In - With out Card - Validation of CVU code layout
		And I'm logged in with the data <country>,<documentation> and <password>
		When I click on "Cargar dinero"
		Then should display the CVU code <cvu>
    
    Examples:
      | country     | documentation | password  | cvu                      | 
      | "Argentina" | "46665484"    | "192837"  | "0000256300000000389815" |
      
	@tc180_Validate_Search_for_branches_Rapipago
  Scenario Outline: Cards - TC - 180 - [WEB] - Cash In - With out Card - Validate Search for branches Rapipago
		And I'm logged in with the data <country>,<documentation> and <password>
		And I click on "Cargar dinero"
		And I click on "Rapipago"
		And I click on "Buscar sucursales cercanas"
		When I search for 'Buenos Aires' in sucursales cercanas input
		Then you should display the rapipago points for the client
    
    Examples:
      | country     | documentation | password  |
      | "Argentina" | "46665484"    | "192837"  |
      
	@tc181_Validate_minimum_and_maximum_limit_information 
  Scenario Outline: Cards - TC - 181 - [WEB] - Cash In - With out Card - Validate minimum and maximum limit information of cash in in the stream of rapipago
		And I'm logged in with the data <country>,<documentation> and <password>
		And I click on "Cargar dinero"
		When I click on "Rapipago"
	  Then should display information that the minimum and maximum limit
	    | Te recordamos que en Rapipago puede cargar desde $100 a $30.000 |

    Examples:
      | country     | documentation | password  |
      | "Argentina" | "46665484"    | "192837"  |
      
	@tc182_Validate_no_direction_in_sucursales_cercanas_input
  Scenario Outline: Cards - TC - 182 - [WEB] - Cash In - With out Card - Validate no direction in sucursales cercanas input
		And I'm logged in with the data <country>,<documentation> and <password>
		And I click on "Cargar dinero"
		And I click on "Rapipago"
		And I click on "Buscar sucursales cercanas"
		When I search for just 'asdfgh13' in sucursales cercanas input
		Then should display a screen with the message 'No podemos encontrar la dirección ingresada.'
    
    Examples:
      | country     | documentation | password  |
      | "Argentina" | "46665484"    | "192837"  | 
      
	@tc183_Validate_clear_sucursales_cercanas_input
  Scenario Outline: Cards - TC - 183 - [WEB] - Cash In - With out Card - Validate clear sucursales cercanas input
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
      
	@tc184_Validate_Infomations_about_Cargar_dinero
  Scenario Outline: Cards - TC - 184 - [WEB] - Cash In - With out Card - Validate Infomations about 'Cargar dinero'
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
      
	@tc185_Data_Sharing_Validation_Dni
  Scenario Outline: Cards - TC - 185 - [WEB] - Cash In - With out Card - Data Sharing Validation DNI
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
      
	@tc186_Data_Sharing_Validation_Cvu
  Scenario Outline: Cards - TC - 186 - [WEB] - Cash In - With out Card - Data Sharing Validation CVU
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

	@tc187_CVU_Copy_Validation
  Scenario Outline: Cards - TC - 187 - [WEB] - Cash In - CVU Copy Validation   
		And I'm logged in with the data <country>,<documentation> and <password>
		And I click on "Cargar dinero"
		When I click on the copy CVU button
		Then copy action is performed with success
			| ¡CVU copiado!            |
			| 0000256300000000389815   |
    
    Examples:
      | country     | documentation | password  |
      | "Argentina" | "46665484"    | "192837"  |

	@tc188_Alias_Copy_Validation
  Scenario Outline: Cards - TC - 188 - [WEB] - Cash In - Alias Copy Validation   
		And I'm logged in with the data <country>,<documentation> and <password>
		And I click on "Cargar dinero"
		When I click on the copy Alias button
		Then copy action is performed with success
			| ¡Alias copiado! |
			| E.PFEFFER.SD    |
    
    Examples:
      | country     | documentation | password  |
      | "Argentina" | "46665484"    | "192837"  |            
   