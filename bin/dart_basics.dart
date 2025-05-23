import 'dart:io';
import 'package:dart_basics/IceCream.dart';
import 'package:dart_basics/dart_basics.dart' as dart_basics;

void main(List<String> arguments) {
  var strawberry = IceCream();
  strawberry.flavor = "strawberry";
  strawberry.charge();
}

void ejercicioCalculadoraEnvioPaquetes(double peso, {String tipoEnvio = 'normal', bool tieneSeguroAdicional = false}) {
  /*
  Ejercicio: Calculadora de envío de paquetes
  Crea una función llamada ejercicio1() que reciba:
    > El peso del paquete en kilogramos (double, obligatorio).
    > El tipo de envío (String, opcional por nombre, con valor por defecto 'normal'). Las opciones son 'normal' o 'express'.
    > Si el paquete tiene seguro adicional (bool, opcional por nombre, por defecto false).

  -> Reglas del cálculo:
     1. El costo base por kilogramo es:
        * 'normal': $5.00 por kg
        * 'express': $10.00 por kg
     2. Si se activa el seguro adicional, se suma $20.00 fijos al costo total.
     3. Si el peso supera los 20 kg, muestra un mensaje indicando que el envío requiere autorización manual.

  -> Salida esperada:
     Imprime un resumen que incluya:
     * Tipo de envío
     * Costo base
     * Si se incluyó seguro
     * Costo total
     * Mensaje adicional si el peso supera los 20 kg
  */

  // Declaración de variables:
  double costoBase;
  double costoTotal;

  // Lógica de cálculo de coste según peso y tipo de envío:
  if(tipoEnvio == 'normal') {
    costoBase = peso * 5;
  } else if(tipoEnvio == 'express') {
    costoBase = peso * 10;
  } else {
    print('Opción de envío no válida...');
    return;
  }

  // Determinación de costo total, según se tiene seguro adicional o no:
  (tieneSeguroAdicional) ? costoTotal = costoBase + 20 : costoTotal = costoBase;

  // Impresión de reporte final:
  print('==== Reporte General del Envío ===');
  print('+ Tipo de Envío: $tipoEnvio');
  print('+ Costo Base: \$$costoBase');
  (tieneSeguroAdicional) ? print('+ SÍ se incluyó seguro adicional') : print('+ NO se incluyó seguro adicional');
  print('+ Costo Total: \$$costoTotal');
  if(peso > 20) {
    print('El envío requiere autorización manual, dado que superar los 20 Kg');
  }
}

void estudioListas() {
  List<String> nombres = ['Daniel', 'Orlando', 'Juan'];

  // -> Agregar elementos:
  nombres.add('Lucas'); // Agrega un solo elemento
  print(nombres); // [Daniel, Orlando, Juan, Lucas]

  nombres.addAll(['Miguel', 'Linux', 'Tux']); // Agregar varios elementos
  print(nombres); // [Daniel, Orlando, Juan, Lucas, Miguel, Linux, Tux]

  nombres.insert(1, 'Steve'); // Inserta [element] en posición [index] en esta lista
  print(nombres); // [Daniel, Steve, Orlando, Juan, Lucas, Miguel, Linux, Tux]


  // -> Eliminar elementos
  nombres.remove('Daniel'); // Elimna elemento por valor
  print(nombres); // [Steve, Orlando, Juan, Lucas, Miguel, Linux, Tux]

  nombres.removeAt(0); // Eliminar elemento por índice
  print(nombres); // [Orlando, Juan, Lucas, Miguel, Linux, Tux]

  nombres.clear(); // Elimina todos los elementos de la lista
  print(nombres); // []

  nombres.addAll(['Miguel', 'Linux', 'Tux']); // Se ingresan elementos a la lista


  // -> Búsqueda de elementos
  bool nombresContainsTux = nombres.contains('Tux'); // Determinar si la listas contiene el elemento
  bool nombresContainsJobs = nombres.contains('Jobs');
  print(nombresContainsTux); // true
  print(nombresContainsJobs); // false

  int indexOfLinux = nombres.indexOf('Linux'); // Índice del elemento en la lista
  int indexOfElon = nombres.indexOf('Elon'); 
  print(indexOfLinux); // 1
  print(indexOfElon); // -1


  // -> Tamaño
  int lengthNombres = nombres.length; // Tamaño de la lista
  print(lengthNombres); // 3

  bool nombresIsEmpty = nombres.isEmpty; // ¿La lista está vacía? 
  print(nombresIsEmpty); // false 

  bool nombresIsNotEmpty = nombres.isNotEmpty; // ¿La lista no está vacía?
  print(nombresIsNotEmpty); // true

  print(nombres); // [Miguel, Linux, Tux]
  nombres[2] = 'Unix'; // Cambiar valor en índice 2 por 'Unix'
  print(nombres); // [Miguel, Linux, Unix]
}

