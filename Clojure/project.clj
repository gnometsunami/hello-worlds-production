(defproject hello_world "0.1.0"
  :description "Hello World"
  :url "https://example.com/HelloWorld"
  :dependencies [[org.clojure/clojure "1.11.0"]]
  :main ^:skip-aot helloworld.core
  :target-path "target/%s"
  :uberjar-name "hello_world.jar"
  :profiles {:uberjar {:aot :all}})
