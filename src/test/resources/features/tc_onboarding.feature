#language: en
#enconding: UTF-8

@Onboarding
Feature: Onboarding 

	Background:
    Given are on the application's login page
    When select the country 'Argentina'

  	@cell_number_screen
  	Scenario: Onboarding - TC - 076 - [AR] Onboarding Cross - As an user, I want to validate Cuál es tu número de celular? screen
		Given I provide a valid DNI
 		And I click on Crear cuenta
		And on Name I inform 'Jhon' in registro
		And on Surname I inform 'Test' in registro
		And on Email I inform 'teste@gmail.com' in registro
		And on Birth date I inform '14031996' in registro
		And I click on Continuar
		When I check the first checkbox in Terms and Conditions
		And I click on Continuar
		And I see a dropdown listing the available countries
		And on Phone number I inform '1112345678' in registro
		And I select the options Mensaje SMS
		And I click on Continuar
		Then I see the text 'Ingresar código de verificación'
		
	@about_you_screen
  	Scenario: Onboarding - TC - 077 - [AR] Onboarding Cross - Login : As an user, I want to register my cell phone number
		Given I provide a valid DNI
 		And I click on Crear cuenta
		And on Name I inform 'Jhon' in registro
		And on Surname I inform 'Test' in registro
		And on Email I inform 'teste@gmail.com' in registro
		And on Birth date I inform '14031996' in registro
		And I click on Continuar
		When I check the first checkbox in Terms and Conditions
		And I click on Continuar
		And I see a dropdown listing the available countries
		And on Phone number I inform '1112345678' in registro
		And I select the options Mensaje SMS
		And I click on Continuar
		Then I see the text 'Ingresar código de verificación'
		And on verification code I inform '000000' in registro
		Then I see the text 'Ahora nos gustaría conocerte mejor.'
		
	@see_Qr_code
  	Scenario: Onboarding - TC - 078 - [AR] Onboarding Cross - Login : As an user, I want to define my 4 digit password
		Given I provide a valid DNI
 		And I click on Crear cuenta
		And on Name I inform 'Jhon' in registro
		And on Surname I inform 'Test' in registro
		And on Email I inform 'teste@gmail.com' in registro
		And on Birth date I inform '14031996' in registro
		And I click on Continuar
		When I check the first checkbox in Terms and Conditions
		And I click on Continuar
		And I see a dropdown listing the available countries
		And on Phone number I inform '1112345678' in registro
		And I select the options Mensaje SMS
		And I click on Continuar
		And on verification code I inform '000000' in registro
		When I check the radio with text 'Estudiante'
		When I check the radio with text 'Más de $60.000,00'
		And I click on Continuar
		Then I see the text 'Sujeto obligado'
		And I click No on answer of categories
 		And I click on Continuar
 		And I create the six digit password
 		And I click on Continuar
 		And I create the six digit password
 		And I click on Continuar
 		And I create the four digit password
 		And I click on Continuar
 		And I create the four digit password
 		And I click on Continuar
 		Then I see the text 'código QR'
 		
 	@define_six_digit_password
  	Scenario: Onboarding - TC - 079 - [AR] Onboarding Cross - Login : As an user, I want to define my six digit password
		Given I provide a valid DNI
 		And I click on Crear cuenta
		And on Name I inform 'Jhon' in registro
		And on Surname I inform 'Test' in registro
		And on Email I inform 'teste@gmail.com' in registro
		And on Birth date I inform '14031996' in registro
		And I click on Continuar
		When I check the first checkbox in Terms and Conditions
		And I click on Continuar
		And I see a dropdown listing the available countries
		And on Phone number I inform '1112345678' in registro
		And I select the options Mensaje SMS
		And I click on Continuar
		And on verification code I inform '000000' in registro
		When I check the radio with text 'Estudiante'
		When I check the radio with text 'Más de $60.000,00'
		And I click on Continuar
		Then I see the text 'Sujeto obligado'
		And I click No on answer of categories
 		And I click on Continuar
 		And I create the six digit password
 		And I click on Continuar
 		And I create the six digit password
 		And I click on Continuar
 		Then I see the text 'Crear tu clave de pagos de 4 dígitos'
 		
 	@screen_categorias
  	Scenario: Onboarding - TC - 080 - [AR] Onboarding Cross - Login : As an user, I want to validate the Estás en alguna de estas categorías? screen
		Given I provide a valid DNI
 		And I click on Crear cuenta
		And on Name I inform 'Jhon' in registro
		And on Surname I inform 'Test' in registro
		And on Email I inform 'teste@gmail.com' in registro
		And on Birth date I inform '14031996' in registro
		And I click on Continuar
		When I check the first checkbox in Terms and Conditions
		And I click on Continuar
		And I see a dropdown listing the available countries
		And on Phone number I inform '1112345678' in registro
		And I select the options Mensaje SMS
		And I click on Continuar
		And on verification code I inform '000000' in registro
		Then I see the text 'Ahora nos gustaría conocerte mejor.'
		
	@screen_terms_conditions
  	Scenario: Onboarding - TC - 081 - [AR] Onboarding Cross - Login : As an user, I want to validate Términos y Condiciones screen
		Given I provide a valid DNI
 		And I click on Crear cuenta
		And on Name I inform 'Jhon' in registro
		And on Surname I inform 'Test' in registro
		And on Email I inform 'teste@gmail.com' in registro
		And on Birth date I inform '14031996' in registro
		And I click on Continuar
		Then I see the text 'Quiero recibir las novedades de Superdigital por email y SMS'
		Then I see the text 'Términos y condiciones'
		When I check the first checkbox in Terms and Conditions
		
	@validation_actual_email
  	Scenario: Onboarding - TC - 082 - [AR] Change email : As an user, I want to validate the check email validation for Email actual
    	And select if the option "I ready have an account"
    	And fill in the documentation field with the document number "33850984" 
    	And click on button ingressar
    	When loading a page I inform the "192837"
    	Then check if the login to the application was performed, observing the following "Saldo actual"
		And I click on settings menu in my name
		And I click on my email
		And on Email Actual I inform 'teste@gmail.com'
		And on Nuevo Email I inform 'teste@hotmail.com'
		And on Repetir Nuevo Email I inform 'teste@hotmail.com' 
		And I click on Continuar
		Then I see the text '¡Ups! Parece que algo salió mal'

	@validation_nuevo_email
  	Scenario: Onboarding - TC - 083 - [AR] Change email : As an user, I want to validate the Digitar el código enviado a screen
    	And select if the option "I ready have an account"
    	And fill in the documentation field with the document number "33850984" 
    	And click on button ingressar
    	When loading a page I inform the "192837"
    	Then check if the login to the application was performed, observing the following "Saldo actual"
		And I click on settings menu in my name
		And I click on my email
		And on Email Actual I inform 'tsttst@gmail.com'
		And on Nuevo Email I inform 'teste@hotmail.com'
		And on Repetir Nuevo Email I inform 'teste@hotmail.com' 
		And I click on Continuar
		Then I see the text 'Digitar el código enviado a:'
		
	@validation_nuevo_codigo
  	Scenario: Onboarding - TC - 084 - [AR] Change email : As an user, I want to see the link Recibir el código nuevamente
    	And select if the option "I ready have an account"
    	And fill in the documentation field with the document number "33850984" 
    	And click on button ingressar
   	 	When loading a page I inform the "192837"
    	Then check if the login to the application was performed, observing the following "Saldo actual"
		And I click on settings menu in my name
		And I click on my email
		And on Email Actual I inform 'tsttst@gmail.com'
		And on Nuevo Email I inform 'teste@hotmail.com'
		And on Repetir Nuevo Email I inform 'teste@hotmail.com' 
		And I click on Continuar
		Then I see the text 'Recibir el código nuevamente'
		
	#Valid email required
	@validation_email_other_account
  	Scenario: Onboarding - TC - 086 - [AR] Change email : As an user, I want to inform an email already in use
    	And select if the option "I ready have an account"
    	And fill in the documentation field with the document number "33850984" 
    	And click on button ingressar
    	When loading a page I inform the "192837"
    	Then check if the login to the application was performed, observing the following "Saldo actual"
		And I click on settings menu in my name
		And I click on my email
		And on Email Actual I inform 'tsttst@gmail.com'
		And on Nuevo Email I inform 'teste@hotmail.com'
		And on Repetir Nuevo Email I inform 'teste@hotmail.com' 
		And I click on Continuar
		Then I see the text '¡Ups! Parece que algo salió mal'
		
	@validation_my_initials
  	Scenario: Onboarding - TC - 087 - [AR][CO][PE] Name initials reversed in profile - As a user, I want to see my initials in Home screen 
    	And select if the option "I ready have an account"
    	And fill in the documentation field with the document number "33850984" 
    	And click on button ingressar
    	When loading a page I inform the "192837"
    	Then check if the login to the application was performed, observing the following "Saldo actual"
		Then I see the text 'SC'
		
	@validation_my_initials_and_name_in_menu_screen
  	Scenario: Onboarding - TC - 088 - [AR][CO][PE] Name initials reversed in profile - As a user, I want to see my initials in menu
    	And select if the option "I ready have an account"
    	And fill in the documentation field with the document number "33850984" 
    	And click on button ingressar
    	When loading a page I inform the "192837"
    	Then check if the login to the application was performed, observing the following "Saldo actual"
    	And I click on settings menu in my name
		Then I see my name 'Silva Cristiano' and my initials 'SC' in menu screen
		
	@valid_crear_cuenta_disabled
  	Scenario: Onboarding - TC - 090 - [AR] Validate button create account disabled when entering an incomplete document ARG
		Given I provide a DNI '1234'
		Then button Crear cuenta is disabled
		
	@valid_language_argentina
  	Scenario: Onboarding - TC - 091 - [AR] Validate language of ARG terms
  		Given I provide a valid DNI
 		And I click on Crear cuenta
		And on Name I inform 'Jhon' in registro
		And on Surname I inform 'Test' in registro
		And on Email I inform 'teste@gmail.com' in registro
		And on Birth date I inform '14031996' in registro
		And I click on Continuar
		Given I see the text 'TÉRMINOS Y CONDICIONES DE USO SUPERDIGITAL ARGENTINA S.A.U®'
		
		

