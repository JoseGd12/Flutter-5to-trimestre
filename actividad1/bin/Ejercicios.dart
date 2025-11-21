import 'dart:io';

void main() {
  // Ejercicio 1: Suma de tres números
  // print("=== Ejercicio 1 ===");
  // ejercicio1();
  
  // // Ejercicio 2: Operaciones básicas
  // print("\n=== Ejercicio 2 ===");
  // ejercicio2();
  
  // // Ejercicio 3: Promedio simple
  // print("\n=== Ejercicio 3 ===");
  // ejercicio3();
  
  // // Ejercicio 4: Promedio ponderado
  // print("\n=== Ejercicio 4 ===");
  // ejercicio4();
  
  // // Ejercicio 5: Velocidad
  // print("\n=== Ejercicio 5 ===");
  // ejercicio5();
  
  // // Ejercicio 6: Factura con IVA y descuento
  // print("\n=== Ejercicio 6 ===");
  // ejercicio6();
  
  // // Ejercicio 7: Conversión a segundos
  // print("\n=== Ejercicio 7 ===");
  // ejercicio7();
  
  // Ejercicio 8: Inversión bancaria
  print("\n=== Ejercicio 8 ===");
  ejercicio8();
  
  // Ejercicio 9: Sueldo con comisiones
  print("\n=== Ejercicio 9 ===");
  ejercicio9();
  
  // Ejercicio 10: Descuento en tienda
  print("\n=== Ejercicio 10 ===");
  ejercicio10();
  
  // Ejercicio 11: Calificación final
  print("\n=== Ejercicio 11 ===");
  ejercicio11();
  
  // Ejercicio 12: Porcentaje por género
  print("\n=== Ejercicio 12 ===");
  ejercicio12();
  
  // Ejercicio 13: Salario por horas
  print("\n=== Ejercicio 13 ===");
  ejercicio13();
  
  // Ejercicio 14: Factura múltiples artículos
  print("\n=== Ejercicio 14 ===");
  ejercicio14();
  
  // Ejercicio 15: Registro de ventas
  print("\n=== Ejercicio 15 ===");
  ejercicio15();
  
  // Ejercicio 16: Pago conductor
  print("\n=== Ejercicio 16 ===");
  ejercicio16();
  
  // Ejercicio 17: Colilla de pago
  print("\n=== Ejercicio 17 ===");
  ejercicio17();
  
  // Ejercicio 18: Cuotas matrícula
  print("\n=== Ejercicio 18 ===");
  ejercicio18();
  
  // Ejercicio 19: Registro estudiante
  print("\n=== Ejercicio 19 ===");
  ejercicio19();
  
  // Ejercicio 20: Factura producto
  print("\n=== Ejercicio 20 ===");
  ejercicio20();
  
  // Ejercicio 21: Información personal
  print("\n=== Ejercicio 21 ===");
  ejercicio21();
  
  // Ejercicio 22: Baldes de agua
  print("\n=== Ejercicio 22 ===");
  ejercicio22();
  
  // Ejercicio 23: Tiempo escalada
  print("\n=== Ejercicio 23 ===");
  ejercicio23();
  
  // Ejercicio 24: Préstamo estudiantil
  print("\n=== Ejercicio 24 ===");
  ejercicio24();
}

// Ejercicio 1
void ejercicio1() {
  print("Ingrese tres números:");
  double num1 = double.parse(stdin.readLineSync()!);
  double num2 = double.parse(stdin.readLineSync()!);
  double num3 = double.parse(stdin.readLineSync()!);
  
  double suma = num1 + num2 + num3;
  print("La suma de los tres números es: $suma");
}

// Ejercicio 2
void ejercicio2() {
  print("Ingrese dos números:");
  double num1 = double.parse(stdin.readLineSync()!);
  double num2 = double.parse(stdin.readLineSync()!);
  
  print("Suma: ${num1 + num2}");
  print("Resta: ${num1 - num2}");
  print("Multiplicación: ${num1 * num2}");
  if (num2 != 0) {
    print("División: ${num1 / num2}");
  } else {
    print("División: No se puede dividir por cero");
  }
}

// Ejercicio 3
void ejercicio3() {
  print("Ingrese las 3 notas:");
  double nota1 = double.parse(stdin.readLineSync()!);
  double nota2 = double.parse(stdin.readLineSync()!);
  double nota3 = double.parse(stdin.readLineSync()!);
  
  double definitiva = (nota1 + nota2 + nota3) / 3;
  print("La definitiva es: ${definitiva.toStringAsFixed(2)}");
}

// Ejercicio 4
void ejercicio4() {
  print("Ingrese las 3 notas:");
  double nota1 = double.parse(stdin.readLineSync()!);
  double nota2 = double.parse(stdin.readLineSync()!);
  double nota3 = double.parse(stdin.readLineSync()!);
  
  double definitiva = (nota1 * 0.2) + (nota2 * 0.3) + (nota3 * 0.5);
  print("La definitiva ponderada es: ${definitiva.toStringAsFixed(2)}");
}

