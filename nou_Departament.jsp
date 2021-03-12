
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    <link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="style_tabela.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga Departament</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style= "background:#333;">
        <%
            String nume = request.getParameter("nume");
            String nr_angajati = request.getParameter("nr_angajati");
            String buget = request.getParameter("buget");
            if (nume != null) {
                jb.connect();
                jb.adaugaDepartament(nume, java.lang.Integer.parseInt(nr_angajati), java.lang.Float.parseFloat(buget));
                jb.disconnect();
        %>
        <script>
        alert("Ati adaugat departamentul!");
        </script>
        <%
        } 
        %>
        <h1> Suntem in tabela Departament.</h1>
        <form action="nou_Departament.jsp" method="post">
            <table style="background:#4D4D4D;">
                <tr>
                    <td align="right">Nume Departament:</td>
                    <td> <input type="text" name="nume" size="40" required/></td>
                </tr>
                <tr>
                    <td align="right">Nr. angajati:</td>
                    <td> <input type="text" name="nr_angajati" size="30" required/></td>
                </tr>
                <tr>
                    <td align="right">buget</td>
                    <td> <input type="text" name="buget" size="30" required/></td>
                </tr>
            </table>
            <div class = "multi-button">
            
            <button type="submit" value="Adauga departamentul">Adauga departamentul</button>
            <button onclick="location.href='index.html'" type="button">Home</button> 
            
            </div>
        </form>
        
       
    </body>
</html>