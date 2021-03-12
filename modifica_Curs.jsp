
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
        <title>Tabela Curs</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style = "background: #565554;">
        <h1 align="center"> Tabela Curs</h1>
        <br/>
      
        <form action="m1_Curs.jsp" method="post">
        <div class="wrapper">
            <table rules = "none" border="1" align="center" style = "background: #706E6D;">
                <tr>
   					<td><b>Mark:</b></td>
                    <td><b>Id curs:</b></td>
                    <td><b>Id profesor:</b></td>
                    <td><b>Nume profesor:</b></td>
                    <td><b>Prenume profesor:</b></td>
                    <td><b>Data nastere:</b></td>
                    <td><b>Salariu:</b></td>
                    <td><b>Id Departament:</b></td>
                    <td><b>Nume Departament:</b></td>
                    <td><b>Nr. angajati:</b></td>
                    <td><b>Buget:</b></td>
                    <td><b>Nume curs:</b></td>
                    <td><b>Credite:</b></td>
                    <td><b>Ore pe semestru:</b></td>
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeCurs();
                    long x;
                    while (rs.next()) {
                        x = rs.getInt("idcurs");
                %>
                <tr>
                    <td><input type="radio" name="primarykey" value="<%= x%>" /></td><td><%= x%></td>
                    <td><%= rs.getInt("idprofesor_curs")%></td>
                    <td><%= rs.getString("nume_profesor")%></td>
                    <td><%= rs.getString("prenume_profesor")%></td>
                    <td><%= rs.getDate("data_nastere")%></td>
                    <td><%= rs.getFloat("salariu")%></td>
                    <td><%= rs.getInt("iddepartament_curs")%></td>
                    <td><%= rs.getString("nume_departament")%></td>
                    <td><%= rs.getInt("nr_angajati")%></td>
                    <td><%= rs.getFloat("buget")%></td>
                    <td><%= rs.getString("nume_curs")%></td>
                    <td><%= rs.getInt("credite")%></td>
                    <td><%= rs.getInt("ore_pe_semestru")%></td>
                    <%
                        }
                    %>
                </tr>
            </table>
            </div>
            <br/>
           <div class = "multi-button">
            <p align="center">
            <button type = "button">Modifica curs</button>
            <button onclick="location.href='index.html'" type="button">Home</button> 
            <button onclick="location.href='nou_Curs.jsp'" type="button">Adauga curs</button>
                              
			
			</p>
			
            </div>
        </form>
        <%
    jb.disconnect();%>
        <br/>
       
        <script src = "functie.js"></script>
    </body>
</html>