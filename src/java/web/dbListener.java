package web;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.sql.*;
import java.util.Collections;
import prova_poo.Disciplina;

/**
 * Web application lifecycle listener.
 *
 * @author Nicholas
 */
public class dbListener implements ServletContextListener {
    private static final String CLASS_NAME = "org.sqlite.JDBC";
    private static final String DB_URL = "jdbc:sqlite:disciplina.db";
    
    public static String exceptionMessage = null;
    Connection con = null;
    Statement stmt = null;
    Exception methodEx = null;
    ResultSet rs = null;
    
    public static Connection getConection() throws Exception {
        return DriverManager.getConnection(DB_URL);
    }
    

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        String etapa ="inicializando";
    }
    
try {
    etapa = "Registrando a classe do drive";
    Class.forName(CLASS_NAME);
    etapa = "Conectando com o DB";
    con = getConection();
    stmt = con.createStatement();
    etapa = "Criando a tabela!";
    stmt.execute(Disciplina.getCreatStatement());
} catch (Exception ex) {
    exceptionMessage = etapa+": "+ex.getLocalizedMessage();
} finally {
    try (stmt.close();con.close();catch(Exception e) { }
}
}

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}
