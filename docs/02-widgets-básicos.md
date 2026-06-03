# Widgets básicos en Flutter
### Text, TextField y ElevatedButton

> Los widgets son los bloques de construcción de cualquier app en Flutter. Todo lo que ves en pantalla es un widget.

---

## ¿Qué es un Widget?

Un widget es un componente visual. Puede ser un texto, un botón, un campo de texto, un ícono, etc. En Flutter **todo es un widget**, incluso la pantalla completa.

---

## Paso 1 — Eliminamos lo que venía por defecto

El proyecto de Flutter trae por defecto un contador con un botón flotante. Lo primero que hacemos es **comentar todo eso** para empezar desde cero. Comentamos el método del contador, el `floatingActionButton` y todo el body original:

```dart
/*int _counter = 0;

void _incrementCounter() {
  setState(() {
    _counter++;
  });
}*/
```

```dart
/*floatingActionButton: FloatingActionButton(
  onPressed: _incrementCounter,
  child: Icon(Icons.add),
),*/
```

> 📌 Comentar es mejor que borrar mientras aprendemos. Si algo sale mal podemos descomentar y volver atrás.

---

## Paso 2 — Primer body: un solo widget a la vez

Comentamos el body original y creamos uno nuevo. La idea es ir probando cada widget **de uno en uno**, comentando y descomentando para ver cómo se ve cada uno:

```dart
body: Center(
  //child: Text("HOLA MUNDO"),
  //child: TextField(),
  child: ElevatedButton(
    onPressed: () {},
    child: Text("iniciar sesión"),
  ),
),
```

> 📌 `Center` solo puede tener un `child`, entonces descomentamos uno y comentamos los demás para ver cada widget por separado.

---

## Paso 3 — Segundo body: varios widgets juntos

Comentamos el body anterior y creamos uno nuevo. Ahora usamos `Column` para mostrar **varios widgets al mismo tiempo**, primero en su versión básica sin estilos:

```dart
body: Center(
  child: Column(
    children: [
      Text("APLICACIONES MOVILES"),
      TextField(),
      ElevatedButton(
        onPressed: () {},
        child: Text("iniciar sesión"),
      ),
      ListTile(title: Text("- ADMINISTRADOR")),
      ListTile(title: Text("- CONTADOR")),
      ListTile(title: Text("- SECRETARIO")),
    ],
  ),
),
```

---

## Paso 4 — Agregamos estilos a cada widget

Ya que vemos cómo se ven sin estilos, ahora los personalizamos uno por uno.

---

### Widget Text con estilo

```dart
// Sin estilo
Text("APLICACIONES MOVILES")

// Con estilo
Text(
  "APLICACIONES MOVILES",
  style: TextStyle(fontSize: 30, color: Colors.red),
)
```

| Propiedad | Descripción |
|---|---|
| `fontSize` | Tamaño de la fuente |
| `fontWeight` | Grosor: `FontWeight.bold` para negrita |
| `color` | Color del texto |

---

### Widget TextField con estilo

```dart
// Sin estilo — se va de extremo a extremo
TextField()

// Con decoración — etiqueta, sugerencia y borde
TextField(
  decoration: InputDecoration(
    labelText: 'escriba su correo',
    hintText: 'usuario@gmail.com',
    border: OutlineInputBorder(),
  ),
)
```

El problema es que el `TextField` ocupa todo el ancho de la pantalla. Para reducirlo lo envolvemos en un `SizedBox` y le damos un ancho:

```dart
// Con ancho reducido
SizedBox(
  width: 300,
  child: TextField(
    decoration: InputDecoration(
      labelText: 'escriba su correo',
      hintText: 'usuario@gmail.com',
      border: OutlineInputBorder(),
    ),
  ),
)
```

| Propiedad | Descripción |
|---|---|
| `labelText` | Etiqueta que aparece sobre el campo |
| `hintText` | Texto de sugerencia dentro del campo |
| `border: OutlineInputBorder()` | Borde visible alrededor del campo |
| `SizedBox width` | Reduce el ancho del campo |

---

### Widget ElevatedButton con estilo

```dart
// Sin estilo
ElevatedButton(
  onPressed: () {},
  child: Text("iniciar sesión"),
)

// Con color de fondo y estilo de texto
ElevatedButton(
  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
  onPressed: () {},
  child: Text(
    "iniciar sesión",
    style: TextStyle(fontSize: 10, color: Colors.black87),
  ),
)
```

| Propiedad | Descripción |
|---|---|
| `backgroundColor` | Color de fondo del botón |
| `onPressed: () {}` | Función vacía, el botón no hace nada todavía |
| `TextStyle` dentro del `child` | Estilo del texto del botón |

---

### Widget ListTile

```dart
ListTile(title: Text("- ADMINISTRADOR")),
ListTile(title: Text("- CONTADOR")),
ListTile(title: Text("- SECRETARIO")),
```

> 📌 `ListTile` es el widget estándar para mostrar elementos en una lista. Lo veremos más en detalle en la clase de Listas.

---

## El código completo con estilos

```dart
body: Center(
  child: Column(
    children: [
      StatelessWidgetejemplo(),
      StatefulWidgetejemplo(),

      Text(
        "APLICACIONES MOVILES",
        style: TextStyle(fontSize: 30, color: Colors.red),
      ),

      SizedBox(
        width: 300,
        child: TextField(
          decoration: InputDecoration(
            labelText: 'escriba su correo',
            hintText: 'usuario@gmail.com',
            border: OutlineInputBorder(),
          ),
        ),
      ),

      ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
        onPressed: () {},
        child: Text(
          "iniciar sesión",
          style: TextStyle(fontSize: 10, color: Colors.black87),
        ),
      ),

      ListTile(title: Text("- ADMINISTRADOR")),
      ListTile(title: Text("- CONTADOR")),
      ListTile(title: Text("- SECRETARIO")),
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
| `SizedBox` | Controlar el ancho o alto de un widget |
| `ElevatedButton` | Botón principal con acción |
| `ListTile` | Elemento estándar de lista |

---

> 💡 **Tip:** Comenta el body anterior antes de crear uno nuevo. Así puedes volver atrás si algo sale mal.
