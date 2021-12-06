package pages;

import static com.codeborne.selenide.Selenide.*;
import static org.junit.Assert.assertTrue;
import org.openqa.selenium.By;
import com.codeborne.selenide.Condition;
import com.codeborne.selenide.ElementsCollection;
import com.codeborne.selenide.SelenideElement;

public class RechargePage {

	private SelenideElement pageTitle = $x("//p[contains(@class, 'PageTitle')]");
	private SelenideElement cardRecharge = $x("//p[text()='Realizar una recarga de celular']");
	private SelenideElement cardTransport = $x("//p[text()='Realizar una recarga de transporte']");
	private SelenideElement cardOthersRecharges = $x("//p[text()='Realizar otras recargas']");
	private ElementsCollection rechargeCompany = $$("p[data-testid='recharge_company_name']");
	private SelenideElement inputCellPhoneNumber = $("input[data-testid='phone_input']");
	private SelenideElement inputValueRecharge = $x("//div[contains(@class,'ResponsiveCurrencyInput')]/input");
	private SelenideElement buttonContinuar = $x("//button[contains(.,'Continuar')]");
	private SelenideElement overBalance = $x("//div[contains(@class, 'overBalance')]");
	private SelenideElement rechargeTransporteTitle = $x("//p[text()='¿Qué tarjeta vas a recargar?']");
	private ElementsCollection transportItens = $$x("//p[contains(@class,'transport_textBoldTitleItem')]");
	private SelenideElement buttonRecargarTarjeta = $x("//button[contains(.,'Recargar tarjeta')]");

	public void waitOnPageLoaded() {
		pageTitle.should(Condition.visible);
	}

	public void pressCardRecharge() {
		cardRecharge.should(Condition.visible).click();
	}

	public void pressCardTransport() {
		cardTransport.should(Condition.visible).click();
	}

	public void pressOtherRecharges() {
		cardOthersRecharges.should(Condition.visible).click();
	}

	public void selectRechargeCompany(String company) {
		switch (company) {
		case "Claro":
			rechargeCompany.get(0).click();
			break;
		case "Movistar - Reca":
			rechargeCompany.get(1).click();
			break;
		case "Nextel":
			rechargeCompany.get(2).click();
			break;
		case "Telecom Persona":
			rechargeCompany.get(3).click();
			break;
		case "Tuenti - Recarg":
			rechargeCompany.get(4).click();
			break;
		}
	}

	public void setCellPhoneNumber(String cellPhoneNumber) {
		inputCellPhoneNumber.should(Condition.visible).sendKeys(cellPhoneNumber);
	}

	public void setValueRecharge(String value) {
		inputValueRecharge.should(Condition.visible).setValue(value);
	}

	public void checkButtonDisabled() {
		assertTrue(buttonContinuar.is(Condition.disabled));
	}
	
	public void checkOverBalance() {
		overBalance.shouldBe(Condition.visible);
	}
	
	public void waitOnTitlePageTransportLoaded() {
		rechargeTransporteTitle.should(Condition.visible);
	}
	
	public void selectFirstTransportItem() {
		transportItens.get(0).should(Condition.visible).click();
	}
	
	public void pressRecargarTarjeta() {
		buttonRecargarTarjeta.click();
	}
	
	public void selectValueTheRecharge(String value) {
		$(By.xpath("//h6[contains(text(),'"+value+"')]")).click();
	}
}
