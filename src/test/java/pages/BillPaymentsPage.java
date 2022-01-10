package pages;

import static com.codeborne.selenide.Condition.visible;
import static com.codeborne.selenide.Selenide.$;
import static com.codeborne.selenide.Selenide.sleep;
import static org.junit.Assert.assertTrue;
import static utils.Utils.numpadKeys;

import java.awt.AWTException;

import org.openqa.selenium.By;

import com.codeborne.selenide.SelenideElement;

public class BillPaymentsPage {

	private SelenideElement inputSearch = $(By.xpath("//input"));
	private SelenideElement firstCompanyOption = $(By.xpath("//li[1]/div/div/p"));
	private SelenideElement inputDniNumber = $(By.xpath("//div[@id='mainContentDiv']/div/div/div/div/div/div/div[2]/div/div/input"));
	private SelenideElement muiInputContinue = $(By.xpath("//button[@data-testid='btn-continue-invoice']"));
	private SelenideElement bntIconHelp = $("svg[data-testid='icon-help']");
	private SelenideElement bntIconCross = $("svg[data-testid='icon-cross']");
	private SelenideElement bntIconAlert = $("svg[data-testid='icon-alert-primary']");
	private SelenideElement bntArrowBack = $("svg[data-testid='icon-arrow-back']");
	private SelenideElement bntBack = $(By.xpath("(.//*[normalize-space(text()) and normalize-space(.)='Continuar'])[1]/following::*[name()='svg'][1]"));  
	private SelenideElement inputValue = $(By.xpath("//div/input[2]"));
	

	public void clickOnHelpButton() {
		bntIconHelp.shouldBe(visible).click();
	}

	public void clickOnBackButton() {
		bntBack.shouldBe(visible).click();
	}
	
	public void clickOnArrowBack() {
		bntArrowBack.shouldBe(visible).click();
	}
		
	public void validateDesappearOfIconAlert() {
		assertTrue(!bntIconAlert.exists());
	}
	
	public void clickOnXButton() {
		bntIconCross.shouldBe(visible).click();
	}
	
	public void fillField(String text) {
		inputSearch.sendKeys(text);
	}
	
	public void selectFirstCompanyOption() {
		firstCompanyOption.shouldBe(visible).click();
	}
	
	public void fillDniField(String text) {
		inputDniNumber.shouldBe(visible).click();
		inputDniNumber.sendKeys(text);
	}
	
    public Boolean checkMuiInputContinue() {
    	Boolean a;
    	if(muiInputContinue.getAttribute("class").contains("Mui-disabled")) {
    		a = true;
    	}else {
    		a =false;
    	}
    	return a; 
    }
    
    public void setAlfaNumericValue(String value) throws AWTException {
    	inputValue.click();
    	sleep(1000);
    	inputValue.sendKeys(value);
    }
	
    public void validateEnteringValue() {
    	assertTrue(inputValue.getAttribute("value").equals(",00"));
    }
}
