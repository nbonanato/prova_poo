package prova_poo;
import java.util.ArrayList;
                
public class Disciplina {
    
    String nome;
    String ementa;
    int ciclo;
    float nota;
    
    ArrayList<Disciplina> disciplinas = new ArrayList<>();
    
    
    public Disciplina(String nome, String ementa, int ciclo) {
        this.nome  = nome;
        this.ementa = ementa;
        this.ciclo = ciclo;
       
    }
    
    public void addDisciplina(Disciplina disciplina){
        disciplinas.add(disciplina);
    }
    
    public ArrayList<Disciplina> getList() {
        return disciplinas;
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
    
    public void setList(ArrayList<Disciplina> list){
        disciplinas = list;
    }
    
}