package steps;

import io.cucumber.java.PendingException;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import pages.ExternalTransferPage;
import pages.MenuPage;
import pages.RechargePage;
import utils.Utils;

public class RechargeStep extends RechargePage {

	@Given("^I see page with ¿Qué recarga vas a hacer\\?$")
	public void iSeePageWithQuéRecargaVasAHacer() throws Throwable {
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


}
