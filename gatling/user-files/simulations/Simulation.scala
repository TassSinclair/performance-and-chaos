package my.gatling.simulation

import io.gatling.core.Predef._
import io.gatling.http.Predef._
import scala.concurrent.duration._

class GatlingSimulation extends Simulation {

  val httpConf = http
    .baseURL(System.getProperty("host"))
    .acceptHeader("text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8")
    .doNotTrackHeader("1")
    .acceptLanguageHeader("en-US,en;q=0.5")
    .acceptEncodingHeader("gzip, deflate")
    .userAgentHeader("Mozilla/5.0 (Windows NT 5.1; rv:31.0) Gecko/20100101 Firefox/31.0")

  val scn1 = scenario("Scenario1")
    .exec(Crawl.crawl)

  val userCount = Integer.getInteger("users", 1)
  val durationInSeconds  = java.lang.Long.getLong("duration", 10L)
  setUp(
    scn1.inject(rampUsers(userCount) over (durationInSeconds seconds))
  ).protocols(httpConf)
}

object Crawl {

  val feeder = csv("/opt/gatling/user-files/urls.csv").random
  val crawl = exec(feed(feeder)
    .exec(http("${path}")
    .get("${path}")
    ))
}
