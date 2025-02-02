public class Disciplina {
    private String id;
    private String nombre;

    public Disciplina(String id, String nombre) {
        this.id = id;
        this.nombre = nombre;
    }

    public String getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    @Override
    public String toString() {
        return id + "," + nombre;
    }

    public static Disciplina fromCSV(String csvLine) {
        String[] parts = csvLine.split(",");
        return new Disciplina(parts[0], parts[1]);
    }
}
