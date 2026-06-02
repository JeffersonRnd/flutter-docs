# Listas y Formularios en Flutter

> Aprende a mostrar colecciones de datos y a capturar información del usuario de forma estructurada.

---

## Parte 1: Listas

### ¿Qué es una lista en Flutter?

Una lista muestra múltiples elementos de forma ordenada y desplazable. En Flutter el widget principal para esto es `ListView`.

---

### ListView básico — el que usamos en clase

En nuestro `main.dart` vimos este ejemplo con elementos fijos:

```dart
ListTile(title: Text('Elemento 1')),
ListTile(title: Text('Elemento 2')),
ListTile(title: Text('Elemento 3')),
```

Pero para que sean desplazables, se envuelven en un `ListView`:

```dart
ListView(
  children: [
    ListTile(title: Text('Elemento 1')),
    ListTile(title: Text('Elemento 2')),
    ListTile(title: Text('Elemento 3')),
  ],
)
```

---

### ListView.builder — para listas dinámicas

Cuando los elementos vienen de una variable (como en nuestro formulario), usamos `ListView.builder`. Es más eficiente porque solo construye los elementos visibles en pantalla.

Este es exactamente el código que usamos en clase:

```dart
// Tenemos una lista de nombres (variable de estado)
List<String> nombres = [];

// ListView.builder la muestra en pantalla
Expanded(
  child: ListView.builder(
    itemCount: nombres.length,    // ¿cuántos elementos tiene la lista?
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(nombres[index]),  // muestra el elemento en esa posición
      );
    },
  ),
),
```

> 📌 `Expanded` es necesario porque `ListView` necesita saber cuánto espacio puede ocupar. `Expanded` le dice "ocupa todo el espacio disponible".

| Propiedad | Descripción |
|---|---|
| `itemCount` | Cantidad total de elementos en la lista |
| `itemBuilder` | Función que construye cada elemento |
| `index` | Posición del elemento actual (0, 1, 2...) |
| `nombres[index]` | Obtiene el elemento en esa posición |

---

## Parte 2: Formulario básico

### ¿Qué hicimos en clase?

Creamos un formulario simple que permite al usuario escribir un nombre y guardarlo en una lista que se muestra en pantalla en tiempo real.

---

### El código completo — paso a paso

#### Paso 1: Declarar el controlador y la lista (como variables de estado)

```dart
class _MyHomePageState extends State<MyHomePage> {

  // Controlador para leer lo que el usuario ingresa
  final TextEditingController _controller = TextEditingController();

  // Lista donde guardamos los nombres ingresados
  List<String> nombres = [];
```

> 📌 `TextEditingController` es el "puente" entre el `TextField` y nuestro código. Sin él no podemos leer lo que el usuario escribió.

---

#### Paso 2: Construir el formulario en el body

```dart
body: Padding(
  padding: EdgeInsets.all(16),  // espacio alrededor del contenido
  child: Column(
    children: [
```

> 📌 `Padding` agrega espacio interno. `EdgeInsets.all(16)` significa 16 píxeles en todos los lados.

---

#### Paso 3: El título

```dart
      Text('Formulario'),
```

---

#### Paso 4: El campo de texto conectado al controlador

```dart
      TextField(
        controller: _controller,       // conecta el campo con el controlador
        decoration: InputDecoration(
          labelText: 'Nombre',
          border: OutlineInputBorder(), // borde visible
        ),
      ),
```

---

#### Paso 5: El botón que guarda el nombre en la lista

```dart
      ElevatedButton(
        onPressed: () {
          setState(() {
            nombres.add(_controller.text);  // agrega el texto a la lista
          });
        },
        child: Text('Guardar'),
      ),
```

> 📌 `nombres.add(...)` agrega un elemento al final de la lista. Envuelto en `setState()` para que Flutter actualice la pantalla.

---

#### Paso 6: La lista que muestra los nombres guardados

```dart
      Expanded(
        child: ListView.builder(
          itemCount: nombres.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(nombres[index]),
            );
          },
        ),
      ),
```

---

### El código completo junto

```dart
class _MyHomePageState extends State<MyHomePage> {

  final TextEditingController _controller = TextEditingController();
  List<String> nombres = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Formulario'),

            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  nombres.add(_controller.text);
                });
              },
              child: Text('Guardar'),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: nombres.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(nombres[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

### ¿Cómo funciona todo junto?

**1.** El usuario escribe un nombre en el `TextField`

**2.** Presiona el botón **Guardar**

**3.** Se ejecuta:
```dart
setState(() {
  nombres.add(_controller.text);  // guarda "Juan" en la lista
});
```

**4.** Flutter detecta el `setState` y redibuja la pantalla

**5.** El `ListView.builder` ahora tiene un elemento más y lo muestra

**6.** El usuario puede seguir agregando nombres y la lista crece

---

## Resumen

| Widget | Para qué sirve |
|---|---|
| `ListView` | Lista de elementos fijos |
| `ListView.builder` | Lista dinámica que viene de una variable |
| `ListTile` | Elemento estándar de lista con texto |
| `Expanded` | Hace que el ListView ocupe el espacio disponible |
| `TextEditingController` | Lee lo que el usuario escribió en el `TextField` |
| `nombres.add(...)` | Agrega un elemento al final de la lista |
| `setState()` | Avisa a Flutter que la lista cambió para redibujar |

---

> 💡 **Tip:** Siempre libera el controlador cuando el widget desaparezca, para no desperdiciar memoria:

```dart
@override
void dispose() {
  _controller.dispose();
  super.dispose();
}
```
