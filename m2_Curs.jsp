
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
  		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet"> 
		<link rel="stylesheet" href="style_tabela.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Curs</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style = "background: #333;">
        <h1 align="center"> Tabela Curs</h1>
      
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("idcurs"));
            String idprofesor = request.getParameter("idprofesor");
            String iddepartament = request.getParameter("iddepartament");
            String nume_curs = request.getParameter("nume_curs");
            String credite = request.getParameter("credite");
            String ore_pe_semestru = request.getParameter("ore_pe_semestru");
			
            String[] valori = {idprofesor, iddepartament, nume_curs, credite, ore_pe_semestru};
            String[] campuri = {"idprofesor", "iddepartament", "nume", "credite", "ore_pe_semestru"};
            jb.modificaTabela("cursuri", "idcurs", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 align="center">Modificarile au fost efectuate !</h1>
         <div class = "multi-button">
            
            <button type="submit" value="Adauga profesorul" onclick="location.href='nou_Profesor.jsp'">Adauga profesorul</button>
            <button onclick="location.href='index.html'" type="button">Home</button> 
            
            </div>
    </body>
</html>