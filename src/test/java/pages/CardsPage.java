package pages;


import static com.codeborne.selenide.Condition.visible;
import static com.codeborne.selenide.Selenide.$;
import static com.codeborne.selenide.Selenide.sleep;
import static org.junit.Assert.assertTrue;

import java.awt.AWTException;
import java.util.ArrayList;

import org.openqa.selenium.By;

import com.codeborne.selenide.SelenideElement;

import utils.Utils;


public class CardsPage {

	private SelenideElement genericMenu;
	private SelenideElement genericElement;
	private SelenideElement balanceCard;
	private SelenideElement genericVirtualCard = $(By.xpath("(.//*[normalize-space(text()) and normalize-space(.)='Saldo tarjeta'])[2]/following::div[4] | (.//*[normalize-space(text()) and normalize-space(.)='Saldo tarjeta'])[1]/following::div[4]"));
	private SelenideElement btnMovimientos = $(By.xpath("//*/text()[normalize-space(.)='Movimientos']/parent::*"));
	private SelenideElement btnMenuTarjeta = $(By.xpath("//*/text()[normalize-space(.)='Menú tarjeta']/parent::*"));
	private SelenideElement btnAddVirtualCard = $(By.xpath("//div[2]/div/div/button"));
	private SelenideElement btnEntendido   = $(By.xpath("//*/text()[normalize-space(.)='Entendido']/parent::*"));
	private SelenideElement btnSiDarDeBaja   = $(By.xpath("//*/text()[normalize-space(.)='Si, dar de baja']/parent::*"));
	private SelenideElement inputChipNoFunciona= $("#ReissueBecauseDamageChip");
	private SelenideElement inputBandaMagneticaDanada= $("#ReissueBecauseDamagedMagneticStrip");
	private SelenideElement inputPlasticoRolo= $("#ReissueBecauseBrokenCard");
	private SelenideElement inputOtro= $("#Other");
	private SelenideElement inputVirtualCardValue = $(By.xpath("//input[@data-testid='responsive_currency_input_significant']"));
	private SelenideElement inputNombreTarjetaVirtual = $(By.xpath("//input[@value='']"));		
	private SelenideElement inputConfirmar = $(By.xpath("//*/text()[normalize-space(.)='Confirmar']/parent::*"));
	private SelenideElement inputContinuar = $(By.xpath("//*/text()[normalize-space(.)='Continuar']/parent::*"));
	private SelenideElement muiSwitchCard = $(By.xpath("//button[2]/div[2]/span"));
	private SelenideElement mainCard = $(By.xpath("//*/text()[normalize-space(.)='Titular']/parent::*"));
	private SelenideElement virtualCard = $(By.xpath("//*/text()[normalize-space(.)='Virtual']/parent::* | (.//*[normalize-space(text()) and normalize-space(.)='Saldo tarjeta'])[2]/following::div[4]"));
	private SelenideElement justLabelVirtualCard = $(By.xpath("//*/text()[normalize-space(.)='Virtual']/parent::*"));


	public void selectOption(String menuOption) {
    	genericMenu = $(By.xpath("(.//*[normalize-space(text()) and normalize-space(.)='"+menuOption+"'])"));
    	genericMenu.shouldBe(visible).click();
    }
        
    public void clickOnMovimientosButton() {
    	btnMovimientos.shouldBe(visible).click();
    }
    
    public void clickOnMenuTarjetaButton() {
    	btnMenuTarjeta.shouldBe(visible).click(); 
    }
    
    public void clickOnMainCard() {
    	mainCard.shouldBe(visible).click();
    }
    
    public void clickOnVirtualCard() {
    	virtualCard.shouldBe(visible).click();
    }
    
    public void checkVirtualCardBlocked() {
    	virtualCard.shouldBe(visible).click();
    	
    	Boolean a = true;
    	int b = 1;
    	while(a) {
    		b += 1;

    		if(checkSwitchCard()) {
    			System.out.println("Check Enable");
    			genericElement = $(By.xpath("(.//*[normalize-space(text()) and normalize-space(.)='Saldo tarjeta'])["+Integer.toString(b+1)+"]/following::div[2]"));
    			genericElement.shouldBe(visible).click();
    		}else {
    			a= false;
    		}
    	}
    }
    
    public void checkForAnEnableVirtualCard() {
    	virtualCard.shouldBe(visible).click();
    	
    	Boolean a = true;
    	int b = 1;
    	while(a) {
    		b += 1;
    		
    		if(!justLabelVirtualCard.isDisplayed()) {
    			genericElement = $(By.xpath("(.//*[normalize-space(text()) and normalize-space(.)='Saldo tarjeta'])["+Integer.toString(b+1)+"]/following::div[2]"));
    			genericElement.shouldBe(visible).click();
    			sleep(1000);
    		}else {
    			this.justLabelVirtualCard.click();
    			a= false;
    		}
    	}
    }
    
    public void setVirtualCardValue(String value) throws AWTException {
    	inputVirtualCardValue.click();
    	utils.Utils.writeRobotString(value);
    }
    
    public void pressConfirmarButton() {
    	inputConfirmar.shouldBe(visible).click();
    }
    
    public void pressContinuarButton() {
    	inputContinuar.shouldBe(visible).click();
    }
    
    public void selectReplaceMotivation(String reason) {
		switch (reason) {
		  case "Chip no funciona":
			  inputChipNoFunciona.click();
		    break;
		  case "Banda magnética dañada":
			  inputBandaMagneticaDanada.click();
		    break;
		  case "Plástico roto":
			  inputPlasticoRolo.click();
			    break;		    
		  default:
			  inputOtro.click();
		}
    }
    
    public void pressEntendidoButton() {
    	btnEntendido.shouldBe(visible).click();
    }
    
    public void pressSiDarBajaButton() {
    	btnSiDarDeBaja.shouldBe(visible).click();
    }
    
    public void checkTextPresent(String value) {
    	sleep(4000);
    	assertTrue($(By.xpath("//*[contains(text(), '"+value.toString()+"')]")).exists());
    }
    
    public Boolean checkBalanceCard(String cardOption) { 
		Boolean existsBalances;
    	
    	balanceCard = $(By.xpath("(.//*[normalize-space(text()) and normalize-space(.)='"+cardOption+"'])[1]/preceding::p[1]"));
    	String balance = balanceCard.shouldBe(visible).getText().replace("$ ", "");
    	 
    	if(balance != "00,00") {
    		existsBalances = true;
    	}else {
    		existsBalances = false;
    	}

    	return existsBalances;
    }
    
    public void addAVirtualCard() {
    	btnAddVirtualCard.shouldBe(visible).click();
    }
    
    public void clickOnGenericVirtualCard() {
    	genericVirtualCard.shouldBe(visible).click();
    }    
    
    public Boolean checkSwitchCard() {
    	Boolean a;
    	if(muiSwitchCard.getAttribute("class").contains("Mui-checked")) {
    		a = true;
    	}else {
    		a =false;
    	}
    	return a; 
    }
    
    public void insertVirtualNameCard() {
    	String name = utils.Utils.generateRadomName();
    	inputNombreTarjetaVirtual.shouldBe(visible).sendKeys(name);
    }
    
    public void purchasingTransactionsvalidation(ArrayList<String> transactionsList) {
    	sleep(1000);
    	for (int i = 0; i < transactionsList.size(); i++) {    
    		Utils.validateMessage(transactionsList.get(i)); 		
		} 
    }
}
