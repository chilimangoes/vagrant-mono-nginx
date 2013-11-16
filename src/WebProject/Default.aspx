<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Test ASP.NET page</title>
</head>
<body>
    <div>
        <% var test = "Hello World! Got an aspx page running on nginx!!!"; %>
        <%= test %>
    </div>
</body>
</html>