void estudioSets() {
  Set<String> emails = {'linux@mail.com', 'daniel@mail.com', 'steve@mail.com'}; // Crear Set
  print(emails); // {linux@mail.com, daniel@mail.com, steve@mail.com}

  // ... usar el constructor:
  Set<int> numeros = Set();
  numeros.add(1); // Agrega un elemento al Set. Si ya existe, no lo añade
  numeros.add(2);
  numeros.add(3);
  print(numeros); // {1, 2, 3}

  emails.addAll({'juan@mail.com', 'bill@mail.com'}); // Agrega múltiples elementos de otra colección
  print(emails); // {linux@mail.com, daniel@mail.com, steve@mail.com, juan@mail.com, bill@mail.com}

  emails.remove('linux@mail.com'); // Elimina un elemento del Set
  print(emails); // {daniel@mail.com, steve@mail.com, juan@mail.com, bill@mail.com}

  print(emails.contains('juan@mail.com')); // Devuelve true si el Set contiene el elemento -> true
  print(emails.contains('richard@mail.com')); // false 

  print(emails.length); // Retorna la cantidad de elementos -> 4

  // -> Verificar si un Set está vacío o no:
  print(emails.isEmpty); // false
  print(emails.isNotEmpty); // true

  emails.clear(); // Elimina todos los elementos
  print(emails); // {}

  emails.addAll({'linux@mail.com', 'daniel@mail.com', 'steve@mail.com'}); // Agregar varios elementos al Set
  emails.removeAll({'daniel@mail.com', 'steve@mail.com'}); // Elimina varios elementos del Set
  print(emails); // {linux@mail.com}

  // -> Conversiones: Set <---> List
  // * Conversión List ---> Set:
  List<String> newEmailList = ['user1@mail.com', 'user2@mail.com', 'user3@mail.com'];
  print(newEmailList); // [user1@mail.com, user2@mail.com, user3@mail.com]
  Set<String> newEmailSet = Set.from(newEmailList);
  print(newEmailSet); // {user1@mail.com, user2@mail.com, user3@mail.com}

  // * Conversión Set ---> List: 
  Set<int> newNumbersSet = {1, 2, 3, 4, 5};
  print(newNumbersSet); // {1, 2, 3, 4, 5}
  List<int> newNumbersList = newNumbersSet.toList();
  print(newNumbersList); // [1, 2, 3, 4, 5]


  // -> Operaciones entre Sets
  Set<int> a = {1, 2, 3};
  Set<int> b = {3, 4, 5};

  // Devuelve un nuevo Set que contiene todos los elementos de a y de b, sin duplicados:
  print(a.union(b)); // {1, 2, 3, 4, 5}

  // Devuelve un nuevo Set con los elementos que están en ambos sets:
  print(a.intersection(b)); // {3}

  // Devuelve un nuevo Set con los elementos que están en a pero no en b:
  print(a.difference(b)); // {1, 2}
}

