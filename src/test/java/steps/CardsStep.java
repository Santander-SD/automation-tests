package steps;

import static com.codeborne.selenide.Selenide.sleep;

import static org.junit.Assert.assertTrue;
import static utils.Utils.generatePendingTest;

import java.awt.AWTException;
import java.io.IOException;
import java.util.ArrayList;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import pages.CardsPage;
import utils.Utils;


public class CardsStep {
	
	CardsPage cards = new CardsPage();
	LoginStep loginStep = new LoginStep();


	@When("I click on button <Seguir la Entrega>")
	public void iClickOnButtonSeguirLaEntrega() throws Exception {
		generatePendingTest("It depends of test mass");
	}
	
	@Given("the physical card has tracking on it")
	public void thePhysicalCardHasTrackingOnIt() throws Exception {
		generatePendingTest("It depends of test mass");
	}
	
	@Then("I have to be informed of delivery states of the physical card in any moment")
	public void iHaveToBeInformedOfDeliveryStatesOfThePhysicalCardInAnyMoment() throws Exception {
		generatePendingTest("It depends of test mass");
	}

	@Given("I'm logged in with a valid account")
	public void iMLoggedInWithAValidAccount() throws IOException {
		loginStep.selectTheCountry(""); 
		loginStep.selectIfTheOption("");
		loginStep.fillInTheDocumentationFieldWithTheDocumentNumber("");
		loginStep.clickOnButtonIngressar();
		loginStep.loadingAPageIInformThe("");
		loginStep.clickOnButtonIngressar();
		loginStep.checkIfTheLoginToTheApplicationWasPerformedObservingTheFollowing("");
	}
	
	String globalCountry;
	@Given("I'm logged in with the data {string},{string} and {string}")
	public void iMLoggedInWithTheDataArgentinaAnd(String country, String documentation, String password)throws IOException {
		String message = "Saldo actual";
		String loginOption = "I ready have an account";
		
		globalCountry =country;
		
		loginStep.selectTheCountry(country); 
		loginStep.selectIfTheOption(loginOption);
		loginStep.fillInTheDocumentationFieldWithTheDocumentNumber(documentation);
		loginStep.clickOnButtonIngressar();
		loginStep.loadingAPageIInformThe(password);
		loginStep.checkIfTheLoginToTheApplicationWasPerformedObservingTheFollowing(message);
	}
	
	@When("I inform the reason {string} for replace card")
	public void informTheReasonForReplaceCard(String reason) {
		cards.selectReplaceMotivation(reason);
	}
	
	@When("I inform the delivery address")
	public void informTheDeliveryAddress() {
		cards.pressContinuarButton();
		utils.Utils.setAllureDetailsAboutTest("Needs mass");
	}

	@Given("I'm on the {string} page")
	public void iMOnTheTarjetasPage(String menuOption) {
		cards.selectOption(menuOption);
	}
	
	@Given("the account have a physical card")
	public void theAccountHaveAPhysicalCard() {
		utils.Utils.setAllureDetailsAboutTest("This test works only in mobile app !!!");
	}
	
	@When("inform my {int}-digits password")
	public void informMyDigitsPassword(Integer int1) {
		utils.Utils.setAllureDetailsAboutTest("This test works only in mobile app !!!");
	}
	
	@Then("I should see my {int}-digits password in the screen")
	public void iShouldSeeMyDigitsPasswordInTheScreen(Integer int1) throws Exception {
		generatePendingTest("This test works only in mobile app !!!");
	}
	
	@When("accept the terms")
	public void acceptTheTerms() {
	    cards.pressEntendidoButton();
	    cards.pressSiDarBajaButton();
	}

	@When("I select {string} for my {string} card")
	public void iSelectFormMyMainCard(String buttonOption, String typeCard) {
		if(typeCard.equals("main")) {
			cards.clickOnMainCard();
		}else {			
			if(globalCountry.equals("Argentina")) {
				cards.checkVirtualCardBlocked();				
			}else {
				cards.clickOnGenericVirtualCard();
			}
		}
		
		if(buttonOption.equals("Movimientos")) {			
			cards.clickOnMovimientosButton();
		}else {			
			cards.clickOnMenuTarjetaButton();
		}
	}
	
