<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>File Upload to Database Demo</title>
</head>
<body>
    <center>
        <h1>File Upload to Database Demo</h1>
        <form method="post" action="testServlet" >
            <table border="0">
                <tr>
                    <td>download id </td>
                    <td><input type="text" name="downloadId" size="50"/></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="download">
                    </td>
                </tr>
            </table>
        </form>
    </center>
</body>
</html>