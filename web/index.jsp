<%-- 
    Document   : index
    Created on : 30/09/2020, 21:51:22
    Author     : Nicholas
--%>
<%@page import="java.util.Set"%>
<%@page import="prova_poo.Disciplina"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    
Disciplina disciplina = new Disciplina(null, null, 0);

try {
    disciplina = (Disciplina) application.getAttribute("disciplinas");
} catch (Exception e) {
    out.print("Ops! Deu erro.");
}

if (disciplina == null) {
    disciplina = new Disciplina(null, null, 0);
    
    Disciplina ILP07 = new Disciplina("Programação Orientada a Objetos", "POO", 4);
    Disciplina IES30 = new Disciplina("Engenharia de Software 3", "IES30", 4);
    Disciplina IBD00 = new Disciplina("Banco de Dados", "BD", 4);
    Disciplina ILP51 = new Disciplina("Linguagem de Programação 4", "POO", 4);
    Disciplina ISO20 = new Disciplina("Sistemas Operacionais 2", "POO", 4);
    Disciplina TTG00 = new Disciplina("Metodologia da Pesquisa Científico-Tecnológica ", "POO", 4);
    
    disciplina.addDisciplina(ILP07);
    disciplina.addDisciplina(IES30);
    disciplina.addDisciplina(IBD00);
    disciplina.addDisciplina(ILP51);
    disciplina.addDisciplina(TTG00);
    
    application.setAttribute("disciplinas", disciplina);
}
    %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Início - Prova POO</title>
    </head>
    <body>
        <div>
            <h1>Nome:</h1><br>Nicholas Stefan Bonanato
            <h1>RA:</h1><br> 1290481913028
            <h2>Número de Disciplinas Matriculadas</h2>
            
            <% 
            if (disciplina != null) {
                out.print(disciplina.getList().size());
                
            } else {
                %> 0 <%
            }
            
            %>
            
        </div>

            <%@include file="menu.jspf"%>
            
    </body>
</html>
