#ESTE CODIGO ES PARA GENERAR LA GRAFICA DE LA CONSULTA 17
import psycopg2
import pandas as pd
import matplotlib.pyplot as plt

# Conexión a PostgreSQL
conn = psycopg2.connect(
    host="localhost",
    database="postgres",
    user="postgres",
    password="lesliE1402"
)

# Consulta SQL
query = """
SELECT 

    localidad.nombrelocalidad, 
    SUM(entrada.cantidad) AS total_entradas
FROM 
    entrada
JOIN 
    localidad ON entrada.idevento = localidad.idevento
GROUP BY 
    localidad.nombrelocalidad
ORDER BY 
    total_entradas DESC;
"""

# Ejecutar la consulta y cargar datos en un DataFrame
df = pd.read_sql_query(query, conn)

# Cerrar conexión
conn.close()

# Crear gráfica de barras
plt.figure(figsize=(10, 6))
plt.bar(df['nombrelocalidad'], df['total_entradas'], color='skyblue')
plt.xlabel('Localidades', fontsize=14)
plt.ylabel('Total Entradas Vendidas', fontsize=14)
plt.title('Entradas Vendidas por Localidad', fontsize=16)
plt.xticks(rotation=90)
plt.tight_layout()
plt.show()
