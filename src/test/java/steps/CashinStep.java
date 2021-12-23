package steps;

import static utils.Utils.validateMessage;

import java.awt.HeadlessException;
import java.awt.datatransfer.UnsupportedFlavorException;
import java.io.IOException;
import java.util.List;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import pages.CardsPage;
import pages.CashinPage;

public class CashinStep {
	
	CashinPage cashin = new CashinPage();
	CardsPage cards = new CardsPage();
	
	@Then("should display the CVU code {string}")
	public void shouldDisplayTheCVUCode(String code) {
		validateMessage(code);
	}
	
	@When("I search for {string} in sucursales cercanas input")
	public void iSearchForInSucursalesCercanasInput(String location) {
		cashin.fillinSearchField(location);
		cashin.selectTheFirstItemFromCityOptions();
	}
	
	@When("I search for just {string} in sucursales cercanas input")
	public void iSearchForJustInSucursalesCercanasInput(String location) {
		cashin.fillinSearchField(location);
	}	
	
	@Then("you should display the rapipago points for the client")
	public void youShouldDisplayTheRapipagoPointsForTheClient() {

	}
	
	@Then("I click on button Close")
	public void iClickOnButtonClose() {
		cashin.clickOnbuttonClose();
	}
	
	@Then("should display information that the minimum and maximum limit")
	public void youShouldDisplayInformationThatTheMinimumLimitIsMaximumIsInTheLimitOfTo(List<String> labels) {
		cards.validateMessages(labels);
	}
	
	@Then("should display a screen with the label {string}")
	public void shouldDisplayAScreenWithTheLabel(String message) {
		validateMessage(message);
	}	
	
	@When("I click on Help button")
	public void iClickOnHelpButton() {
		cashin.clickOnbuttonHelp();
	}
	
	@Given("display the customer data screen for user account")
	public void displayTheCustomerDataScreenForUserAccount() {

	}
	@When("I click on the button Share My Data from DNI")
	public void youClickOnTheButtonShareMisDats() {
		cashin.clickOnButtonCompartilharDNI();
	}
	
	@When("I click on the button Share My Data from CVU")
	public void youClickOnTheButtonShareMisDatsCvu() {
		cashin.clickOnbuttonCompartilharCVU();
	}
	
	@When("I click on the copy CVU button")
	public void iClickOnTheCvuButton() {
		cashin.clickOnButtonCopyCVU();
	}
	
	@When("I click on the copy Alias button")
	public void youClickOnTheAliasButton() {
		cashin.clickOnButtonCopyAlias();
	}
	
	@Then("copy action is performed with success")
	public void copyActionIsPerformedWithSuccess(List<String> labels) throws HeadlessException, UnsupportedFlavorException, IOException {
		validateMessage(labels.get(0).toString());
		cashin.dataTransferValidation(labels);
	}
}
