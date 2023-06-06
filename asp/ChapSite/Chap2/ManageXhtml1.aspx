<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="Scripts/jquery-3.6.3.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {    
            $("#hide").click(function () { 
                $("#effect").hide();
            });
            $("#show").click(function () { 
                $("#effect").show();
            });
           $(".flip").click(function () {
              $("#effect").fadeToggle();

           });
            $("#chgText").click(function () {
                $("#effect").text("内容更改为：孤独的根号三");
            });
            $("#chgCss").click(function () {
                $("*").css({ "background-color":"#fff880", "font-family": "隶书" });
            });

        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <span id ="hide">隐藏</span>
            <span id ="show">显示</span>
            <span class="flip">淡入和淡出</span>
            <span id="chgText" style="color:#ffd800">更改内容</span>
            <span id="chgCss">更改样式</span>
        </div>
        <p id ="effect">单击“隐藏”我就消失；单击“显示”我就回来，单击“淡入或淡出”我就淡入或淡出。</p>
    </form>
</body>
</html>