void estudioMaps() {
  // Creación de Map:
  Map<String, String> paises = {
    'CO':'Colombia',
    'MX':'México',
    'PE':'Perú'
  };

  print(paises); // {CO: Colombia, MX: México, PE: Perú}

  // -> Constructor:
  Map<int, String> usuarios = Map();
  usuarios[1] = 'Daniel'; // 	Asigna un valor a una clave.
  usuarios[2] = 'Linux';
  usuarios[3] = 'Steve';
  print(usuarios); // {1: Daniel, 2: Linux, 3: Steve}
  print(usuarios[2]); // Accede al valor mediante su clave -> Linux

  usuarios.addAll({4: 'Juan', 5: 'Max', 6: 'Orlando'}); // Agrega múltiples pares claves-valor de otro Map
  print(usuarios); // {1: Daniel, 2: Linux, 3: Steve, 4: Juan, 5: Max, 6: Orlando}

  usuarios.remove(1); // Elimina el par clave-valor según la clave
  print(usuarios); // {2: Linux, 3: Steve, 4: Juan, 5: Max, 6: Orlando}

  print(usuarios.containsKey(5)); // Retorna true si la clave existe -> true
  print(usuarios.containsKey(10)); // false

  print(usuarios.containsValue('Linux')); // Retorna true si el valor existe -> true
  print(usuarios.containsValue('Ana')); // false

  Iterable<int> keysUsuarios = usuarios.keys; // Devuelve una vista de todas las claves
  print(keysUsuarios); // (2, 3, 4, 5, 6)

  Iterable<String> valuesUsuarios = usuarios.values; // Devuelve una vista de todos los valores
  print(valuesUsuarios); // (Linux, Steve, Juan, Max, Orlando)

  // Verifica si el Map está vacío o no:
  print(usuarios.isEmpty); // false
  print(usuarios.isNotEmpty); // true

  // 	Devuelve la cantidad de pares clave-valor:
  print(usuarios.length); // 5

  usuarios.clear(); //	Elimina todos los elementos del mapa
  print(usuarios); // {}
}

void listLoop() {
  print("============= listLoop =============");

  List<int> numbers = [1, 2, 3, 4, 5, 6, 7];

  for(int i = 0; i < numbers.length; i++) {
    print(numbers[i]);
  }

  for (var element in numbers) {
    if(element >= 4) {
      print("$element es mayor o igual a 4");
    } else {
      print("$element es menor a 4");
    }
  }

  print("USANDO forEach");
  numbers.forEach((number){ // forEach
        if(number >= 4) {
      print("$number es mayor o igual a 4");
    } else {
      print("$number es menor a 4");
    }
  });

  numbers.forEach(print); // forEach

  // ==> While:
  print("=> Usando Ciclo While:");
  int jj = 0;

  while(jj < numbers.length) {
    print("- Valor en índice $jj => ${numbers[jj]}");
    jj++;
  }

  // ==> do-while:
  print("=> Usando Ciclo do-While:");
  int kk = 0;

  do{
    print("- Valor en índice $kk => ${numbers[kk]}");
    kk++;
  } while(kk < numbers.length);
}

void setLoop() {
  print("============= setLoop =============");

  Set<int> numbers = {1, 2, 3, 4, 5, 6, 7};

  for(var element in numbers) {
    print("Iteración SET: $element");
  }

  print("USANDO forEach:");
  numbers.forEach(print); // forEach
}

void mapLoop() {
  print("============= mapLoop =============");

  Map<String, int> numbers = {
    'uno': 1,
    'dos': 2,
    'tres': 3,
    'cuatro': 4,
    'cinco': 5,
    'seis': 6,
    'siete': 7 
  };

  for(var element in numbers.entries) {
    print("Clave: ${element.key} - Valor: ${element.value}");
  }

  // Para iterar únicamente sobre las claves:
  for(var element in numbers.keys) {
    print("CLAVE: $element");
  }

  // Para iterar únicamente sobre los valores:
  for(var element in numbers.values) {
    print("VALOR: $element");
  }

  print("USANDO forEach:");
  numbers.forEach((clave, valor){ //forEach
    print("CLAVE - VALOR USANDO forEach => $clave: $valor");
  });
}