// Ejercicio 5
void ejercicio5() {
  print("Ingrese la distancia (km):");
  double distancia = double.parse(stdin.readLineSync()!);
  print("Ingrese el tiempo (horas):");
  double tiempo = double.parse(stdin.readLineSync()!);
  
  double velocidad = distancia / tiempo;
  print("La velocidad es: ${velocidad.toStringAsFixed(2)} km/h");
}

// Ejercicio 6
void ejercicio6() {
  print("Ingrese el valor de la compra:");
  double compra = double.parse(stdin.readLineSync()!);
  
  double descuento = compra * 0.10;
  double compraConDescuento = compra - descuento;
  double iva = compraConDescuento * 0.19;
  double total = compraConDescuento + iva;
  
  print("Valor compra: \$${compra.toStringAsFixed(2)}");
  print("Descuento (10%): \$${descuento.toStringAsFixed(2)}");
  print("Subtotal: \$${compraConDescuento.toStringAsFixed(2)}");
  print("IVA (19%): \$${iva.toStringAsFixed(2)}");
  print("Total a pagar: \$${total.toStringAsFixed(2)}");
}

// Ejercicio 7
void ejercicio7() {
  print("Ingrese horas:");
  int horas = int.parse(stdin.readLineSync()!);
  print("Ingrese minutos:");
  int minutos = int.parse(stdin.readLineSync()!);
  print("Ingrese segundos:");
  int segundos = int.parse(stdin.readLineSync()!);
  
  int totalSegundos = (horas * 3600) + (minutos * 60) + segundos;
  print("Total en segundos: $totalSegundos");
}

// Ejercicio 8
void ejercicio8() {
  print("Ingrese el capital a invertir:");
  double capital = double.parse(stdin.readLineSync()!);
  
  double ganancia = capital * 0.02;
  print("Ganancia después de un mes: \$${ganancia.toStringAsFixed(2)}");
}

// Ejercicio 9
void ejercicio9() {
  print("Ingrese sueldo base:");
  double sueldoBase = double.parse(stdin.readLineSync()!);
  
  print("Ingrese valor de las 3 ventas:");
  double venta1 = double.parse(stdin.readLineSync()!);
  double venta2 = double.parse(stdin.readLineSync()!);
  double venta3 = double.parse(stdin.readLineSync()!);
  
  double comisiones = (venta1 + venta2 + venta3) * 0.10;
  double total = sueldoBase + comisiones;
  
  print("Comisiones: \$${comisiones.toStringAsFixed(2)}");
  print("Total a recibir: \$${total.toStringAsFixed(2)}");
}

// Ejercicio 10
void ejercicio10() {
  print("Ingrese el total de la compra:");
  double compra = double.parse(stdin.readLineSync()!);
  
  double descuento = compra * 0.15;
  double total = compra - descuento;
  
  print("Descuento (15%): \$${descuento.toStringAsFixed(2)}");
  print("Total a pagar: \$${total.toStringAsFixed(2)}");
}

// Ejercicio 11
void ejercicio11() {
  print("Ingrese las 3 calificaciones parciales:");
  double p1 = double.parse(stdin.readLineSync()!);
  double p2 = double.parse(stdin.readLineSync()!);
  double p3 = double.parse(stdin.readLineSync()!);
  
  print("Ingrese calificación examen final:");
  double examen = double.parse(stdin.readLineSync()!);
  
  print("Ingrese calificación trabajo final:");
  double trabajo = double.parse(stdin.readLineSync()!);
  
  double promedioParciales = (p1 + p2 + p3) / 3;
  double calificacionFinal = (promedioParciales * 0.55) + (examen * 0.30) + (trabajo * 0.15);
  
  print("Calificación final: ${calificacionFinal.toStringAsFixed(2)}");
}

// Ejercicio 12
void ejercicio12() {
  print("Ingrese cantidad de hombres:");
  int hombres = int.parse(stdin.readLineSync()!);
  print("Ingrese cantidad de mujeres:");
  int mujeres = int.parse(stdin.readLineSync()!);
  
  int total = hombres + mujeres;
  double porcentajeHombres = (hombres / total) * 100;
  double porcentajeMujeres = (mujeres / total) * 100;
  
  print("Porcentaje de hombres: ${porcentajeHombres.toStringAsFixed(2)}%");
  print("Porcentaje de mujeres: ${porcentajeMujeres.toStringAsFixed(2)}%");
}

// Ejercicio 13
void ejercicio13() {
  print("Ingrese horas trabajadas:");
  double horas = double.parse(stdin.readLineSync()!);
  print("Ingrese valor por hora:");
  double valorHora = double.parse(stdin.readLineSync()!);
  
  double salario = horas * valorHora;
  print("Salario: \$${salario.toStringAsFixed(2)}");
}

