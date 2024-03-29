# autobot-karate-api
## Test Automation API Made `Simple.`

#### Environment yang diperlukan :
* Intellij IDEA dengan plugin Cucumber for Java & Gherkin
* Dependency maven
```
    
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>autobot-karate-api</groupId>
    <artifactId>autobot-karate-api</artifactId>
    <version>1.0-SNAPSHOT</version>

    <dependencies>
        <dependency>
            <groupId>com.intuit.karate</groupId>
            <artifactId>karate-apache</artifactId>
            <version>0.9.6</version>
            <scope>test</scope>
        </dependency>
        <dependency>
            <groupId>com.intuit.karate</groupId>
            <artifactId>karate-junit4</artifactId>
            <version>0.9.6</version>
            <scope>test</scope>
        </dependency>
        <dependency>
            <groupId>com.intuit.karate</groupId>
            <artifactId>karate-gatling</artifactId>
            <version>0.9.6</version>
        </dependency>
        <dependency>
            <groupId>net.masterthought</groupId>
            <artifactId>cucumber-reporting</artifactId>
            <version>5.2.0</version>
        </dependency>
        <dependency>
            <groupId>com.fasterxml.jackson.core</groupId>
            <artifactId>jackson-databind</artifactId>
            <version>2.10.3</version>
        </dependency>
        <dependency>
            <groupId>com.github.java-json-tools</groupId>
            <artifactId>json-schema-validator</artifactId>
            <version>2.2.12</version>
        </dependency>

    </dependencies>
    <build>
        <testResources>
            <testResource>
                <directory>src/test/java</directory>
                <excludes>
                    <exclude>**/*.java</exclude>
                </excludes>
            </testResource>
        </testResources>
        <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>3.8.1</version>
                <configuration>
                    <source>1.8</source>
                    <target>1.8</target>
                </configuration>
            </plugin>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-surefire-plugin</artifactId>
                <version>2.10</version>
                <configuration>
                    <argLine>-Dfile.encoding=UTF-8</argLine>
                    <systemProperties>
                        <karate.options>--tags ~@ignore</karate.options>
                    </systemProperties>
                </configuration>
            </plugin>
            <plugin>
                <groupId>io.gatling</groupId>
                <artifactId>gatling-maven-plugin</artifactId>
                <version>3.0.5</version>
                <configuration>
                    <simulationsFolder>src/test/java</simulationsFolder>
                    <runMultipleSimulations>true</runMultipleSimulations>
                    <includes>
                        <include>runner.PerformanceTest</include>
                    </includes>
                </configuration>
<!--if want automate running after api test CRUD-->
<!--                <executions>-->
<!--                    <execution>-->
<!--                        <phase>test</phase>-->
<!--                        <goals>-->
<!--                            <goal>test</goal>-->
<!--                        </goals>-->
<!--                    </execution>-->
<!--                </executions>-->
            </plugin>
        </plugins>
    </build>
</project>
```
* JDK 8 atau lebih 
* [Cucumber reporting](https://github.com/damianszczepanik/cucumber-reporting)

##### Setting environment :
* Jalankan terminal/CMD
* Ketik `sudo nano ~/.bash_profile`
* Kemudian di baris pertama, ketikkan sebagai berikut (disesuaikan dengan direktori instalasi):

```
export JAVA_HOME=/usr/lib/jvm/java-8
export PATH=$PATH:/usr/lib/jvm/java-8/bin
```
 
