package utils;

import static com.codeborne.selenide.Selenide.screenshot;
import org.openqa.selenium.OutputType;
import io.cucumber.java.Scenario;
import java.io.*;

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
                               new FileOutputStream(phathFile),"UTF-8");

		bufferOut.write(contents);
		bufferOut.close();
	}
}
