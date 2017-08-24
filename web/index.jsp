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
    <input type="button" style="margin: 10%;font-size: 20px;" onclick="share();" value="Android:share"/>
    <div id="show"  style="margin: 10%;font-size: 20px;">    初始文字 </div>
    <input type="button" style="margin: 10%;font-size: 20px;" onclick="register();" value="IOS:register"/>
    <input type="button" style="margin: 10%;font-size: 20px;" onclick="goScreen();" value="Android:goScreen"/>
    <input type="button" style="margin: 10%;font-size: 20px;" onclick="getUserAgen2();" value="Android:getUserAgen2"/>
    <input type="button" style="margin: 10%;font-size: 20px;" onclick="home();" value="Android:home"/>
    <input type="button" style="margin: 10%;font-size: 20px;" onclick="projectList();" value="Android:projectList"/>
    <input type="button" style="margin: 10%;font-size: 20px;" onclick="funds();" value="Android:funds"/>
    <input type="button" style="margin: 10%;font-size: 20px;" onclick="coupons();" value="Android:coupons"/>
    <input type="button" style="margin: 10%;font-size: 20px;" onclick="recharge();" value="Android:recharge"/>
    <input type="button" style="margin: 10%;font-size: 20px;" onclick="account();" value="Android:account"/>
    <input type="button" style="margin: 10%;font-size: 20px;" onclick="getUser();" value="Android:getUser"/>
    <input type="button" style="margin: 10%;font-size: 20px;" onclick="login();" value="Android:login"/>
    <input type="button" style="margin: 10%;font-size: 20px;" onclick="goto();" value="Android:goto"/>
