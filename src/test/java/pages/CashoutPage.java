package pages;

import static com.codeborne.selenide.Condition.visible;
import static com.codeborne.selenide.Condition.hidden;

import static com.codeborne.selenide.Selenide.$;
import static com.codeborne.selenide.Selenide.sleep;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static utils.Utils.numpadKeys;

import java.awt.AWTException;

import org.openqa.selenium.By;

import com.codeborne.selenide.SelenideElement;

public class CashoutPage {

	private SelenideElement buttonHelp = $("svg[data-testid='icon-help']");
	private SelenideElement currencyInputSignificant = $("input[data-testid='responsive_currency_input_significant']");
	private SelenideElement inputVirtualCardValue = $(By.xpath("//div/input[1]"));
	private SelenideElement disableButtonContinue = $(By.xpath("//button[@data-testid='submit-button' and contains(@class, 'Mui-disabled')]"));
	private SelenideElement buttonCancel = $(By.xpath("(.//*[normalize-space(text()) and normalize-space(.)='Cancelar'])"));
    private SelenideElement iconAlertPrimary = $("svg[data-testid='icon-alert-primary']");
    private SelenideElement mainBalanceField = $(By.xpath("//input[@data-testid='responsive_currency_input_significant']"));
    private SelenideElement mainBalanceFieldFraction = $("input[data-testid='responsive_currency_input_fraction']");
    private SelenideElement iconCloseModal = $("svg[data-testid='icon-cross']");
    
    
    
	public void clickOnbuttonHelp() {
		buttonHelp.shouldBe(visible).click();
	}
	
	public void clickCloseModal() {
		iconCloseModal.shouldBe(visible).click();
	}

	public void validateContinueButtonIsDisable() {
		assertTrue(disableButtonContinue.exists());
	}
	
	public String getCurrentBalance() {
		mainBalanceField.shouldBe(visible);
		
		String balance = mainBalanceField.getValue() + mainBalanceFieldFraction.getValue();
		
		return balance;
	}
	
	
	public String getCurrentBalanceField() {
		mainBalanceField.shouldBe(visible);
		
		String balance = mainBalanceField.getValue();
		
		return balance;
	}

	public void validateAlertIcon() {
		iconAlertPrimary.shouldBe(visible);
		assertTrue(iconAlertPrimary.exists());
	}
	
	public void validateContinueButtonIsAtivated() {	
		disableButtonContinue.shouldBe(hidden);
		assertFalse(disableButtonContinue.exists());
	}
	
	public void validateMainValueScreen() {
		sleep(3000);
		assertTrue(currencyInputSignificant.exists());
	}
	
	public void clickOnCancelButton() {
		buttonCancel.shouldBe(visible).click();
	}
	
	public void validateButtonCancelIsDisable() {
		sleep(3000);
		assertFalse(buttonCancel.exists());
	}
	
    public void setVirtualCardValue(String value) throws AWTException {
    	inputVirtualCardValue.click();
    	sleep(1000);
    	
        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
            inputVirtualCardValue.sendKeys(numpadKeys(Character.toString(c)));	
        }
        //utils.Utils.writeRobotString(value);
    }
}
