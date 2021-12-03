#language: en
#enconding: UTF-8
@home
Feature: Home

  Background:
    Given i'm logged into the application

  @Home_Success_Flow_I_Hide_Balance
  Scenario: Home - TC - 001 - Hide Balance
    When click on the eye to hide the balance
    Then check if the balance is hidden

  @Home_Success_Flow_II_View_Balance
  Scenario: Home - TC - 002 - View Balance
    When click on the eye to show the balance
    Then check if the balance is been shown

  Scenario Outline: Home - TC - 003 .. 004 - Search Transactions
    When click on the magnifier button
    And fill the search field with <searchParameter>
    Then check if the application performed the search and is showing the following <message>

    @Home_Success_Flow_III_Search_Successful
    Examples:
      | searchParameter | message |
      | "Recarga"       | "Recarga" |

    @Home_Exception_Flow_I_Not_Found_Results
    Examples:
      | searchParameter | message                                  |
      | "adsadsahdsa"   | "¡Ups! No se encontró ningún movimiento" |

  Scenario Outline: Home - TC - 005 ... 006 - Filter Transactions
    When click on the filter button
    And click on the option <operationType>
    And fill the operation date range field with <initialDate> and <finalDate>
    And fill the amount range field with <initialAmount> and <finalAmount>
    And click on the button Aplicar Filtros
    Then check if the application filtered the data and is showing the following <message>

    @Home_Success_Flow_IV_Filter_Transactions_Pagos
    Examples:
      | operationType | initialDate | finalDate  | initialAmount | finalAmount | message          |
      | "Pagos"       | "01122021"  | "02122021" | "10"          | "10000"     | "2 De Diciembre" |

    @Home_Success_Flow_V_Filter_Transactions_Transferencias
    Examples:
      | operationType    | initialDate | finalDate  | initialAmount | finalAmount | message        |
      | "Transferencias" | "22082021"  | "23082021" | "10"          | "10000"     | "23 De Agosto" |

