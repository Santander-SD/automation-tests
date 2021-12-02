package steps;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.junit.Assert;
import pages.ExternalTransferPage;
import pages.LoginPage;

public class ExternalTransferStep {

    LoginPage login = new LoginPage();
    ExternalTransferPage et = new ExternalTransferPage();

    @Given("i'm logged into the application")
    public void i_m_logged_into_the_application() {
        login.optionAcess("I ready have an account");
        login.fillDocumentationNumber("33850984");
        login.enter();
        login.enterpassword("192837");
    }
    @When("click on Transferir")
    public void click_on_transferir() {
        et.accessMenuTransfer();
    }
    @When("click on Buscar por CBU CVU o Alias")
    public void click_on_buscar_por_cbu_cvu_o_alias() {
        et.clickBtnSearchCBUCVUAlias();
    }
    @When("fill in the CBU CVU o Alias field with {string}")
    public void fill_in_the_cbu_cvu_o_alias_field_with(String string) {
        et.fillCBUCVUAlias(string);
    }
    @When("click on button Continuar")
    public void click_on_button_continuar() {
        et.clickBtnContinue();
    }
    @When("fill in the transfer value field with {string}")
    public void fill_in_the_transfer_value_field_with(String string) {
        et.fillValue(string);
    }
    @When("select Concepto de transferencia {string}")
    public void select_concepto_de_transferencia(String string) {
        et.optionConcept(string);
    }
    @When("click on button Confirmar transferencia")
    public void click_on_button_confirmar_transferencia() {
        et.clickBtnConfirmTransfer();
    }
    @Then("check if the transfer on the application was performed, observing the following message {string}")
    public void check_if_the_transfer_on_the_application_was_performed_observing_the_following(String string) {
        et.validateMessage(string);
    }

    @When("click on the checkbox Guardar contacto como favorito")
    public void click_on_the_checkbox_guardar_contacto_como_favorito() {
        et.clickCheckSaveAsFavorite();
    }

    @Then("check if the contact was saved as favorite")
    public void check_if_the_contact_was_saved_as_favorite() {
        throw new io.cucumber.java.PendingException();
    }

    @Then("the operation will not be continued and the following message will be displayed {string}")
    public void the_operation_will_not_be_continued_and_the_following_message_will_be_displayed(String string) {
        et.validateMessage(string);
    }

    @Then("the application checks that the amount entered is greater than the account balance and display the following message {string}")
    public void the_application_checks(String string) {
        et.validateMessage(string);
    }
}
