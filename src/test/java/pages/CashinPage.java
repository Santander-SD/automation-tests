package pages;

import static com.codeborne.selenide.Condition.visible;
import static com.codeborne.selenide.Selenide.$;
import static org.junit.Assert.assertTrue;

import java.awt.HeadlessException;
import java.awt.Toolkit;
import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.UnsupportedFlavorException;
import java.io.IOException;
import java.util.List;

import org.openqa.selenium.By;

import com.codeborne.selenide.SelenideElement;

public class CashinPage {
	
	private SelenideElement inputSearchDomicilio = $(By.xpath("//input"));
	private SelenideElement firstOption = $(By.xpath("//li[1]/div/div/p[1]"));
	private SelenideElement buttonClose = $("svg[data-testid='icon-cross']");
	private SelenideElement buttonHelp = $("svg[data-testid='icon-help']");
	private SelenideElement buttonCompartilharDNI = $(By.xpath("//div[3]/div[2]/button"));
	private SelenideElement buttonCompartilharCVU = $(By.xpath("//div[3]/div[5]/button"));
	private SelenideElement buttonCopyCVU = $(By.xpath("(.//*[normalize-space(text()) and normalize-space(.)='Compartir mis datos'])[1]/following::*[name()='svg'][1]"));
	private SelenideElement buttonCopyAlias = $(By.xpath("(.//*[normalize-space(text()) and normalize-space(.)='Compartir mis datos'])[1]/following::*[name()='svg'][2]"));


	public void fillinSearchField(String value) {
		inputSearchDomicilio.sendKeys(value);
	}
	
	public void clickOnButtonCopyCVU() {
		buttonCopyCVU.shouldBe(visible).click();
	}
	
	public void clickOnButtonCopyAlias() {
		buttonCopyAlias.shouldBe(visible).click();
	}
	
	public void clickOnButtonCompartilharDNI() {
		buttonCompartilharDNI.shouldBe(visible).click();
	}
	
	public void clickOnbuttonCompartilharCVU() {
		buttonCompartilharCVU.shouldBe(visible).click();
	}
	
	public void selectTheFirstItemFromCityOptions() {
		firstOption.shouldBe(visible).click();
	}
	
	public void clickOnbuttonClose() {
		buttonClose.shouldBe(visible).click();
	}
	
	public void clickOnbuttonHelp() {
		buttonHelp.shouldBe(visible).click();
	}
	
	public void dataTransferValidation(List<String> labels) throws HeadlessException, UnsupportedFlavorException, IOException {
		String data = (String) Toolkit.getDefaultToolkit()
                .getSystemClipboard().getData(DataFlavor.stringFlavor); 
				
		for (int i = 1; i < labels.size(); i++) {
			assertTrue(data.contains(labels.get(1).toString()));
		}
	}
	
}
