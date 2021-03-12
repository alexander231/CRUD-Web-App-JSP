
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    <link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="style_tabela.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga Curs</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style= "background:#333;">
        <%
            int idprofesor, iddepartament, nr_angajati;
        	float salariu, buget;
            String id1, id2, nume_profesor, prenume_profesor, data_nastere, nume_curs, nume_departament, credite, ore_pe_semestru;
            id1 = request.getParameter("idprofesor");
            id2 = request.getParameter("iddepartament");
            nume_curs = request.getParameter("nume_curs");
            credite = request.getParameter("credite");
            ore_pe_semestru = request.getParameter("ore_pe_semestru");
            if (id1 != null) {
            	System.out.println("YES");
                jb.connect();
                jb.adaugaCurs(java.lang.Integer.parseInt(id1), java.lang.Integer.parseInt(id2), nume_curs, java.lang.Integer.parseInt(credite), java.lang.Integer.parseInt(ore_pe_semestru));
                jb.disconnect();
        %>
        <script>
        alert("Ati adaugat cursul!");
        </script><%
        } 
        jb.connect();
        ResultSet rs1 = jb.vedeTabela("profesori");
        ResultSet rs2 = jb.vedeTabela("departamente");
        %>
        <h1> Suntem in tabela Cursuri.</h1>
        <form action="nou_Curs.jsp" method="post">
            <table style ="background:#4D4D4D;">
                <tr>
                    <td align="right">IdProfesor:</td>
                    <td> 
                        Selectati profesorul:
			<SELECT NAME="idprofesor">
                                <%
                                    while(rs1.next()){
                                        idprofesor = rs1.getInt("idprofesor");
                                        nume_profesor = rs1.getString("nume");
                                        prenume_profesor = rs1.getString("prenume");
                                        data_nastere = rs1.getString("data_nastere");
                                        salariu = rs1.getFloat("salariu");
                                %>
                                    <OPTION VALUE="<%= idprofesor%>"><%= idprofesor%>, <%= nume_profesor%>, <%= prenume_profesor%>, <%= data_nastere%>, <%= salariu%></OPTION>
                                <%
                                    }
                                %>
			</SELECT>
                    
                    </td>
                </tr>
                <tr>
                    <td align="right">IdDepartament:</td>
                    <td> 
                        Selectati departamentul:
			<SELECT NAME="iddepartament">
				<!-- OPTION selected="yes" VALUE="iris1">Iris 1</OPTION -->
                                <%
                                    while(rs2.next()){
                                        iddepartament = rs2.getInt("iddepartament");
                                        nume_departament = rs2.getString("nume");
                                        nr_angajati = rs2.getInt("nr_angajati");
                                        buget = rs2.getFloat("buget");
                                %>
                                    <OPTION VALUE="<%= iddepartament%>"><%= iddepartament%>, <%= nume_departament%>, <%= nr_angajati%>, <%=buget%></OPTION>
                                <%
                                    }
                                %>
			</SELECT>
                     </td>
                </tr>
                <tr>
                    <td align="right">Nume curs:</td>
                    <td> <input type="text" name="nume_curs" size="30" required/></td>
                </tr>
                <tr>
                    <td align="right">Credite:</td>
                    <td> <input type="text" name="credite" size="30" required/></td>
                </tr>
                <tr>
                    <td align="right">Ore pe semestru:</td>
                    <td> <input type="text" name="ore_pe_semestru" size="30" required/></td>
                </tr>
            </table>
            <div class = "multi-button">
            
            <button type="submit" value="Adauga Curs">Adauga curs</button>
            <button onclick="location.href='index.html'" type="button">Home</button> 
            
            </div>
        </form>
        
      
    </body>
</html>