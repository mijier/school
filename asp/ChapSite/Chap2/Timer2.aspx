<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
   
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script>
        function startTime() {
            var today = new Date();//获取客户端当前时间
            var h = today.getHours();
            var m = today.getMinutes();
            var s = today.getSeconds();
            m = checkTime(m);
            s = checkTime(s);
            document.getElementById("divTimer").innerHTML = h + ":" + m + ":" + s;
            setTimeout("startTime()", 1000);
                if (i < 10) {
                    i = "0" + i;

                }
                return i;
            }

        }
    </script>
     
</head>
<body onload="startTime()">
    <form id="form1" runat="server">
        <div id="divTimer">
        </div>
    </form>
</body>
</html>
