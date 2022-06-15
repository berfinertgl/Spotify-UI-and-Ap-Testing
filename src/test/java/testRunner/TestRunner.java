package testRunner;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;
import cucumber.api.CucumberOptions;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

@CucumberOptions(
        features = {"src/test/java/examples/users/users.feature"},
        plugin = {
                "summary", "pretty","html:Reports/CucumberReport/Reports.html",
                "json:Reports/CucmberReport/Report",
                "com.evenstack.extentreports.cucumber.adapter.ExtentcucumberAdapter:"
        }
)

public class TestRunner {

    @Karate.Test
    Karate testUsers() {
        return Karate.run("users").relativeTo(getClass());
    }
    @Test
    public void testParallel() {
        Results results = Runner.path("classpath:examples")
                .tags("~@ignore")
                //.outputCucumberJson(true)
                .parallel(5);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}
