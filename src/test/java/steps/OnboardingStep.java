package steps;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import pages.OnboardingPage;

public class OnboardingStep {

    OnboardingPage onboarding = new OnboardingPage();

    @Given("I provide a DNI {string}")
    public void iProvideAValidDNI(String DNINumber) {
    	onboarding.fillDNINumber(DNINumber);
    }
    
    @Given("I provide a valid DNI")
    public void iProvideAValidDNI() {
    	onboarding.fillDNINumberGenerated();
    }
    
    @Given("I click on Crear cuenta")
    public void iClickOnCrearCuenta() {
        onboarding.clickCrearCuenta();
    }
    
    @Given("on Name I inform {string} in registro")
    public void onNameIInformInRegistro(String Nombre) {
        onboarding.setInputNombre(Nombre);
    }
    @Given("on Surname I inform {string} in registro")
    public void onSurnameIInformInRegistro(String Apellido) {
        onboarding.setInputApellido(Apellido);
    }
    @Given("on Birth date I inform {string} in registro")
    public void onBirthDateIInformInRegistro(String Nacimiento) {
        onboarding.setInputNacimiento(Nacimiento);
    }
    @Given("on Email I inform {string} in registro")
    public void onEmailIInformInRegistro(String Email) {
        onboarding.setInputEmail(Email);
    }
    @Given("I click on Continuar")
    public void iClickOn() {
        onboarding.clickContinue();
    }
//    @Then("I see {string} screen")
//    public void iSeeScreen(String string) {
//        // Write code here that turns the phrase above into concrete actions
//        throw new io.cucumber.java.PendingException();
//    }
//    @Then("I see the button Entendido")
//    public void iSeeTheButtonEntendido() {
//        // Write code here that turns the phrase above into concrete actions
//        throw new io.cucumber.java.PendingException();
//    }
//    @Then("I cannot proceed with the onboarding")
//    public void iCannotProceedWithTheOnboarding() {
//        // Write code here that turns the phrase above into concrete actions
//        throw new io.cucumber.java.PendingException();
//    }

    @When("I check the first checkbox in Terms and Conditions")
    public void iCheckTheFirstCheckboxInTermsAndConditions() {
        onboarding.clickCheckTermsAndConditions();
    }
    
    @When("I see a dropdown listing the available countries")
    public void iSeeADropdownListingTheAvailableCountries() {
        onboarding.validExistSelectPrefix();
    }
    
    @When("on Phone number I inform {string} in registro")
    public void onPhoneNumberIInformInRegistro(String number) {
        onboarding.setPhoneNumber(number);
    }
    
    @When("I select the options Mensaje SMS")
    public void iSelectTheOptionsMensajeSMS() {
       onboarding.clickRadioMsgSMS();
    }
    
    @Then("I see the text {string}")
    public void iSee(String text) {
       onboarding.textExist(text);
    }

    @Then("on verification code I inform {string} in registro")
    public void onVerificationCodeIInformInRegistro(String code) {
       onboarding.setVerificationCode(code);
    }
    
    @When("I check the radio with text {string}")
    public void iCheckTheRadioWithText(String text) {
        onboarding.clickRadioByText(text);
    }
    
    @When("I click No on answer of categories")
    public void iClickNoOnAnswerOfCategories() {
       onboarding.clickAnswersNo();
    }
    
    @When("I create the six digit password")
    public void iCreateTheSixDigitPassword() {
       onboarding.setSixDigitPassword();
    }
    
    @When("I create the four digit password")
    public void iCreateTheFourDigitPassword() {
       onboarding.setFourDigitPassword();
    }

    @Then("I click on settings menu in my name")
    public void iClickOnSettingsMenuInMyName() {
        onboarding.clickSettingsNavbar();
    }
    @Then("I click on my email")
    public void iClickOnMyEmail() {
        onboarding.clickMiEmail();
    }
    @Then("on Email Actual I inform {string}")
    public void onEmailActualIInform(String email) {
        onboarding.setEmailActual(email);
    }
    @Then("on Nuevo Email I inform {string}")
    public void onNuevoEmailIInform(String email) {
        onboarding.setEmailNuevo(email);
    }
    @Then("on Repetir Nuevo Email I inform {string}")
    public void onRepetirNuevoEmailIInform(String email) {
        onboarding.setEmailrepetir(email);
    }

    @Then("I see my name {string} and my initials {string} in menu screen")
    public void iSeeMyNameAndMyInitialsInMenuScreen(String name, String initials) {
        onboarding.validNameAndInitialName(name, initials);
    }
    
    @Then("button Crear cuenta is disabled")
    public void buttoCrearCuentaIsDisabled() {
        onboarding.buttonCrearCuentaDisabled();
    }

    @Then("button Continuar is disabled")
    public void buttonContinuarIsDisabled() {
    	onboarding.ButtonContinueDisabled();
    }



}
