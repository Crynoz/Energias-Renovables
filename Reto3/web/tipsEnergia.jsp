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
    <a href="graficas.jsp" 
       class="relative text-white text-lg font-semibold hover:text-green-300 transition duration-300 px-2">
        Graficas de datos
        <span class="absolute bottom-0 left-0 h-0.5 w-0 bg-green-300 transition-all duration-300 hover:w-full"></span>
    </a>
    
</nav>

                </div>
            </div>
        </div>
    </header>
 <!-- Sección de inicio -->


<section id="inicio" class="container mx-auto py-16 px-4">
    <h2 class="text-5xl font-bold text-center mb-12" style="color: #145a32;">Tipos de energia</h2>
    <div class="container mx-auto px-4">
        
        
  <!-- Tres columnas -->
  <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-8">
    
    <!-- Columna 1: Energía Solar -->
    
    <div class="p-4 border rounded-lg shadow-md max-h-80 overflow-auto">
        
      <h2 class="text-3xl font-semibold mb-4">Energía Solar</h2>
      <p class="text-gray-700">Generación de electricidad a partir de la energía solar
Para generar electricidad, aprovechando la energía solar, se utilizan los paneles solares en los que se produce el efecto fotovoltaico.
Las celdas fotovoltaicas están constituidas por:
 Una superficie antirreflectante que facilita la absorción de la luz solar. 
Contactos metálicos, uno superior y otro inferior.
Dos semiconductores con cargas opuestas, separados por una junta neutra. La capa negativa (semiconductor N), capaz de ceder parte de sus electrones. La otra de tipo P acepta los electrones. La unión P-N genera un campo eléctrico con una barrera de potencial que impide que se trasladen electrones entre las placas
En la imagen se representa la estructura de una instalación fotovoltaica de autoconsumo conectada a la red:
Paneles solares (módulos fotovoltaicos): captan la energía solar y la convierten en electricidad en forma de corriente continua (DC).
El controlador de carga solar (opcional): dispositivo electrónico cuya función principal es gestionar el estado de carga de las baterías solares, asegurando una carga óptima para prolongar su vida útil. En el caso de no haber baterías no será necesaria su instalación.
 Batería de almacenamiento (opcional): almacenan el exceso de energía generada durante el día, permitiendo utilizarla en momentos de baja o nula producción solar, como durante la noche. Se conectan antes del inversor ya que estas almacenan la corriente en estado continuo. 
Inversor fotovoltaico: transforma la corriente continua (DC) generada por los paneles solares en corriente alterna (AC).
Red eléctrica (distribución): cuando los paneles solares no generan suficiente energía, puede consumir electricidad de la red. En situaciones donde la instalación genera más energía de la consumida, el exceso puede ser vertido en la red. 

                                                                                                    

                                                      
Cuadro eléctrico (protecciones): posee diferentes sistemas de protección (fusibles, interruptores) que garantizan la seguridad de la instalación por sobrecargas o cortocircuitos. 
Contador bidireccional: mide la energía consumida de la red eléctrica y la energía que inyecta en ella cuando el sistema fotovoltaico genera más electricidad de la necesaria. Permite calcular la compensación de excedentes. 
Sistema de monitorización: puede ser a través de una app o un software, permitiendo visualizar en tiempo real el consumo y la producción de energía.
</p>
    </div>
    
    <!-- Columna 2: Energía Eólica -->
    <div class="p-4 border rounded-lg shadow-md max-h-80 overflow-auto">
      <h2 class="text-3xl font-semibold mb-4">Energía Eólica</h2>
      <p class="text-gray-700">Una planta hidroeléctrica está constituida por las siguientes partes y su funcionamiento es el siguiente:
Un embalse, represa o depósito de agua.
Cerca del fondo de la pared de la presa se encuentra la toma de agua la cual pasa a través de túneles o tuberías.
Una o varias turbinas que giran por la fuerza del agua que cae por los túneles.
Los generadores, que están conectados con las turbinas y convierten la energía mecánica de las turbinas en electricidad. 
Los transformadores que convierten la tensión alterna de los generadores a un voltaje más alto adecuado para la transmisión de larga distancia. 
Líneas de transmisión para conducir la electricidad a los centros de distribución.
</p>
    </div>
    
    <!-- Columna 3: Energía Hidroeléctrica -->
    <div class="p-4 border rounded-lg shadow-md max-h-80 overflow-auto">
      <h2 class="text-3xl font-semibold mb-4">Energía Hidroeléctrica</h2>
      <p class="text-gray-700">La electricidad en una central eólica se produce de la siguiente manera:
