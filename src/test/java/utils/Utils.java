package utils;

import static com.codeborne.selenide.Selenide.screenshot;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.WebDriver;
import io.cucumber.java.Scenario;
import java.io.*;
import com.codeborne.selenide.Conditional;
import com.codeborne.selenide.Selenide;
import java.util.ArrayList;

public class Utils {

	public static void capturarScreenshot(Scenario scenario) {
		try {
			byte[] tempShot = screenshot(OutputType.BYTES);
			scenario.attach(tempShot, "image/png", scenario.getName());
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public static void filecreation(String phathFile, String contents) throws IOException {

		OutputStreamWriter bufferOut = new OutputStreamWriter(
				new FileOutputStream(phathFile), "UTF-8");

		bufferOut.write(contents);
		bufferOut.close();
	}

	public static void addEnvironmentAllure(ArrayList<String> infomationAplication, Conditional<WebDriver> driver)
			throws IOException {
		driver = Selenide.webdriver();
		String nameBrowser = driver.driver().browser().name;
		String versionBrowser = driver.driver().getUserAgent();
		String[] versionHandling = versionBrowser.split(" ");
		for (String version : versionHandling) {
			if (version.charAt(0) == nameBrowser.toUpperCase().charAt(0)) {
				versionBrowser = version;
			}
		}

		versionHandling = versionBrowser.split("/");
		versionBrowser = versionHandling[1];

		try {

			File env = new File("allure-results/environment.properties");
			BufferedWriter as = new BufferedWriter(new FileWriter(env));
			as.write("BROWSER = " + nameBrowser.toUpperCase() + " - Version: " + versionBrowser);
			as.newLine();
			as.write("APLICATION = " + infomationAplication.get(0).toUpperCase() + " VERSION: "
					+ infomationAplication.get(1));
			as.newLine();
			as.write("ENVIRONMENT = " + infomationAplication.get(2).toUpperCase());
			as.newLine();
			as.write("OPERATIONAL SYSTEM = " +
					System.getProperty("os.name").toUpperCase());
			as.newLine();
			as.write(("USER RESPONSIBLE FOR THE EXECUTION: = " + System.getProperty("user.name").toUpperCase()));
			as.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
