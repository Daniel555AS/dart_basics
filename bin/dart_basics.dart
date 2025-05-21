import 'dart:io';
import 'package:dart_basics/dart_basics.dart' as dart_basics;

void main(List<String> arguments) {
  estudioSets();
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




