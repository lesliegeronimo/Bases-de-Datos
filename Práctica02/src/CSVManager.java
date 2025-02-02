import java.io.*;
import java.util.*;

public class CSVManager {

    public static List<String> leerCSV(String archivo) {
        // Verificar si el archivo existe, si no, crearlo vacío
        File file = new File(archivo);
        if (!file.exists()) {
            try {
                file.createNewFile();  // Crear el archivo vacío
            } catch (IOException e) {
                System.out.println("Error al crear el archivo: " + e.getMessage());
                return new ArrayList<>();
            }
        }

        List<String> lineas = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(archivo))) {
            String linea;
            while ((linea = br.readLine()) != null) {
                lineas.add(linea);
            }
        } catch (IOException e) {
            System.out.println("Error al leer el archivo: " + e.getMessage());
        }
        return lineas;
    }

    public static void escribirCSV(String archivo, List<String> lineas) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(archivo))) {
            for (String linea : lineas) {
                bw.write(linea);
                bw.newLine();
            }
        } catch (IOException e) {
            System.out.println("Error al escribir en el archivo: " + e.getMessage());
        }
    }

    public static void agregarLineaCSV(String archivo, String linea) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(archivo, true))) {
            bw.write(linea);
            bw.newLine();
        } catch (IOException e) {
            System.out.println("Error al agregar al archivo: " + e.getMessage());
        }
    }
}
