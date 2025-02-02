import java.util.*;

public class Main {

    private static final String ARCHIVO_ATLETAS = "atletas.csv";
    private static final String ARCHIVO_ENTRENADORES = "entrenadores.csv";
    private static final String ARCHIVO_DISCIPLINAS = "disciplinas.csv";

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int opcion = 0;

        while (true) {
            mostrarMenu();
            try {
                System.out.print("Seleccione una opción: ");
                opcion = scanner.nextInt();
                
                if (opcion < 1 || opcion > 13) {
                    System.out.println("Opción no válida. Intente nuevamente.");
                    continue;
                }

                switch (opcion) {
                    case 1:
                        agregarAtleta(scanner);
                        break;
                    case 2:
                        consultarAtleta(scanner);
                        break;
                    case 3:
                        editarAtleta(scanner);
                        break;
                    case 4:
                        eliminarAtleta(scanner);
                        break;
                    case 5:
                        agregarEntrenador(scanner);
                        break;
                    case 6:
                        consultarEntrenador(scanner);
                        break;
                    case 7:
                        editarEntrenador(scanner);
                        break;
                    case 8:
                        eliminarEntrenador(scanner);
                        break;
                    case 9:
                        agregarDisciplina(scanner);
                        break;
                    case 10:
                        consultarDisciplina(scanner);
                        break;
                    case 11:
                        editarDisciplina(scanner);
                        break;
                    case 12:
                        eliminarDisciplina(scanner);
                        break;
                    case 13:
                        System.out.println("Saliendo del programa...");
                        scanner.close();
                        return; // Sale del método main
                    default:
                        System.out.println("Opción no válida.");
                }
            } catch (InputMismatchException e) {
                System.out.println("Entrada inválida. Por favor ingrese un número entre 1 y 13.");
                scanner.next(); // Consumir la entrada inválida
            }
        }
    }

    private static void mostrarMenu() {
        System.out.println("Menú de Interacción");
        System.out.println("1. Agregar Atleta");
        System.out.println("2. Consultar Atleta");
        System.out.println("3. Editar Atleta");
        System.out.println("4. Eliminar Atleta");
        System.out.println("5. Agregar Entrenador");
        System.out.println("6. Consultar Entrenador");
        System.out.println("7. Editar Entrenador");
        System.out.println("8. Eliminar Entrenador");
        System.out.println("9. Agregar Disciplina");
        System.out.println("10. Consultar Disciplina");
        System.out.println("11. Editar Disciplina");
        System.out.println("12. Eliminar Disciplina");
        System.out.println("13. Salir");
    }

    private static void agregarAtleta(Scanner scanner) {
        System.out.print("Ingrese el ID del atleta: ");
        String id = scanner.next();
        scanner.nextLine();
        
        // Verificar si el ID ya existe
        List<String> lineas = CSVManager.leerCSV(ARCHIVO_ATLETAS);
        for (String linea : lineas) {
            Atleta atletaExistente = Atleta.fromCSV(linea);
            if (atletaExistente.getId().equals(id)) {
                System.out.println("Error: Ya existe un atleta con el ID " + id);
                return;  // No se permite registrar un atleta con el mismo ID
            }
        }
    
        System.out.print("Ingrese el nombre del atleta: ");
        String nombre = scanner.nextLine();
        System.out.print("Ingrese la edad del atleta (solo número): ");
        
        // Validar que la edad sea un número
        int edad;
        while (true) {
            if (scanner.hasNextInt()) {
                edad = scanner.nextInt();
                scanner.nextLine();
                break;
            } else {
                System.out.println("Edad inválida, por favor ingrese un número.");
                scanner.next();
            }
        }
        
        System.out.print("Ingrese la disciplina del atleta: ");
        String disciplina = scanner.nextLine();
        
        Atleta atleta = new Atleta(id, nombre, edad, disciplina);
        CSVManager.agregarLineaCSV(ARCHIVO_ATLETAS, atleta.toString());
        System.out.println("Atleta agregado exitosamente.");
    }
    
    

    private static void consultarAtleta(Scanner scanner) {
        System.out.print("Ingrese el ID del atleta a consultar: ");
        String id = scanner.next();

        List<String> lineas = CSVManager.leerCSV(ARCHIVO_ATLETAS);
        for (String linea : lineas) {
            Atleta atleta = Atleta.fromCSV(linea);
            if (atleta.getId().equals(id)) {
                System.out.println("Atleta encontrado: " + atleta);
                return;
            }
        }
        System.out.println("Atleta no encontrado.");
    }

    private static void editarAtleta(Scanner scanner) {
        System.out.print("Ingrese el ID del atleta a editar: ");
        String id = scanner.next();

        List<String> lineas = CSVManager.leerCSV(ARCHIVO_ATLETAS);
        List<String> nuevasLineas = new ArrayList<>();
        boolean encontrado = false;

        for (String linea : lineas) {
            Atleta atleta = Atleta.fromCSV(linea);
            if (atleta.getId().equals(id)) {
                System.out.print("Ingrese el nuevo nombre: ");
                String nombre = scanner.next();
                System.out.print("Ingrese la nueva edad: ");
                int edad = scanner.nextInt();
                System.out.print("Ingrese la nueva disciplina: ");
                String disciplina = scanner.next();

                atleta = new Atleta(id, nombre, edad, disciplina);
                encontrado = true;
            }
            nuevasLineas.add(atleta.toString());
        }

        if (encontrado) {
            CSVManager.escribirCSV(ARCHIVO_ATLETAS, nuevasLineas);
            System.out.println("Atleta editado exitosamente.");
        } else {
            System.out.println("Atleta no encontrado.");
        }
    }

    private static void eliminarAtleta(Scanner scanner) {
        System.out.print("Ingrese el ID del atleta a eliminar: ");
        String id = scanner.next();

        List<String> lineas = CSVManager.leerCSV(ARCHIVO_ATLETAS);
        List<String> nuevasLineas = new ArrayList<>();
        boolean encontrado = false;

        for (String linea : lineas) {
            Atleta atleta = Atleta.fromCSV(linea);
            if (!atleta.getId().equals(id)) {
                nuevasLineas.add(linea);
            } else {
                encontrado = true;
            }
        }

        if (encontrado) {
            CSVManager.escribirCSV(ARCHIVO_ATLETAS, nuevasLineas);
            System.out.println("Atleta eliminado exitosamente.");
        } else {
            System.out.println("Atleta no encontrado.");
        }
    }

    private static void agregarEntrenador(Scanner scanner) {
        System.out.print("Ingrese el ID del entrenador: ");
        String id = scanner.next();
        scanner.nextLine();
        
        // Verificar si el ID ya existe
        List<String> lineas = CSVManager.leerCSV(ARCHIVO_ENTRENADORES);
        for (String linea : lineas) {
            Entrenador entrenadorExistente = Entrenador.fromCSV(linea);
            if (entrenadorExistente.getId().equals(id)) {
                System.out.println("Error: Ya existe un entrenador con el ID " + id);
                return;  // No se permite registrar un entrenador con el mismo ID
            }
        }
    
        System.out.print("Ingrese el nombre del entrenador: ");
        String nombre = scanner.nextLine();
        System.out.print("Ingrese el equipo del entrenador: ");
        String equipo = scanner.nextLine();
        
        Entrenador entrenador = new Entrenador(id, nombre, equipo);
        CSVManager.agregarLineaCSV(ARCHIVO_ENTRENADORES, entrenador.toString());
        System.out.println("Entrenador agregado exitosamente.");
    }
    

    private static void consultarEntrenador(Scanner scanner) {
        System.out.print("Ingrese el ID del entrenador a consultar: ");
        String id = scanner.next();

        List<String> lineas = CSVManager.leerCSV(ARCHIVO_ENTRENADORES);
        for (String linea : lineas) {
            Entrenador entrenador = Entrenador.fromCSV(linea);
            if (entrenador.getId().equals(id)) {
                System.out.println("Entrenador encontrado: " + entrenador);
                return;
            }
        }
        System.out.println("Entrenador no encontrado.");
    }

    private static void editarEntrenador(Scanner scanner) {
        System.out.print("Ingrese el ID del entrenador a editar: ");
        String id = scanner.next();

        List<String> lineas = CSVManager.leerCSV(ARCHIVO_ENTRENADORES);
        List<String> nuevasLineas = new ArrayList<>();
        boolean encontrado = false;

        for (String linea : lineas) {
            Entrenador entrenador = Entrenador.fromCSV(linea);
            if (entrenador.getId().equals(id)) {
                System.out.print("Ingrese el nuevo nombre: ");
                String nombre = scanner.next();
                System.out.print("Ingrese el nuevo equipo: ");
                String equipo = scanner.next();

                entrenador = new Entrenador(id, nombre, equipo);
                encontrado = true;
            }
            nuevasLineas.add(entrenador.toString());
        }

        if (encontrado) {
            CSVManager.escribirCSV(ARCHIVO_ENTRENADORES, nuevasLineas);
            System.out.println("Entrenador editado exitosamente.");
        } else {
            System.out.println("Entrenador no encontrado.");
        }
    }

    private static void eliminarEntrenador(Scanner scanner) {
        System.out.print("Ingrese el ID del entrenador a eliminar: ");
        String id = scanner.next();

        List<String> lineas = CSVManager.leerCSV(ARCHIVO_ENTRENADORES);
        List<String> nuevasLineas = new ArrayList<>();
        boolean encontrado = false;

        for (String linea : lineas) {
            Entrenador entrenador = Entrenador.fromCSV(linea);
            if (!entrenador.getId().equals(id)) {
                nuevasLineas.add(linea);
            } else {
                encontrado = true;
            }
        }

        if (encontrado) {
            CSVManager.escribirCSV(ARCHIVO_ENTRENADORES, nuevasLineas);
            System.out.println("Entrenador eliminado exitosamente.");
        } else {
            System.out.println("Entrenador no encontrado.");
        }
    }

    private static void agregarDisciplina(Scanner scanner) {
        System.out.print("Ingrese el ID de la disciplina: ");
        String id = scanner.next();
        scanner.nextLine();
        
        // Verificar si el ID ya existe
        List<String> lineas = CSVManager.leerCSV(ARCHIVO_DISCIPLINAS);
        for (String linea : lineas) {
            Disciplina disciplinaExistente = Disciplina.fromCSV(linea);
            if (disciplinaExistente.getId().equals(id)) {
                System.out.println("Error: Ya existe una disciplina con el ID " + id);
                return;  // No se permite registrar una disciplina con el mismo ID
            }
        }
    
        System.out.print("Ingrese el nombre de la disciplina: ");
        String nombre = scanner.nextLine();
        
        Disciplina disciplina = new Disciplina(id, nombre);
        CSVManager.agregarLineaCSV(ARCHIVO_DISCIPLINAS, disciplina.toString());
        System.out.println("Disciplina agregada exitosamente.");
    }
    

    private static void consultarDisciplina(Scanner scanner) {
        System.out.print("Ingrese el ID de la disciplina a consultar: ");
        String id = scanner.next();

        List<String> lineas = CSVManager.leerCSV(ARCHIVO_DISCIPLINAS);
        for (String linea : lineas) {
            Disciplina disciplina = Disciplina.fromCSV(linea);
            if (disciplina.getId().equals(id)) {
                System.out.println("Disciplina encontrada: " + disciplina);
                return;
            }
        }
        System.out.println("Disciplina no encontrada.");
    }

    private static void editarDisciplina(Scanner scanner) {
        System.out.print("Ingrese el ID de la disciplina a editar: ");
        String id = scanner.next();

        List<String> lineas = CSVManager.leerCSV(ARCHIVO_DISCIPLINAS);
        List<String> nuevasLineas = new ArrayList<>();
        boolean encontrado = false;

        for (String linea : lineas) {
            Disciplina disciplina = Disciplina.fromCSV(linea);
            if (disciplina.getId().equals(id)) {
                System.out.print("Ingrese el nuevo nombre: ");
                String nombre = scanner.next();

                disciplina = new Disciplina(id, nombre);
                encontrado = true;
            }
            nuevasLineas.add(disciplina.toString());
        }

        if (encontrado) {
            CSVManager.escribirCSV(ARCHIVO_DISCIPLINAS, nuevasLineas);
            System.out.println("Disciplina editada exitosamente.");
        } else {
            System.out.println("Disciplina no encontrada.");
        }
    }

    private static void eliminarDisciplina(Scanner scanner) {
        System.out.print("Ingrese el ID de la disciplina a eliminar: ");
        String id = scanner.next();

        List<String> lineas = CSVManager.leerCSV(ARCHIVO_DISCIPLINAS);
        List<String> nuevasLineas = new ArrayList<>();
        boolean encontrado = false;

        for (String linea : lineas) {
            Disciplina disciplina = Disciplina.fromCSV(linea);
            if (!disciplina.getId().equals(id)) {
                nuevasLineas.add(linea);
            } else {
                encontrado = true;
            }
        }

        if (encontrado) {
            CSVManager.escribirCSV(ARCHIVO_DISCIPLINAS, nuevasLineas);
            System.out.println("Disciplina eliminada exitosamente.");
        } else {
            System.out.println("Disciplina no encontrada.");
        }
    }
}
