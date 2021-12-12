package steps;

import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import pages.HomePage;
import utils.Utils;

public class HomeStep {

    HomePage home = new HomePage();

    @When("click on the eye to hide the balance")
    public void click_on_the_eye_to_hide_the_balance() {
        home.hideBalance();
    }

    @Then("check if the balance is hidden")
    public void check_if_the_balance_is_hidden() {
        home.validateHiddenBalance();
    }

    @When("click on the eye to show the balance")
    public void click_on_the_eye_to_show_the_balance() {
        home.showBalance();
    }

    @Then("check if the balance is been shown")
    public void check_if_the_balance_is_been_shown() {
        home.validateDisplayedBalance();
    }

    @When("click on the magnifier button")
    public void click_on_the_magnifier_button() {
        home.clickSearch();
    }

    @When("fill the search field with {string}")
    public void fill_the_search_field_with(String string) {
        home.fillSearch(string);
    }

    @Then("check if the application performed the search and is showing the following {string}")
    public void check_if_the_application_performed_the_search_and_is_showing_the_following(String string) {
        Utils.validateMessage(string);
    }

    @When("click on the filter button")
    public void click_on_the_filter_button() {
        home.clickFilter();
    }

    @When("click on the option {string}")
    public void click_on_the_option(String string) {
        home.optionOperation(string);
    }

    @When("fill the operation date range field with {string} and {string}")
    public void fill_the_operation_date_range_field_with_and(String string, String string2) {
        home.fillDateRange(string, string2);
    }

    @When("fill the amount range field with {string} and {string}")
    public void fill_the_amount_range_field_with_and(String string, String string2) {
        home.fillAmountRange(string, string2);
    }

    @When("click on the button Aplicar Filtros")
    public void click_on_the_button_aplicar_filtros() {
        home.clickBtnApplyFilter();
    }

    @Then("check if the application filtered the data and is showing the following {string}")
    public void check_if_the_application_filtered_the_data_and_is_showing_the_following(String string) {
        Utils.validateMessage(string);
    }

    @Then("check if the application checked the date input and is showing the following {string}")
    public void check_if_the_application_checked_the_date_input_and_is_showing_the_following(String string) {
        Utils.validateMessage(string);
    }

    @When("click on the radiobutton Fecha exacta de la operacion")
    public void click_on_the_radiobutton_fecha_exacta_de_la_operacion() {
        home.clickSpecificDate();
    }

    @When("fill the operation date field with {string}")
    public void fill_the_operation_date_field_with(String string) {
        home.fillSpecificDate(string);
    }

    @When("click on the radiobutton Monto exacto")
    public void click_on_the_radiobutton_monto_exacto() {
        home.clickSpecificAmount();
    }

    @When("fill the amount field with {string}")
    public void fill_the_amount_range_with(String string) {
        home.fillSpecificAmount(string);
    }

}
