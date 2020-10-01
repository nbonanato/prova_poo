<%-- 
    Document   : disciplinas
    Created on : 30/09/2020, 22:27:04
    Author     : Nicholas
--%>

<%@page import="java.util.Set"%>
<%@page import="prova_poo.Disciplina"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Disciplina disciplina = null;
    
try {
    disciplina = (Disciplina) application.getAttribute("disciplinas");
} catch (Exception e) {
    out.print("Ops! Deu erro.");
}

if (disciplina != null) {
 
    ArrayList<Disciplina> listD = disciplina.getList();
    ArrayList<Disciplina> newList = new ArrayList<>();
    int count = 0;
    
    for (int i = 0; i <disciplina.getList().size(); i++)
      try {
    String nota = request.getParameter("nota"+i);
    Disciplina disci = listD.get(i);
    
    disci.setNota(Float.parseFloat(nota));
    newList.add(disci);
    count++;
    
} catch (Exception e) {
    out.print("Ops! Deu erro.");
    continue;
}

if (count == disciplina.getList().size()) {
    disciplina.setList(newList);
 
}

application.setAttribute("disciplinas", disciplina);
    %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela de Disciplinas</title>
    </head>
    <body>
        <h1>Matérias</h1>
        
        <form>
            <table class="table">
                <%
                    for (int i=0; i<disciplina.getList().size(); i++) {
                  %>
                  <tr>
                      <td> <% out.println(disciplina.getList().get(i).getNome()); %> </td>
                      <td> <% out.println(disciplina.getList().get(i).getEmenta()); %> </td>
                      <td> <% out.println(disciplina.getList().get(i).getCiclo()); %>  </td>
                      <td>  <input type="text" name="nota <% out.print(Integer.toString(i)); %>" value ="<% out.println();disciplina.getList().get(i).getNota(); %>"><td>
                   </tr>
                   <%
                       }
                   %>
                    <input type=submit" name=" " value="Atualizar">
                   
                    }

                    %>
            
        </form>
                    </table>
        
        
          <%@include file="menu.jspf"%>
        
    </body>
</html>
