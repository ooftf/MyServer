<%--
  Created by IntelliJ IDEA.
  User: mengqingchao
  Date: 2017/8/15 0015
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <input type="button" onclick="inviteFriends();" value="inviteFriends"/>
  <span id="show"> </span>
  </body>
</html>
<script>
  function inviteFriends() {
      window.WebViewJavascriptBridge.callHandler(
          'inviteFriends'
          , {'param': ""}
          , function(responseData) {
              document.getElementById("show").innerHTML = "send get responseData from java, data = " + responseData
          }
      );
  }
</script>