</body>
</html>
<script>
    document.getElementById("show").innerHTML = " window.navigator.getUserAgen()" +  window.navigator.userAgent
    function share() {
        window.WebViewJavascriptBridge.callHandler(
            'inviteFriends'
            , {"isShowName":false,
                "isShowQRcode":false,
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
    function home() {
        window.WebViewJavascriptBridge.callHandler('home', {'key':'value'}, function responseCallback(responseData) {
            document.getElementById("show").innerHTML = "send get responseData from java, data = " + responseData
        })
    }
    function projectList() {
        window.WebViewJavascriptBridge.callHandler('projectList', {'key':'value'}, function responseCallback(responseData) {
            document.getElementById("show").innerHTML = "send get responseData from java, data = " + responseData
        })
    }
    function funds() {
        window.WebViewJavascriptBridge.callHandler('funds', {'key':'value'}, function responseCallback(responseData) {
            document.getElementById("show").innerHTML = "send get responseData from java, data = " + responseData
        })
    }
    function coupons() {
        window.WebViewJavascriptBridge.callHandler('coupons', {'key':'value'}, function responseCallback(responseData) {
            document.getElementById("show").innerHTML = "send get responseData from java, data = " + responseData
        })
    }
    function recharge() {
        window.WebViewJavascriptBridge.callHandler('recharge', {'key':'value'}, function responseCallback(responseData) {
            document.getElementById("show").innerHTML = "send get responseData from java, data = " + responseData
        })
    }
    function account() {
        window.WebViewJavascriptBridge.callHandler('account', {'key':'value'}, function responseCallback(responseData) {
            document.getElementById("show").innerHTML = "send get responseData from java, data = " + responseData
        })
    }
    function getUser() {
        window.WebViewJavascriptBridge.callHandler('getUser', {'key':'value'}, function responseCallback(responseData) {
            document.getElementById("show").innerHTML = "send get responseData from java, data = " + responseData
        })
    }
    function login() {
        window.WebViewJavascriptBridge.callHandler('login', {'key':'value'}, function responseCallback(responseData) {
            document.getElementById("show").innerHTML = "send get responseData from java, data = " + responseData
        })
    }
   function goto() {
        window.WebViewJavascriptBridge.callHandler('goto',
            {"className":"com.stateunion.p2p.etongdai.activity.invest.invest.InvestDetailsActivity",
                "isCloseWebView":false,
                "params":[{"key":"CreditorRightsVo","className":"com.stateunion.p2p.etongdai.data.vo.PptItemExtendMdlVo","jsonClass":"{\"pptClaimExtendMdl\":null,\"pptItemExtendMdl\":{\"pptItemPkMdl\":null,\"iteBidDate\":15,\"iteBidDeadline\":1504849599000,\"iteBidMin\":10000,\"iteBidMinName\":null,\"iteBidMinFdName\":null,\"iteBidMinYuan\":100,\"iteBidSum\":null,\"iteBidSumName\":null,\"iteBidSumFdName\":null,\"iteBidSumYuan\":null,\"iteBorrowerUseId\":202323,\"iteBorrowerUseIdName\":\"邓云杉\",\"iteBorrowAmount\":100000,\"iteBorrowAmountYuan\":1000,\"iteCollateralValue\":null,\"iteCollateralValueYuan\":null,\"iteCpType\":\"2\",\"iteCpTypeName\":\"平台操作员\",\"iteCpTypeFdName\":\"平台操作员\",\"iteCreatePerson\":0,\"iteCreatePersonName\":\"系统管理员\",\"iteCreateTime\":1503553416000,\"iteDirectionalDate\":1,\"iteDirectionalDeadline\":null,\"iteDirectionalGroup\":null,\"iteDirectionalGroupName\":null,\"iteDirectionalLevel\":1,\"iteDirectionalLevelName\":\"B\",\"iteDirectionalType\":\"1\",\"iteDirectionalTypeName\":\"不定向\",\"iteDirectionalTypeFdName\":\"不定向\",\"iteDisplayLevel\":1,\"iteDisplayLevelName\":\"B\",\"iteDoneServiceFee\":0,\"iteDoneServiceFeeYuan\":0,\"iteFullTime\":null,\"iteId\":6378,\"iteIdName\":null,\"iteInvestMoneyDl\":null,\"iteInvestMoneyDlYuan\":null,\"iteInvestMoneyUl\":null,\"iteInvestMoneyUlYuan\":null,\"iteInvestRewardDelay\":null,\"iteInvestRewardLimit\":0,\"iteLateCharge\":0.0005,\"iteLimit\":100000,\"iteLimitYuan\":1000,\"iteLoanLossReserves\":0,\"iteLoanLossReservesYuan\":0,\"iteModifyPerson\":787,\"iteModifyPersonName\":\"qcl\",\"iteModifyTime\":1503553599000,\"iteMpType\":\"2\",\"iteMpTypeName\":\"平台操作员\",\"iteMpTypeFdName\":\"平台操作员\",\"iteNo\":\"20170824134336000002\",\"iteNoName\":null,\"iteOrder\":99,\"iteOverdueDays\":7,\"iteOweSum\":null,\"iteOweSumYuan\":null,\"iteProgress\":0,\"itePublishType\":\"1\",\"itePublishTypeName\":\"直接发布\",\"itePublishTypeFdName\":\"直接发布\",\"iteReason\":\"1\",\"iteReasonName\":\"短期周转\",\"iteReasonFdName\":\"短期周转\",\"iteRelateItem\":null,\"iteRelateItemName\":null,\"iteRepayedSum\":null,\"iteRepayedSumYuan\":null,\"iteRepaymentSchedule\":null,\"iteRepayDate\":1,\"iteRepayDeadline\":null,\"iteRepayInterval\":\"1\",\"iteRepayIntervalName\":\"个月\",\"iteRepayIntervalFdName\":\"个月\",\"iteRepaySum\":100917,\"iteRepaySumYuan\":1009.17,\"iteRepayType\":\"2\",\"iteRepayTypeName\":\"按月还息到期还本\",\"iteRepayTypeFdName\":\"按月还息到期还本\",\"iteRiskMargin\":0,\"iteRiskMarginYuan\":0,\"iteSafeguardType\":\"1\",\"iteSafeguardTypeName\":\"无担保\",\"iteSafeguardTypeFdName\":\"无担保\",\"iteSource\":\"2\",\"iteSourceName\":\"平台\",\"iteSourceFdName\":\"平台\",\"iteState\":\"5-3\",\"iteStateName\":\"发标二级复审通过-已发标\",\"iteStateFdName\":\"发标二级复审通过-已发标\",\"iteTitle\":\"test01\",\"iteType\":\"1\",\"iteTypeName\":\"信用贷\",\"iteTypeFdName\":\"信用贷\",\"iteYearRate\":0.11,\"itgId\":243,\"itgIdName\":\"1\",\"pointsRewardType\":0,\"pointsValue\":0,\"investNum\":0,\"itgId2\":null,\"itemSafeguardList\":[{\"pptItemSafeguardPkMdl\":null,\"iteId\":6378,\"iteIdName\":\"test01\",\"itsType\":\"1\",\"itsTypeName\":\"征信认证\",\"itsTypeFdName\":\"征信认证\"},{\"pptItemSafeguardPkMdl\":null,\"iteId\":6378,\"iteIdName\":\"test01\",\"itsType\":\"2\",\"itsTypeName\":\"第三方担保\",\"itsTypeFdName\":\"第三方担保\"}],\"itemDescList\":[{\"pptItemDescPkMdl\":null,\"itdContent\":\"<p class=\\\"MsoNormal\\\" style=\\\"font-size:14px;font-family:微软雅黑, Arial, Lucida, Verdana, Helv etica, sans-serif;white-space:normal;margin-top:0px;color:#666666;padding-bottom:0px;padding-top:0px;padding-left:24px;padding-right:0px;background-color:#ffffff;\\\">\\r\\n\\t<span style=\\\"font-family:'font-size:14px;\\\">一、借款基本情况</span> \\r\\n</p>\\r\\n<p class=\\\"MsoNormal\\\" style=\\\"font-size:14px;font-family:微软雅黑, Arial, Lucida, Verdana, Helvetica, sans-serif;white-space:normal;margin-top:0px;color:#666666;padding-bottom:0px;padding-top:0px;padding-left:24px;padding-right:0px;background-color:#ffffff;\\\">\\r\\n\\t<span style=\\\"font-family:'font-size:14px;\\\">1.</span><span style=\\\"font-family:'font-size:14px;\\\">借款用途</span> \\r\\n</p>\\r\\n<p class=\\\"MsoNormal\\\" style=\\\"font-size:14px;font-family:微软雅黑, Arial, Lucida, Verdana, Helvetica, sans-serif;white-space:normal;margin-top:0px;color:#666666;padding-bottom:0px;padding-top:0px;padding-left:24px;padding-right:0px;background-color:#ffffff;\\\">\\r\\n\\t<span style=\\\"font-family:'font-size:14px;\\\">借款人为中小企业主，从事商贸行业多年，能够准确的把握该行业的发展动态。借款人为扩大企业经营范围，需要一笔短期资金。本次所借资金主要用于其扩大市场。</span> \\r\\n</p>\\r\\n<p class=\\\"MsoNormal\\\" style=\\\"font-size:14px;font-family:微软雅黑, Arial, Lucida, Verdana, Helvetica, sans-serif;white-space:normal;margin-top:0px;color:#666666;padding-bottom:0px;padding-top:0px;padding-left:24px;padding-right:0px;background-color:#ffffff;\\\">\\r\\n\\t<span style=\\\"font-family:'font-size:14px;\\\">2.</span><span style=\\\"font-family:'font-size:14px;\\\">还款来源</span> \\r\\n</p>\\r\\n<p class=\\\"MsoNormal\\\" style=\\\"font-size:14px;font-family:微软雅黑, Arial, Lucida, Verdana, Helvetica, sans-serif;white-space:normal;margin-top:0px;color:#666666;padding-bottom:0px;padding-top:0px;padding-left:24px;padding-right:0px;background-color:#ffffff;\\\">\\r\\n\\t<span style=\\\"font-family:'font-size:14px;\\\">借款人的还款来源为其企业经营收入。该企业自成立以来，管理科学，经营稳健，且有稳定的经营渠道，企业发展前景良好。该企业无不良征信，无未结清不良贷款，未出现对外担保情况，还款有保</span> \\r\\n</p>\",\"itdId\":6206,\"itdInvestorLevel\":1,\"itdInvestorLevelName\":\"B\",\"iteId\":6378,\"iteIdName\":\"test01\"}],\"pptCollateralExtendMdls\":null,\"itemApprovalList\":null,\"borrowerLoginName\":null,\"borrowerName\":null,\"borrowerPlanSum\":0,\"borrowerPlanSumYuan\":0,\"borrowerRepaySum\":0,\"borrowerRepaySumYuan\":0,\"investorLoginName\":null,\"investorName\":null,\"investorRepaySum\":0,\"investorRepaySumYuan\":0,\"investorSum\":0,\"investorSumYuan\":0,\"surplusTotalNo\":0,\"surplusPrincipal\":null,\"interestStartTime\":null,\"iteExpYearRate\":0,\"discountRate\":0,\"claInitSum\":0,\"rescPlanDate\":null,\"rescPlanSum\":0,\"rescPlanSumYuan\":0,\"rescPlanPrincipal\":0,\"rescPlanPrincipalYuan\":0,\"rescPlanInterest\":0,\"rescPlanInterestYuan\":0,\"recRepaySum\":0,\"recRepaySumYuan\":0,\"rescRepayTime\":null,\"rescState\":null,\"rescStateName\":null,\"rescTotalNo\":0,\"rescNo\":0,\"rescId\":null,\"rsbId\":null,\"rescShouldLateCharge\":0,\"rescRePayType\":null,\"autoRepayState\":null,\"remark\":null,\"useName\":null,\"praValidSum\":0,\"praValidSumYuan\":0,\"endBalanceYuan\":0,\"shouldPayYuan\":0,\"rescIds\":null,\"claTransId\":null,\"sumRepay\":0,\"repayedNum\":0,\"rescType\":null,\"startRepayTime\":null,\"endRepayTime\":null,\"rownum\":null,\"iteYearRateString\":null,\"iteBorrowAmountYuanString\":null,\"iteLimitYuanString\":null,\"iteProgressString\":null,\"iteRepayIntervalString\":null,\"borrowLevelName\":\"B\",\"myTotalInvSum\":null,\"myTotalInvSumYuan\":null,\"startTime\":null,\"endTime\":null,\"startMoth\":null,\"endMoth\":null,\"captcha\":null,\"taskId\":null,\"taskName\":null,\"processInstanceId\":null,\"activitiId\":null,\"repaySum\":null,\"fufPraNowSum\":null,\"fufPraNowSumYuan\":null,\"claTransClaimSum\":null,\"claTransClaimSumYuan\":null,\"itemCost\":null,\"itemCostYuan\":null,\"claTransSum\":null,\"claTransSumYuan\":null,\"claHoldState\":null,\"iteYearRateDown\":null,\"iteYearRateUp\":null,\"orderArgs\":null,\"publishDate\":1503553599000,\"recallOrNot\":null,\"toiImgUrl\":null,\"claId\":null,\"repayedSumYuan\":null,\"repayedPrincipalYuan\":null,\"repayedInterestYuan\":null,\"unrepayedPrincipalYuan\":null,\"unrepayedInterestYuan\":null,\"reiSort\":null,\"rewardLimit\":null,\"rewardLimitYuan\":null,\"applyTime\":null,\"rescShouldLateChargeYuan\":null,\"rescOverdueDays\":null,\"investor\":null,\"ascDesc\":null,\"useLoginName\":\"d***3\",\"userId\":null,\"ifClaim\":1,\"type\":null,\"itdContent\":null,\"itemBreach\":null,\"itoOperate\":null,\"pointsRewardTypeName\":null},\"ticCount\":0,\"payAmt\":0,\"ticValue\":0,\"ticId\":0,\"expectedNetIncome\":0,\"showBorrowerFlag\":1,\"borrowerName\":\"邓***\",\"borrowerMobilePhones\":\"15*******11\",\"borrowerAge\":\"25\",\"borrowerSex\":\"男\",\"borrowerHousehold\":\"山西省大同市\",\"borrowerIdentityNum\":\"140************05X\",\"repaymentScheduleList\":null,\"riskUrl\":\"http://test2.etongdai.com/p2p/help/risk/20170407/9642.html\"}"},
                    {"key":"InvestmentDetailVo","className":"com.stateunion.p2p.etongdai.data.vo.InvestmentDetailVo","jsonClass":"{\"pptItemPkMdl\":null,\"iteBidDate\":15,\"iteBidDeadline\":1504849599000,\"iteBidMin\":10000,\"iteBidMinName\":null,\"iteBidMinFdName\":null,\"iteBidMinYuan\":100,\"iteBidSum\":null,\"iteBidSumName\":null,\"iteBidSumFdName\":null,\"iteBidSumYuan\":null,\"iteBorrowerUseId\":202323,\"iteBorrowerUseIdName\":\"邓云杉\",\"iteBorrowAmount\":100000,\"iteBorrowAmountYuan\":1000,\"iteCollateralValue\":null,\"iteCollateralValueYuan\":null,\"iteCpType\":\"2\",\"iteCpTypeName\":\"平台操作员\",\"iteCpTypeFdName\":\"平台操作员\",\"iteCreatePerson\":0,\"iteCreatePersonName\":\"系统管理员\",\"iteCreateTime\":1503553416000,\"iteDirectionalDate\":1,\"iteDirectionalDeadline\":null,\"iteDirectionalGroup\":null,\"iteDirectionalGroupName\":null,\"iteDirectionalLevel\":1,\"iteDirectionalLevelName\":\"B\",\"iteDirectionalType\":\"1\",\"iteDirectionalTypeName\":\"不定向\",\"iteDirectionalTypeFdName\":\"不定向\",\"iteDisplayLevel\":1,\"iteDisplayLevelName\":\"B\",\"iteDoneServiceFee\":0,\"iteDoneServiceFeeYuan\":0,\"iteFullTime\":null,\"iteId\":6378,\"iteIdName\":null,\"iteInvestMoneyDl\":null,\"iteInvestMoneyDlYuan\":null,\"iteInvestMoneyUl\":null,\"iteInvestMoneyUlYuan\":null,\"iteInvestRewardDelay\":null,\"iteInvestRewardLimit\":0,\"iteLateCharge\":0.0005,\"iteLimit\":100000,\"iteLimitYuan\":1000,\"iteLoanLossReserves\":0,\"iteLoanLossReservesYuan\":0,\"iteModifyPerson\":787,\"iteModifyPersonName\":\"qcl\",\"iteModifyTime\":1503553599000,\"iteMpType\":\"2\",\"iteMpTypeName\":\"平台操作员\",\"iteMpTypeFdName\":\"平台操作员\",\"iteNo\":\"20170824134336000002\",\"iteNoName\":null,\"iteOrder\":99,\"iteOverdueDays\":7,\"iteOweSum\":null,\"iteOweSumYuan\":null,\"iteProgress\":0,\"itePublishType\":\"1\",\"itePublishTypeName\":\"直接发布\",\"itePublishTypeFdName\":\"直接发布\",\"iteReason\":\"1\",\"iteReasonName\":\"短期周转\",\"iteReasonFdName\":\"短期周转\",\"iteRelateItem\":null,\"iteRelateItemName\":null,\"iteRepayedSum\":null,\"iteRepayedSumYuan\":null,\"iteRepaymentSchedule\":null,\"iteRepayDate\":1,\"iteRepayDeadline\":null,\"iteRepayInterval\":\"1\",\"iteRepayIntervalName\":\"个月\",\"iteRepayIntervalFdName\":\"个月\",\"iteRepaySum\":100917,\"iteRepaySumYuan\":1009.17,\"iteRepayType\":\"2\",\"iteRepayTypeName\":\"按月还息到期还本\",\"iteRepayTypeFdName\":\"按月还息到期还本\",\"iteRiskMargin\":0,\"iteRiskMarginYuan\":0,\"iteSafeguardType\":\"1\",\"iteSafeguardTypeName\":\"无担保\",\"iteSafeguardTypeFdName\":\"无担保\",\"iteSource\":\"2\",\"iteSourceName\":\"平台\",\"iteSourceFdName\":\"平台\",\"iteState\":\"5-3\",\"iteStateName\":\"发标二级复审通过-已发标\",\"iteStateFdName\":\"发标二级复审通过-已发标\",\"iteTitle\":\"test01\",\"iteType\":\"1\",\"iteTypeName\":\"信用贷\",\"iteTypeFdName\":\"信用贷\",\"iteYearRate\":0.11,\"itgId\":243,\"itgIdName\":\"1\",\"pointsRewardType\":0,\"pointsValue\":0,\"investNum\":0,\"itgId2\":null,\"itemSafeguardList\":[{\"pptItemSafeguardPkMdl\":null,\"iteId\":6378,\"iteIdName\":\"test01\",\"itsType\":\"1\",\"itsTypeName\":\"征信认证\",\"itsTypeFdName\":\"征信认证\"},{\"pptItemSafeguardPkMdl\":null,\"iteId\":6378,\"iteIdName\":\"test01\",\"itsType\":\"2\",\"itsTypeName\":\"第三方担保\",\"itsTypeFdName\":\"第三方担保\"}],\"itemDescList\":[{\"pptItemDescPkMdl\":null,\"itdContent\":\"<p class=\\\"MsoNormal\\\" style=\\\"font-size:14px;font-family:微软雅黑, Arial, Lucida, Verdana, Helv etica, sans-serif;white-space:normal;margin-top:0px;color:#666666;padding-bottom:0px;padding-top:0px;padding-left:24px;padding-right:0px;background-color:#ffffff;\\\">\\r\\n\\t<span style=\\\"font-family:'font-size:14px;\\\">一、借款基本情况</span> \\r\\n</p>\\r\\n<p class=\\\"MsoNormal\\\" style=\\\"font-size:14px;font-family:微软雅黑, Arial, Lucida, Verdana, Helvetica, sans-serif;white-space:normal;margin-top:0px;color:#666666;padding-bottom:0px;padding-top:0px;padding-left:24px;padding-right:0px;background-color:#ffffff;\\\">\\r\\n\\t<span style=\\\"font-family:'font-size:14px;\\\">1.</span><span style=\\\"font-family:'font-size:14px;\\\">借款用途</span> \\r\\n</p>\\r\\n<p class=\\\"MsoNormal\\\" style=\\\"font-size:14px;font-family:微软雅黑, Arial, Lucida, Verdana, Helvetica, sans-serif;white-space:normal;margin-top:0px;color:#666666;padding-bottom:0px;padding-top:0px;padding-left:24px;padding-right:0px;background-color:#ffffff;\\\">\\r\\n\\t<span style=\\\"font-family:'font-size:14px;\\\">借款人为中小企业主，从事商贸行业多年，能够准确的把握该行业的发展动态。借款人为扩大企业经营范围，需要一笔短期资金。本次所借资金主要用于其扩大市场。</span> \\r\\n</p>\\r\\n<p class=\\\"MsoNormal\\\" style=\\\"font-size:14px;font-family:微软雅黑, Arial, Lucida, Verdana, Helvetica, sans-serif;white-space:normal;margin-top:0px;color:#666666;padding-bottom:0px;padding-top:0px;padding-left:24px;padding-right:0px;background-color:#ffffff;\\\">\\r\\n\\t<span style=\\\"font-family:'font-size:14px;\\\">2.</span><span style=\\\"font-family:'font-size:14px;\\\">还款来源</span> \\r\\n</p>\\r\\n<p class=\\\"MsoNormal\\\" style=\\\"font-size:14px;font-family:微软雅黑, Arial, Lucida, Verdana, Helvetica, sans-serif;white-space:normal;margin-top:0px;color:#666666;padding-bottom:0px;padding-top:0px;padding-left:24px;padding-right:0px;background-color:#ffffff;\\\">\\r\\n\\t<span style=\\\"font-family:'font-size:14px;\\\">借款人的还款来源为其企业经营收入。该企业自成立以来，管理科学，经营稳健，且有稳定的经营渠道，企业发展前景良好。该企业无不良征信，无未结清不良贷款，未出现对外担保情况，还款有保</span> \\r\\n</p>\",\"itdId\":6206,\"itdInvestorLevel\":1,\"itdInvestorLevelName\":\"B\",\"iteId\":6378,\"iteIdName\":\"test01\"}],\"pptCollateralExtendMdls\":null,\"itemApprovalList\":null,\"borrowerLoginName\":null,\"borrowerName\":null,\"borrowerPlanSum\":0,\"borrowerPlanSumYuan\":0,\"borrowerRepaySum\":0,\"borrowerRepaySumYuan\":0,\"investorLoginName\":null,\"investorName\":null,\"investorRepaySum\":0,\"investorRepaySumYuan\":0,\"investorSum\":0,\"investorSumYuan\":0,\"surplusTotalNo\":0,\"surplusPrincipal\":null,\"interestStartTime\":null,\"iteExpYearRate\":0,\"discountRate\":0,\"claInitSum\":0,\"rescPlanDate\":null,\"rescPlanSum\":0,\"rescPlanSumYuan\":0,\"rescPlanPrincipal\":0,\"rescPlanPrincipalYuan\":0,\"rescPlanInterest\":0,\"rescPlanInterestYuan\":0,\"recRepaySum\":0,\"recRepaySumYuan\":0,\"rescRepayTime\":null,\"rescState\":null,\"rescStateName\":null,\"rescTotalNo\":0,\"rescNo\":0,\"rescId\":null,\"rsbId\":null,\"rescShouldLateCharge\":0,\"rescRePayType\":null,\"autoRepayState\":null,\"remark\":null,\"useName\":null,\"praValidSum\":0,\"praValidSumYuan\":0,\"endBalanceYuan\":0,\"shouldPayYuan\":0,\"rescIds\":null,\"claTransId\":null,\"sumRepay\":0,\"repayedNum\":0,\"rescType\":null,\"startRepayTime\":null,\"endRepayTime\":null,\"rownum\":null,\"iteYearRateString\":null,\"iteBorrowAmountYuanString\":null,\"iteLimitYuanString\":null,\"iteProgressString\":null,\"iteRepayIntervalString\":null,\"borrowLevelName\":\"B\",\"myTotalInvSum\":null,\"myTotalInvSumYuan\":null,\"startTime\":null,\"endTime\":null,\"startMoth\":null,\"endMoth\":null,\"captcha\":null,\"taskId\":null,\"taskName\":null,\"processInstanceId\":null,\"activitiId\":null,\"repaySum\":null,\"fufPraNowSum\":null,\"fufPraNowSumYuan\":null,\"claTransClaimSum\":null,\"claTransClaimSumYuan\":null,\"itemCost\":null,\"itemCostYuan\":null,\"claTransSum\":null,\"claTransSumYuan\":null,\"claHoldState\":null,\"iteYearRateDown\":null,\"iteYearRateUp\":null,\"orderArgs\":null,\"publishDate\":1503553599000,\"recallOrNot\":null,\"toiImgUrl\":null,\"claId\":null,\"repayedSumYuan\":null,\"repayedPrincipalYuan\":null,\"repayedInterestYuan\":null,\"unrepayedPrincipalYuan\":null,\"unrepayedInterestYuan\":null,\"reiSort\":null,\"rewardLimit\":null,\"rewardLimitYuan\":null,\"applyTime\":null,\"rescShouldLateChargeYuan\":null,\"rescOverdueDays\":null,\"investor\":null,\"ascDesc\":null,\"useLoginName\":\"d***3\",\"userId\":null,\"ifClaim\":1,\"type\":null,\"itdContent\":null,\"itemBreach\":null,\"itoOperate\":null,\"pointsRewardTypeName\":null}"}]
        }, function responseCallback(responseData) {
            document.getElementById("show").innerHTML = "send get responseData from java, data = " + responseData
        })
    }
    /*function goto() {
        window.WebViewJavascriptBridge.callHandler('goto',
            {"className":"com.stateunion.p2p.etongdai.activity.invest.invest.InvestDetailsActivity",
                "isCloseWebView":false,
                "params":[{"key":"CreditorRightsVo","className":"java.lang.Integer","jsonClass":"253"},
                    {"key":"InvestmentDetailVo","className":"java.lang.String","jsonClass":"\"hello\""}]
            }, function responseCallback(responseData) {
                document.getElementById("show").innerHTML = "send get responseData from java, data = " + responseData
            })
    }*/
</script>
