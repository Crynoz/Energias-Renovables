<%@page import="java.util.stream.Collectors"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
   <%
    // Configurar la conexión a la base de datos
    String url = "jdbc:mysql://localhost:3307/EnergyManagement";
    String usuario = "root";
    String contraseña = "";

    // Inicializamos listas para almacenar los años, la producción y el consumo
    List<Integer> years = new ArrayList<>();
    List<Double> productionData = new ArrayList<>();
    List<Double> consumptionData = new ArrayList<>();
    
     //Inicializamos listas para almacenar los datos de la nueva consulta
    List<String> energySources = new ArrayList<>();
    List<Double> totalProduction = new ArrayList<>();
    List<Double> percentages = new ArrayList<>();

    // Establecer la conexión a la base de datos y ejecutar la consulta
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, usuario, contraseña);
        Statement stmt = conn.createStatement();
        String sql = "SELECT year, SUM(production) AS produccion_total, SUM(consumption) AS consumo_total FROM energydata GROUP BY year ORDER BY year;"; // Asumiendo que tienes una tabla EnergyData
        ResultSet rs = stmt.executeQuery(sql);

        // Obtener los datos y almacenarlos en las listas
        while (rs.next()) {
            years.add(rs.getInt("year"));
            productionData.add(rs.getDouble("produccion_total"));
            consumptionData.add(rs.getDouble("consumo_total"));
        }
        String sql2="SELECT es.name AS fuente, SUM(ed.production) AS produccion_total, round((SUM(ed.production) / total_produccion.total * 100),1) AS porcentaje FROM energydata ed JOIN EnergySource es ON ed.source_id = es.id JOIN ( SELECT SUM(production) AS total FROM energydata ) AS total_produccion ON 1 = 1 GROUP BY es.name, total_produccion.total ORDER BY porcentaje DESC;";
        ResultSet rs2 = stmt.executeQuery(sql2);
        while (rs2.next()) {
            energySources.add(rs2.getString("fuente"));
            totalProduction.add(rs2.getDouble("produccion_total"));
            percentages.add(rs2.getDouble("porcentaje"));
        }
        
        // Cerrar la conexión
        rs.close();
        rs2.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
    

    
    // Convertir las listas en cadenas para pasar a JavaScript
    
    String yearsJs = years.stream().map(String::valueOf).collect(Collectors.joining(","));
    String productionJs = productionData.stream().map(String::valueOf).collect(Collectors.joining(","));
    String consumptionJs = consumptionData.stream().map(String::valueOf).collect(Collectors.joining(","));
    // Para la segunda consulta
    String energySourcesJs = energySources.stream().map(String::valueOf).collect(Collectors.joining("','", "'", "'"));
    String totalProductionJs = totalProduction.stream().map(String::valueOf).collect(Collectors.joining(","));
    String percentagesJs = percentages.stream().map(String::valueOf).collect(Collectors.joining(","));
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Energy Track - Energías Renovables en Caldas</title>
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.css" rel="stylesheet" />
    <head>
        <!-- Agregar el enlace a Google Fonts para Roboto -->
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Fira+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Montserrat:ital,wght@0,100..900;1,100..900&family=Roboto+Mono:ital,wght@0,100..700;1,100..700&display=swap" rel="stylesheet">
    </head>


    <script src="https://cdn.jsdelivr.net/npm/flowbite@2.5.2/dist/flowbite.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>



    <style>

        /* Estilos personalizados adicionales */
        body {
            font-family: "Fira Sans", sans-serif;
            font-weight: 400;
            font-style: normal;
            font-size: 20px;

        }
        .hero-section {
            background: linear-gradient(135deg, #090922, #0a639e);
            color: white;
        }
        .card-hover:hover {
            transform: scale(1.05);
            transition: transform 0.3s ease;
        }
        h1, h2, h3, h4, h5, h6 {
            color: #145a32;
        }

        .slide {
            display: none;
            width: 100%;
            height: 400px; /* Establecer un alto fijo para el slider */
            position: absolute;
            top: 0;
            left: 0;
        }

        .slide.active {
            display: block;
        }

        /* Fondo oscuro para mejorar la visibilidad del texto */
        .slide .absolute {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }

        .slide .text-white {
            position: absolute;
            bottom: 0; /* Asegurarnos de que el texto esté en la parte inferior */
            left: 0;
            width: 100%;
            padding: 1.5rem; /* Espaciado del texto */
            background-color: rgba(0, 0, 0, 0.4); /* Fondo oscuro más suave */
            font-size: 1.125rem; /* Tamaño del texto */
            color: white; /* Color del texto en blanco */
            font-weight: bold; /* Hacer que el texto sea más destacado */
            text-align: center; /* Asegurarse de que el texto esté centrado */
        }

        /* Ajustes adicionales para hacer que el texto sea más legible */
        .text-white p {
            font-size: 1.1rem;
            line-height: 1.5;
        }

        /* Mejorar la visibilidad en pantallas pequeñas */
        @media (max-width: 768px) {
            .text-white p {
                font-size: 1rem; /* Reducir el tamaño del texto en pantallas más pequeñas */
            }
        }


    </style>
</head>
<body class="bg-gray-100">
    <!-- Encabezado con Banner y Navegación -->
    <header class="hero-section py-6">
        <div class="container mx-auto px-4">
            <div class="flex items-center justify-between">
                <img src="images/sloganprev.png" alt="Energía Renovable" class="w-80 h-50 rounded-lg shadow-lg">

                <div class="text-center flex-grow">
                    <h1 class="text-6xl font-bold mb-2" style="color:#f39c12  ">Energy Track</h1>
                    <h3 class="text-2xl font-bold mb-4" style="color: #0de314;">Energia verde, orgullo de Caldas</h3>

                    <nav class="flex justify-center space-x-4 bg-gray-900 p-4 shadow-md rounded-lg">
                        <a href="index.jsp" 
                           class="relative text-white text-lg font-semibold hover:text-green-300 transition duration-300 px-2">
                            Inicio
                            <span class="absolute bottom-0 left-0 h-0.5 w-0 bg-green-300 transition-all duration-300 hover:w-full"></span>
                        </a>

                        <a href="tablas.jsp" 
                           class="relative text-white text-lg font-semibold hover:text-green-300 transition duration-300 px-2">
                            Tablas de datos
                            <span class="absolute bottom-0 left-0 h-0.5 w-0 bg-green-300 transition-all duration-300 hover:w-full"></span>
                        </a>
                        <a href="tipsEnergia.jsp" 
                           class="relative text-white text-lg font-semibold hover:text-green-300 transition duration-300 px-2">
                            Tips de Ahorro
                            <span class="absolute bottom-0 left-0 h-0.5 w-0 bg-green-300 transition-all duration-300 hover:w-full"></span>
                        </a>
                    </nav>

                </div>
            </div>
        </div>
    </header>
    <!-- Sección de Datos Energéticos -->
    <section id="datosenergeticos" class="container mx-auto py-16 px-4">
        <div class="grid md:grid-cols-2 gap-12">
            <!-- Gráfica -->
            <div class="bg-white rounded-lg shadow-lg p-8">
                <h3 class="text-2xl font-bold mb-6 text-center">Tendencia Energética en Caldas</h3>
                <canvas id="energyChart"></canvas>
            </div>
            <div class="bg-white rounded-lg shadow-lg p-8">
                <h3 class="text-2xl font-bold mb-6 text-center">Division de Energias en Caldas</h3>
                <canvas id="energyTorta"></canvas>
            </div>



        </div>
    </section>
    <!-- Pie de Página -->
    <footer class="bg-gray-800 text-white py-8 text-center">
        <div class="container mx-auto">
            <h4 class="text-xl mb-4" style="color:white">Desarrollado por:</h4>
            <ul class="flex justify-center space-x-6">
                <li>Alejandra Londoño Usma</li>
                <li>Cristian Alejandro Castellanos Torres</li>
                <li>Luis Enrique Valencia García</li>
            </ul>
            <p class="mt-4 text-sm text-gray-400">&copy; 2024 Energías Renovables de Caldas</p>
        </div>
    </footer>

    <script>
        // Configuración de la gráfica barras
        var ctx = document.getElementById('energyChart').getContext('2d');
        var chart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: [<%= yearsJs %>],
                datasets: [
                    {
                        label: 'Producción (MWh)',
                        data: [<%= productionJs %>],
                        backgroundColor: 'rgba(54, 162, 235, 0.6)'
                    },
                    {
                        label: 'Consumo (MWh)',
                        data: [<%= consumptionJs %>],
                        backgroundColor: 'rgba(255, 99, 132, 0.6)'
                    }
                ]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
        var ctx2 = document.getElementById('energyTorta').getContext('2d');
    var chart2 = new Chart(ctx2, {
        type: 'pie',  // Gráfico tipo torta (pie)
        data: {
            labels: [<%= energySourcesJs %>],  // Nombres de las fuentes de energía
            datasets: [{
                data: [<%= percentagesJs %>],  // Producción total por fuente de energía
                backgroundColor: [
                    '#045D5D',  // Verde claro
                    '#BCC6CC',  // Violeta
                      // Magenta
                    '#007C80'   // Amarillo (puedes añadir más colores si tienes más fuentes)
                ],
                borderColor: 'rgba(0, 0, 0, 1)',  // Borde de los segmentos
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'top',
                },
                tooltip: {
                    callbacks: {
                        label: function(tooltipItem) {
                            var percentage = tooltipItem.raw.toFixed(1);
                            return tooltipItem.label + ': ' + percentage + '%';
                        }
                    }
                }
            }
        }
    });



    </script>

</body>
</html>