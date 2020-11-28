<%@page import="java.util.Set" %>
<%@page import="prova_poo.Disciplina" %>
<%@page import="java.util.ArrayList" %>
<%@page import="web.DbListener" %>

<% 
String exceptionMsg = null;

if (request.getParameter("cancelar") != null) {
    response.sendRedirect(request.getRequestURI());
}

if (request.getParameter("formInsert") != null) {
    
    try {
        String nome = request.getParameter("nome");
        String ementa = request.getParameter("ementa");
        int ciclo = Integer.parseInt(request.getParameter("ciclo"));
        float nota = Float.parseFloat(request.getParameter("nota"));
        Disciplina.insert(nome, ementa, ciclo, nota);
        
        response.sendRedirect(request.getRequestURI());

    } catch (Exception e) {
        exceptionMsg = e.getLocalizedMessage();
    }}
    
    
if (request.getParameter("formUpdate") != null) {
    
    try {
        String nome = request.getParameter("nome");
         String nomeAntigo = request.getParameter("nomeAntigo");
        String ementa = request.getParameter("ementa");
        int ciclo = Integer.parseInt(request.getParameter("ciclo"));
        float nota = Float.parseFloat(request.getParameter("nota"));
        Disciplina.update(nomeAntigo, nome, ementa, ciclo, nota);
        
        response.sendRedirect(request.getRequestURI());

    } catch (Exception e) {
        exceptionMsg = e.getLocalizedMessage();
    }}
        
    
    if (request.getParameter("formDelete") != null) {
    
    try {
        String nome = request.getParameter("nome");
        Disciplina.delete(nome);
        response.sendRedirect(request.getRequestURI());

    } catch (Exception e) {
        exceptionMsg = e.getLocalizedMessage();
    }}
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TABELA DE MATÉRIAS</title>
    </head>
    <body>
        <h1>Essas são as disciplinas!</h1>
        
        <% if (request.getParameter("prepareInsert")!= null) {   %>
        <h3>Inserir registro</h3>
        <form>
            Nome: <input type="text" name="nome" />
            Ementa: <input type="text" name="ementa" />
            Ciclo: <input type="text" name="ciclo" />
            Nota: <input type="text" name="nota" />
            <input type="submit" name="formInsert" value="Inserir" />
            <input type="submit" name="cancelar" value="Cancelar" />
        </form>
        
        <form>
        <% } else if (request.getParameter("prepareUpdate") != null) { %>
        <h3>Alteração de registro</h3>
        <% String nome = request.getParameter("nome");
        String ementa = request.getParameter("ementa");
        int ciclo = Integer.parseInt(request.getParameter("ciclo"));%>
            <input type="hidden" name="nomeAntigo" value="<%=nome%>"/>
        Nome:  <input type="text" name="nome" value="<%=nome%>"/>
        Ementa:  <input type="text" name="nome" value="<%=ementa%>"/>
        Ciclo:  <input type="text" name="nome" value="<%=ciclo%>"/>
             <input type="submit" name="formUpdate" value="Atualizar" />
            <input type="submit" name="cancelar" value="Cancelar" />
        </form>
             
                     <form>
        <% } else if (request.getParameter("prepareDeleter") != null) { %>
        <h3>Alteração de registro</h3>
        <% String nome = request.getParameter("nome");%>
        Nome:  <input type="text" name="nome" value="<%=nome%>"/>
        Deseja excluir o registro <i><%=nome%></i> ?
             <input type="submit" name="formDelete" value="Sim!" />
            <input type="submit" name="cancelar" value="Não!" />
        </form>
             
         <% } else { %>
         
         <form method="POST">
             <input type="submit" name="prepareInserir" value="inserir"/>
         </form>
        
         <h3>Lista</h3>
         <table border="2">
             <tr>
                 <th>Nome</th>
                 <th>Ementa</th>
                 <th>Ciclo</th>
                 <th>Nota</th>
                 <th>Ações</th>
             </tr>    
                 <% for (Disciplina c: Disciplina.getList()) { %>
             <tr>
                 <td><%=c.getNome()%></td>
                 <td><%=c.getEmenta()%></td>
                 <td><%=c.getCiclo()%></td>
                 <td><%=c.getNota()%></td>
                 <td>
                     <form>
                         <input type="hidden" name="nome" value="<%=c.getNome()%>" />
                         <input type="hidden" name="ementa" value="<%=c.getEmenta()%>" />
                         <input type="hidden" name="ciclo" value="<%=c.getCiclo()%>" />
                         <input type="hidden" name="nota" value="<%=c.getNota()%>" />
                                <input type="submit" name="prepareUpdate" value="Alterar" />
                                <input type="submit" name="prepareDelete" value="Excluir" />
                     </form>
                 </td>    
             </tr>
             <%}%>
             
         </table>
         
         
                <%@include file="WEB-INF/menu.jspf" %>
    </body>
</html>
