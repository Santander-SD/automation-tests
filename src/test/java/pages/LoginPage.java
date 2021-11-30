package pages;

import static com.codeborne.selenide.Selenide.$;
import static com.codeborne.selenide.Selenide.$$;
import java.util.HashMap;
import java.util.Map;
import static com.codeborne.selenide.Condition.*;
import com.codeborne.selenide.SelenideElement;
import com.codeborne.selenide.ElementsCollection;
import static com.codeborne.selenide.Selenide.sleep;


public class LoginPage {

    private SelenideElement selectCountry = $("#login-country-select-label");
    private ElementsCollection selectOptionCoumtry = $$("ul li");
    private SelenideElement labelPageApp = $("div.main-main10 h1");
    private SelenideElement btnCreateNewAccount = $("article > button:nth-child(1)");
    private SelenideElement btnIreadyHaveAnAccount = $("button:nth-child(2)");
    private SelenideElement inputNumberDocumentation = $("#login-idnumber-input");
    private SelenideElement btnIngresar = $("#footer-button-next");
    private SelenideElement btnPassWordZero = $("div:nth-child(4) > button:nth-child(2)  div span");
    private SelenideElement btnPassWordOne = $("div:nth-child(1) > button:nth-child(1)  div span");
    private SelenideElement btnPassWordTwo = $("div:nth-child(1) > button:nth-child(2)  div span");
    private SelenideElement btnPassWordThree = $("div:nth-child(1) > button:nth-child(3)  div span");
    private SelenideElement btnPassWordFour = $("div:nth-child(2) > button:nth-child(1)  div span");
    private SelenideElement btnPassWordFive = $("div:nth-child(2) > button:nth-child(2)  div span");
    private SelenideElement btnPassWordSix = $("div:nth-child(2) > button:nth-child(3)  div span");
    private SelenideElement btnPassWordSeven = $("div:nth-child(3) > button:nth-child(1)  div span");
    private SelenideElement btnPassWordEight = $("div:nth-child(3) > button:nth-child(2)  div span");
    private SelenideElement btnPassWordNine = $("div:nth-child(3) > button:nth-child(3)  div span");
    private SelenideElement visibleKeys = $(" div:nth-child(1) div:nth-child(1)  > input ");
    private SelenideElement labelPassWordSucess = $(".a5ebb719__BalanceCard_cardContent__vg04X >div> p");
    private SelenideElement labelPassWordInvalid = $(" div:nth-child(1)  p.ResultScreen_title__SqB8j");

    private Map<String, SelenideElement> createColectionPassword() {
        /**
         * Private keyboard mapping method type: it works like a dictionary,
         *  (see HashMap documentation), so it will access the element
         *  for iteration through a key
         */
        Map<String, SelenideElement> colectionNumber = new HashMap<String, SelenideElement>();
        colectionNumber.put("0", btnPassWordZero);
        colectionNumber.put("1", btnPassWordOne);
        colectionNumber.put("2", btnPassWordTwo);
        colectionNumber.put("3", btnPassWordThree);
        colectionNumber.put("4", btnPassWordFour);
        colectionNumber.put("5", btnPassWordFive);
        colectionNumber.put("6", btnPassWordSix);
        colectionNumber.put("7", btnPassWordSeven);
        colectionNumber.put("8", btnPassWordEight);
        colectionNumber.put("9", btnPassWordNine);
        return colectionNumber;
    }

    public void accessApplication() {
        labelPageApp.shouldBe(visible);
    }

    public void optionCountry(String country){
        selectCountry.click();  
        selectOptionCoumtry.findBy(text(country)).click();
    }

    public void optionAcess(String optionAcess) {
        /**
         *  Method referring to the mapping of the buttons present on the login screen, its behavior is like a dictionary,
         *  (see HashMap documentation), so it will access the element for iteration through a key
         */
        Map<String, SelenideElement> colectionAcess = new HashMap<String, SelenideElement>();
        colectionAcess.put("create new account", btnCreateNewAccount);
        colectionAcess.put("I ready have an account", btnIreadyHaveAnAccount);
        colectionAcess.get(optionAcess).click();
    }

    public void fillDocumentationNumber(String documentationNumber) {
        inputNumberDocumentation.setValue(documentationNumber);
    }

    public void enter() {
        btnIngresar.click();
    }

    public void enterpassword(String password) {
        /**
         * Method referring to the actual iteration of the virtual keyboard, 
         * will handle the 6-digit password, using each element as keys
         */
        visibleKeys.shouldBe(visible);
        Map<String, SelenideElement> colectionAcess = new HashMap<String, SelenideElement>();
        colectionAcess = createColectionPassword();
        for (int i = 0; i < password.length(); i++) {
            char myChar = password.charAt(i);
            colectionAcess.get(String.valueOf(myChar)).click();
        }
    }

    public String validateLogin(){
        sleep(8000);
        String statusLogin = "";
         if(labelPassWordInvalid.exists()){
            statusLogin  = labelPassWordInvalid.text(); 
          }else if(labelPassWordSucess.exists()){
            statusLogin  = labelPassWordSucess.text();
         }
		return statusLogin;
     }

}