El viento hace girar las palas del aerogenerador. 
El rotor convierte la energía cinética del viento en energía mecánica. 
Una caja de engranajes aumenta la velocidad de rotación de las palas, de entre 18 y 25 vueltas por minuto, hasta 1800 vueltas por minuto. 
El eje, conectado a la multiplicadora, transmite la energía mecánica al generador. 
El generador, que funciona con una turbina de imanes, transforma la energía mecánica en energía eléctrica. 
La corriente continua generada viaja por el mástil hasta un convertidor, que la transforma en corriente alterna. 
El transformador aumenta la tensión de la corriente alterna para que pueda distribuirse. 
La corriente alterna se envía a la subestación y, desde allí, a los hogares a través de la red de distribución.
</p>
    </div>
  
  </div>

  
</div>
    
    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-8">
    
    <!-- Columna 1: Energía Solar -->
    
    <div class="p-4 border rounded-lg shadow-md ">
      <p class="text-gray-700">
          <img src="images/instFoto.jpg" >
      <h3 class="text-3xl font-semibold mb-4 text-center">Planta Fotovoltaica</h3>
</p>
    </div>
    
    <!-- Columna 2: Energía Eólica -->
    <div class="p-4 border rounded-lg shadow-md ">
      
      <p class="text-gray-700">
          <img src="images/energiaeolica.jpg">
          <h3 class="text-3xl font-semibold mb-4 text-center">Planta Eólica</h3>
</p>
    </div>
    
    <!-- Columna 3: Energía Hidroeléctrica -->
    <div class="p-4 border rounded-lg shadow-md ">
      
      <p class="text-gray-700">
          <img src="images/centralhidroelectrica.jpg"><!-- comment -->
          <h3 class="text-3xl font-semibold mb-4 text-center">Planta Hidroeléctrica</h3>
</p>
    </div>
  
  </div>
    <div class="p-4 border rounded-lg shadow-md max-h-80 overflow-auto">
      
      <section id="ahorro" class="container mx-auto py-16 px-4">
  <h2 class="text-5xl font-bold text-center mb-12" style="color: #145a32;">Tips de Ahorro</h2>
  <ul class="list-disc list-inside space-y-4 text-gray-700 text-lg">
    <li>
      <strong>Utilizar bombillas LED:</strong> Son más eficientes y duran mucho más que las bombillas incandescentes.
    </li>
    <li>
      <strong>Aprovechar la luz natural:</strong> Abre cortinas y persianas durante el día para reducir el uso de luces artificiales.
    </li>
    <li>
      <strong>Desenchufar aparatos eléctricos:</strong> Los dispositivos en modo de espera (standby) siguen consumiendo electricidad.
    </li>
    <li>
      <strong>Usa temporizadores:</strong> Configura horarios para que los electrodomésticos se apaguen automáticamente.
    </li>
    <li>
      <strong>Usa regletas con interruptor:</strong> Conecta varios dispositivos y apágalos todos a la vez al no necesitarlos.
    </li>
    <li>
      <strong>Apagar las luces:</strong> Asegúrate de apagar las luces al salir de una habitación.
    </li>
    <li>
      <strong>Contratar una tarifa de luz adecuada:</strong> Infórmate sobre planes que se ajusten a tus necesidades y horarios de consumo.
    </li>
    <li>
      <strong>Iluminación solar en exteriores:</strong> Utiliza lámparas solares con pequeños paneles para alimentar luces LED.
    </li>
    <li>
      <strong>Usa sensores de movimiento:</strong> Ideales para que las luces se enciendan y apaguen automáticamente en pasillos y baños.
    </li>
    <li>
      <strong>Apagar los electrodomésticos que no se utilicen:</strong> Evita mantener dispositivos encendidos sin uso.
    </li>
    <li>
      <strong>Pásate al autoconsumo:</strong> Instala paneles solares para generar tu propia electricidad.
    </li>
  </ul>
</section>

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

