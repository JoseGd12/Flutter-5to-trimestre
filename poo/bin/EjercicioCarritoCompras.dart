import 'dart:io';

// 1. Clase Producto con los atributos requeridos
class Producto {
  String codigo;
  String nombre;
  String categoria;
  double precio;
  int cantidad;
  
  // Constructor
  Producto({
    required this.codigo,
    required this.nombre,
    required this.categoria,
    required this.precio,
    required this.cantidad,
  });
  
  // 2. Método para mostrar la información completa del producto
  void mostrarInformacion() {
    print('┌─ Información del Producto ──────────────────────');
    print('│ Código: $codigo');
    print('│ Nombre: $nombre');
    print('│ Categoría: $categoria');
    print('│ Precio: \$${precio.toStringAsFixed(2)}');
    print('│ Cantidad a llevar: $cantidad');
    print('└─────────────────────────────────────────────────');
  }
  
  // Método adicional útil para el carrito
  double get subtotal => precio * cantidad;
}

// 3. Clase CarritoCompra
class CarritoCompra {
  List<Producto> productos = [];
  
  // Método para agregar productos a comprar
  void agregarProducto(Producto producto) {
    // Verificar si el producto ya existe en el carrito
    int index = productos.indexWhere((p) => p.codigo == producto.codigo);
    
    if (index != -1) {
      // Si ya existe, actualizar la cantidad
      productos[index].cantidad += producto.cantidad;
      print('Cantidad actualizada para ${producto.nombre}');
    } else {
      // Si no existe, agregar nuevo producto
      productos.add(producto);
      print('${producto.nombre} agregado al carrito');
    }
  }
  
  // Método para imprimir el total de la compra
  void imprimirTotalCompra() {
    if (productos.isEmpty) {
      print('El carrito está vacío');
      return;
    }
    
    print('\n' + '=' * 50);
    print('RESUMEN DE COMPRA');
    print('=' * 50);
    
    double total = 0;
    int totalItems = 0;
    
    // Mostrar cada producto en el carrito
    for (int i = 0; i < productos.length; i++) {
      Producto producto = productos[i];
      double subtotal = producto.subtotal;
      total += subtotal;
      totalItems += producto.cantidad;
      
      print('${i + 1}. ${producto.nombre}');
      print('   Cantidad: ${producto.cantidad} x \$${producto.precio.toStringAsFixed(2)}');
      print('   Subtotal: \$${subtotal.toStringAsFixed(2)}');
      print('   ─────────────────────────');
    }
    
    print('\nTOTALES:');
    print('• Productos diferentes: ${productos.length}');
    print('• Items totales: $totalItems');
    print('• Total compra: \$${total.toStringAsFixed(2)}');
    print('=' * 50);
  }
  
  // Método adicional para mostrar detalles del carrito
  void mostrarCarrito() {
    if (productos.isEmpty) {
      print('El carrito está vacío');
      return;
    }
    
    print('\n' + '=' * 60);
    print('CONTENIDO DEL CARRITO');
    print('=' * 60);
    
    for (int i = 0; i < productos.length; i++) {
      Producto producto = productos[i];
      print('${i + 1}. ${producto.nombre} (${producto.codigo})');
      print('   Categoría: ${producto.categoria}');
      print('   Precio: \$${producto.precio.toStringAsFixed(2)}');
      print('   Cantidad: ${producto.cantidad}');
      print('   Subtotal: \$${producto.subtotal.toStringAsFixed(2)}');
      print('   ──────────────────────────────────────────────');
    }
  }
}

// Función principal para demostrar el funcionamiento
void main() {
  CarritoCompra carrito = CarritoCompra();
  bool continuar = true;
  
  print('SISTEMA DE COMPRAS');
  print('=' * 40);
  
  while (continuar) {
    print('\nOpciones:');
    print('1. Agregar producto al carrito');
    print('2. Ver productos en carrito');
    print('3. Ver total de compra');
    print('4. Salir');
    print('Seleccione una opción (1-4): ');
    
    String? opcion = stdin.readLineSync();
    
    switch (opcion) {
      case '1':
        agregarProductoAlCarrito(carrito);
        break;
      case '2':
        carrito.mostrarCarrito();
        break;
      case '3':
        carrito.imprimirTotalCompra();
        break;
      case '4':
        continuar = false;
        print('Gracias por comprar');
        break;
      default:
        print('Opción no válida. Intente nuevamente.');
    }
  }
}

// Función auxiliar para agregar productos al carrito
void agregarProductoAlCarrito(CarritoCompra carrito) {
  print('\nAGREGAR PRODUCTO AL CARRITO');
  print('─' * 30);
  
  try {
    print('Ingrese el código del producto:');
    String codigo = stdin.readLineSync() ?? '';
    
    print('Ingrese el nombre del producto:');
    String nombre = stdin.readLineSync() ?? '';
    
    print('Ingrese la categoría del producto:');
    String categoria = stdin.readLineSync() ?? '';
    
    print('Ingrese el precio del producto:');
    double precio = double.parse(stdin.readLineSync() ?? '0');
    
    print('Ingrese la cantidad:');
    int cantidad = int.parse(stdin.readLineSync() ?? '0');
    
    // Validaciones básicas
    if (codigo.isEmpty || nombre.isEmpty || categoria.isEmpty) {
      print('Error: Código, nombre y categoría son obligatorios');
      return;
    }
    
    if (precio <= 0) {
      print('Error: El precio debe ser mayor a 0');
      return;
    }
    
    if (cantidad <= 0) {
      print('Error: La cantidad debe ser mayor a 0');
      return;
    }
    
    // Crear el producto y agregarlo al carrito
    Producto nuevoProducto = Producto(
      codigo: codigo,
      nombre: nombre,
      categoria: categoria,
      precio: precio,
      cantidad: cantidad,
    );
    
    // Mostrar información del producto antes de agregar
    print('\nProducto a agregar:');
    nuevoProducto.mostrarInformacion();
    
    // Confirmar agregar al carrito
    print('¿Agregar este producto al carrito? (s/n):');
    String? confirmacion = stdin.readLineSync();
    
    if (confirmacion?.toLowerCase() == 's') {
      carrito.agregarProducto(nuevoProducto);
    } else {
      print('Producto no agregado');
    }
    
  } catch (e) {
    print('Error: Ingrese valores válidos para precio y cantidad');
  }
}

// Ejemplo de uso predefinido (para testing)
void ejemploUso() {
  print('\n' + '=' * 50);
  print('EJEMPLO DE USO DEL SISTEMA');
  print('=' * 50);
  
  
  
  // Crear carrito y agregar productos
  CarritoCompra carritoEjemplo = CarritoCompra();
  
  
  
  // Agregar más cantidad de un producto existente
  Producto masMouses = Producto(
    codigo: 'MOU-001',
    nombre: 'Mouse Inalámbrico',
    categoria: 'Tecnología',
    precio: 25.50,
    cantidad: 1,
  );
  
  carritoEjemplo.agregarProducto(masMouses);
  
  // Mostrar total de compra
  carritoEjemplo.imprimirTotalCompra();
}