	@When("I select {string} for my enable {string} card")
	public void iSelectFormMyEnableMainCard(String buttonOption, String typeCard) {
		if(typeCard.equals("main")) {
			cards.clickOnMainCard();
		}else {			
			if(globalCountry.equals("Argentina")) {
				cards.checkForAnEnableVirtualCard();				
			}else {
				cards.clickOnGenericVirtualCard();
			}
		}
		
		if(buttonOption.equals("Movimientos")) {			
			cards.clickOnMovimientosButton();
		}else {			
			cards.clickOnMenuTarjetaButton();
		}
	}	
	
	@Then("should be displayed all purchasing transactions from my main card")
	public void shouldBeDisplayedAllPurchasingTransactionsFromMyMainCard() {
		ArrayList<String> transactionsList = new ArrayList<String>();
		transactionsList.add("Compra");
		transactionsList.add("South Emporium Argentina ARG");
		transactionsList.add("261,61");
		transactionsList.add("Compra");
		transactionsList.add("Midhwest Emporium Argentina ARG");
    	transactionsList.add("99,99");
    	transactionsList.add("Compra");
    	transactionsList.add("Northwest Emporium Argentina ARG");
    	transactionsList.add("155,13");
    	
		cards.purchasingTransactionsvalidation(transactionsList);	    
	}

	@When("I click on {string}")
	public void iClickOn(String option) {
	    cards.selectOption(option);
	    sleep(3000);
	}

	@When("I confirm operation on the mobile app")
	public void iConfirmOperationOnTheMobileApp() throws Exception {
		utils.Utils.setAllureDetailsAboutTest("It depends of mobile app operation");
		generatePendingTest("It depends of mobile app operation");
	}
	
	@When("I see the message {string}")
	public void iSeeThe(String message) {
		Utils.validateMessage(message);
	}
	
	@Then("I should see all virtual card details")
	public void iShouldSeeAllVirtualCardDetails() throws Exception {
		generatePendingTest("It depends of mobile app operation");
	}

	@Given("I already have money on my virtual card")
	public void iAlreadyHaveMoneyOnMyVirtualCard() {
		assertTrue(cards.checkBalanceCard("Virtual"));  
	}
	
	@When("I insert a withdraw value {string}")
	public void iInsertAWithdrawValue(String value) throws AWTException {
		cards.setVirtualCardValue(value.replace(",", ""));
		cards.pressConfirmarButton();
	}
	
	@Then("a voucher with message {string} should be displayed")
	public void aVoucherWithMessageShouldBeDisplayed(String string) throws Exception {
		utils.Utils.setAllureDetailsAboutTest("It depends of mobile app operation");
		generatePendingTest("It depends of mobile app operation");
	}
	
	@Then("Card balance should be updated")
	public void cardBalanceShouldBeUpdated() {
		System.out.println("It depends of mobile app operation");
	}
	
	@Then("withdraw voucher should exists on <Movimientos>")
	public void withdrawVoucherShouldExistsOnMovimientos() throws Exception {
		generatePendingTest("It depends of mobile app operation");
	}
	
	@When("I insert a recharge value {string}")
	public void insertARechargeValue(String value) throws AWTException {
		cards.setVirtualCardValue(value.replace(",", ""));
		cards.pressConfirmarButton();
	}
	
	@Then("display the voucher with message {string}")
	public void displayTheVoucherWithMessage(String string) {

	}
	@Then("recharge voucher should exists on <Movimientos>")
	public void rechargeVoucherShouldExistsOnMovimientos() {

	}
	
	@When("I inform the reason for cancel card")
	public void iInformTheReasonForCancelCard() {
		utils.Utils.setAllureDetailsAboutTest("This step isen't inside the happy flow");
	}
	
