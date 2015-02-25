name := "DeckOfCards"

version := "1.0"

libraryDependencies ++= Seq(
  "org.specs2" %% "specs2" % "2.3.6" % "test"
)

scalacOptions in Test ++= Seq("-Yrangepos")

resolvers ++= Seq("snapshots", "releases").map(Resolver.sonatypeRepo)
