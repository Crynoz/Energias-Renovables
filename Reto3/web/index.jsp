<%-- 
    Document   : index
    Created on : 5/12/2024, 9:16:22 p. m.
    Author     : blincc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <a href="#index" 
       class="relative text-white text-lg font-semibold hover:text-green-300 transition duration-300 px-2">
        Inicio
        <span class="absolute bottom-0 left-0 h-0.5 w-0 bg-green-300 transition-all duration-300 hover:w-full"></span>
    </a>
    <a href="tablas.jsp" 
       class="relative text-white text-lg font-semibold hover:text-green-300 transition duration-300 px-2">
        Tablas de datos
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
 <!-- Sección de inicio -->


<section id="inicio" class="container mx-auto py-16 px-4">
    <h2 class="text-5xl font-bold text-center mb-12" style="color: #145a32;">Caldas como potencia en energías renovables</h2>
    <div class="relative">
        <!-- Slider -->
        <div class="relative overflow-hidden" style="position:relative; height: 400px;">
            <!-- Slide 1 -->
            <div class="slide active">
                <img src="images/norcasia2.jpeg" alt="Parque Solar" class="w-full h-full object-cover">
                <!-- Fondo oscuro con opacidad para el texto -->
                <div class="absolute inset-0 bg-black opacity-50"></div>
                <div class="absolute bottom-0 left-0 p-6 text-white">
                    <p class="text-lg font-semibold">
                        Las energías renovables son aquellas que se obtienen a partir de fuentes naturales que producen energía de forma inagotable e indefinida. La energía solar, la energía eólica o la energía mareomotriz generan fuentes de energía renovable. Las energías renovables se consideran limpias porque son inagotables y producen bajo impacto en el medio ambiente. Las energías que se consumen, en la actualidad, son obtenidas de fuentes no renovables, como los combustibles fósiles y la energía nuclear. Ellas generan un alto impacto negativo sobre el medio ambiente.
                    </p>
                </div>
            </div>
            <!-- Slide 2 -->
            <div class="slide">
                <img src="images/eolica.jpg" alt="Energía Solar" class="w-full h-full object-cover">
                <div class="absolute inset-0 bg-black opacity-50"></div>
                <div class="absolute bottom-0 left-0 p-6 text-white">
                    <p class="text-lg font-semibold">
                       El departamento de Caldas, ubicado en la región central de Colombia, se perfila como una futura potencia energética del país gracias a su diversificación en fuentes de energía renovable. Este territorio, estratégicamente situado en la zona andina, cuenta con un vasto potencial hidroeléctrico, solar y eólico, lo que le permite aprovechar al máximo sus recursos naturales.
                    </p>
                </div>
            </div>
            <!-- Slide 3 -->
            <div class="slide active">
                <img src="images/paneles u de caldas.jpeg" alt="Parque Solar" class="w-full h-full object-cover">
                <!-- Fondo oscuro con opacidad para el texto -->
                <div class="absolute inset-0 bg-black opacity-50"></div>
                <div class="absolute bottom-0 left-0 p-6 text-white">
                    <p class="text-lg font-semibold">
                       Las iniciativas en energías renovables que se han implementado en la región, como la expansión de centrales hidroeléctricas y proyectos solares, consolidan a Caldas como un referente clave en la transición energética de Colombia. Con el creciente desarrollo de estas fuentes limpias, Caldas no solo se posiciona como un actor crucial en el suministro de energía sostenible, sino también como un modelo de innovación y sostenibilidad dentro del país.
                    </p>
                </div>
            </div>
        </div>

        <!-- Controles de navegación -->
        <button class="absolute top-1/2 left-4 transform -translate-y-1/2 bg-gray-700 text-white p-2 rounded-full hover:bg-green-500" id="prevBtn">
            &lt;
        </button>
        <button class="absolute top-1/2 right-4 transform -translate-y-1/2 bg-gray-700 text-white p-2 rounded-full hover:bg-green-500" id="nextBtn">
            &gt;
        </button>
    </div>
</section>





    <!-- Sección de Centrales Hidroeléctricas -->
    <section id="plantas" class="container mx-auto py-16 px-4">
        <h2 class="text-3xl font-bold text-center mb-12" >Principales Generadores de Energia en  Caldas</h2>
        
        <div class="grid md:grid-cols-3 gap-8">
            <div class="bg-white rounded-lg shadow-lg overflow-hidden card-hover">
                <img src="images/tepuy.jpeg" alt="Parque Solar" class="w-full h-56 object-cover">
                <div class="p-6">
                    <h3 class="text-xl font-semibold mb-4">Parque Solar Tepuy</h3>
                    <p>Ubicado en La Dorada, Caldas, con una capacidad nominal de 83 MW suficiente para abastecer una ciudad de 400 mil habitantes aproximadamente. Cuenta con 199.534 paneles fotovoltaicos bifaciales. La vida útil del parque solar está estimada en 35 años.</p>
                </div>
            </div>
            
            <div class="bg-white rounded-lg shadow-lg overflow-hidden card-hover">
                <img src="images/miel.jpg" alt="Central Hidroeléctrica" class="w-full h-56 object-cover">
                <div class="p-6">
                    <h3 class="text-xl font-semibold mb-4">Central Hidroeléctrica La Miel</h3>
                    <p>Está localizada en el municipio de Norcasia con una capacidad de 406 MW. Esta central es una de las principales en Colombia operada  por la empresa ISAGEN, una de las empresas más grandes del sector energético en el país.
                    </p>
                </div>
            </div>
            
            <div class="bg-white rounded-lg shadow-lg overflow-hidden card-hover">
                <img src="images/esmeralda.jpeg" alt="Central Hidroeléctrica 3" class="w-full h-56 object-cover">
                <div class="p-6">
                    <h3 class="text-xl font-semibold mb-4">Central Hidroeléctrica La Esmeralda</h3>
                    <p>Ubicada en Chinchina, Caldas con una capacidad Nominal 30 MW y Capacidad efectiva neta 17 MW.
                    </p>
                </div>
            </div>
        </div>
    </section>

    <!-- Sección de Centrales menores-->
    <section id="menores" class="container mx-auto py-16 px-4">
        <h2 class="text-3xl font-bold text-center mb-12">Plantas de Generacion de Energia Menores en Caldas</h2>
        
          
        <div class="grid md:grid-cols-3 gap-8">
            <div class="bg-white rounded-lg shadow-lg overflow-hidden card-hover">
                <img src="images/sancancio.jpg" alt="Parque Solar" class="w-full h-56 object-cover">
                <div class="p-6">
                    <h3 class="text-xl font-semibold mb-4">Central Hidroeléctrica Sancancio </h3>
                    
                </div>
            </div>
            
            <div class="bg-white rounded-lg shadow-lg overflow-hidden card-hover">
                <img src="images/municipal.jpg" alt="Central Hidroeléctrica" class="w-full h-56 object-cover">
                <div class="p-6">
                    <h3 class="text-xl font-semibold mb-4">Central Hidroeléctrica Municipal</h3>
                    
                </div>
            </div>
            
            <div class="bg-white rounded-lg shadow-lg overflow-hidden card-hover">
                <img src="images/guacaica.jpg" alt="Central Hidroeléctrica 3" class="w-full h-56 object-cover">
                <div class="p-6">
                    <h3 class="text-xl font-semibold mb-4">Central Hidroeléctrica Guacaica</h3>
                    
                   
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

