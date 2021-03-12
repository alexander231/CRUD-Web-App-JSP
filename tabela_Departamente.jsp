
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
        <title>Tabela Departamente</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style ="background: #4E598C;">
        <h1 align="center"> Tabela Departamente</h1>
        <br/>
        
        <form action="sterge_Departament.jsp" method="post">
			<div class="wrapper">
            <table rules = "none" border="1" align="center" style ="background: #6470A9;">
            <tbody>
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>Id departament:</b></td>
                    <td><b>Nume:</b></td>
                    <td><b>Nr. angajati:</b></td>
                    <td><b>Buget:</b></td>

                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("departamente");
                    long x;
                    while (rs.next()) {
                        x = rs.getInt("iddepartament");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
                    <td><%= x%></td>
                    <td><%= rs.getString("nume")%></td>
                    <td><%= rs.getInt("nr_angajati")%></td>
                    <td><%= rs.getFloat("buget")%></td>
                    <%
                        }
                    %>
                </tr>
                </tbody>
            </table>
            </div>
            <br/>
           
              <div class = "multi-button">
            <p align="center">
            <button type = "button">Sterge departament</button>
            <button onclick="location.href='index.html'" type="button">Home</button> 
            <button onclick="location.href='nou_Departament.jsp'" type="button">Adauga departament</button>
                              
			
			</p>
			
            </div>
			
            
        </form>
        <%
            rs.close();
            jb.disconnect();
        %>
       
        
        <script src = "functie.js"></script>
    </body>
</html>