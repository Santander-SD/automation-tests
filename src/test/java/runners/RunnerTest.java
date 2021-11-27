package runners;

import org.junit.AfterClass;
import org.junit.runner.RunWith;

import com.codeborne.selenide.Selenide;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import io.cucumber.junit.CucumberOptions.SnippetType;


@RunWith(Cucumber.class)
@CucumberOptions(plugin = {"pretty",
        "io.qameta.allure.cucumber6jvm.AllureCucumber6Jvm"},
        features = "classpath:features/",
        publish = true,
        //tags = {""},
        monochrome = true,
        glue = { "steps" },
        snippets = SnippetType.CAMELCASE,
        dryRun = false
       )

public class RunnerTest {


    @AfterClass
    public static void tearDown() {
    	Selenide.closeWebDriver();
    }

}
