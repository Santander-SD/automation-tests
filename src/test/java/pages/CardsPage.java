package pages;


import static com.codeborne.selenide.Condition.visible;
import static com.codeborne.selenide.Selenide.$;
import static com.codeborne.selenide.Selenide.sleep;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static utils.Utils.numpadKeys;
import static utils.Utils.validateMessage;

import java.awt.AWTException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;

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
	private SelenideElement inputCountrySelect= $("#country-select");
	private SelenideElement inputDepartureDate= $("#departureDate");
	//private SelenideElement inputArrival= $("#arrival");
	private SelenideElement inputArrival= $(By.xpath("(.//*[normalize-space(text()) and normalize-space(.)='Fecha de retorno'])[1]/following::input[1]"));
	
	
	
	private SelenideElement inputOtro= $("#Other");
	private SelenideElement inputVirtualCardValue = $(By.xpath("//div/input[2]"));
	private SelenideElement inputNombreTarjetaVirtual = $(By.xpath("//input[@value='']"));		
	private SelenideElement inputConfirmar = $(By.xpath("//*/text()[normalize-space(.)='Confirmar']/parent::*"));
	private SelenideElement inputContinuar = $(By.xpath("//*/text()[normalize-space(.)='Continuar']/parent::*"));
	private SelenideElement inputSearch = $(By.xpath("//input"));
	private SelenideElement inputVencimientoTarjeta = $("input[data-testid='card_activation_input']");
	private SelenideElement buttonSearch= $(By.xpath("(.//*[normalize-space(text()) and normalize-space(.)='Menú tarjeta'])[1]/following::*[name()='svg'][1]"));
	private SelenideElement buttonEyeopened = $("svg[data-testid='icon-eye-opened']");	
	private SelenideElement buttonEyeClosed = $("svg[data-testid='icon-eye-closed']");
	private SelenideElement buttonArrowBackMainScreen = $("svg[data-testid='icon-arrow-back']");
	private SelenideElement buttonArrowBack = $(By.xpath("(.//*[normalize-space(text()) and normalize-space(.)='Botón de baja'])[1]/following::*[name()='svg'][1]"));
	//private SelenideElement buttonArrowBackMainScreen = $(By.xpath("(.//*[normalize-space(text()) and normalize-space(.)='Extraer'])[1]/following::*[name()='svg'][1]"));
	private SelenideElement muiSwitchCard = $(By.xpath("//button[2]/div[2]/span/span"));
	private SelenideElement mainCard = $(By.xpath("//*/text()[normalize-space(.)='Titular']/parent::*"));
	private SelenideElement virtualCard = $(By.xpath("//*/text()[normalize-space(.)='Virtual']/parent::* | (.//*[normalize-space(text()) and normalize-space(.)='Saldo tarjeta'])[2]/following::div[4]"));
	private SelenideElement justLabelVirtualCard = $(By.xpath("//*/text()[normalize-space(.)='Virtual']/parent::*"));
	private SelenideElement informationIcon= $(By.xpath("(.//*[normalize-space(text()) and normalize-space(.)='Vencimiento'])[1]/following::*[name()='svg'][1]"));
	private SelenideElement buttonArrivalDate= $(By.xpath("(.//*[normalize-space(text()) and normalize-space(.)='Crear aviso'])[1]/preceding::*[name()='svg'][1]"));
	private SelenideElement buttonDepartureDate= $(By.xpath("(.//*[normalize-space(text()) and normalize-space(.)='Fecha de salida'])[1]/following::*[name()='svg'][1]"));
	
	
	public void selectOption(String menuOption) {
    	genericMenu = $(By.xpath("(.//*[normalize-space(text()) and normalize-space(.)='"+menuOption+"'])"));
    	genericMenu.shouldBe(visible).click();
    }
	
	public void selectDateDeparture(String date) {
		for (int i = 0; i < 9; i++) {
			inputDepartureDate.sendKeys(Keys.BACK_SPACE);			
		}

		inputDepartureDate.sendKeys(date.replace("/", ""));
	}
	
	public void validateIfMainCardIsVisible() {
		assertFalse(mainCard.exists());
	}
	
	public void selectDateDeparturePlus() {
		buttonDepartureDate.click();
		
		Date data = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		
		int formated = Integer.parseInt(dateFormat.format(data).substring(0, 2)) + 1;
				
		genericMenu = $(By.xpath("//button/span/p[contains(text(), '"+Integer.toString(formated)+"')]"));
		genericMenu.shouldBe(visible).click();
		
	}	
	
	public void selectDateArrival() {
		buttonArrivalDate.click();
		
		Date data = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		
		int formated = Integer.parseInt(dateFormat.format(data).substring(0, 2)) + 1;
		System.out.println(formated);
		
		genericMenu = $(By.xpath("//button/span/p[contains(text(), '"+Integer.toString(formated)+"')][last()]"));
		sleep(2000);		
		genericMenu.click();
		
	}
	
	
	
	public void validateNewreport(String country) throws ParseException {
		sleep(3000);
		Date data = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
//		
//		
//		Date date = dateFormat.parse(dateFormat.format(data));
//				
//		Calendar cal = Calendar.getInstance();
//		cal.setTime(date);
//		cal.add(Calendar.DAY_OF_MONTH, 1);
//		date = cal.getTime(); 
//		
//		System.out.println(date.toString());
//		System.out.println(country);
//		
//		
		//validateMessage(dateFormat.format(data).toString());
		validateMessage(country);
		
		
	}	
	
	public void clickOnEyeOpenedMainCard() {
		sleep(2000);
		buttonEyeopened.click();
	}
	
	public void clickOnEyeOpenedVirtualCard() {
		sleep(2000);
		selectLastEyeButton(6);
	}
	
	public void selectCountry(String country) {
		buttonArrowBack.scrollIntoView(false);
		inputCountrySelect.shouldBe(visible).click();
		
		sleep(1000);
    	genericMenu = $(By.xpath("//li[contains(text(), '"+country+"')]"));
    	
    	//genericMenu.scrollIntoView("{block: \"end\"}");
    	genericMenu.click();
    	
    	//$("#my-button").scrollIntoView("{block: \"end\"}");
    	//$("#my-button").scrollIntoView("{behavior: \"instant\", block: \"end\", inline: \"nearest\"}");

	}
	
	public void clickOnButtonArrowBack() {
		buttonArrowBack.scrollIntoView(false);
		buttonArrowBack.click();
	}
	
	public void clickOnButtonArrowBackMainScreen() {
		sleep(3000);
		buttonArrowBackMainScreen.shouldBe(visible).click();
	}
	
	public void validateBackToMainCards() {
		assertTrue(!buttonArrowBack.exists());
	}
	
	public void inputDataBuscarComprobante(String data) {
		buttonSearch.shouldBe(visible).click();
		sleep(1000);
		inputSearch.click();
		inputSearch.sendKeys(data);
	}
	
	public void validateEyeClosed() {
		assertTrue(buttonEyeClosed.exists());
	}
	
	public void clickOnEyeClosed() {
		buttonEyeClosed.shouldBe(visible).click();
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
    
    public void setDataInputVencimiento() {
    	
    }
    
    public void clickOnInformationIcont() {
    	informationIcon.shouldBe(visible).click();
    }
    
    public void setDateInputVencimiento(String date) {
    	inputVencimientoTarjeta.click();
    	inputVencimientoTarjeta.sendKeys(date.replace("/", ""));
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
    
    public void selectLastEyeButton(int cardPosition) {
		genericElement = $(By.xpath("(.//*[normalize-space(text()) and normalize-space(.)='Saldo tarjeta'])["+Integer.toString(cardPosition)+"]/following::*[name()='svg'][1]"));
		genericElement.shouldBe(visible).click();
    }

    public void selectLastVirtualCard(int cardPosition) {
		genericElement = $(By.xpath("//div[@id='mainContentDiv']/div/div/div/div/div/div/div/div/div/div/div[2]/div/div/div/div[3]/button["+Integer.toString(cardPosition)+"]/div"));
		genericElement.shouldBe(visible).click();
    }
    
    public void clickOnFirstVirtualCard() {
    	virtualCard.shouldBe(visible).click();
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
    	sleep(1000);
    	
        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
            inputVirtualCardValue.sendKeys(numpadKeys(Character.toString(c)));	
        }
        //utils.Utils.writeRobotString(value);
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
    
    public Boolean checkBalanceCard(int cardOption) { 
		Boolean existsBalances;
    	
    	balanceCard = $(By.xpath("(.//*[normalize-space(text()) and normalize-space(.)='Saldo tarjeta'])["+Integer.toString(cardOption)+"]/following::div[2]/preceding::p[1]"));
    	
    	
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
    
    public void validateMessages(List<String> labels) {
    	sleep(1000);
    	for (int i = 0; i < labels.size(); i++) {  
    		Utils.validateMessage(labels.get(i)); 		
		} 
    }
}
