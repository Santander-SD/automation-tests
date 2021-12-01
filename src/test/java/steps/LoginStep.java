package steps;

import static org.junit.Assert.assertEquals;
import java.io.IOException;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import pages.LoginPage;

public class LoginStep {

    LoginPage login = new LoginPage();

    @Given("are on the application's login page")
    public void areOnTheApplicationSLoginPage() {
        login.accessApplication();
    }

    @When("select the country {string}")
    public void selectTheCountry(String country) {
        login.optionCountry(country);
    }

    @When("select if the option {string}")
    public void selectIfTheOption(String optionAcess) {
        login.optionAcess(optionAcess);
    }

    @When("fill in the documentation field with the document number {string}")
    public void fillInTheDocumentationFieldWithTheDocumentNumber(String documentationNumber) {
        login.fillDocumentationNumber(documentationNumber);
    }

    @When("click on button ingressar")
    public void clickOnButtonIngressar() {
        login.enter();
    }

    @When("and when loading a page I inform the {string}")
    public void andWhenLoadingAPageIInformThe(String password) {
        login.enterpassword(password);
    }

    @When("ienter the {string} and click on the eye {string}")
    public void ienterTheAndClickOnTheEye(String password, String enableEye) {
        boolean enable = enableEye.equals("true") ? true : false;
        login.setEnableButonEye(enable);
        login.enterpassword(password);
    }

    @When("enable the button Remember my password")
    public void enableTheButtonRememberMyPassword() {
        login.rebemberPassWord();
    }

    @When("password, an iteration will be performed with a click on I forgot my password button")
    public void passwordAnIterationWillBePerformedWithAClickOnIForgotMyPasswordButton() {
       login.iForgotMyPassword();
    }

    @Then("check if the login to the application was performed, observing the following {string}")
    public void checkIfTheLoginToTheApplicationWasPerformedObservingTheFollowing(String message) throws IOException {
        assertEquals(login.validateLogin(), message);
    }

    @Then("the operation will not be continued, as the igress button will not be enabled {string}")
    public void theOperationWillNotBeContinuedAsTheIgressButtonWillNotBeEnabled(String buttonEnabled) {
        String checkButtonEnabled = login.getButtonIngressarEnzbled() == true ? "true" : "false";
        assertEquals(checkButtonEnabled, buttonEnabled);
    }

    @Then("the password entered will be displayed to verify {string}")
    public void thePasswordEnteredWillBeDisplayedToVerify(String verifyPassword) {
        assertEquals(login.getCheckThePasswordEntered(), verifyPassword);
    }

    @Then("the button will be enabled {string}")
    public void theButtonWillBeEnabled(String enableButton) {
        String statusRemenberPassword = login.getStatusRemenberPassWord() == true ? "true" : "false";
        assertEquals(statusRemenberPassword, enableButton);
    }

    @Then("a popup opens and displays the {string}")
    public void aPopupOpensAndDisplaysThe(String message_) {

        assertEquals(login.getStatusIForgotMyPassword(), message_);
    }

}
