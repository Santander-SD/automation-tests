package steps;

import static com.codeborne.selenide.Selenide.sleep;
import static org.junit.Assert.assertTrue;
import static utils.Utils.validateMessages;

import java.awt.AWTException;
import java.util.List;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import pages.BillPaymentsPage;

public class BillPaymentsStep {
	
	BillPaymentsPage bp = new BillPaymentsPage();

	
	@Given("fill in the Company field with {string}")
	public void fillInTheCompanyFieldWith(String text) {
		bp.fillField(text);
	}
	
	@Given("fill in the barCode field with {string}")
	public void fillInTheBarCodeFieldWith(String text) {
		bp.fillField(text);
	}
	
	@Given("I select the company")
	public void iSelectTheCompany() {
		bp.selectFirstCompanyOption();
	}
	
	@Given("the payment is made")
	public void thePaymentIsMadey() {

	}
	
	@Given("voucher information is displayed")
	public void voucherInformationIsDisplayed () {
		
	}
	
	@Given("fill in the payment code field with {string}")
	public void fillInThePaymentCodeFieldWith(String code) {
		bp.fillDniField(code);
	}
	
	
	@Then("if there are multiple payments for this service, the screen for choosing payments is displayed:")
	public void ifThereAreMultiplePaymentsForThisService(List<String> labels) {
		validateMessages(labels);
	}
	
	@Then("the payment information is between the minimum and the maximum amount established by the bank:")
	public void thePaymentInformationIsBetweenTheMinimumMaximum(List<String> labels) {
		validateMessages(labels);
	}
	
	@Then("it should display all the messages below:")
	public void  itShouldDisplayTheAllMessagesBelow(List<String> labels) {
		validateMessages(labels);
	}
	
	@When("I click the {string} button")
	public void iClickTheButton(String string) {

	}
	
	@Then("the application show a message saying that I have a out of date bank slip")
	public void theApplicationShowAMessageSayingThatIHaveAOutOfDateBankSlip() {

	}	
	
	@Then("the application displays a message saying the payment has already been made.")
	public void theApplicationDisplaysAMessageSayingThePaymentHasAlreadyBeenMade() {

	}	
	
	@When("should display the message 'Pago realizado!' on the screen")
	public void shouldDisplayTheMessagePagoRealizadoOnTheScreen() {

	}
	
	@Then("the aplication show a message saying that I have bank slip with payment already made by another user.")
	public void theAplicationShowAMessageSayingThatIHaveBankSlipWithPaymentAlreadyMadeByAnotherUser() {

	}
	
	@Then("a screen shows the sharing options for the vouncher information")
	public void aScreenShowsTheSharingOptionsForTheVouncherInformation() {

	}	
	
	@When("I click on confirm in the pop-up")
	public void iClickOnConfirmInThePopUp() {

	}
	@When("I enter a invalid PIN number")
	public void iEnterAInvalidPINNumber() {

	}
	@Then("a message appears saying I have a invalid PIN number")
	public void aMessageAppearsSayingIHaveAInvalidPINNumber() {

	}

	@Then("the payment screen  is loaded but the payment is above the total bill amount amount making it impossible to continue the flow")
	public void thePaymentScreenIsLoadedButThePaymentIsAboveTheTotalBillAmountAmountMakingItImpossibleToContinueTheFlow() {

	}
	
	@Then("the payment screen  is loaded but the payment is is shown to be zero amount making it impossible to continue the flow")
	public void thePaymentScreenIsLoadedButThePaymentIsIsShownToBeZeroAmountMakingItImpossibleToContinueTheFlow() {

	}	

	@When("I click on button arrow back")
	public void iClickOnButtonArrowBack() {
		sleep(2000);
		bp.clickOnArrowBack();
	}

	@When("I click on back arrow")
	public void iClickOnButtonBackNew() {
		sleep(2000);
		bp.clickOnBackButton();
	}
	
	@When("I click on help button")
	public void iClickOnHelpButton() {
		bp.clickOnHelpButton();
	}
	
	@Then("the field is clean")
	public void theFieldIsClean() {
		bp.validateDesappearOfIconAlert();
	}	
	
	@When("I click on clear button")
	public void iClickOnClearButton() {
		bp.clickOnXButton();
	}	
	
	@Then("Should not continue the flow")
	public void shouldNotContinueTheFlow() {
		sleep(3000);
    	assertTrue(bp.checkMuiInputContinue());
	}
	
	@When("insert the value {string}")
	public void insertTheValue(String value) throws AWTException {
		bp.setAlfaNumericValue(value);
	}	
	
	@Then("the field does not allow entering the value")
	public void theFieldDoesNotAllowEnteringTheValue() {
		bp.validateEnteringValue();
	}	
}
