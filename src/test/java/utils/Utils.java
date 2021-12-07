package utils;

import static com.codeborne.selenide.Condition.text;

import static com.codeborne.selenide.Selenide.$;
import static com.codeborne.selenide.Selenide.screenshot;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.WebDriver;
import io.cucumber.java.Scenario;
import java.io.*;
import com.codeborne.selenide.Conditional;
import com.codeborne.selenide.Selenide;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import io.qameta.allure.Allure;
import java.awt.event.KeyEvent;
import java.awt.AWTException;
import java.awt.Robot;

public class Utils {
	
	private static Robot robot;

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

	public static void validateMessage(String message) {
		$("body").shouldHave(text(message));
	}

    public static void writeRobotString(String s) throws AWTException {
    	robot=new Robot();
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (Character.isUpperCase(c)) {
                robot.keyPress(KeyEvent.VK_SHIFT);
            }
            robot.keyPress(Character.toUpperCase(c));
            robot.keyRelease(Character.toUpperCase(c));

            if (Character.isUpperCase(c)) {
                robot.keyRelease(KeyEvent.VK_SHIFT);
            }
        }
        robot.delay(1);
    }
    
	public static void generatePendingTest(String message) throws Exception {
		Allure.addAttachment("", message);	
		throw new io.cucumber.java.PendingException(message);
	}
	
	public static void setAllureDetailsAboutTest(String message) {
		Allure.addAttachment("", message);
		Allure.description(message);
	}	
	
	public static String generateRadomName() {
		String[] a = { "JRR Tolkien", "Elijah Wood", "John Howe", "Ian McKellen", "Viggo Mortensen", "Ted Nasmith", "Alan Lee", "Christopher Lee" }; 
																									
		List<String> numberList = new ArrayList<String>();
		Random r = new Random();

		int i = r.nextInt(a.length);
		for (int j = 0; j < 50; j++) {
			numberList.add(Integer.toString(j));
		}
		int j = r.nextInt(numberList.size());
		return a[i]+j;
	}
}