void ejercicioList() {
  // Dada una lista de números enteros, imprime solo los números pares y calcula su suma total.

  List<int> numeros = [3, 4, 7, 10, 12];
  List<int> pares = [];
  int sum = 0;

  for(int numero in numeros) {
    if(numero % 2 == 0) {
      pares.add(numero);
      sum += numero;
    }
  }

  print("Resultado Suma: $sum"); // 26
  print("Número Pares: $pares"); // [4, 10, 12]
}

void ejercicioList2() {
  /*
    Dada una lista de números enteros, cuenta cuántos son:
      - Positivos
      - Negativos
      - Ceros

    Salida Esperada:
      * Positivos: 2  
      * Negativos: 2  
      * Ceros: 2
  */

  List<int> datos = [0, -5, 10, -3, 8, 0];
  int positivos = 0;
  int negativos = 0;
  int ceros = 0;

  for(var dato in datos) {
    if(dato > 0) {
      positivos++;
    } else if(dato < 0) {
      negativos++;
    } else {
      ceros++;
    }
  }

  print('* Positivos: $positivos');
  print('* Negativos: $negativos');
  print('* Ceros: $ceros');
}

void ejercicioList3() {
  /*
    Dada una lista de enteros, crea una nueva lista sin duplicados, ordenada de menor a mayor, y muestra:
      - La lista original
      - La lista sin duplicados
      - El valor máximo y mínimo

    SALIDA ESPERADA:
    Original: [3, 6, 2, 6, 9, 2, 1]  
    Sin duplicados: [1, 2, 3, 6, 9]  
    Máximo: 9  
    Mínimo: 1
  */

  List<int> numeros = [3, 6, 2, 6, 9, 2, 1];
  List<int> numerosSinDuplicados = (numeros.toSet()).toList();
  // numerosSinDuplicados.sort(); // Ordenar lista de números sin duplicados usando método sort()
  List<int> numerosOrdenadosSinDuplicados = ordenarNumeros(numerosSinDuplicados);

  print('Original: $numeros');
  print('Sin duplicados: $numerosOrdenadosSinDuplicados');
  print('Máximo: ${numerosOrdenadosSinDuplicados.last}');
  print('Mínimo: ${numerosOrdenadosSinDuplicados.first}');
}

/* 
  Algoritmo para ordenar listas de números
*/
List<int> ordenarNumeros(List<int> lista) {
  if(lista.isEmpty || lista.length == 1) {
    return lista;
  }

  bool cambio = false;
  int index = 0; 
  int numTemp = 0; 
  
  while(true) {
    if(lista[index] > lista[index + 1]) {
      numTemp = lista[index + 1];
      lista[index + 1] = lista[index];
      lista[index] = numTemp;
      cambio = true;
    }

    if(index == lista.length - 2) {
      if(!cambio) {
        break;
      }

      index = 0;
      cambio = false; 
    } else {
      index++;
    }
  }

  return lista;
}

void ejercicioSet() {
  /*
    Dado un Set<String> con nombres, imprime solo los nombres que comienzan con una vocal. 
    Además, muestra cuántos cumplen esa condición.
  */
  Set<String> nombres = {'Ana', 'Luis', 'Esteban', 'Oscar', 'María'};
  Set<String> nombresVocales = {};
  String vocales = 'aeiou';
  int cantidad = 0;

  for(String nombre in nombres) {
    String primeraLetra = nombre[0].toLowerCase();
    if(vocales.contains(primeraLetra)) {
      nombresVocales.add(nombre);
      cantidad++;
    }
  }
  print(nombresVocales); // {Ana, Esteban, Oscar}
  print("Cantidad: $cantidad"); // 3
}

void ejercicioSet2() {
  /*
   Dada una lista de strings con nombres, determina si hay nombres duplicados (usando un Set).

   Salida Esperada:
   Hay duplicados: true
  */

  List<String> nombres = ['Ana', 'Luis', 'Ana', 'Pedro', 'Luis'];

  Set<String> setNombres = Set.from(nombres);

  print('Hay duplicados: ${nombres.length != setNombres.length}');
}