	@Then("the main card should be cancelled")
	public void theMainCardShouldBeCancelled() {

	}
	
	@Then("the cancelled main card on [Tarjetas] page should display message {string}")
	public void theCancelledMainCardOnTarjetasPageShouldDisplayMessage(String string) throws Exception {
		generatePendingTest("It depends of mobile app operation");
	}
		



	@Then("the virtual card should be blocked")
	public void theVirtualCardShouldBeBlocked() {

	}
	
	@Then("should display a screen with the message {string}")
	public void shouldDisplayAScreenWithTheMessage(String message) {
		Utils.validateMessage(message);
	}

	@Then("should be displayed all purchasing transactions from my virtual card")
	public void shouldBeDisplayedAllPurchasingTransactionsFromMyVirtualCard() {
		ArrayList<String> transactionsList = new ArrayList<String>();
		transactionsList.add("Compra");
		transactionsList.add("MERCADOPAGO *Spotify Buenos Aires ARG");
		transactionsList.add("244,99");
		transactionsList.add("Compra");
		transactionsList.add("MERCADOPAGO *iFood Buenos Aires ARG");
    	transactionsList.add("77,97");
    	transactionsList.add("Compra");
    	transactionsList.add("MERCADOPAGO *Uber Buenos Aires ARG");
    	transactionsList.add("119,91");
    	
		cards.purchasingTransactionsvalidation(transactionsList);	 
	}
	
	@When("I confirm data to request a new card")
	public void iConfirmDataToRequestANewCard() {

	}
	
	@Then("the request should be successful displaying the voucher on the screen")
	public void theRequestShouldBeSuccessfulDisplayingTheVoucherOnTheScreen() {
		utils.Utils.setAllureDetailsAboutTest("It depends of mobile app operation");
	}
	
	@Then("a new card should be displayed on caroussel with tracking button name {string}")
	public void aNewCardShouldBeDisplayedOnCarousselWithTrackingButtonName(String string) throws Exception {
		generatePendingTest("It depends of mobile app operation");
	}
	
	@Then("I should see the message {string}")
	public void iShouldSeeTheMessage(String string) throws Exception {
		generatePendingTest("It depends of mobile app operation");
	}
	
	@Then("the virtual card should be cancelled")
	public void theVirtualCardShouldBeCancelled() {

	}
	
	@Then("I should be redirected to the [Home] page")
	public void iShouldBeRedirectedToTheHomePage() {

	}
	
	@Then("the cancelled virtual card on [Tarjetas] page should display message {string}")
	public void theCancelledVirtualCardOnTarjetasPageShouldDisplayMessage(String string) {

	}	
	
    @Given("I click on plus button")
    public void iClickOnPlusButton() {
    	cards.addAVirtualCard();
    }
    
    @When("I insert virtual card name")
    public void iInsertVirtualCardName() {
    	cards.insertVirtualNameCard();
    }
    
    @When("I confirm virtual card data by clicking on {string}")
    public void iConfirmVirtualCardDataByClickingOnConfirmar(String option) {
    	cards.selectOption(option);
    }	

    @Given("already activate my virtual card")
    public void alreadyActivateMyVirtualCard() {

    }
    
    @When("I accept the terms to block virtual card")
    public void iAcceptTheTermsToBlockVirtualCard() {
    	cards.selectOption("Bloquear tarjeta");
    }
    
    @Then("the switch button should be updated")
    public void theSwitchButtonShouldBeUpdated() {
    	sleep(2000);
    	assertTrue(cards.checkSwitchCard());
    }

    
    @Then("should display the screen with message: {string}")
    public void shouldDisplayTheScreenWithMessage(String string) throws Exception {
    	generatePendingTest("It depends of mobile app operation");
    }
    
    @Then("the virtual card should be unblocked")
    public void theVirtualCardShouldBeUnblocked() {
    	System.out.println("It depends of mobile app operation");
    }

    @When("I accept the terms")
    public void iAcceptTheTerms() {
    	cards.pressSiDarBajaButton();
    }
}
