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

    @Then("check if the login to the application was performed, observing the following {string}")
    public void checkIfTheLoginToTheApplicationWasPerformedObservingTheFollowing(String message) throws IOException {
        assertEquals(login.validateLogin(), message);
    }

}
