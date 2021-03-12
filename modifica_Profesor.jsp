
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    <link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet"> 
    	<link rel="stylesheet" href="style_tabela.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <br/>
        <title>Tabela Profesori</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style = "background:#9888A5;">
        <h1 align="center"> Tabela Profesori</h1>
        <br/>
        
        <form action="m1_Profesor.jsp" method="post">
        <div class="wrapper">
            <table rules = "none" border="1" align="center" style ="background:#7F6C8E;">
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>Id profesor:</b></td>
                    <td><b>Nume:</b></td>
                    <td><b>Prenume:</b></td>
                    <td><b>Data nastere:</b></td>
                    <td><b>Salariu:</b></td>
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("profesori");
                    long x;
                    while (rs.next()) {
                        x = rs.getLong("idprofesor");
                %>
                <tr>
                    <td><input type="radio" name="primarykey" value="<%= x%>" /></td>
                    <td><%= x%></td>
                    <td><%= rs.getString("nume")%></td>
                    <td><%= rs.getString("prenume")%></td>
                    <td><%= rs.getString("data_nastere")%></td>
                    <td><%= rs.getFloat("salariu")%></td>
                    <%
                        }
                    %>
                </tr>
            </table>
            </div>
            <br/>
            <div class = "multi-button">
            <p align="center">
            <button type = "button">Modifica profesor</button>
            <button onclick="location.href='index.html'" type="button">Home</button> 
            <button onclick="location.href='nou_Profesor.jsp'" type="button">Adauga profesor</button>
                              
			
			</p>
			
            </div>
            
            
        </form>
        <%
    jb.disconnect();%>
       <script src = "functie.js"></script>
    </body>
</html>