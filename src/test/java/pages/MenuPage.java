package pages;

import static com.codeborne.selenide.Selenide.$;
import com.codeborne.selenide.SelenideElement;
import java.time.Duration;
import static com.codeborne.selenide.Condition.*;


import org.openqa.selenium.By;


public class MenuPage {

    private SelenideElement btnHome = $(By.name("Inicio"));
    private SelenideElement btnUserMenu = $(By.id("user-navbar"));
    private SelenideElement btnCreateNickName = $(By.xpath("/html/body/div/div/div/div[2]/div[2]/div/div/div/div[1]/div/div[3]/div/div/div[7]/div"));
    private SelenideElement btnEndSession = $(By.xpath("/html/body/div/div/div/div[2]/div[2]/div/div/div/div[1]/div/div[3]/div/div/div[8]/div/div/div[1]/div/div/div"));
    private SelenideElement btnExitSession = $(By.id("btn-dialog-modal-0"));
    private SelenideElement brtnAbortExitSession = $(By.id("btn-dialog-modal-1"));

    public String getNameBtnUserMenu(){
        this.btnUserMenu.shouldBe(visible, Duration.ofSeconds(6));
        return this.btnUserMenu.text();
    } 

    public void menuHome(){
        btnHome.click();
    }
    
    public void menuAccessProfileMenu(){
        btnUserMenu.click();
    }

    public void menuCreateNickName(){
        btnCreateNickName.click();
    }

    public void menuEndSession(){
        btnEndSession.click();
    }

    public void menuExitSession(){
        btnExitSession.click();
    }

    public void menuAbortExitSession(){
        brtnAbortExitSession.click();
    }

}
