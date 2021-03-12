
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    	<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet"> 
		<link rel="stylesheet" href="style_tabela.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Departament</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style ="background:#333;">
        <h1>Tabela Departamente</h1>
        <br/>
        
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("departamente", "iddepartament", aux);
            rs.first();
            String nume = rs.getString("nume");
            String nr_angajati = rs.getString("nr_angajati");
            String buget = rs.getString("buget");
            rs.close();
            jb.disconnect();
        %>
        <form action="m2_Departament.jsp" method="post">
            <table style = "background: #4D4D4D;">
                <tr>
                    <td align="right">IdMedic:</td>
                    <td> <input type="text" name="iddepartament" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Nume:</td>
                    <td> <input type="text" name="nume" size="30" value="<%= nume%>"/></td>
                </tr>
                <tr>
                    <td align="right">Nr. Angajati:</td>
                    <td> <input type="text" name="nr_angajati" size="30" value="<%= nr_angajati%>"/></td>
                </tr>
                <tr>
                    <td align="right">Buget:</td>
                    <td> <input type="text" name="buget" size="30" value="<%= buget%>"/></td>
                </tr>
            </table>
            <div class = "multi-button">
            
            <button type="submit" value="Modifica departamentul">Modifica departamentul</button>
            <button onclick="location.href='index.html'" type="button">Home</button> 
            <button onclick="location.href='nou_Departament.jsp'" type="button">Adauga un nou departament</button>
            </div>
        </form>
        
      
    </body>
</html>