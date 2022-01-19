package steps;

import static com.codeborne.selenide.Selenide.sleep;
import static org.junit.Assert.assertTrue;
import static utils.Utils.validateMessage;

import java.awt.AWTException;
import java.util.List;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import pages.CardsPage;
import pages.CashoutPage;

public class CashoutStep {
	
	CashoutPage cashout = new CashoutPage();
	CardsPage cards = new CardsPage();

	@Then("should be displayed the data bellow:")
	public void shouldBeDisplayedTheDataBellow(List<String> labels) {
		cards.validateMessages(labels);
	}
	
	@When("I'm on the screen where I define the amount to be withdrawn, I put the value {string} which is released for withdrawal")
	public void iMOnTheScreenWhereIDefineTheAmountToBeWithdrawnIPutTheValueWhichIsReleasedForWithdrawal(String value) throws AWTException {
		cashout.setVirtualCardValue(value.replace(",", ""));
	}
	
	@Then("display a modal of attention informing:")
	public void displayAModalOfAttentionInforming(List<String> labels) {
		cards.validateMessages(labels);
	}
	
	@Then("I click to close and return to home from the Super Digital application to validate that the serve operation was not performed")
	public void clickToCloseAndReturnToHomeFromTheSuperDigitalApplicationToValidateThatTheServeOperationWasNotPerformed() {
		cashout.clickCloseModal();
				
		System.out.println(this.globalBalance);
		validateMessage(this.globalBalance);
	}	
	
	@Then("should display a toast balance with a new color")
	public void shouldDisplayAToastBalanceWithANewColor() {
		cashout.validateAlertIcon();
	}

	@When("on the extacción screen where it defines the value to be withdrawn")
	public void onTheExtacciónScreenWhereItDefinesTheValueToBeWithdrawn() {
		sleep(2000);
	}
	
	String globalBalance;
	@Given("check the balance on the main screen")
	public void checkTheBalanceOnTheMainScreen() {
		globalBalance = cashout.getCurrentBalance();
	}
	
	
	@Then("contain an infomative with the total account value")
	public void containAnInfomativeWithTheTotalAccountValue() {

		System.out.println(this.globalBalance);
		validateMessage(this.globalBalance);
		assertTrue(!this.globalBalance.equals("0,00"));
	}

	@When("I'm on the screen where I define the amount to be withdrawn, I put the value {string} which is out of the allowed")
	public void iMOnTheScreenWhereIDefineTheAmountToBeWithdrawnIPutTheValueWhichIsOutOfTheAllowed(String value) throws AWTException {
		cashout.setVirtualCardValue(value.replace(",", ""));
	}
	
	
	@Then("the Continue button is activated to give Cash Out procedure")
	public void theContinueButtonIsActivatedToGiveCashOutProcedure() {
		cashout.validateContinueButtonIsAtivated();
	}
	
	@Then("the Continue button is not enabled")
	public void theContinueButtonIsNotEnabled() {
		cashout.validateContinueButtonIsDisable();
	}
	
	@Given("on the effective retreat screen to define the value to be removed with {string}")
	public void onTheEffectiveRetreatScreenToDefineTheValueToBeRemovedWith(String value) throws AWTException {
		cashout.setVirtualCardValue(value.replace(",", ""));
	}
	
	@When("I click the cancel button of an attention modal")
	public void iClickTheCancelButtonOfAnAttentionModal() {
	    cashout.clickOnCancelButton();
	}
	
	@Then("return to screen to choose value for serve")
	public void returnToScreenToChooseValueForServe() {
		cashout.validateButtonCancelIsDisable();
		cashout.validateMainValueScreen();
	}	
	
	@When("logged in in Super Digital Application")
	public void loggedInInSuperDigitalApplication() {

	}
	@When("click the button with the user's letters")
	public void clickTheButtonWithTheUserSLetters() {

	}
	@When("a list containing the option {string}")
	public void aListContainingTheOption(String string) {

	}
	@When("click on the approving")
	public void clickOnTheApproving() {

	}

	@Then("on the Super Digital Web screen The OTP coding generation is relized")
	public void onTheSuperDigitalWebScreenTheOTPCodingGenerationIsRelized() {

	}
	@Then("at home will display the value of the serve")
	public void atHomeWillDisplayTheValueOfTheServe() {

	}	

	
}
