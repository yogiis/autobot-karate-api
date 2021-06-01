# autobot-karate-api
## Test Automation API Made `Simple.`

# Index

<table>
<tr>
  <th>Start</th>
  <td>
    | <a href="#gettingstarted">Getting Started</a>
  </td>
</tr>
</table>

### Getting Started
Lihat video ini untuk menggunakan karate di [ IntelliJ Community Edition](https://youtu.be/W-af7Cd8cMc).

#### Environment yang diperlukan :
* Intellij IDEA dengan plugin Cucumber for Java & Gherkin
* Dependency maven
```
    <dependency>
       <groupId>com.intuit.karate</groupId>
       <artifactId>karate-apache</artifactId>
       <version>0.9.6.RC1</version>
       <scope>test</scope>
    </dependency>
       <dependency>
       <groupId>com.intuit.karate</groupId>
       <artifactId>karate-junit4</artifactId>
       <version>0.9.6.RC1</version>
       <scope>test</scope>
    </dependency>
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
 
