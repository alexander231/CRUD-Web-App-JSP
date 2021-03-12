
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    	<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="style_tabela.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Departamente</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style = "background: #333;">
        <h1 align ="center"> Tabela Departamente:</h1>
     

        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("iddepartament"));
            String nume = request.getParameter("nume");
            String nr_angajati = request.getParameter("nr_angajati");
            String buget = request.getParameter("buget");

            String[] valori = {nume, String.valueOf(nr_angajati), String.valueOf(buget)};
            String[] campuri = {"nume", "nr_angajati", "buget"};
            jb.modificaTabela("departamente", "iddepartament", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 align="center">Modificarile au fost efectuate !</h1>
        <div class = "multi-button">
            
            <button type="submit" value="Modifica departamentul" onclick="location.href='nou_Departament.jsp'">Adauga departamentul</button>
            <button onclick="location.href='index.html'" type="button">Home</button> 
            
        </div>
    </body>
</html>