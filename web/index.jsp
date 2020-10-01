
<%@page import="prova_poo.Disciplina"%>
<%@page import="java.util.Set"%>

<% 
Disciplina disciplina = new Disciplina(null, null, 0);

try {
    disciplina = (Disciplina) application.getAttribute("disciplinas");
} catch (Exception e) {
    out.println("Ops! Deu erro.");
}

if(disciplina == null) {
    disciplina = new Disciplina(null, null, 0);
    
    Disciplina POO = new Disciplina("Programação Orientada a Objetos", "POO", 4);
    Disciplina ES3 = new Disciplina("Engenharia de Software 3", "ES3", 4);
    Disciplina BD = new Disciplina("Banco de Dados", "BD", 4);
    Disciplina MTD = new Disciplina("Metodologia", "MTD", 4);
    Disciplina SO2 = new Disciplina("Sistemas Operacionais 2", "MTD", 4);
    Disciplina LP4 = new Disciplina("Linguagem de Programação 4", "MTD", 4);
    
    disciplina.addDisciplina(POO);
    disciplina.addDisciplina(ES3);
    disciplina.addDisciplina(BD);
    disciplina.addDisciplina(MTD);
    disciplina.addDisciplina(SO2);
    disciplina.addDisciplina(LP4);
    
    application.setAttribute("disciplinas", disciplina);
    
}

%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INÍCIO - PROVA POO</title>
    </head>
    <body>
        <div> 
            <h1>Nome</h1><br>Nicholas Stefan Bonanato<br>
            <h1>RA</h1><br> 1290481913028<br>
            <h1>Número de disciplinas matriculadas</h1>
            
            <% 
            if (disciplina != null) {
                out.print(disciplina.getList().size());
                
            } else {
                %> 0 <%
            }
            
            %>
        
        
        </div>
    </body>
</html>
