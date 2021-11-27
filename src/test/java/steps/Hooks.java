package steps;

import static utils.Utils.capturarScreenshot;

import com.codeborne.selenide.Selenide;

import commons.BaseTests;
import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.cucumber.java.Scenario;

public class Hooks {
	BaseTests baseTests = new BaseTests();

	@Before
	public void setUp() {
		baseTests.openPage();
	}

	@After
	public void tearDown(Scenario scenario) throws Exception {
		capturarScreenshot(scenario);
		Selenide.closeWindow();
	}

}