// Ejercicio 14
void ejercicio14() {
  double subtotal = 0;
  
  for (int i = 1; i <= 4; i++) {
    print("Artículo $i:");
    print("Ingrese precio unitario:");
    double precio = double.parse(stdin.readLineSync()!);
    print("Ingrese cantidad:");
    int cantidad = int.parse(stdin.readLineSync()!);
    
    subtotal += precio * cantidad;
  }
  
  double iva = subtotal * 0.19;
  double total = subtotal + iva;
  
  print("\n=== FACTURA ===");
  print("Subtotal: \$${subtotal.toStringAsFixed(2)}");
  print("IVA (19%): \$${iva.toStringAsFixed(2)}");
  print("Total: \$${total.toStringAsFixed(2)}");
}

// Ejercicio 15
void ejercicio15() {
  print("Ingrese monto de la venta:");
  double venta = double.parse(stdin.readLineSync()!);
  
  double iva = venta * 0.19;
  double total = venta + iva;
  
  print("IVA: \$${iva.toStringAsFixed(2)}");
  print("Total a pagar: \$${total.toStringAsFixed(2)}");
  
  print("Ingrese cantidad con la que paga el cliente:");
  double pago = double.parse(stdin.readLineSync()!);
  
  double cambio = pago - total;
  if (cambio >= 0) {
    print("Cambio: \$${cambio.toStringAsFixed(2)}");
  } else {
    print("Falta: \$${cambio.abs().toStringAsFixed(2)}");
  }
}

// Ejercicio 16
void ejercicio16() {
  print("Ingrese total recaudado:");
  double recaudado = double.parse(stdin.readLineSync()!);
  
  double pagoConductor = recaudado * 0.19;
  print("Pago del conductor: \$${pagoConductor.toStringAsFixed(2)}");
}

// Ejercicio 17
void ejercicio17() {
  print("Ingrese salario del empleado:");
  double salario = double.parse(stdin.readLineSync()!);
  print("Ingrese valor de ahorro mensual:");
  double ahorro = double.parse(stdin.readLineSync()!);
  
  double eps = salario * 0.125;
  double pension = salario * 0.16;
  double totalDeducciones = eps + pension + ahorro;
  double totalRecibir = salario - totalDeducciones;
  
  print("\n=== COLILLA DE PAGO ===");
  print("Salario: \$${salario.toStringAsFixed(2)}");
  print("Ahorro mensual: \$${ahorro.toStringAsFixed(2)}");
  print("Deducción EPS (12.5%): \$${eps.toStringAsFixed(2)}");
  print("Deducción Pensión (16%): \$${pension.toStringAsFixed(2)}");
  print("Total a recibir: \$${totalRecibir.toStringAsFixed(2)}");
}

// Ejercicio 18
void ejercicio18() {
  print("Ingrese valor total de la matrícula:");
  double matricula = double.parse(stdin.readLineSync()!);
  
  double cuota1 = matricula * 0.40;
  double cuota2 = matricula * 0.25;
  double cuota3 = matricula * 0.20;
  double cuota4 = matricula * 0.15;
  
  print("\n=== PLAN DE PAGOS ===");
  print("Primera cuota (40%): \$${cuota1.toStringAsFixed(2)}");
  print("Segunda cuota (25%): \$${cuota2.toStringAsFixed(2)}");
  print("Tercera cuota (20%): \$${cuota3.toStringAsFixed(2)}");
  print("Cuarta cuota (15%): \$${cuota4.toStringAsFixed(2)}");
}

// Ejercicio 19
void ejercicio19() {
  print("Ingrese nombre del estudiante:");
  String nombre = stdin.readLineSync()!;
  print("Ingrese programa de formación:");
  String programa = stdin.readLineSync()!;
  print("Ingrese ficha:");
  String ficha = stdin.readLineSync()!;
  
  List<double> notas = [];
  for (int i = 1; i <= 5; i++) {
    print("Ingrese nota $i:");
    double nota = double.parse(stdin.readLineSync()!);
    notas.add(nota);
  }
  
  double promedio = notas.reduce((a, b) => a + b) / notas.length;
  
  print("\n=== INFORMACIÓN ESTUDIANTE ===");
  print("Nombre: $nombre");
  print("Programa: $programa");
  print("Ficha: $ficha");
  print("Promedio final: ${promedio.toStringAsFixed(2)}");
}

