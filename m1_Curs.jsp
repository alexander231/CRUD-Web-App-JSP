
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
    <body style ="background:#333;">
        <h1>Tabela Curs</h1>
        
        <%
            jb.connect();
            String nume_profesor, prenume_profesor, data_nastere, nume_departament, nume_curs;
			float salariu, buget;
			int nr_angajati, credite, ore_pe_semestru;
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceCursID(aux);
            rs.first();
            int id1 = rs.getInt("idprofesor_curs");
            int id2 = rs.getInt("iddepartament_curs");

            nume_profesor = rs.getString("nume_profesor");
            prenume_profesor = rs.getString("prenume_profesor");
            data_nastere= rs.getString("data_nastere");
            salariu = rs.getFloat("salariu");
            nume_departament = rs.getString("nume_departament");
            nr_angajati = rs.getInt("nr_angajati");
            buget = rs.getFloat("buget");
            nume_curs = rs.getString("nume_curs");
            credite= rs.getInt("credite");
			ore_pe_semestru = rs.getInt("ore_pe_semestru");
			
            ResultSet rs1 = jb.vedeTabela("profesori");
            ResultSet rs2 = jb.vedeTabela("departamente");
            int idprofesor, iddepartament;


        %>
        <form action="m2_Curs.jsp" method="post">
            <table align="center" style = "background: #4D4D4D;">
                <tr>
                    <td align="right">IdCurs:</td>
                    <td> <input type="text" name="idcurs" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">idprofesor:</td>
                    <td> 
                        <SELECT NAME="idprofesor">
                            <%
                                while (rs1.next()) {
                                    idprofesor = rs1.getInt("idprofesor");
                                    nume_profesor = rs1.getString("nume");
                                    prenume_profesor = rs1.getString("prenume");
                                    data_nastere = rs1.getString("data_nastere");
                                    salariu = rs1.getFloat("salariu");
                                    if (idprofesor != id1) {
                            %>
                            <OPTION VALUE="<%= idprofesor%>"><%= idprofesor%>, <%= nume_profesor%>, <%= prenume_profesor%>, <%= data_nastere%>, <%= salariu%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idprofesor%>"><%= idprofesor%>, <%= nume_profesor%>, <%= prenume_profesor%>, <%= data_nastere%>, <%= salariu%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">iddepartament:</td>
                    <td> 
                        <SELECT NAME="iddepartament">
                            <%
                                while (rs2.next()) {
                                    iddepartament = rs2.getInt("iddepartament");
                                    nume_departament = rs2.getString("nume");
                                    nr_angajati = rs2.getInt("nr_angajati");
                                    buget = rs2.getFloat("buget");
                            if (iddepartament != id2) {
                            %>
                            <OPTION VALUE="<%= iddepartament%>"><%= iddepartament%>, <%= nume_departament%>, <%= nr_angajati%>, <%= buget%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= iddepartament%>"><%= iddepartament%>, <%= nume_departament%>, <%= nr_angajati%>, <%= buget%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">nume_curs:</td>
                    <td> <input type="text" name="nume_curs" size="30" value="<%= nume_curs%>"/></td>
                </tr>
                <tr>
                    <td align="right">credite:</td>
                    <td> <input type="text" name="credite" size="30" value="<%= credite%>"/></td>
                </tr>
                <tr>
                    <td align="right">ore_pe_semestru:</td>
                    <td> <input type="text" name="ore_pe_semestru" size="30" value="<%= ore_pe_semestru%>"/></td>
                </tr>
            </table><div class = "multi-button">
            
            <button type="submit" value="Adauga profesorul">Modifica curs</button>
            <button onclick="location.href='index.html'" type="button">Home</button> 
            <button onclick="location.href='nou_Curs.jsp'" type="button">Adauga un nou curs</button>
            </div>
            
        </form>
        
    </body>
    <%
        rs.close();
        rs1.close();
        rs2.close();
        jb.disconnect();
    %>
</html>