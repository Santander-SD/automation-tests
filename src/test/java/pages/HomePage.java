package pages;

import com.codeborne.selenide.SelenideElement;
import org.openqa.selenium.By;

import static com.codeborne.selenide.Selenide.$;
import static com.codeborne.selenide.Selenide.sleep;
import static org.junit.Assert.assertEquals;

public class HomePage {

    private SelenideElement btnShowHideBalance = $(By.xpath("//button[contains(@aria-describedby,'balance_card_title')]"));
    private SelenideElement balanceText = $(By.xpath("//span[contains(@data-testid,'balance_card_balance')]"));
    private SelenideElement btnSearch = $(By.xpath("//div/button[@class='42-MuiButtonBase-root 42-MuiIconButton-root a5ebb719__SearchBar_buttonContainer__1IwSd'][1]"));
    private SelenideElement inputSearch = $(By.xpath("//input[@class='42-MuiInputBase-input']"));
    private SelenideElement btnFilter = $(By.xpath("//div/button[@class='42-MuiButtonBase-root 42-MuiIconButton-root a5ebb719__SearchBar_buttonContainer__1IwSd'][2]"));
    private SelenideElement filterPayments = $(By.xpath("//*/text()[normalize-space(.)='Pagos']/parent::*"));
    private SelenideElement filterTransfers = $(By.xpath("//*/text()[normalize-space(.)='Transferencias']/parent::*"));
    private SelenideElement filterCards = $(By.xpath("//*/text()[normalize-space(.)='Compras con tarjeta']/parent::*"));
    private SelenideElement filterDeposits = $(By.xpath("//*/text()[normalize-space(.)='Depósitos']/parent::*"));
    private SelenideElement filterWithdraws = $(By.xpath("//*/text()[normalize-space(.)='Retiros']/parent::*"));
    private SelenideElement filterPhoneRecharge = $(By.xpath("//*/text()[normalize-space(.)='Recarga de teléfono']/parent::*"));
    private SelenideElement filterTransportRecharge = $(By.xpath("//*/text()[normalize-space(.)='Recarga de transporte']/parent::*"));
    private SelenideElement inputInitialDate = $(By.xpath("//div[4]/div/div/div/input"));
    private SelenideElement inputFinalDate = $(By.xpath("//div[2]/div/input"));
    private SelenideElement inputInitialAmount = $(By.xpath("//div[6]/div/div/div/input"));
    private SelenideElement inputFinalAmount = $(By.xpath("//div[6]/div/div[2]/div/input"));
    private SelenideElement btnApplyFilter = $(By.xpath("//*/text()[normalize-space(.)='Aplicar filtros']/parent::*"));
    private SelenideElement radioSpecificDate = $(By.xpath("//input[@class='42-transactions4849']"));
    private SelenideElement radioSpecificAmount = $(By.xpath("//div[2]/label/span/span/input"));


    public void hideBalance() {
        btnShowHideBalance.click();
    }

    public void showBalance() {
        btnShowHideBalance.click();
        sleep(2000);
        btnShowHideBalance.click();
    }

    public void clickSearch() {
        btnSearch.click();
    }

    public void fillSearch(String parameter) {
        inputSearch.clear();
        inputSearch.sendKeys(parameter);
    }

    public void clickFilter() {
        btnFilter.click();
    }

    public void optionOperation(String option) {
        switch (option) {
            case "Pagos":
                filterPayments.click();
                break;
            case "Transferencias":
                filterTransfers.click();
                break;
            case "Compras con tarjeta":
                filterCards.click();
                break;
            case "Depósitos":
                filterDeposits.click();
                break;
            case "Retiros":
                filterWithdraws.click();
                break;
            case "Recarga de teléfono":
                filterPhoneRecharge.click();
                break;
            case "Recarga de transporte":
                filterTransportRecharge.click();
                break;
        }
    }

    public void fillDateRange(String initialDate, String finalDate) {
        inputInitialDate.clear();
        inputInitialDate.sendKeys(initialDate);
        inputFinalDate.clear();
        inputFinalDate.sendKeys(finalDate);
    }

    public void fillAmountRange(String initialAmount, String finalAmount) {
        inputInitialAmount.clear();
        inputInitialAmount.sendKeys(initialAmount);
        inputFinalAmount.clear();
        inputFinalAmount.sendKeys(finalAmount);
    }

    public void clickBtnApplyFilter() {
        btnApplyFilter.click();
    }

    public void validateHiddenBalance() {
        String attribute = balanceText.getAttribute("aria-hidden");
        assertEquals(attribute, "true");
    }

    public void validateDisplayedBalance() {
        String attribute = balanceText.getAttribute("aria-hidden");
        assertEquals(attribute, "false");
    }

    public void clickSpecificDate() {
        radioSpecificDate.click();
    }

    public void fillSpecificDate(String string) {
        inputInitialDate.clear();
        inputInitialDate.sendKeys(string);
    }

    public void clickSpecificAmount() {
        radioSpecificAmount.click();
    }

    public void fillSpecificAmount(String string) {
        inputInitialAmount.clear();
        inputInitialAmount.sendKeys(string);
    }
}