// Ejercicio 20
void ejercicio20() {
  print("Ingrese precio unitario:");
  double precio = double.parse(stdin.readLineSync()!);
  print("Ingrese cantidad:");
  int cantidad = int.parse(stdin.readLineSync()!);
  print("Ingrese porcentaje de descuento:");
  double descuentoPorcentaje = double.parse(stdin.readLineSync()!);
  
  double subtotal = precio * cantidad;
  double descuento = subtotal * (descuentoPorcentaje / 100);
  double subtotalConDescuento = subtotal - descuento;
  double iva = subtotalConDescuento * 0.19;
  double precioNeto = subtotalConDescuento + iva;
  
  print("\n=== FACTURA ===");
  print("Subtotal: \$${subtotal.toStringAsFixed(2)}");
  print("Descuento: \$${descuento.toStringAsFixed(2)}");
  print("Subtotal con descuento: \$${subtotalConDescuento.toStringAsFixed(2)}");
  print("IVA (19%): \$${iva.toStringAsFixed(2)}");
  print("Precio neto: \$${precioNeto.toStringAsFixed(2)}");
}

// Ejercicio 21
void ejercicio21() {
  print("Ingrese nombre:");
  String nombre = stdin.readLineSync()!;
  print("Ingrese dirección:");
  String direccion = stdin.readLineSync()!;
  print("Ingrese año de nacimiento:");
  int anioNacimiento = int.parse(stdin.readLineSync()!);
  
  DateTime ahora = DateTime.now();
  int edad = ahora.year - anioNacimiento;
  
  print("\n=== INFORMACIÓN PERSONAL ===");
  print("Nombre: $nombre");
  print("Dirección: $direccion");
  print("Año de nacimiento: $anioNacimiento");
  print("Edad: $edad años");
}

// Ejercicio 22
void ejercicio22() {
  // Caso específico con baldes conocidos
  print("=== Caso con baldes conocidos ===");
  double tiempoLlenado1L = 1.5; // horas
  int capacidad1L = 1;
  int capacidad5L = 5;
  int capacidad3L = 3;
  
  double tiempo5L = (capacidad5L / capacidad1L) * tiempoLlenado1L;
  double tiempo3L = (capacidad3L / capacidad1L) * tiempoLlenado1L;
  
  print("Balde de 1L: ${tiempoLlenado1L} horas");
  print("Balde de 3L: ${tiempo3L} horas");
  print("Balde de 5L: ${tiempo5L} horas");
  
  // Caso general con baldes desconocidos
  print("\n=== Caso con baldes desconocidos ===");
  print("Ingrese capacidad del balde pequeño (litros):");
  double capacidadPequeno = double.parse(stdin.readLineSync()!);
  print("Ingrese tiempo de llenado del balde pequeño (horas):");
  double tiempoPequeno = double.parse(stdin.readLineSync()!);
  print("Ingrese capacidad del balde mediano (litros):");
  double capacidadMediano = double.parse(stdin.readLineSync()!);
  print("Ingrese capacidad del balde grande (litros):");
  double capacidadGrande = double.parse(stdin.readLineSync()!);
  
  double tiempoMediano = (capacidadMediano / capacidadPequeno) * tiempoPequeno;
  double tiempoGrande = (capacidadGrande / capacidadPequeno) * tiempoPequeno;
  
  print("Balde mediano ($capacidadMediano L): ${tiempoMediano.toStringAsFixed(2)} horas");
  print("Balde grande ($capacidadGrande L): ${tiempoGrande.toStringAsFixed(2)} horas");
}

// Ejercicio 23
void ejercicio23() {
  // Caso base conocido
  double tiempoBase = 5.0; // horas
  double alturaBase = 7.0; // metros
  
  print("Se tarda $tiempoBase horas en subir $alturaBase metros");
  print("Ingrese la altura que desea subir (metros):");
  double alturaDeseada = double.parse(stdin.readLineSync()!);
  
  double tiempoDeseado = (alturaDeseada / alturaBase) * tiempoBase;
  
  print("Para subir ${alturaDeseada}m se tardará: ${tiempoDeseado.toStringAsFixed(2)} horas");
}

// Ejercicio 24
void ejercicio24() {
  print("Ingrese monto del préstamo:");
  double monto = double.parse(stdin.readLineSync()!);
  
  double tasaAnual = 0.05; // 5%
  double interesAnual = monto * tasaAnual;
  double interesTrimestral = interesAnual / 4;
  double interesMensual = interesAnual / 12;
  double totalPagar = monto + (interesAnual * 5); // 5 años
  
  print("\n=== INFORME DEL PRÉSTAMO ===");
  print("Monto del préstamo: \$${monto.toStringAsFixed(2)}");
  print("Intereses pagados en un año: \$${interesAnual.toStringAsFixed(2)}");
  print("Intereses pagados en el 3er trimestre: \$${interesTrimestral.toStringAsFixed(2)}");
  print("Intereses pagados en el primer mes: \$${interesMensual.toStringAsFixed(2)}");
  print("Total a pagar en 5 años: \$${totalPagar.toStringAsFixed(2)}");
}