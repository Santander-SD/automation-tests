package steps;

import static org.junit.Assert.assertEquals;
import java.io.IOException;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import pages.CustomizationPage;
import pages.LoginPage;

public class LoginStep {

    LoginPage login = new LoginPage();
    CustomizationPage custom = new CustomizationPage();

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

    @When("loading a page I inform the {string}")
    public void loadingAPageIInformThe(String password) {
        login.enterpassword(password);
    }

    @When("enter the {string} and click on the eye {string}")
    public void enterTheAndClickOnTheEye(String password, String enableEye) {
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

    @When("loading a page I inform the {string}, incorrect three {int} attempt")
    public void loadingAPageIInformTheIncorrectThreeAttempt(String password, Integer repeatPassword) {
        login.enterPasswordToBeBlocked(password, repeatPassword);
    }

    @When("click button create a new password")
    public void clickButtonCreateANewPassword() {
        login.createNewPassoword();
    }

    @When("an email will be sent containing information to create a new password {string}")
    public void anEmailWillBeSentContainingInformationToCreateANewPassword(String sendEmail) {
        assertEquals(login.getStatusSendEmail(), sendEmail);
    }

    @When("entering the email, check if it was sent, click on the link and follow the steps")
    public void enteringTheEmailCheckIfItWasSentClickOnTheLinkAndFollowTheSteps() {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }

    @When("insert the new password")
    public void insertTheNewPassword() {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }

    @When("i access my browser profile until the nickname is created, I enter the {string} and click on the create button")
    public void iAccessMyBrowserProfileUntilTheNicknameIsCreatedIEnterTheAndClickOnTheCreateButton(String nickName) {
        custom.createNickName(nickName);
    }

    @When("a message to validate the creation is sent to the cell phone {string}")
    public void aMessageToValidateTheCreationIsSentToTheCellPhone(String messageMobile) {
        assertEquals(custom.getStatusConfirmationCreationNickName(), messageMobile);
    }

    @When("accessing the user profile menu and choosing the option to complete the assignment and {string} the request")
    public void accessingTheUserProfileMenuAndChoosingTheOptionToCompleteTheAssignmentAndTheRequest(String confirm) throws IOException {
        login.logoutApplication(confirm);
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

    @Then("the password will be locked {string}")
    public void thePasswordWillBeLocked(String passwordlocked) {
        throw new io.cucumber.java.PendingException();
    }

    @Then("the operation ends with the creation of a new password {string}")
    public void theOperationEndsWithTheCreationOfANewPassword(String string) {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }

    @Then("the new password entered will be displayed to verify {string}")
    public void theNewPasswordEnteredWillBeDisplayedToVerify(String string) {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }

    @Then("the nickname was created {string}")
    public void theNicknameWasCreated(String string) {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }

    @Then("check if the login to the application was performed, Show menu {string}")
    public void checkIfTheLoginToTheApplicationWasPerformedShowMenu(String nickName) {
        assertEquals(custom.getNameBtnUserMenu(), nickName);
    }

    @Then("will be redirected to main page to login {string}")
    public void willBeRedirectedToMainPageToLogin(String messageHomeLogin) {
        assertEquals(login.getStatusLogout(), messageHomeLogin);
    }

}
