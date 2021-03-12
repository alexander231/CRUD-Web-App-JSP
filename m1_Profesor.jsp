
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    	<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet"> 
		<link rel="stylesheet" href="style_tabela.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Profesori</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style ="background:#333;">
        <h1 style = "color: #fff;margin-left: 10px;margin-top:10px;">Tabela Profesori</h1>
        <br/>
       
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("profesori", "idprofesor", aux);
            rs.first();
            String nume = rs.getString("nume");
            String prenume = rs.getString("prenume");
            String data_nastere = rs.getString("data_nastere");
            float salariu = rs.getFloat("salariu");
            rs.close();
            jb.disconnect();
        %>
        <form action="m2_Profesor.jsp" method="post">
            <table align="center" style = "background: #4D4D4D;">
                <tr>
                    <td align="right">Id profesor:</td>
                    <td> <input type="text" name="idprofesor" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Nume:</td>
                    <td> <input type="text" name="nume" size="30" value="<%= nume%>"/></td>
                </tr>
                <tr>
                    <td align="right">Prenume:</td>
                    <td> <input type="text" name="prenume" size="30" value="<%= prenume%>"/></td>
                </tr>
                <tr>
                    <td align="right">Data nastere:</td>
                    <td> <input type="text" name="data_nastere" size="30" value="<%= data_nastere%>"/></td>
                </tr>
                <tr>
                    <td align="right">Salariu:</td>
                    <td> <input type="text" name="salariu" size="30" value="<%= salariu%>"/></td>
                </tr>
            </table>
            <div class = "multi-button">
            
            <button type="submit" value="Adauga profesorul">Modifica profesorul</button>
            <button onclick="location.href='index.html'" type="button">Home</button> 
            <button onclick="location.href='nou_Profesor.jsp'" type="button">Adauga un nou profesor</button>
            </div>
        </form>
        
    </body>
</html>