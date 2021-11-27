package utils;

import static com.codeborne.selenide.Selenide.screenshot;

import org.openqa.selenium.OutputType;

import io.cucumber.java.Scenario;

public class Utils {

	public static void capturarScreenshot(Scenario scenario) {
		try {
			byte[] tempShot = screenshot(OutputType.BYTES);
			scenario.attach(tempShot, "image/png", scenario.getName());
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
