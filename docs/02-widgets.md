# Widgets básicos en Flutter
### Text, TextField y ElevatedButton

> Los widgets son los bloques de construcción de cualquier app en Flutter. Todo lo que ves en pantalla es un widget.

---

## ¿Qué es un Widget?

Un widget es un componente visual. Puede ser un texto, un botón, un campo de texto, un ícono, etc. En Flutter **todo es un widget**, incluso la pantalla completa.

---

## Lo que veremos en esta clase

En el archivo `main.dart` ya tenemos ejemplos de los tres widgets más usados. Están comentados para que los podamos activar de a poco:

```dart
body: Center(
  child: Column(
    children: [
      // Widget Text — muestra texto
      Text('HOLA MUNDO'),

      // Widget TextField — campo de texto
      TextField(),

      // Widget ElevatedButton — botón con acción
      ElevatedButton(
        onPressed: () {},
        child: Text('Enviar'),
      ),
    ],
  ),
),
```

Vamos a ver cada uno en detalle.

---

## 1. Widget Text

El widget `Text` muestra un texto en pantalla.

### Ejemplo básico — el que usamos en clase

```dart
Text('HOLA MUNDO')
```

### Con estilos — también en nuestro código

```dart
Text(
  'Hola Mundo',
  style: TextStyle(fontSize: 24, color: Colors.blue),
),
```

> 📌 `TextStyle` permite personalizar el texto: tamaño, color, negrita, etc.

| Propiedad | Descripción |
|---|---|
| `fontSize` | Tamaño de la fuente (número) |
| `fontWeight` | Grosor: `FontWeight.bold` para negrita |
| `color` | Color: `Colors.blue`, `Colors.red`, etc. |

---

## 2. Widget TextField (Input)

El widget `TextField` permite al usuario escribir texto.

### Ejemplo básico

```dart
TextField()
```

### Con estilos — el que usamos en clase

```dart
TextField(
  decoration: InputDecoration(
    labelText: 'Escribe tu nombre',
    hintText: 'ESCRIBE ACÁ',
    border: OutlineInputBorder(),
  ),
),
```

### Capturar lo que escribe el usuario — TextEditingController

Para leer el valor del `TextField` se usa un `TextEditingController`. En nuestro código lo declaramos así:

```dart
// Paso 1: declarar el controlador (fuera del build)
final TextEditingController _controller = TextEditingController();
```

Luego lo conectamos al `TextField`:

```dart
// Paso 2: asignarlo al TextField
TextField(
  controller: _controller,
  decoration: InputDecoration(
    labelText: 'Nombre',
    border: OutlineInputBorder(),
  ),
),
```

Y cuando el usuario presiona el botón, leemos el valor:

```dart
// Paso 3: leer el texto ingresado
print(_controller.text);
```

| Propiedad | Descripción |
|---|---|
| `controller` | Conecta el campo con el controlador para leer su valor |
| `labelText` | Etiqueta que aparece sobre el campo |
| `hintText` | Texto de sugerencia dentro del campo |
| `border: OutlineInputBorder()` | Agrega un borde visible alrededor del campo |
| `obscureText: true` | Oculta el texto (para contraseñas) |

---

## 3. Widget ElevatedButton (Botón)

El widget `ElevatedButton` es el botón principal de Flutter.

### Ejemplo básico — el que usamos en clase

```dart
ElevatedButton(
  onPressed: () {},
  child: Text('Enviar'),
),
```

> 📌 `onPressed` es la función que se ejecuta cuando el usuario presiona el botón. Si está vacío `() {}`, no hace nada todavía.

### Con color personalizado — también en nuestro código

```dart
ElevatedButton(
  onPressed: () {},
  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
  child: Text('Enviar'),
),
```

---

## 4. Widget ListTile

El widget `ListTile` muestra un elemento de lista con texto.

### Ejemplo básico — también en nuestro código

```dart
ListTile(title: Text('Elemento 1')),
ListTile(title: Text('Elemento 2')),
ListTile(title: Text('Elemento 3')),
```

> Lo veremos más en detalle en la clase de Listas.

---

## Cómo se ven juntos en pantalla

En nuestro `main.dart` los widgets están dentro de un `Column` que los apila verticalmente:

```dart
body: Center(
  child: Column(
    children: [
      Text('HOLA MUNDO'),
      Text(
        'Hola Mundo',
        style: TextStyle(fontSize: 24, color: Colors.blue),
      ),
      TextField(),
      TextField(
        decoration: InputDecoration(
          labelText: 'Escribe tu nombre',
          hintText: 'ESCRIBE ACÁ',
          border: OutlineInputBorder(),
        ),
      ),
      ElevatedButton(
        onPressed: () {},
        child: Text('Enviar'),
      ),
      ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
        child: Text('Enviar'),
      ),
      ListTile(title: Text('Elemento 1')),
      ListTile(title: Text('Elemento 2')),
      ListTile(title: Text('Elemento 3')),
    ],
  ),
),
```

---

## Resumen

| Widget | Para qué sirve |
|---|---|
| `Text` | Mostrar texto en pantalla |
| `TextStyle` | Dar estilo al texto (color, tamaño) |
| `TextField` | Capturar texto del usuario |
| `TextEditingController` | Leer lo que el usuario escribió |
| `ElevatedButton` | Botón principal con acción |
| `ListTile` | Elemento estándar de lista |

---

> 💡 **Tip:** Usa `SizedBox(height: 16)` entre widgets para darles espacio vertical sin configuraciones complejas.
