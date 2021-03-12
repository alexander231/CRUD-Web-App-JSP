
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    <link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="style_tabela.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga profesor</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style= "background:#333;">
        <%
            String nume = request.getParameter("nume");
            String prenume = request.getParameter("prenume");
            String data_nastere = request.getParameter("data_nastere");
            String salariu = request.getParameter("salariu");
            
           
            
          
            if (nume != null && prenume != null && data_nastere !=null) {
                jb.connect();
                jb.adaugaProfesor(nume, prenume, data_nastere, java.lang.Float.parseFloat(salariu));
                jb.disconnect();
        %>
        <script>
        alert("Ati adaugat profesorul!");
        </script>
        <%
        } 
        %>
        <h1> Suntem in tabela Profesor.</h1>
        <form action="nou_Profesor.jsp" method="post">
            <table style ="background:#4D4D4D;">
                <tr>
                    <td align="right">Nume profesor:</td>
                    <td> <input type="text" name="nume" size="30" required/></td>
                </tr>
                <tr>
                    <td align="right">Prenume profesor:</td>
                    <td> <input type="text" name="prenume" size="30" required/></td>
                </tr>
                <tr>
                    <td align="right">Data nastere:</td>
                    <td> <input type="text" name="data_nastere" size="30" required/></td>
                </tr>
                <tr>
                    <td align="right">Salariu:</td>
                    <td> <input type="text" name="salariu" size="30" required/></td>
                </tr>
            </table>
             <div class = "multi-button">
            
            <button type="submit" value="Adauga profesorul">Adauga profesorul</button>
            <button onclick="location.href='index.html'" type="button">Home</button> 
            
            </div>
        </form>
        
       
    </body>
</html>