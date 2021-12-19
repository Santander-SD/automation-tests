package steps;

import static com.codeborne.selenide.Selenide.sleep;
import static org.junit.Assert.assertTrue;
import static utils.Utils.getJsonValueTest;
import static utils.Utils.getValueListJson;
import static utils.Utils.setAllureDetailsAboutTest;
import static utils.Utils.validateMessage;

import java.awt.AWTException;
import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import pages.CardsPage;


public class CardsStep {
	
	CardsPage cards = new CardsPage();
	LoginStep loginStep = new LoginStep();
	public String globaSelectCountry;
	


	@When("I click on button <Seguir la Entrega>")
	public void iClickOnButtonSeguirLaEntrega() throws Exception {

	}
	
	@Given("the physical card has tracking on it")
	public void thePhysicalCardHasTrackingOnIt() throws Exception {

	}
	
	@Then("I have to be informed of delivery states of the physical card in any moment")
	public void iHaveToBeInformedOfDeliveryStatesOfThePhysicalCardInAnyMoment(String message) throws Exception {
		validateMessage(message);
	}
	
	@Then("I have to be informed of delivery states of the physical card in any moment with the labels:")
	public void iHaveToBeInformedOfDeliveryStatesOfThePhysicalCardInAnyMomentWithTheLabels(List<String> labels) {
		cards.validateMessages(labels);
	}	
	
	@Then("I see the messages:")
	public void iSeeTheMessages(List<String> labels) {
		cards.validateMessages(labels);
	}		

	String globalCountry;
	@Given("I'm logged in with the data {string},{string} and {string}")
	public void iMLoggedInWithTheDataArgentinaAnd(String country, String documentation, String password)throws IOException {
		String loginOption = "I ready have an account";
		
		globalCountry =country;
		
		loginStep.selectTheCountry(country); 
		loginStep.selectIfTheOption(loginOption);
		loginStep.fillInTheDocumentationFieldWithTheDocumentNumber(documentation);
		loginStep.clickOnButtonIngressar();
		loginStep.loadingAPageIInformThe(password);
	}
	
	@When("I inform the reason {string} for replace card")
	public void informTheReasonForReplaceCard(String reason) {
		cards.selectReplaceMotivation(reason);
	}
	
	@When("I inform the delivery address")
	public void informTheDeliveryAddress() {
		cards.pressContinuarButton();
	}

	@When("I search for {string}")
	public void iSearchFor(String data) {
		cards.inputDataBuscarComprobante(data);
	}
	
	@Then("should display all the information about the search")
	public void shouldDisplayAllTheInformationAboutTheSearch() {
		cards.validateMessages(getValueListJson(getJsonValueTest("ce019","validateList")));
	}
	
	@Then("should display all the information about the virtual card transactions")
	public void shouldDisplayAllTheInformationAboutTheVirtualCardTransactions() {
		cards.validateMessages(getValueListJson(getJsonValueTest("ce021","validateList")));
	}

	@Given("I'm on the {string} page")
	public void iMOnTheTarjetasPage(String menuOption) {
		cards.selectOption(menuOption);
	}
	
	@Given("the account have a physical card")
	public void theAccountHaveAPhysicalCard() {
		setAllureDetailsAboutTest("This test works only in mobile app !!!");
	}
	
	@When("inform my {int}-digits password")
	public void informMyDigitsPassword(Integer int1) {
		setAllureDetailsAboutTest("This test works only in mobile app !!!");
	}
	
    @When("I click on eye opened button for the main card")
    public void iClickOnEyeOpenedButton() {
    	cards.clickOnEyeOpenedMainCard();
    }

    @When("I click on eye opened button for the virtual card")
    public void iClickOnEyeOpenedButtonVirtualCard() {
    	cards.clickOnEyeOpenedVirtualCard();
    }
    
    @Then("should display the card Balance")
    public void shouldDisplayTheCardBalance() {
    	cards.validateEyeClosed();
    }	
	
	@Then("I should see my {int}-digits password in the screen")
	public void iShouldSeeMyDigitsPasswordInTheScreen(Integer int1) throws Exception {

	}
	
