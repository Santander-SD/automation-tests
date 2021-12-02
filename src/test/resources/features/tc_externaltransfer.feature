#language: en
#enconding: UTF-8
@externalTransfer
Feature: External Transfer

  Background:
    Given i'm logged into the application

  Scenario Outline: External Transfer - TC - 001 .. 003 - Transfer to other banks
    When click on Transferir
    And click on Buscar por CBU CVU o Alias
    And fill in the CBU CVU o Alias field with <CBUCVUAlias>
    And click on button Continuar
    And fill in the transfer value field with <transferValue>
    And click on button Continuar
    And select Concepto de transferencia <concepto>
    And click on button Confirmar transferencia
    Then check if the transfer on the application was performed, observing the following message <message>

    @Success_Flow_I_Successful_Withdraw
    Examples:
      | CBUCVUAlias              | transferValue | concepto   | message                                    |
      | '0000256300000000387819' | "50"          | "Facturas" | "Confirma esta operación desde tu celular" |

    @Success_Flow_II_Transfer_To_A_Valid_Alias
    Examples:
      | CBUCVUAlias | transferValue | concepto | message                                    |
      | 'MONROE'    | "5000"        | "Cuotas" | "Confirma esta operación desde tu celular" |

    @Success_Flow_III_Transfer_To_A_Valid_CBU_CVU
    Examples:
      | CBUCVUAlias              | transferValue | concepto   | message                                    |
      | '0000256300000000387819' | "5000"        | "Expensas" | "Confirma esta operación desde tu celular" |

  @Success_Flow_IV_Save_As_Favorite
  Scenario Outline: External Transfer - TC - 004 - Transfer to other banks - Save as Favorite
    When click on Transferir
    And click on Buscar por CBU CVU o Alias
    And fill in the CBU CVU o Alias field with <CBUCVUAlias>
    And click on button Continuar
    And fill in the transfer value field with <transferValue>
    And click on button Continuar
    And select Concepto de transferencia <concepto>
    And click on the checkbox Guardar contacto como favorito
    And click on button Confirmar transferencia
    Then check if the contact was saved as favorite

    Examples:
      | CBUCVUAlias              | transferValue | concepto   |
      | '0000256300000000387819' | "5000"        | "Facturas" |

  Scenario Outline: External Transfer - TC - 005 .. 007 - CBU CVU o Alias Incorrecto
    When click on Transferir
    And click on Buscar por CBU CVU o Alias
    And fill in the CBU CVU o Alias field with <CBUCVUAlias>
    And click on button Continuar
    Then the operation will not be continued and the following message will be displayed "¡Ups! Parece que hubo un error con la búsqueda"

    @Exception_Flow_I_CBU_Incorrecto
    Examples:
      | CBUCVUAlias              |
      | '3281783721632132137846' |

    @Exception_Flow_II_CVU_Incorrecto
    Examples:
      | CBUCVUAlias              |
      | '4568484154841481100449' |

    @Exception_Flow_III_Alias_Incorrecto
    Examples:
      | CBUCVUAlias  |
      | 'SIAIDSAHUS' |

  @Exception_Flow_IV_Account_Balance_Is_Insufficient
  Scenario Outline: External Transfer - TC - 008 - Account Balance Is Insufficient
    When click on Transferir
    And click on Buscar por CBU CVU o Alias
    And fill in the CBU CVU o Alias field with <CBUCVUAlias>
    And click on button Continuar
    And fill in the transfer value field with <transferValue>
    Then the application checks that the amount entered is greater than the account balance and display the following message "Esta cantidad es mayor que su saldo actual"

    Examples:
      | CBUCVUAlias              | transferValue |
      | '0000256300000000387819' | "500000000"   |