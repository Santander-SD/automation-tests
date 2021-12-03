package pages;

import static com.codeborne.selenide.Selenide.$;
import static com.codeborne.selenide.Condition.*;
import com.codeborne.selenide.SelenideElement;
import com.codeborne.selenide.selector.ByAttribute;



public class CustomizationPage extends MenuPage {

    private String statusConfirmationCreationNickName = "";

    private SelenideElement inputNickName = $("input[data-testid]");
    private SelenideElement btnCeateNickName = $("button[data-testid='submitButton']");
    private SelenideElement labelAlertCreationNickname =$(ByAttribute.xpath("/html/body/div/div/div/div[2]/div[2]/div/div/div/div[2]/div/div[2]/div/div[2]/div/div/div/h1"));


    public String getStatusConfirmationCreationNickName(){
        return this.statusConfirmationCreationNickName;
    }

    public void createNickName(String nickName){
       menuAccessProfileMenu();
       menuCreateNickName();
       inputNickName.setValue(nickName);
       btnCeateNickName.click();
       labelAlertCreationNickname.shouldBe(visible);
       this.statusConfirmationCreationNickName =  labelAlertCreationNickname.text();
    }
    
}
