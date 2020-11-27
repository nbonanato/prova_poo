package prova_poo;
import java.util.ArrayList;
import web.dbListener;
import java.sql.*;
                
public class Disciplina {
    
    String nome;
    String ementa;
    int ciclo;
    float nota;
    
    public static ArrayList<Disciplina> getList() throws Exception {
    ArrayList<Disciplina> disciplinas = new ArrayList<>();
         Connection con = null;
        Statement stmt = null;
        Exception methodEx = null;
        ResultSet rs = null;
        
        try {
            con = dbListener.getConection();
            stmt = con.createStatement();
            stmt.execute(Disciplina.getCreatStatement());
            rs = stmt.executeQuery("SELECT * FROM disciplinas");
            
                while (rs.next()) {
                    list.add(new Disciplina (
                            rs.getString("nome"),
                            rs.getString("ementa"),
                            rs.getInt("ciclo"),
                            rs.getFloat("nota")));
                }

        } catch (Exception e) {
            methodEx = ex;
        } finally {
            try {
                  stmt.close();
               con.close();
            } catch (Exception e) {}
            if (methodEx !=null) throw methodEx;
            return list;
            }
        

       
        
        }
    
           public static void insert (String nome, String ementa, int ciclo, float nota) throws Exception {
       Connection con = null;
        PreparedStatement stmt = null;
        Exception methodEx = null;
        ResultSet rs = null;

try {
    con = dbListener.getConection();
    stmt = con.prepareStatement("INSERT  INTO disciplinas values(?,?,?,?)");
        stmt.setString(1, nome);
        stmt.setString(2, ementa);
        stmt.setString(3, " "  + ciclo);
        stmt.setString(4, " " + nota);
        stmt.execute();
} catch (Exception ex) {
    methodEx = ex;
} finally {
      try {
                stmt.close();
               con.close();
            } catch (Exception e) { }
        }
}

        public static void update (String nomeAntigo, String nome, String ementa, int ciclo, float nota) throws Exception {
       Connection con = null;
        PreparedStatement stmt = null;
        Exception methodEx = null;
        ResultSet rs = null;

try {
    con = dbListener.getConection();
    stmt = con.prepareStatement("UPDATE disciplinas SET nome=?, ementa=?, ciclo=?, nota=? WHERE nome=?");
        stmt.setString(1, nome);
        stmt.setString(2, ementa);
        stmt.setString(3, " "  + ciclo);
        stmt.setString(4, " " + nota);
        stmt.setString(5, " " + nomeAntigo);
        stmt.execute();
} catch (Exception ex) {
    methodEx = ex;
} finally {
      try {
                stmt.close();
               con.close();
            } catch (Exception e) { }
        }
}
           
        public static void delete (String nome) throws Exception {
       Connection con = null;
        PreparedStatement stmt = null;
        Exception methodEx = null;
        ResultSet rs = null;

try {
    con = dbListener.getConection();
    stmt = con.prepareStatement("DELETE FROM disciplinas WHERE nome=?");
        stmt.setString(1, nome);
        stmt.execute();
} catch (Exception ex) {
    methodEx = ex;
} finally {
      try {
                stmt.close();
               con.close();
            } catch (Exception e) { }
        }
}          
          
            public Disciplina(String nome, String ementa, int ciclo, float nota) {
        this.nome  = nome;
        this.ementa = ementa;
        this.ciclo = ciclo;
        this.nota = nota;
            }
            
    public String getNome() {
    return nome;
}
    
    public String getEmenta(){
        return ementa;
    }
    
    public int getCiclo(){
        return ciclo;
    }
    
    public float getNota(){
        return nota;
    }
    
    public void setNota(float value){
        nota = value;
    }
    
public static String getCreatStatement(){
    return "CREATLE TABLE IF NOT EXISTS disciplinas ("
            + "nome VARCHAR(50) PRIMARY KEY,"
            + "ementa VARCHAT(100) NOT NULL,"
            + "ciclo int,"
            + "nota float )";
    }





    
   
}