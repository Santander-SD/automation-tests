package pages;

import static com.codeborne.selenide.Condition.visible;
import static com.codeborne.selenide.Selenide.$;
import static com.codeborne.selenide.Selenide.sleep;
import static org.junit.Assert.assertTrue;

import org.openqa.selenium.By;

import com.codeborne.selenide.SelenideElement;

public class InternalTransferPage {

    private SelenideElement btnContinue = $(By.xpath("//span[contains(.,'Continuar')]"));  
    private SelenideElement inputValueDocument = $(By.xpath("//input[contains(@data-testid, 'responsive_currency_input_significant')]"));
    private SelenideElement genericInput = $(By.xpath("//input"));
    private SelenideElement favorite = $(By.xpath("//ul/div/div/p[1]"));
    private SelenideElement genericField = $(By.xpath("//input"));
    

    public void fillGenericField(String content) {
    	genericField.sendKeys(content);
    }
    
    public void selectFavorite() {
    	sleep(2000);
    	favorite.shouldBe(visible).click();
    }

    public void clickBtnContinue() {
        btnContinue.click();
    }

    public void fillInField(String value) {
    	genericInput.sendKeys(value);
    }
    
    public void validateOnlyNumberPhoneField() {
    	assertTrue(genericInput.getAttribute("value").equals(""));    	
    }
    
    public void fillValueDocument(String value) {
    	inputValueDocument.sendKeys(value);
    }

}
