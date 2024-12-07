<%@ page import="java.sql.*,java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

                        <a href="graficas.jsp" 
                           class="relative text-white text-lg font-semibold hover:text-green-300 transition duration-300 px-2">
                            Graficas de datos
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
            <!-- Tabla de Datos # 1-->
            <div class="bg-white rounded-lg shadow-lg p-8">
                <h3 class="text-2xl font-bold mb-6 text-center">Energias en Caldas</h3>   

                <table class="w-full text-center" style="text-align: left;">
                    <thead class="bg-gray-200">
                        <tr>
                            <th class="p-3">ID</th>
                            <th class="p-3">Name</th>
                            <th class="p-3">Description</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            // Configuración de la conexión a la base de datos
                            String url = "jdbc:mysql://localhost:3307/EnergyManagement"; // URL de la base de datos
                            String usuarioDB = "root"; // Usuario de MySQL
                            String claveDB = ""; // Contraseña de MySQL

                            // Establecer la conexión
                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection conn = DriverManager.getConnection(url, usuarioDB, claveDB);
                                Statement stmt = conn.createStatement();
                                String sql = "SELECT * FROM EnergySource"; // Consulta SQL para obtener los usuarios
                                ResultSet rs = stmt.executeQuery(sql);

                                // Mostrar los resultados en la tabla HTML
                                while (rs.next()) {
                                    int id = rs.getInt("id");
                                    String name = rs.getString("name");
                                    String description = rs.getString("description");

                        %>
                        <tr class="border-b">
                            <td class="p-3"><%= id%></td>
                            <td class="p-3"><%= name%></td>
                            <td class="p-3"><%= description%></td>
                        </tr>
                        <%
                                }
                                // Cerrar la conexión
                                rs.close();
                                stmt.close();
                                conn.close();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <!-- Tabla de Datos #2-->
            <div class="bg-white rounded-lg shadow-lg p-8">
                <h3 class="text-2xl font-bold mb-6 text-center">Producción y Consumo Energético en Caldas</h3>   
                <div class="overflow-y-auto max-h-64">
                <table class="w-full text-center" style="text-align: left;">
                    <thead class="bg-gray-200 sticky top-0">
                        <tr>
                            <th class="p-3">Energia</th>
                            <th class="p-3">Año</th>
                            <th class="p-3">Produccion</th>
                            <th class="p-3">Consumo</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            // Configuración de la conexión a la base de datos
                            //
                            // Establecer la conexión
                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection conn = DriverManager.getConnection(url, usuarioDB, claveDB);
                                Statement stmt = conn.createStatement();
                                String sql = "SELECT a.year,a.production,a.consumption, b.name from energydata as a join EnergySource as b on a.source_id=b.id;"; // Consulta SQL para obtener los usuarios
                                ResultSet rs = stmt.executeQuery(sql);

                                // Mostrar los resultados en la tabla HTML
                                while (rs.next()) {
                                    int year = rs.getInt("year");
                                    String name = rs.getString("name");
                                    double production = rs.getDouble("production");
                                    double consumption = rs.getDouble("consumption");

                        %>
                        <tr class="border-b">
                            <td class="p-3"><%= name%></td>
                            <td class="p-3"><%= year%></td>
                            <td class="p-3"><%= production%></td>
                            <td class="p-3"><%= consumption%></td>
                        </tr>
                        <%
                                }
                                // Cerrar la conexión
                                rs.close();
                                stmt.close();
                                conn.close();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </tbody>
                </table>
                    </div>
            </div>
        </div>
    </section>
    <!-- Pie de Página -->
    <footer class="bg-gray-800 text-white py-8 text-center">
        <div class="container mx-auto">
            <h4 class="text-xl mb-4" style="color:white;">Desarrollado por:</h4>
            <ul class="flex justify-center space-x-6">
                <li>Alejandra Londoño Usma</li>
                <li>Cristian Alejandro Castellanos Torres</li>
                <li>Luis Enrique Valencia García</li>
            </ul>
            <p class="mt-4 text-sm text-gray-400">&copy; 2024 Energías Renovables de Caldas</p>
        </div>
    </footer>

    <script>
        // Configuración de la gráfica
        var ctx = document.getElementById('energyChart').getContext('2d');
        var chart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['2021', '2022', '2023'],
                datasets: [
                    {
                        label: 'Producción (MWh)',
                        data: [1245, 1350, 1475],
                        backgroundColor: 'rgba(54, 162, 235, 0.6)'
                    },
                    {
                        label: 'Consumo (MWh)',
                        data: [1100, 1220, 1340],
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
        let currentSlide = 0;
        const slides = document.querySelectorAll('.slide');
        const totalSlides = slides.length;

        function showSlide(index) {
            slides.forEach((slide, i) => {
                slide.classList.remove('active'); // Elimina la clase "active" de todos los slides
                if (i === index) {
                    slide.classList.add('active'); // Agrega la clase "active" al slide actual
                }
            });
        }

        document.getElementById('nextBtn').addEventListener('click', () => {
            currentSlide = (currentSlide + 1) % totalSlides;
            showSlide(currentSlide);
        });

        document.getElementById('prevBtn').addEventListener('click', () => {
            currentSlide = (currentSlide - 1 + totalSlides) % totalSlides;
            showSlide(currentSlide);
        });

// Inicializar el primer slide
        showSlide(currentSlide);




    </script>

</body>
</html>