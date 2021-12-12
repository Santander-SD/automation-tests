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

  Scenario Outline: Home - TC - 005 ... 011 - Filter Transactions
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

    @Home_Exception_Flow_II_Filter_Transactions_ComprasTarjetas_NotFound
    Examples:
      | operationType         | initialDate | finalDate  | initialAmount | finalAmount | message        |
      | "Compras con tarjeta" | "22082021"  | "23082021" | "10"          | "10000"     | "¡Ups! No se encontró ningún movimiento" |

    @Home_Success_Flow_VI_Filter_Transactions_Depositos
    Examples:
      | operationType | initialDate | finalDate  | initialAmount | finalAmount | message          |
      | "Depósitos"   | "01122021"  | "03122021" | "10"          | "10000"     | "3 De Diciembre" |

    @Home_Success_Flow_VII_Filter_Transactions_Retiros
    Examples:
      | operationType | initialDate | finalDate  | initialAmount | finalAmount | message           |
      | "Retiros"     | "10122021"  | "12122021" | "10"          | "10000"     | "11 De Diciembre" |

    @Home_Success_Flow_VIII_Filter_Transactions_RecargaTelefone
    Examples:
      | operationType         | initialDate | finalDate  | initialAmount | finalAmount | message           |
      | "Recarga de teléfono" | "10122021"  | "12122021" | "10"          | "10000"     | "11 De Diciembre" |

    @Home_Success_Flow_IX_Filter_Transactions_RecargaTransporte
    Examples:
      | operationType           | initialDate | finalDate  | initialAmount | finalAmount | message          |
      | "Recarga de transporte" | "08122021"  | "10122021" | "10"          | "10000"     | "9 De Diciembre" |

  Scenario Outline: Home - TC - 012 ... 014 - Filter Transactions - Invalid Date
    When click on the filter button
    And fill the operation date range field with <initialDate> and <finalDate>
    Then check if the application checked the date input and is showing the following <message>

    @Home_Exception_Flow_III_Filter_Transactions_Invalid_Date_Initial
    Examples:
      | initialDate | finalDate  | message         |
      | "35012021"  | "02122021" | "Data inválida" |

    @Home_Exception_Flow_IV_Filter_Transactions_Invalid_Date_Final
    Examples:
      | initialDate | finalDate  | message         |
      | "01012021"  | "02132021" | "Data inválida" |

    @Home_Exception_Flow_V_Filter_Transactions_Invalid_Date_Period
    Examples:
      | initialDate | finalDate  | message                                                            |
      | "01012021"  | "31122020" | "A data inicial no pode ser superior a data final e a data actual" |

  Scenario Outline: Home - TC - 015 .. 016 - Filter Transactions - Specific Date
    When click on the filter button
    And click on the radiobutton Fecha exacta de la operacion
    And fill the operation date field with <date>
    And click on the button Aplicar Filtros
    Then check if the application filtered the data and is showing the following <message>

    @Home_Success_Flow_X_Filter_Transactions_Specific_Date
    Examples:
      | date       | message        |
      | "06102021" | "6 De Octubre" |

    @Home_Exception_Flow_VI_Filter_Transactions_Specific_Date_Not_Found
    Examples:
      | date       | message        |
      | "02102021" | "¡Ups! No se encontró ningún movimiento" |

  Scenario Outline: Home - TC - 017 ... 018 - Filter Transactions - Amount
    When click on the filter button
    And fill the amount range field with <initialAmount> and <finalAmount>
    And click on the button Aplicar Filtros
    Then check if the application checked the date input and is showing the following <message>

    @Home_Success_Flow_XI_Filter_Transactions_Amount_Minimum
    Examples:
      | initialAmount | finalAmount | message    |
      | "100"         | "0"         | "$ 100,00" |

    @Home_Success_Flow_XI_Filter_Transactions_Amount_Maximum
    Examples:
      | initialAmount | finalAmount | message   |
      | "0"           | "50"        | "$ 50,00" |

  Scenario Outline: Home - TC - 019 .. 020 - Filter Transactions - Specific Amount
    When click on the filter button
    And click on the radiobutton Monto exacto
    And fill the amount field with <amount>
    Then check if the application filtered the data and is showing the following <message>

    @Home_Success_Flow_X_Filter_Transactions_Specific_Date
    Examples:
      | amount | message    |
      | "950"  | "$ 950,00" |

    @Home_Exception_Flow_VII_Filter_Transactions_Specific_Date_Not_Found
    Examples:
      | amount | message                                  |
      | "971"  | "¡Ups! No se encontró ningún movimiento" |

