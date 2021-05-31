package runner;

import io.gatling.core.scenario.Simulation;
import scala.language.postfixOps
import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import helper.PerformanceConstants

import scala.concurrent.duration._

class PerformanceTest extends Simulation {

  //  mvn clean test-compile gatling:test -Dkarate.env=env_staging -Dgatling.simulationClass=runner.PerformanceTest

  val  createOrder = scenario("Load 3000 user active").exec(karateFeature("classpath:01_CRUD/02_CRUD.feature", "~@ignore") )


  setUp(
    createOrder.inject(
      rampConcurrentUsers(PerformanceConstants.numOfUsersStart) to(PerformanceConstants.numOfUsersEnd) during (PerformanceConstants.duration seconds),
      constantConcurrentUsers(PerformanceConstants.numOfUsersEnd) during (PerformanceConstants.duration seconds),
      rampConcurrentUsers(PerformanceConstants.numOfUsersStart) to(PerformanceConstants.numOfUsersEnd) during (PerformanceConstants.duration seconds)
    )

  )

}
