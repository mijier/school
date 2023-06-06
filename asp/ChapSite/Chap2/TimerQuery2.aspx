<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TimerQuery2.aspx.cs" Inherits="TimerQuery2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="Scripts/jquery-3.6.3.min.js"></script>
     <script>   
         function refresh() {
                   $.ajax({
                   url:"Ajax2.aspx",
                   success: function (datetime) {
                       $("#divMsg").text(datetime);
                       }         
                   });
             setTimeout("refresh()", 1000);
        }
     </script>

    
</head>
<body onload="refresh()">
    <form id="form1" runat="server">
        <div id="divMsg">
        </div>
    </form>
</body>
</html>
