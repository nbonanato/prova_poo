<%@page import="prova_poo.Disciplina"%>
<%@page import="java.util.Set"%>
<%@page import="web.DbListener"%>





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
            <h1>Número de disciplinas matriculadas:</h1><br> 
            
            <%= Disciplina.getList().size() %>
        
        
        </div>
       
            
            <%@include file="WEB-INF/menu.jspf" %>
    </body>
</html>
