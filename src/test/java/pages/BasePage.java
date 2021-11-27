package pages;


import static com.codeborne.selenide.Selenide.$;

import org.openqa.selenium.By;

import static com.codeborne.selenide.Condition.*;
import com.codeborne.selenide.SelenideElement;

public class BasePage {
	
	private SelenideElement imgGoogle = $("img[alt='Google']");
	
	private SelenideElement inputSearch = $("input[title=\"Pesquisar\"]");
	
	private SelenideElement buttonSearch = $(By.xpath("(//input[@type='submit'])[3]"));
	
	private SelenideElement results = $("div#result-stats");
	
	public void accessGoogle() {
		imgGoogle.shouldBe(visible);
	}
	
	public void setSearch(String pesquisa) {
		inputSearch.setValue(pesquisa);
	}
	
	public void pressSearch() {
		buttonSearch.click();
	}
	
	public void waitByResults() {
		results.shouldBe(visible);
	}
}
