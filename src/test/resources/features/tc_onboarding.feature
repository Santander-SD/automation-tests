#language: en
#enconding: UTF-8
@Onboarding
Feature: Onboarding

  Background: 
    Given are on the application's login page
    When select the country 'Argentina'

  @CTB-075
  Scenario: Onboarding - CTB - 075 - [AR] Onboarding Cross - Login : As an user, I want to provide my basic informations with an invalid email for approvement
    Given I provide a valid DNI
    And I click on Crear cuenta
    And on Name I inform 'Jhon' in registro
    And on Surname I inform 'Test' in registro
    And on Email I inform 'teste123' in registro
    And on Birth date I inform '14031996' in registro
    And I click on Continuar
    Then I see the text 'Email inválido'

  @CTB-076
  Scenario: Onboarding - CTB - 076 - [AR] Onboarding Cross - As an user, I want to validate Cuál es tu número de celular? screen
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

  @CTB-077
  Scenario: Onboarding - CTB - 077 - [AR] Onboarding Cross - Login : As an user, I want to register my cell phone number
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

  @CTB-078
  Scenario: Onboarding - CTB - 078 - [AR] Onboarding Cross - Login : As an user, I want to define my 4 digit password
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

  @CTB-079
  Scenario: Onboarding - CTB - 079 - [AR] Onboarding Cross - Login : As an user, I want to define my six digit password
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

  @CTB-080 
  Scenario: Onboarding - CTB - 080 - [AR] Onboarding Cross - Login : As an user, I want to validate the Estás en alguna de estas categorías? screen
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

  @CTB-081
  Scenario: Onboarding - CTB - 081 - [AR] Onboarding Cross - Login : As an user, I want to validate Términos y Condiciones screen
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

  @CTB0-082
  Scenario: Onboarding - CTB - 082 - [AR] Change email : As an user, I want to validate the check email validation for Email actual
    And select if the option "I ready have an account"
    And fill in the documentation field with the document number "23791098"
    And click on button ingressar
    When loading a page I inform the "192837"
    And I click on settings menu in my name
    And I click on my email
    And on Email Actual I inform 'teste@gmail.com'
    And on Nuevo Email I inform 'teste@hotmail.com'
    And on Repetir Nuevo Email I inform 'teste@hotmail.com'
    And I click on Continuar
    Then I see the text '¡Ups! Parece que algo salió mal'

  @CTB-083
  Scenario: Onboarding - CTB - 083 - [AR] Change email : As an user, I want to validate the Digitar el código enviado a screen
    And select if the option "I ready have an account"
    And fill in the documentation field with the document number "23791098"
    And click on button ingressar
    When loading a page I inform the "192837"
    And I click on settings menu in my name
    And I click on my email
    And on Email Actual I inform 'antwan_hirthe@hotmail.com'
    And on Nuevo Email I inform 'teste@hotmail.com'
    And on Repetir Nuevo Email I inform 'teste@hotmail.com'
    And I click on Continuar
    Then I see the text 'Digitar el código enviado a:'

  @CTB-084 
  Scenario: Onboarding - CTB - 084 - [AR] Change email : As an user, I want to see the link Recibir el código nuevamente
    And select if the option "I ready have an account"
    And fill in the documentation field with the document number "23791098"
    And click on button ingressar
    When loading a page I inform the "192837"
    And I click on settings menu in my name
    And I click on my email
    And on Email Actual I inform 'antwan_hirthe@hotmail.com'
    And on Nuevo Email I inform 'teste@hotmail.com'
    And on Repetir Nuevo Email I inform 'teste@hotmail.com'
    And I click on Continuar
    Then I see the text 'Recibir el código nuevamente'

  @CTB-085
  Scenario: Onboarding - CTB - 085 - [AR] Change email : As an user, I want to change my email so I can update my account
    And select if the option "I ready have an account"
    And fill in the documentation field with the document number "23791098"
    And click on button ingressar
    When loading a page I inform the "192837"
    And I click on settings menu in my name
    And I click on my email
    And on Email Actual I inform 'antwan_hirthe@hotmail.com'
    And on Nuevo Email I inform 'teste@hotmail.com'
    And on Repetir Nuevo Email I inform 'teste@hotmail.com'
    And I click on Continuar
    Then I see the text 'email successfully'

  #Valid email required
  @CTB-086
  Scenario: Onboarding - CTB - 086 - [AR] Change email : As an user, I want to inform an email already in use
    And select if the option "I ready have an account"
    And fill in the documentation field with the document number "23791098"
    And click on button ingressar
    When loading a page I inform the "192837"
    And I click on settings menu in my name
    And I click on my email
    And on Email Actual I inform 'antwan_hirthe@hotmail.com'
    And on Nuevo Email I inform 'teste@hotmail.com'
    And on Repetir Nuevo Email I inform 'teste@hotmail.com'
    And I click on Continuar
    Then I see the text '¡Ups! Parece que algo salió mal'

  @CTB-087
  Scenario: Onboarding - CTB - 087 - [AR][CO][PE] Name initials reversed in profile - As a user, I want to see my initials in Home screen
    And select if the option "I ready have an account"
    And fill in the documentation field with the document number "23791098"
    And click on button ingressar
    When loading a page I inform the "192837"
    Then I see the text 'HB'

  @CTB-088
  Scenario: Onboarding - CTB - 088 - [AR][CO][PE] Name initials reversed in profile - As a user, I want to see my initials in menu
    And select if the option "I ready have an account"
    And fill in the documentation field with the document number "23791098"
    And click on button ingressar
    When loading a page I inform the "192837"
    And I click on settings menu in my name
    Then I see my name 'HILARIO BOSCO' and my initials 'HB' in menu screen

  @CTB-089
  Scenario: Onboarding - CTB - 089 - [AR][CO][PE] Name initials reversed in profile - As a user, I want to see my name in menu
    And select if the option "I ready have an account"
    And fill in the documentation field with the document number "23791098"
    And click on button ingressar
    When loading a page I inform the "192837"
    And I click on settings menu in my name
    Then I see my name 'HILARIO BOSCO' and my initials 'HB' in menu screen

  @CTB-090
  Scenario: Onboarding - CTB - 090 - [AR] Validate button create account disabled when entering an incomplete document ARG
    Given I provide a DNI '1234'
    Then button Crear cuenta is disabled

  @CTB-091
  Scenario: Onboarding - CTB - 091 - [AR] Validate language of ARG terms
    Given I provide a valid DNI
    And I click on Crear cuenta
    And on Name I inform 'Jhon' in registro
    And on Surname I inform 'Test' in registro
    And on Email I inform 'teste@gmail.com' in registro
    And on Birth date I inform '14031996' in registro
    And I click on Continuar
    Given I see the text 'TÉRMINOS Y CONDICIONES DE USO SUPERDIGITAL ARGENTINA S.A.U®'

  @CTB-092
  Scenario: Onboarding - CTB - 092 - [AR] Validate message invalid phone number ARG
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
    And on Phone number I inform '0000000000' in registro
    And I select the options Mensaje SMS
    And I click on Continuar
    Then I see the text '¡Ups! Ese número no es válido. ¿Podrías intentarlo de nuevo?'

  @CTB-094
  Scenario: Onboarding - CTB - 094 - [AR] Validate not accept ARG terms
    Given I provide a valid DNI
    And I click on Crear cuenta
    And on Name I inform 'Jhon' in registro
    And on Surname I inform 'Test' in registro
    And on Email I inform 'teste@gmail.com' in registro
    And on Birth date I inform '14031996' in registro
    And I click on Continuar
    Given I see the text 'TÉRMINOS Y CONDICIONES DE USO SUPERDIGITAL ARGENTINA S.A.U®'
    Then button Continuar is disabled

  @CTB-095
  Scenario: Onboarding - CTB - 095 - [AR] Try to proceed without email
    Given I provide a valid DNI
    And I click on Crear cuenta
    And on Name I inform 'Jhon' in registro
    And on Surname I inform 'Test' in registro
    And on Birth date I inform '14031996' in registro
    Then button Continuar is disabled

  @CTE-196
  Scenario: Onboarding - CTE - 196 - [AR] Validate account creation with a document already used
    And fill in the documentation field with the document number "23791098"
    And I click on Crear cuenta
    Then I see the text 'Detectamos un error en el usuario que ingresaste'
    
  @CTE-197
  Scenario: Onboarding - CTE - 197 - [AR] Validate account creation with invalid document
    And fill in the documentation field with the document number "00000000"
    Then button Continuar is disabled
    
  @CTE-198
  Scenario: Onboarding - CTE - 198 - [AR] Validate account creation with blank name field
    Given I provide a valid DNI
    And I click on Crear cuenta
    And on Surname I inform 'Test' in registro
    And on Email I inform 'teste@gmail.com' in registro
    And on Birth date I inform '14031996' in registro
    Then button Continuar is disabled
    
  @CTE-199
  Scenario: Onboarding - CTE - 199 - [AR] Validate account creation with blank last name field
    Given I provide a valid DNI
    And I click on Crear cuenta
    And on Name I inform 'Teste' in registro
    And on Email I inform 'teste@gmail.com' in registro
    And on Birth date I inform '14031996' in registro
    Then button Continuar is disabled
    
 	@CTE-200
  Scenario: Onboarding - CTE - 200 - [AR] Validate account creation with blank birth date field
    Given I provide a valid DNI
    And I click on Crear cuenta
    And on Name I inform 'Teste' in registro
    And on Surname I inform 'Test' in registro
    And on Email I inform 'teste@gmail.com' in registro
    Then button Continuar is disabled
    
 	@CTE-201
  Scenario: Onboarding - CTE - 201 - [AR] Validate account creation with invalid name field
    Given I provide a valid DNI
    And I click on Crear cuenta
    And on Name I inform 'A' in registro
    And on Surname I inform 'Test' in registro
    And on Email I inform 'teste@gmail.com' in registro
    And on Birth date I inform '14031996' in registro
    Then button Continuar is disabled
    
  @CTE-202
  Scenario: Onboarding - CTE - 202 - [AR] Validate account creation with invalid last name field
    Given I provide a valid DNI
    And I click on Crear cuenta
    And on Name I inform 'Teste' in registro
    And on Surname I inform 'A' in registro
    And on Email I inform 'teste@gmail.com' in registro
    And on Birth date I inform '14031996' in registro
    Then button Continuar is disabled
    
  @CTE-203
  Scenario: Onboarding - CTE - 203 - [AR] Validate account creation with invalid email field
    Given I provide a valid DNI
    And I click on Crear cuenta
    And on Name I inform 'Teste' in registro
    And on Surname I inform 'Test' in registro
    And on Email I inform 'teste' in registro
    And on Birth date I inform '14031996' in registro
    And I click on Continuar
    Given I see the text 'Email inválido'
    
  @CTE-204
  Scenario: Onboarding - CTE - 204 - [AR] Validate account creation with invalid birth date field
    Given I provide a valid DNI
    And I click on Crear cuenta
    And on Name I inform 'Teste' in registro
    And on Surname I inform 'Test' in registro
    And on Email I inform 'teste' in registro
    And on Birth date I inform '14032030' in registro
    And I click on Continuar
    Given I see the text 'Fecha de nacimiento inválida'
    
  @CTE-205
  Scenario: Onboarding - CTE - 205 - [AR] Just click on the checkbox to send an sms under the terms and conditions
    Given I provide a valid DNI
    And I click on Crear cuenta
    And on Name I inform 'Jhon' in registro
    And on Surname I inform 'Test' in registro
    And on Email I inform 'teste@gmail.com' in registro
    And on Birth date I inform '14031996' in registro
    And I click on Continuar
    Given I see the text 'TÉRMINOS Y CONDICIONES DE USO SUPERDIGITAL ARGENTINA S.A.U®'
    When I check the second checkbox in Terms and Conditions
    Then button Continuar is disabled
    
  @CTE-206
  Scenario: Onboarding - CTE - 206 - [AR] Validate account creation with blank cell number field
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
    And on Phone number I inform '' in registro
    Then button Continuar is disabled
    
  @CTE-207
  Scenario: Onboarding - CTE - 207 - [AR] Validate account creation with incomplete cell number field
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
    And on Phone number I inform '12345' in registro
    Then button Continuar is disabled
    
  @CTE-208
  Scenario: Onboarding - CTE - 208 - [AR] Validate account creation with phone number validation by phone call
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
    And I select the options Llamada de celular
    And I click on Continuar
		When I see the text 'Ingresar código de verificación'
		
	@CTE-209
  Scenario: Onboarding - CTE - 209 - [AR] Validate account creation by marking only the profession without marking the income
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
    Then button Continuar is disabled
    
  @CTE-210
  Scenario: Onboarding - CTE - 210 - [AR] Validate account creation by marking income only without marking profession
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
    When I check the radio with text 'Más de $60.000,00'
    Then button Continuar is disabled
    
  @CTE-211
  Scenario: Onboarding - CTE - 211 - [AR] Validate account creation without checking income and profession
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
    Then button Continuar is disabled
    
  @CTE-212
  Scenario: Onboarding - CTE - 212 - [AR] Validate account creation by checking YES in all categories
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
    And I click Yes on answer of categories
    And I click on Continuar
    When I see the text 'Crear contraseña de 6 dígitos'
    
  @CTE-213
  Scenario: Onboarding - CTE - 213 - [AR] Validate account creation by not marking categories
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
    Then button Continuar is disabled
    
  @CTE-214
  Scenario: Onboarding - CTE - 214 - [AR] Validate first incomplete 6-digit password
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
    And I create the four digit password
    Then button Continuar is disabled
    
  @CTE-215
  Scenario: Onboarding - CTE - 215 - [AR] Validate first 6-digit password with sequential values
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
    And I create the six digit password with sequential numbers
    Then button Continuar is disabled
    
  @CTE-216
  Scenario: Onboarding - CTE - 216 - [AR] Validate first 6-digit password with the same numbers
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
    And I create the six digit password with same numbers
    Then button Continuar is disabled
    
  @CTE-217
  Scenario: Onboarding - CTE - 217 - [AR] Validate first 6-digit password with the same value as the date of birth
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
    And I create the six digit password with birthday numbers
    Then button Continuar is disabled
    
  @CTE-218
  Scenario: Onboarding - CTE - 218 - [AR] Validate second 6-digit password different from the first
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
    And I create the six digit password with same numbers
    Then button Continuar is disabled
    
  @CTE-219
  Scenario: Onboarding - CTE - 219 - [AR] Validate first incomplete 4-digit password
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
    And I create the two digit password
    Then button Continuar is disabled
    
  @CTE-220
  Scenario: Onboarding - CTE - 220 - [AR] Validate first 4-digit sequential password
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
    And I create the four digit password with sequential numbers
    Then button Continuar is disabled
    
  @CTE-221
  Scenario: Onboarding - CTE - 221 - [AR] Validate first password of 4 equal digits
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
    And I create the four digit password with same numbers
    Then button Continuar is disabled
    
  @CTE-222
  Scenario: Onboarding - CTE - 222 - [AR] Validate first 4-digit password with the same value as the date of birth
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
    And I create the four digit password with birthday numbers
    Then button Continuar is disabled
    
  @CTE-223
  Scenario: Onboarding - CTE - 223 - [AR] Validate second 4-digit password different from the first
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
    And I create the four digit password with birthday numbers
    Then button Continuar is disabled
    
  @CTE-224
  Scenario: Onboarding - CTE - 224 - [AR] Validate current email field with invalid format
    And select if the option "I ready have an account"
    And fill in the documentation field with the document number "23791098"
    And click on button ingressar
    When loading a page I inform the "192837"
    And I click on settings menu in my name
    And I click on my email
    And on Email Actual I inform 'teste'
    And on Nuevo Email I inform 'teste@hotmail.com'
    And on Repetir Nuevo Email I inform 'teste@hotmail.com'
    And I click on Continuar
    Then I see the text '¡Ups! Ese email no es válido. ¿Podrías intentar de nuevo?'
    
  @CTE-225
  Scenario: Onboarding - CTE - 225 - [AR] Validate new email field with invalid format
    And select if the option "I ready have an account"
    And fill in the documentation field with the document number "23791098"
    And click on button ingressar
    When loading a page I inform the "192837"
    And I click on settings menu in my name
    And I click on my email
    And on Email Actual I inform 'antwan_hirthe@hotmail.com'
    And on Nuevo Email I inform 'teste'
    And on Repetir Nuevo Email I inform 'teste@hotmail.com'
    And I click on Continuar
    Then I see the text '¡Ups! Ese email no es válido. ¿Podrías intentar de nuevo?'
    
  @CTE-226
  Scenario: Onboarding - CTE - 226 - [AR] Validate repeat field with invalid format
    And select if the option "I ready have an account"
    And fill in the documentation field with the document number "23791098"
    And click on button ingressar
    When loading a page I inform the "192837"
    And I click on settings menu in my name
    And I click on my email
    And on Email Actual I inform 'antwan_hirthe@hotmail.com'
    And on Nuevo Email I inform 'teste@hotmail.com'
    And on Repetir Nuevo Email I inform 'teste'
    And I click on Continuar
    Then I see the text '¡Ups! Ese email no es válido. ¿Podrías intentar de nuevo?'
    
  @CTE-227
  Scenario: Onboarding - CTE - 227 - [AR] Validate current email field blank
    And select if the option "I ready have an account"
    And fill in the documentation field with the document number "23791098"
    And click on button ingressar
    When loading a page I inform the "192837"
    And I click on settings menu in my name
    And I click on my email
    And on Nuevo Email I inform 'teste@hotmail.com'
    And on Repetir Nuevo Email I inform 'teste@hotmail.com'
    Then button Continuar is disabled
    
  @CTE-228
  Scenario: Onboarding - CTE - 228 - [AR] Validate blank new email field
    And select if the option "I ready have an account"
    And fill in the documentation field with the document number "23791098"
    And click on button ingressar
    When loading a page I inform the "192837"
    And I click on settings menu in my name
    And I click on my email
    And on Email Actual I inform 'antwan_hirthe@hotmail.com'
    And on Repetir Nuevo Email I inform 'teste@hotmail.com'
    Then button Continuar is disabled
    
  @CTE-229
  Scenario: Onboarding - CTE - 229 - [AR] Validate blank repeat email field
    And select if the option "I ready have an account"
    And fill in the documentation field with the document number "23791098"
    And click on button ingressar
    When loading a page I inform the "192837"
    And I click on settings menu in my name
    And I click on my email
    And on Email Actual I inform 'antwan_hirthe@hotmail.com'
    And on Nuevo Email I inform 'teste@hotmail.com'
    Then button Continuar is disabled
    
  @CTE-230
  Scenario: Onboarding - CTE - 230 - [AR] Validate email fields with different values
    And select if the option "I ready have an account"
    And fill in the documentation field with the document number "23791098"
    And click on button ingressar
    When loading a page I inform the "192837"
    And I click on settings menu in my name
    And I click on my email
    And on Email Actual I inform 'antwan_hirthe@hotmail.com'
    And on Nuevo Email I inform 'teste@hotmail.com'
    And on Repetir Nuevo Email I inform '123@gmail.com'
    And I click on Continuar
    Then I see the text 'Las direcciones de email no coinciden'
    
  @CTE-231
  Scenario: Onboarding - CTE - 231 - [AR] Validate my current email present in the email button
    And select if the option "I ready have an account"
    And fill in the documentation field with the document number "23791098"
    And click on button ingressar
    When loading a page I inform the "192837"
    And I click on settings menu in my name
    And I click on my email
    Then I see the text 'antwan_hirthe@hotmail.com'
    
  @CTE-232
  Scenario: Onboarding - CTE - 232 - [AR] Validate screen for email exchange
    And select if the option "I ready have an account"
    And fill in the documentation field with the document number "23791098"
    And click on button ingressar
    When loading a page I inform the "192837"
    And I click on settings menu in my name
    And I click on my email
    Then I see the text 'Cambiar email'
    Then I see the text 'Digitar el email que desea vincular a su cuenta'