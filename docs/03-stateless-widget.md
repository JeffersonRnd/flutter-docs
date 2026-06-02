# StatelessWidget en Flutter

> Un widget que no cambia. Muestra información fija que no se actualiza mientras la app está corriendo.

---

## ¿Qué es un StatelessWidget?

Un `StatelessWidget` es un widget **sin estado**, lo que significa que una vez que se construye, su contenido **no cambia**. Es perfecto para mostrar información estática.

> 📌 La palabra "state" significa "estado". Sin estado = sin cambios en pantalla.

---

## Lo que hicimos en clase

Al final del archivo `main.dart` creamos nuestro primer widget personalizado:

```dart
// Acá creamos el widget
class MiWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Bienvenidos a mi primera app');
  }
}
```

Y lo llamamos desde el `body` del `Scaffold`:

```dart
body: Center(
  child: Column(
    children: [
      // Llamamos al widget acá
      MiWidget(),
      // ...otros widgets
    ],
  ),
),
```

> 📌 Fíjate: `MiWidget()` se usa igual que cualquier otro widget de Flutter como `Text()` o `ElevatedButton()`.

---

## Estructura básica

```dart
import 'package:flutter/material.dart';

class MiWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Hola, soy un StatelessWidget');
  }
}
```

### Partes importantes

| Parte | Descripción |
|---|---|
| `class MiWidget` | Nombre del widget (siempre en PascalCase: primera letra mayúscula) |
| `extends StatelessWidget` | Indica que es un widget sin estado |
| `build()` | Método obligatorio que construye y devuelve la UI |
| `BuildContext context` | Información sobre dónde está el widget dentro de la app |

---

## ¿Por qué crear nuestros propios widgets?

En lugar de escribir todo el código en un solo lugar, podemos **separarlo en partes** más pequeñas y reutilizables.

**Sin widget propio** — todo junto en el `build`:

```dart
Column(
  children: [
    Text('Bienvenidos a mi primera app'),
    // ...100 líneas más de código
  ],
)
```

**Con widget propio** — separado y limpio:

```dart
Column(
  children: [
    MiWidget(),  // ✅ limpio y reutilizable
    // ...
  ],
)
```

---

## Ejemplo completo — lo que está en nuestro main.dart

Este es exactamente el widget que creamos en clase:

```dart
class MiWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Bienvenidos a mi primera app');
  }
}
```

Si quisiéramos hacerlo más completo (con `Scaffold`, `AppBar`, etc.) sería así:

```dart
class PantallaBienvenida extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bienvenida')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.flutter_dash, size: 80, color: Colors.blue),
            SizedBox(height: 16),
            Text(
              '¡Bienvenido a Flutter!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## StatelessWidget con parámetros

También podemos pasarle datos a nuestro widget mediante el constructor:

```dart
class TarjetaUsuario extends StatelessWidget {
  // Parámetros que recibe el widget
  final String nombre;
  final String correo;

  // Constructor
  const TarjetaUsuario({
    required this.nombre,
    required this.correo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(nombre, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(correo),
          ],
        ),
      ),
    );
  }
}
```

Y se usa así:

```dart
TarjetaUsuario(
  nombre: 'Juan Pérez',
  correo: 'juan@correo.com',
)
```

---

## ¿Cuándo usar StatelessWidget?

✅ Úsalo cuando:
- La información que muestra **no cambia**
- No necesitas responder a acciones del usuario
- Es un componente visual reutilizable con datos fijos

❌ No lo uses cuando:
- El usuario interactúa y la pantalla debe **actualizarse**
- Necesitas un contador, formulario, o cualquier dato que cambie → usa `StatefulWidget`

---

## Resumen visual

```
StatelessWidget
    │
    └── build()
            │
            └── Devuelve la UI (un widget)
                No cambia una vez construido
```

> 💡 **Tip:** Si tu widget solo muestra información y no reacciona a nada, usa `StatelessWidget`. Es más simple y eficiente.