void ejercicioSet3() {
  /*
  Tienes dos Set<String> que contienen nombres de personas que asistieron a dos eventos distintos. 
  Muestra:
    - Quiénes asistieron a ambos eventos (intersección)
    - Quiénes asistieron solo al primero (diferencia)
    - El total de personas únicas que asistieron a alguno de los dos eventos (unión)

  SALIDA ESPERADA:
  Ambos eventos: {Luis, Carlos}  
  Solo primer evento: {Ana, María}  
  Total únicos: {Ana, Luis, María, Carlos, Marta, Pedro}
  */

  Set<String> evento1 = {'Ana', 'Luis', 'María', 'Carlos'};
  Set<String> evento2 = {'Luis', 'Carlos', 'Marta', 'Pedro'};

  print('Ambos eventos: ${evento1.intersection(evento2)}');
  print('Solor primer evento: ${evento1.difference(evento2)}');
  print('Total únicos: ${evento1.union(evento2)}');
}

void ejercicioMap() {
  /*
    Dado un Map<String, int> que representa productos y sus precios, imprime solo los productos 
    cuyo precio es mayor o igual a 100. También muestra el total de productos que cumplen la condición.
  */

  Map<String, int> productos = {
  'Monitor': 150,
  'Teclado': 80,
  'Mouse': 50,
  'Impresora': 200,
  };

  int total = 0;

  print('Productos con precio >= 100:');
  
  for (var producto in productos.entries) {
    if(producto.value >= 100) {
      print('${producto.key}: ${producto.value}');
      total++;
    }
  }

  /*
    Monitor: 150
    Impresora: 200
  */
  
  print('Total: $total'); // Total: 2
}

void ejercicioMap2() {
  /*
    Dado un Map<String, double> con nombres de estudiantes y sus notas finales, calcula el promedio 
    general. También imprime quién tiene la nota más alta.

    SALIDA ESPERADA:
    Promedio general: 4.35  
    Nota más alta: Pedro con 4.9
  */

  Map<String, double> notas = {
  'Ana': 4.5,
  'Luis': 3.8,
  'Pedro': 4.9,
  'María': 4.2,
  };

  MapEntry<String, double> notaEstudiante = notas.entries.first;
  double notaMasAlta = notaEstudiante.value;
  double sumaNotas = 0;

  for(var nota in notas.entries) {
    if(nota.value > notaMasAlta) {
      notaMasAlta = nota.value;
      notaEstudiante = nota;
    }
    sumaNotas += nota.value;
  }

  print('Promedio general: ${(sumaNotas / notas.length).toStringAsFixed(2)}');
  print('Nota más alta: ${notaEstudiante.key} con ${notaEstudiante.value}');
}

void ejercicioMap3() {
  /*
    Dado un Map<String, List<int>> que contiene estudiantes y sus notas, calcula:
      - El promedio de cada estudiante
      - Qué estudiantes tienen promedio superior a 4.0
      - Cuál es el promedio general del grupo

    SALIDA ESPERADA:
      Ana: 4.33  
      Luis: 3.33  
      Pedro: 4.67  

      Promedios > 4.0: [Ana, Pedro]  
      Promedio general del grupo: 4.11
  */

  Map<String, List<int>> notas = {
  'Ana': [4, 5, 4],
  'Luis': [3, 3, 4],
  'Pedro': [5, 5, 4],
  };

  double sum = 0;
  double sumGeneral = 0;
  Map<String, double> promedios = {};
  List<String> estudiantesPromedioSuperior4 = [];

  for (var element in notas.entries) {
    sum = 0;
    for(var calificacion in element.value) {
      sum += calificacion;
    }
    promedios[element.key] = double.parse((sum / element.value.length).toStringAsFixed(2));
  }

  for(var promedio in promedios.entries){
    sumGeneral += promedio.value;
    if(promedio.value > 4) {
      estudiantesPromedioSuperior4.add(promedio.key);
    }
    print('${promedio.key}: ${promedio.value}');
  }

  print('\nPromedios > 4.0: $estudiantesPromedioSuperior4');
  print('Promedio general del grupo: ${sumGeneral / promedios.length}');
}