	@When("accept the terms")
	public void acceptTheTerms() {
	    cards.pressEntendidoButton();
	    cards.pressSiDarBajaButton();
	}
	
	@When("accept the terms for the main card")
	public void acceptTheTermsForTheMainCard() {
	    cards.pressSiDarBajaButton();
	}	
	
	@When("I don't validate the operation on the app")
	public void iDonTValidateTheOperationOnTheApp() {
		sleep(125000);
	}	
	
	@When("I fill in the Vencimiento field")
	public void iFillInTheVencimientoFieldWithTheData() {
		cards.setDateInputVencimiento(getJsonValueTest("ce015","date"));
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
	
	@When("I click on button back")
	public void iClickOnButtonBack() {
		cards.clickOnButtonArrowBack();
	}
	
	@When("I click on main button back")
	public void iClickOnMainButtonBack() {
		cards.clickOnButtonArrowBackMainScreen();
	}
	
	@Then("should back to the main screen cards")
	public void shouldBackToTheMainScreenCards() {
		cards.validateBackToMainCards();
	}
	
	@Then("should back to the main screen")
	public void shouldBackToTheMainScreen() {
		cards.validateMessages(getValueListJson(getJsonValueTest("ce028","labels")));
	}
	
	@When("I select {string} for my last {string} card")
	public void iSelectTheLastVirtualCard(String buttonOption, String typeCard) {
		cards.selectLastVirtualCard(6);
		
		if(buttonOption.equals("Movimientos")) {			
			cards.clickOnMovimientosButton();
		}else {			
			cards.clickOnMenuTarjetaButton();
		}
	}
	
	@When("I select {string} for my first {string} card")
	public void iSelectTheFirstVirtualCard(String buttonOption, String typeCard) {
		cards.clickOnFirstVirtualCard();
		
		if(buttonOption.equals("Movimientos")) {			
			cards.clickOnMovimientosButton();
		}else {			
			cards.clickOnMenuTarjetaButton();
		}
	}	
	
	@When("I select {string} for my enabled {string} card")
	public void iSelectTheEnabledVirtualCard(String buttonOption, String typeCard) {
		cards.selectLastVirtualCard(3);
		
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
		cards.validateMessages(getValueListJson(getJsonValueTest("ce005","labels")));
	}

	@When("I click on {string}")
	public void iClickOn(String option) {
	    cards.selectOption(option);
	    sleep(2000);
	}
	
	@Then("should display a new repot")
	public void shouldDisplayANewRepot() throws ParseException {
		cards.validateNewreport(this.globaSelectCountry);
	}	
	
	
	@When("I selec the country {string}")
	public void iSelecTheCountry(String country) {
		this.globaSelectCountry = country;
		cards.selectCountry(country);
		sleep(1000);
	}
	
	@When("I select the departure date {string}")
	public void iSelectTheDepartureDate(String date) {
		cards.selectDateDeparture(date);
		sleep(2000);
	}
	@When("I select the arrival date {string}")
	public void iSelectTheArrivalDate(String date) {
		cards.selectDateArrival();
		sleep(10000);
	}
	
	@When("I select the arrival date to {int} day +")
	public void iSelectTheArrivalDateToDay(Integer int1) {
		cards.selectDateArrival();
		sleep(10000);
	}
	
	@When("I select the departure date to {int} day +")
	public void iSelectTheDepartureDateToDay(Integer int1) {
		cards.selectDateDeparturePlus();
		sleep(10000);
	}
	
	@When("I confirm operation on the mobile app")
	public void iConfirmOperationOnTheMobileApp() throws Exception {
		sleep(1000);
		validateMessage("Validar la operación en tu celular");
	}
	
	@When("I see the message {string}")
	public void iSeeThe(String message) {
		validateMessage(message);
	}
	
	@Then("I should see all virtual card details")
	public void iShouldSeeAllVirtualCardDetails() throws Exception {

	}

	@When("I click on information icon")
	public void iClickOnInformationIcon() {
		cards.clickOnInformationIcont();
	}
	
	@Then("should display informations about the vencimiento de la tarjeta")
	public void shouldDisplayInformationsAboutTheVencimientoDeLaTarjeta() {
		cards.validateMessages(getValueListJson(getJsonValueTest("ce016","validateList")));
	}

	@Given("I already have money on my virtual card")
	public void iAlreadyHaveMoneyOnMyVirtualCard() {
		assertTrue(cards.checkBalanceCard(6));  
	}
	
	@When("I insert a withdraw value {string}")
	public void iInsertAWithdrawValue(String value) throws AWTException {
		cards.setVirtualCardValue(value.replace(",", ""));
		cards.pressConfirmarButton();
	}
	
	@Then("a voucher with message {string} should be displayed")
	public void aVoucherWithMessageShouldBeDisplayed(String string) throws Exception {
		setAllureDetailsAboutTest("It depends of mobile app operation");
	}
	
	@Then("Card balance should be updated")
	public void cardBalanceShouldBeUpdated() {

	}
	
	@Then("withdraw voucher should exists on <Movimientos>")
	public void withdrawVoucherShouldExistsOnMovimientos() throws Exception {

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
		setAllureDetailsAboutTest("This step isen't inside the happy flow");
	}
	
	@Then("the main card should be cancelled")
	public void theMainCardShouldBeCancelled() {

	}
	
	@Then("the cancelled main card on [Tarjetas] page should display message {string}")
	public void theCancelledMainCardOnTarjetasPageShouldDisplayMessage(String string) throws Exception {

	}
		
	@Then("the virtual card should be blocked")
	public void theVirtualCardShouldBeBlocked() {

	}
	
	@Then("should display a screen with the message {string}")
	public void shouldDisplayAScreenWithTheMessage(String message) {
		validateMessage(message);
	}

	@Then("should be displayed all purchasing transactions from my virtual card")
	public void shouldBeDisplayedAllPurchasingTransactionsFromMyVirtualCard() {		
		cards.validateMessages(getValueListJson(getJsonValueTest("ce006","labels")));
	}
	
	@When("I confirm data to request a new card")
	public void iConfirmDataToRequestANewCard() {
		cards.selectOption("De acuerdo");
		cards.selectOption("Continuar");
		cards.selectOption("Confirmar");
	}
	
	@Then("the request should be successful displaying the voucher on the screen")
	public void theRequestShouldBeSuccessfulDisplayingTheVoucherOnTheScreen() {

	}
	
	@Then("a new card should be displayed on caroussel with tracking button name {string}")
	public void aNewCardShouldBeDisplayedOnCarousselWithTrackingButtonName(String string) throws Exception {
		setAllureDetailsAboutTest("It depends of mobile app operation");
	}
	
	@Then("I should see the message {string}")
	public void iShouldSeeTheMessage(String string) throws Exception {
		
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
    	sleep(4000);
    	assertTrue(cards.checkSwitchCard());
    }

    
    @Then("should display the screen with message: {string}")
    public void shouldDisplayTheScreenWithMessage(String string) throws Exception {

    }
    
    @Then("the virtual card should be unblocked")
    public void theVirtualCardShouldBeUnblocked() {
    	System.out.println("It depends of mobile app operation");
    }

    @When("I accept the terms")
    public void iAcceptTheTerms() {
    	cards.pressSiDarBajaButton();
    }
    
    @Given("already received the main\\/physical card")
    public void alreadyReceivedTheMainPhysicalCard() {

    }
    
    @When("I inform the expiration date")
    public void iInformTheExpirationDate() { 
    	cards.setDateInputVencimiento(getJsonValueTest("ce015","date"));
    }
    
    @Then("main card should be activated")
    public void mainCardShouldBeActivated() {
    	setAllureDetailsAboutTest("This test needs manual validation, because of mobile flow.");
    }
    
    @Then("should display a success screen with messages: {string}")
    public void shouldDisplayASuccessScreenWithMessages(String message) {

    }    
}
