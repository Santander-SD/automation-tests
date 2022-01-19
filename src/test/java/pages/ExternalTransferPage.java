package pages;

import com.codeborne.selenide.ElementsCollection;
import com.codeborne.selenide.SelenideElement;
import org.openqa.selenium.By;
import static com.codeborne.selenide.Condition.text;
import static com.codeborne.selenide.Selenide.$;
import static com.codeborne.selenide.Selenide.$$;

public class ExternalTransferPage {

    private SelenideElement menuTransfer = $(By.xpath("//span[contains(.,'Transferir')]"));
    private SelenideElement btnSearchCBUCVUAlias = $(By.xpath("//p[contains(.,'Buscar por CBU')]"));
    private SelenideElement labelCBUCVUAlias = $(By.xpath("//div[contains(class, '42-MuiInputBase')]"));
    private SelenideElement inputCBUCVUAlias = $(By.xpath("//input[@type='text']"));
    private SelenideElement btnContinue = $(By.xpath("//span[contains(.,'Continuar')]"));
    private SelenideElement inputValue = $(By.xpath("//input[contains(@data-testid, 'responsive_currency_input_fraction')] | //input"));
    private SelenideElement selectConcept = $(By.xpath("//div[contains(@aria-labelledby, 'concept-label')]"));
    private ElementsCollection selectConceptOption = $$("ul li");
    private SelenideElement checkSaveAsFavorite = $(By.xpath("//input[@type='checkbox']"));
    private SelenideElement btnConfirmTransfer = $(By.xpath("//span[contains(.,'Confirmar transferencia')]"));


    public void accessMenuTransfer() {
        menuTransfer.click();
    }

    public void clickBtnSearchCBUCVUAlias() {
        btnSearchCBUCVUAlias.click();
    }

    public void fillCBUCVUAlias(String data) {
        inputCBUCVUAlias.click();
        inputCBUCVUAlias.clear();
        inputCBUCVUAlias.sendKeys(data);
    }

    public void clickBtnContinue() {
        btnContinue.click();
    }

    public void fillValue(String value) {
        inputValue.sendKeys(value);
    }

    public void optionConcept(String option) {
        selectConcept.click();
        selectConceptOption.findBy(text(option)).click();
    }

    public void clickCheckSaveAsFavorite() {
        checkSaveAsFavorite.click();
    }

    public void clickBtnConfirmTransfer() {
        btnConfirmTransfer.click();
    }

}
