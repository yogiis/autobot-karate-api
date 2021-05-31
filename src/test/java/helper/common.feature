@ignore
Feature: Common function in scenario

  Scenario:
    * def uuid =
         """
           function() {
             return java.util.UUID.randomUUID() + '';
           }
         """

    * def random_alphanumeric =
             """
             function(s) {
               var text = "";
               var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789";
               for (var i = 0; i < s; i++)
                 text += possible.charAt(Math.floor(Math.random() * possible.length));
               return text;
             }
             """

    * def date_time_now =
        """
          function() {
            var DateFormat = Java.type('java.text.SimpleDateFormat');
            var sdf = new DateFormat('yyyy-MM-dd HH:mm:ss');
            var date = new java.util.Date();
            return sdf.format(date);
          }
        """

    * def local_date =
        """
          function() {
            var DateFormat = Java.type('java.text.SimpleDateFormat');
            var sdf = new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ");
            var date = new java.util.Date();
            return sdf.format(date);
          }
        """

    * def random_phonenumber =
        """
            function() {
                var frontnumber = "6281500000";
                var lastThreedigits = Math.floor(Math.random()*999);
                return frontnumber + lastThreedigits + '';
            }
        """

    * def generate_subdomain =
        """
            function() {
                var text = 'apitesting';
                var number = Math.floor(Math.random()*9999);
                return text+number;
            }
         """

    * def random_number =
        """
            function(s) {
                var number = "";
                var possible = "123456789";
                for (var i = 0; i < s; i++)
                  number += Math.floor(Math.random()*possible.length);
                return number + '';
            }
        """

    * def random_alphabet =
             """
             function(s) {
               var text = "";
               var possible = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz";
               for (var i = 0; i < s; i++)
                 text += possible.charAt(Math.floor(Math.random() * possible.length));
               return text;
             }
             """
