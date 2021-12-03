package pages;

import static com.codeborne.selenide.Selenide.$;
import static com.codeborne.selenide.Selenide.$$;

import java.io.IOException;
import java.time.Duration;
import java.util.HashMap;
import java.util.Map;
import static com.codeborne.selenide.Condition.*;
import com.codeborne.selenide.SelenideElement;
import com.codeborne.selenide.ElementsCollection;
import static com.codeborne.selenide.Selenide.sleep;

public class LoginPage extends MenuPage {
    private boolean buttonIngressarEnzbled;
    private String checkThePasswordEntered = "";
    private boolean enableButonEye = false;
    private boolean statusRemenberPassWord = false;
    private String statusIForgotMyPassword = "";
    private String statusPasswordToBeBlocked = "";
    private String statusSendEmail = "";
    private String statusLogout = "";

    private SelenideElement labelScreenHomeLogin = $("div h1");
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
    private SelenideElement visibleKeys = $("div:nth-child(1) div:nth-child(1)  > input");
    private SelenideElement labelPassWordSucess = $(".a5ebb719__BalanceCard_cardContent__vg04X >div> p");
    private SelenideElement labelPassWordInvalid = $("div:nth-child(1)  p.ResultScreen_title__SqB8j");
    private SelenideElement btnEyePassWord = $("button[class='MuiButtonBase-root-17 jss3']");
    private SelenideElement btnViewPassWordOne = $("div:nth-child(1) div:nth-child(1) > input");
    private SelenideElement btnViewPassWordTwo = $("div:nth-child(1) div:nth-child(2) > input");
    private SelenideElement btnViewPassWordThree = $("div:nth-child(1) div:nth-child(3) > input");
    private SelenideElement btnViewPassWordFour = $("div:nth-child(1) div:nth-child(4) > input");
    private SelenideElement btnViewPassWordFive = $("div:nth-child(1) div:nth-child(5) > input");
    private SelenideElement btnViewPassWordSix = $("div:nth-child(1) div:nth-child(6) > input");
    private SelenideElement btnRememberPassWord = $("input[type='checkbox']");
    private SelenideElement btnIforgotMyPassword = $("button[variant='text-auto']");
    private SelenideElement labelRemenberPassWord = $("#modal-title");
    private SelenideElement btnScreenAlertsIncorrectData = $("div[data-testid='footerButtonsContainer'] button");
    private SelenideElement btnDeletePasswordEnteredByDigit = $("svg[data-testid='icon-backspace']");
    private SelenideElement btnCreateNewPassWord = $("div[role='presentation'] div button:nth-child(1)");
    private SelenideElement labelSendEmailPassWord = $("div h1");

