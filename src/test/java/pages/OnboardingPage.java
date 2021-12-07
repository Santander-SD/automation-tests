package pages;

import static com.codeborne.selenide.Selenide.$;
import java.util.Random;
import org.junit.Assert;
import org.openqa.selenium.By;
import com.codeborne.selenide.SelenideElement;

public class OnboardingPage {
  
    private SelenideElement inputNumberDNI = $("#show-login-idnumber-input");
    private SelenideElement ButtonCrearCuenta = $("#footer-button-next");
    private SelenideElement inputNombre = $("input[name='name']");
    private SelenideElement inputApellido = $("input[name='middlename']");
    private SelenideElement inputEmail = $("input[name='email']");
    private SelenideElement inputNacimiento = $("input[name='birthDate']");
    private SelenideElement ButtonContinue = $("#footer-button-next");
    private SelenideElement checkTermsAndConditions = $(By.xpath("//*[contains(@label, 'Términos')]"));
    private SelenideElement selectCountryPrefix = $("#phone-prefix-list-select");
    private SelenideElement inputPhoneNumber = $("#phone-number-input");
    private SelenideElement radioMessageSMS = $(By.xpath("//span[contains(text(), 'Mensaje SMS')]/../span[1]"));
    private SelenideElement inputVerificationCode = $("input[type='number']");
    private SelenideElement inputUserNaveBar = $("#user-navbar");
    private SelenideElement buttonMiEmail = $(By.xpath("//p[contains(text(), 'Mi email')]"));
    private SelenideElement inputEmailActual = $("input[name='email']");
    private SelenideElement inputEmailNuevo = $("input[name='newEmail']");
    private SelenideElement inputEmailRepetir = $("input[name='confirmEmail']");
    private SelenideElement nameMenuScreen = $(By.xpath("//div[contains(@class, 'ConfigurationMenu_avatarContainer__2l8_v')]/div[2]/span"));
    private SelenideElement initialsMenuScreen = $(By.xpath("//div[contains(@class, 'ConfigurationMenu_avatarContainer__2l8_v')]/div[1]/div[1]/div[1]"));
    
   
    public void setEmailActual(String email) {
    	inputEmailActual.setValue(email);
    }
    
    public void setEmailNuevo(String email) {
    	inputEmailNuevo.setValue(email);
    }
    
    public void setEmailrepetir(String email) {
    	inputEmailRepetir.setValue(email);
    }
    
    public void fillDNINumber(String documentationNumber) {
    	inputNumberDNI.setValue(documentationNumber);
    }
    
    public void fillDNINumberGenerated() {
    	Random rand = new Random();
    	Integer code = rand.nextInt(900000);
    	inputNumberDNI.setValue(code.toString());
    }
    
    public void clickCrearCuenta() {
    	ButtonCrearCuenta.click();
    }
    
    public void clickSettingsNavbar() {
    	inputUserNaveBar.click();
    }
    
    public void setInputNombre(String Nombre) {
    	inputNombre.setValue(Nombre);
    }
    
    public void setInputApellido(String Apellido) {
    	inputApellido.setValue(Apellido);
    }
    
    public void setInputEmail(String Email) {
    	inputEmail.setValue(Email);
    }
    
    public void setInputNacimiento(String Nacimiento) {
    	inputNacimiento.click();
    	inputNacimiento.sendKeys(Nacimiento);
    }

    public void clickContinue() {
    	ButtonContinue.click();
    }
    
    public void clickMiEmail() {
    	buttonMiEmail.click();
    }
    
    public void clickCheckTermsAndConditions() {
    	checkTermsAndConditions.click();
    }
    
	public void validExistSelectPrefix() {
		selectCountryPrefix.exists();
    }
    
    public void setPhoneNumber(String number) {
    	inputPhoneNumber.click();
    	inputPhoneNumber.sendKeys(number);
    }
    
    public void clickRadioMsgSMS() {
    	radioMessageSMS.click();
    }
    
    public void textExist(String text) {
    	$(By.xpath("//*[contains(text(), '"+text+"')]")).click();
    	Assert.assertTrue($(By.xpath("//*[contains(text(), '"+text+"')]")).exists());
    }
    
    public void setVerificationCode(String code) {
    	inputVerificationCode.sendKeys(code);
    }
    
    public void buttonCrearCuentaDisabled() {
    	Assert.assertFalse(ButtonCrearCuenta.isEnabled());
    }
    
    public void clickRadioByText(String text) {
    	$(By.xpath("//*[contains(text(), '"+text+"')]")).click();
    }
    
    public void clickAnswersNo() {
    	$(By.xpath("//p[contains(text(), 'financiación del terrorismo.')]/../../div[2]/button[2]")).click();
    	$(By.xpath("//p[contains(text(), 'funciones públicas')]/../../div[2]/button[2]")).click();
    }
    
    public void setSixDigitPassword() {
    	$(By.xpath("//span[contains(text(), '0')]/../..")).click();
    	$(By.xpath("//span[contains(text(), '1')]/../..")).click();
    	$(By.xpath("//span[contains(text(), '0')]/../..")).click();
    	$(By.xpath("//span[contains(text(), '2')]/../..")).click();
    	$(By.xpath("//span[contains(text(), '0')]/../..")).click();
    	$(By.xpath("//span[contains(text(), '3')]/../..")).click();
    }
    
    public void setFourDigitPassword() {
    	$(By.xpath("//span[contains(text(), '0')]/../..")).click();
    	$(By.xpath("//span[contains(text(), '1')]/../..")).click();
    	$(By.xpath("//span[contains(text(), '0')]/../..")).click();
    	$(By.xpath("//span[contains(text(), '2')]/../..")).click();
    }
    
    public void validNameAndInitialName(String name, String initials) {
    	$(By.xpath("//div[contains(@class, 'ConfigurationMenu_avatarContainer__2l8_v')]/div[1]/div[1]/div[1]")).click();
    	Assert.assertEquals(nameMenuScreen.getText(), name);
    	Assert.assertEquals(initialsMenuScreen.getText(), initials);
    }

}