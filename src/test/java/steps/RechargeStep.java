package steps;

import com.codeborne.selenide.Selenide;

import io.cucumber.java.PendingException;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import pages.ExternalTransferPage;
import pages.LoginPage;
import pages.MenuPage;
import pages.RechargePage;
import utils.Utils;

public class RechargeStep extends RechargePage {

	@Given("^I see page with ¿Qué recarga vas a hacer\\?$")
	public void iSeePageWithQueRecargaVasAHacer() throws Throwable {
		waitOnPageLoaded();
	}

	@When("^click on Recargar$")
	public void clickOnRecargar() throws Throwable {
		new MenuPage().clickOnRecargar();
	}

	@And("^click on card Realizar una recarga de celular$")
	public void clickOnCardRealizarUnaRecargaDeCelular() throws Throwable {
		pressCardRecharge();
	}

	@And("select company with {string}")
	public void selectCompanyWithCompanyValue(String companyValue) throws Throwable {
		selectRechargeCompany(companyValue);
	}

	@And("I set the Cell number field with {string}")
	public void iSetTheCellNumberFieldWithCellPhoneNumber(String cellPhoneNumber) throws Throwable {
		setCellPhoneNumber(cellPhoneNumber);
	}

	@When("set recharge value with {string}")
	public void setRechargeValueWith(String rechargeValue) {
		setValueRecharge(rechargeValue);
	}

	@When("confirm process")
	public void confirmProcess() {
		new ExternalTransferPage().clickBtnContinue();
	}

	@Then("I see the confirmation message with {string}")
	public void iSeeTheConfirmationMessageWith(String message) {
		Utils.validateMessage(message);
	}

	@Then("I see the continue button disabled")
	public void iSeeTheContinueButtonDisabled() throws Throwable {
		checkButtonDisabled();
	}

	@And("^I see an alert icone about over balance$")
	public void iSeeAnAlertIconeAboutOverBalance() throws Throwable {
		checkOverBalance();
	}

	@When("click on card Realizar una recarga de transporte")
	public void clickOnCardRealizarUnaRecargaDeTransporte() {
		pressCardTransport();
	}

	@When("select the registered cards")
	public void selectTheRegisteredCards() {
		waitOnTitlePageTransportLoaded();
		selectFirstTransportItem();
	}

	@When("Click on button Recargar tarjeta")
	public void clickOnButtonRecargarTarjeta() {
		pressRecargarTarjeta();
	}

	@When("select the value {string}")
	public void selectTheValue(String valueRecharge) {
		selectValueTheRecharge(valueRecharge);
	}

	@And("^I confirm the transaction on Mobile$")
	public void iConfirmTheTransactionOnMobile() throws Throwable {
		throw new PendingException();
	}

	@And("^I wait to exceed the time out for confirmation$")
	public void iWaitToExceedTheTimeOutForConfirmation() throws Throwable {
		Selenide.sleep(120000);
	}

	@When("click on Registrar nueva tarjeta")
	public void clickOnRegistrarNuevaTarjeta() {
		pressButtonRegister();
	}

	@When("I set value on Alias with {string}")
	public void iSetValueOnAliasWith(String alias) {
		setAlias(alias);
	}

	@When("I set value onNúmero de tarjea with {string}")
	public void iSetValueOnNúmeroDeTarjeaWith(String cardNumber) {
		setCardNumber(cardNumber);
	}

	@When("set Alias value with {string}")
	public void setAliasValueWith(String alias) {
		setAlias(alias);
	}

	@When("set number of card with {string}")
	public void setNumberOfCardWithConfirmaEstaOperaciónDesdeTuCelular(String cardNumber) {
		setCardNumber(cardNumber);
	}

	@When("select the card with alias {string}")
	public void selectTheCardWithAlias(String alias) {
		selectCardWithAlias(alias);
	}

	@When("I click on Editar datos")
	public void iClickOnEditarDatos() {
		clickOnEditData();
	}

	@When("I click on Eliminar alias")
	public void iClickOnEliminarAlias() {
		clickOnDeletion();
	}

	@When("I confirm alias deletion")
	public void iConfirmAliasDeletion() {
		confirmDeletionCard();
	}
	
	@When("click on Recargar tarjeta no registrada")
	public void clickOnRecargarTarjetaNoRegistrada() {
		clickOnRechargeWithCardNotRegistered();
	}
	
	@Then("I see the available values recharge")
	public void iSeeTheAvailableValuesRecharge() {
		validateValuesRecharge();
	}
	
	@When("I not select the value")
	public void iNotSelectTheValue() {
	    //this step does not require implementation
	}

	@Then("I see company {string}")
	public void iSeeCompanyCompanyValue(String company) throws Throwable {
		validateCompany(company);
	}

	@And("I click on doubts icon")
	public void iClickOnDoubtsIcon() throws Throwable {
		clickOnPanelDoubts();
	}

	@And("I cancel alias deletion")
	public void iCancelAliasDeletion() throws Throwable {
		cancelDeletionCard();
	}

	@Then("I see the register card number")
	public void iSeeTheRegisterCardNumber() throws Throwable {
		validateRegisterScreem();
	}

	@And("I click on Guardar alteración")
	public void iClickOnGuardarAlteración() throws Throwable {
		clickSaveChange();
	}

	@Then("^I see the Guardar alteracion button disabled$")
	public void iSeeTheGuardarAlteracionButtonDisabled() throws Throwable {
		checkButtonSaveChangeDisabled();
	}

	@Then("^I see the detail card$")
	public void iSeeTheDetailCard() throws Throwable {
		checkDetailCard();
	}

	@And("^clear alias field$")
	public void clearAliasField() throws Throwable {
		clearAlias();
	}

	@Given("^I'm logged in with valid data$")
	public void iMLoggedInWithValidData() throws Throwable {
		 LoginPage login = new LoginPage();
	        login.optionAcess("I ready have an account");
	        login.fillDocumentationNumber("23791098");
	        login.enter();
	        login.enterpassword("192837");
	}

}