    private Map<String, SelenideElement> createColectionPassword() {
        /**
         * Private keyboard mapping method type: it works like a dictionary,
         * (see HashMap documentation), so it will access the element
         * for iteration through a key
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

    private Map<Integer, SelenideElement> createColectionPasswordView() {
        Map<Integer, SelenideElement> colectionNumberView = new HashMap<Integer, SelenideElement>();
        colectionNumberView.put(1, btnViewPassWordOne);
        colectionNumberView.put(2, btnViewPassWordTwo);
        colectionNumberView.put(3, btnViewPassWordThree);
        colectionNumberView.put(4, btnViewPassWordFour);
        colectionNumberView.put(5, btnViewPassWordFive);
        colectionNumberView.put(6, btnViewPassWordSix);
        return colectionNumberView;
    }

    private boolean displayEnterButton() {
        return btnIngresar.isEnabled();
    }

    public void setEnableButonEye(boolean enable) {
        this.enableButonEye = enable;
    }

    public boolean getButtonIngressarEnzbled() {
        return this.buttonIngressarEnzbled;
    }

    public String getCheckThePasswordEntered() {
        return this.checkThePasswordEntered;
    }

    public boolean getStatusRemenberPassWord() {
        return this.statusRemenberPassWord;
    }

    public String getStatusIForgotMyPassword() {
        return this.statusIForgotMyPassword;
    }

    public String getStatusPasswordToBeBlocked() {
        return this.statusPasswordToBeBlocked;
    }

    public String getStatusSendEmail() {
        return this.statusSendEmail;
    }

    public String getStatusLogout(){
        return this.statusLogout;
    }

    public void accessApplication() {
        labelPageApp.shouldBe(visible);
    }

    public void optionCountry(String country) {
        selectCountry.click();
        selectOptionCoumtry.findBy(text(country)).click();
    }

    public void optionAcess(String optionAcess) {
        /**
         * Method referring to the mapping of the buttons present on the login screen,
         * its behavior is like a dictionary,
         * (see HashMap documentation), so it will access the element for iteration
         * through a key
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
        if (displayEnterButton()) {
            btnIngresar.click();
            this.buttonIngressarEnzbled = true;
        } else {
            this.buttonIngressarEnzbled = false;
        }
    }

    public void iForgotMyPassword() {
        btnIforgotMyPassword.click();
        this.statusIForgotMyPassword = labelRemenberPassWord.text();
    }

    public void enterpassword(String password) {
        /**
         * Method referring to the actual iteration of the virtual keyboard,
         * will handle the 6-digit password, using each element as keys
         */
        visibleKeys.shouldBe(visible);
        Map<String, SelenideElement> colectionAcess = new HashMap<String, SelenideElement>();
        Map<Integer, SelenideElement> colectionView = new HashMap<Integer, SelenideElement>();

        colectionView = createColectionPasswordView();
        colectionAcess = createColectionPassword();
        for (int i = 0; i < password.length(); i++) {
            int activate = i + 1;
            char myChar = password.charAt(i);
            colectionAcess.get(String.valueOf(myChar)).click();
            if (enableButonEye) {
                viewPassword(activate);
                this.checkThePasswordEntered += colectionView.get(i + 1).getValue();
            }
        }
    }

    public void enterPasswordToBeBlocked(String password, int passwordAttempts) {
        for (int i = 0; i < passwordAttempts; i++) {
            enterpassword(password);
            verificao();
            if (i < 2) {
                btnScreenAlertsIncorrectData.click();
                for (int j = 0; j < password.length(); j++) {
                    btnDeletePasswordEnteredByDigit.click();
                }
            }
        }
        // this.statusPasswordToBeBlocked = labelPassWordInvalid.isDisplayed() == false
        // ? "true" : "false";
    }

    public void createNewPassoword() {
        sleep(2000);
        btnCreateNewPassWord.exists();
        btnCreateNewPassWord.shouldBe(visible);
        btnCreateNewPassWord.click();

        boolean status = false;
        while (!status) {
            sleep(2000);
            if (labelSendEmailPassWord.exists()) {
                status = true;
            } else {
                status = false;
            }
        }
        this.statusSendEmail = labelSendEmailPassWord.getText();
    }

    private void viewPassword(int activate) {
        if (activate == 1) {
            btnEyePassWord.click();
        }
    }

    private void verificao() {
        boolean status = false;
        while (!status) {
            sleep(2000);
            if (labelPassWordInvalid.exists()) {
                status = true;
            } else if (labelPassWordSucess.exists()) {
                status = true;
            } else {
                status = false;
            }
        }
    }

    public String validateLogin() {
        verificao();
        String statusLogin = "";
        if (labelPassWordInvalid.exists()) {
            statusLogin = labelPassWordInvalid.text();
        } else if (labelPassWordSucess.exists()) {
            statusLogin = labelPassWordSucess.text();
        }
        return statusLogin;
    }

    public void rebemberPassWord() {
        btnRememberPassWord.click();
        this.statusRemenberPassWord = true;
    }

    public void logoutApplication(String confirm) throws IOException{
        menuAccessProfileMenu();
        menuEndSession();
        if(confirm.equals("true")){    
            menuExitSession();
            labelScreenHomeLogin.shouldBe(visible, Duration.ofMillis(6000));
            this.statusLogout = labelScreenHomeLogin.text();
        }else{
            menuAbortExitSession();
            this.statusLogout = getNameBtnUserMenu();
        }
     }

}
