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
    <input type="button" style="margin: 10%;font-size: 20px;" onclick="inviteFriends();" value="Android:inviteFriends"/>
    <div id="show"  style="margin: 10%;font-size: 20px;">    初始文字 </div>
    <input type="button" style="margin: 10%;font-size: 20px;" onclick="register();" value="IOS:register"/>
    <input type="button" style="margin: 10%;font-size: 20px;" onclick="goScreen();" value="Android:goScreen"/>
    <input type="button" style="margin: 10%;font-size: 20px;" onclick="userAgen();" value="Android:getUserAgen"/>
    <input type="button" style="margin: 10%;font-size: 20px;" onclick="getUserAgen2();" value="Android:getUserAgen2"/>
</body>
</html>
<script>
    document.getElementById("show").innerHTML = " window.navigator.getUserAgen()" +  window.navigator.userAgent
    function inviteFriends() {
        window.WebViewJavascriptBridge.callHandler(
            'inviteFriends'
            , {"isShowQRcode":false,
                "isShowSms":false,
                "isShowTimeline":false,
                "isShowSession":true,
                "imgUrl":"http://api.etongdai.com/images/share/share1.png",
                "content":"----易通贷理财，6年老平台，收益稳健，我已经使用好久了，100元起投，赶紧加入吧！",
                "title":"财富结缘，易生相伴",
                "pageUrl":"https://m.etongdai.com/static/register/invitefriend.html?friendId=MjI2MjQ3Ng=="}
            , function (responseData) {
                document.getElementById("show").innerHTML = "send get responseData from java, data = " + responseData
            }
        );
    }
    function goScreen() {
        window.WebViewJavascriptBridge.callHandler('getUserInfo',{},function (responseData) {
            if(responseData.isLogin){
                responseData.userId
                responseData.sessionId
                window.WebViewJavascriptBridge.callHandler("go",{'class':"com.stateunion.p2p.etongdai.fragment.home.account_manage.AccountManageActivity"},function (responseData) {
                    document.getElementById("show").innerHTML = "send get responseData from java, data = " + responseData
                })
            }else{
                window.WebViewJavascriptBridge.callHandler("login",{},function (responseData) {
                    document.getElementById("show").innerHTML = "send get responseData from java, data = " + responseData
                })
            }
        })

    }
    function register() {
        setupWebViewJavascriptBridge(function(bridge) {
            /* Initialize your app here */
            bridge.callHandler('register', {'key':'value'}, function responseCallback(responseData) {
                document.getElementById("show").innerHTML = "send get responseData from java, data = " + responseData
            })
        })
    }
    function setupWebViewJavascriptBridge(callback) {
        if (window.WebViewJavascriptBridge) { return callback(WebViewJavascriptBridge); }
        if (window.WVJBCallbacks) { return window.WVJBCallbacks.push(callback); }
        window.WVJBCallbacks = [callback];
        var WVJBIframe = document.createElement('iframe');
        WVJBIframe.style.display = 'none';
        WVJBIframe.src = 'https://__bridge_loaded__';
        document.documentElement.appendChild(WVJBIframe);
        setTimeout(function() { document.documentElement.removeChild(WVJBIframe) }, 0)
    }
    function userAgen() {
        document.getElementById("show").innerHTML = " window.getUserAgen()" +  window.userAgent

    }
    function getUserAgen2() {
        document.getElementById("show").innerHTML = " window.navigator.getUserAgen()" +  window.navigator.userAgent
    }

</script>
