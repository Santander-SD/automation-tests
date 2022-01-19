package steps;

import static com.codeborne.selenide.Selenide.sleep;
import static utils.Utils.validateMessage;

import java.util.List;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import pages.InternalTransferPage;

public class InternalTransferStep {

    InternalTransferPage it = new InternalTransferPage();
    
    @Given("Select name of favorite")
    public void selectNameOfFavorite() {
    	it.selectFavorite();
    }    

    @Then("should display on screen the message {string}")
    public void shouldDisplayOnScreenTheMessage(String string) {

    }
    
    @Then("should display on screen the messages:")
    public void shouldDisplayOnScreenTheMessages(List<String> labels) {

    }    
    
	@When("I confirm operation on my mobile app")
	public void iConfirmOperationOnTheMobileApp() throws Exception {
		sleep(1000);
		validateMessage("Confirma esta operación desde tu celular");
	}   
	
    @When("fill in the field with {string}")
    public void fill_in_the_field_with(String string) {
    	 it.fillInField(string);
    }    
    
    @Then("the phone field does not allow entering the value")
    public void thePhoneFieldDoesNotAllowEnteringTheValue() {
    	it.validateOnlyNumberPhoneField();
    }    
	
    @When("fill in the transfer value field document with {string}")
    public void fill_in_the_transfer_value_field_with(String string) {
        it.fillValueDocument(string);
    }	

	@Then("should display the message {string}")
	public void shouldDisplayTheMessage(String message) {
		validateMessage(message);
	}

}
