public class Atleta {
    private String id;
    private String nombre;
    private int edad;
    private String disciplina;

    public Atleta(String id, String nombre, int edad, String disciplina) {
        this.id = id;
        this.nombre = nombre;
        this.edad = edad;
        this.disciplina = disciplina;
    }

    public String getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public int getEdad() {
        return edad;
    }

    public String getDisciplina() {
        return disciplina;
    }

    @Override
    public String toString() {
        return id + "," + nombre + "," + edad + "," + disciplina;
    }

    public static Atleta fromCSV(String csvLine) {
        String[] parts = csvLine.split(",");
        return new Atleta(parts[0], parts[1], Integer.parseInt(parts[2]), parts[3]);
    }
}
