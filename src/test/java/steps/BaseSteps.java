package steps;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import pages.BasePage;

public class BaseSteps extends BasePage {
	@Given("I open google page")
	public void iOpenGooglePage() {
	    accessGoogle();
	}
	
	@When("set search field")
	public void setSearchField() {
	    setSearch("Automation Tests");
	}
	
	@When("click on button search")
	public void clickOnButtonSearch() {
	    pressSearch();
	}
	
	@Then("I see results of search")
	public void iSeeResultsOfSearch() {
	    waitByResults();
	}

}
