public class Entrenador {
    private String id;
    private String nombre;
    private String equipo;

    public Entrenador(String id, String nombre, String equipo) {
        this.id = id;
        this.nombre = nombre;
        this.equipo = equipo;
    }

    public String getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public String getEquipo() {
        return equipo;
    }

    @Override
    public String toString() {
        return id + "," + nombre + "," + equipo;
    }

    public static Entrenador fromCSV(String csvLine) {
        String[] parts = csvLine.split(",");
        return new Entrenador(parts[0], parts[1], parts[2]);
    }
}
