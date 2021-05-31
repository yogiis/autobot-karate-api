package runner;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import static org.junit.Assert.assertEquals;

@KarateOptions(
        features = {
                "classpath:00_Auth/00_login.feature",
                "classpath:01_CRUD/02_CRUD.feature"
        },
        tags = {"@test","~@ignore"}
)
public class SuiteTest {
    //ATTENTION
    //the special tag
    //@parallel=false can be used.
    //If you place it above the Feature keyword, it will apply to all Scenario-s.
    //And if you just want one or two Scenario-s to NOT run in parallel, you can place this tag above only those Scenario
    //running in maven : mvn test -Dkarate.env=env_staging -Dtest=SuiteTest

    @Test
    public void SuiteTest() {
        Results results = Runner.parallel(getClass(),1);
        generateReport(results.getReportDir());
        assertEquals(results.getErrorMessages(), 0, results.getFailCount());
    }

    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList<String>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target/cucumber-report"), "karate");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}
