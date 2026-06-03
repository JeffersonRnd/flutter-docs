# StatelessWidget en Flutter

> Un widget que no cambia. Muestra información fija que no se actualiza mientras la app está corriendo.

---

## ¿Qué es un StatelessWidget?

Un `StatelessWidget` es un widget **sin estado**, lo que significa que una vez que se construye, su contenido **no cambia**. Es perfecto para mostrar información estática.

> 📌 La palabra "state" significa "estado". Sin estado = sin cambios en pantalla.

---

## Creamos un StatelessWidget

Al final del archivo `main.dart` creamos nuestro primer widget personalizado:

```dart
class StatelessWidgetejemplo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Text("Textoooo" ));
  }
}
```

Y lo llamamos desde el `body` del `Scaffold`:

```dart
body: Center(
  child: Column(
    children: [
      // Llamamos al widget acá
      StatelessWidgetejemplo(),
      // ...otros widgets
    ],
  ),
),
```

> 📌 Fíjate: `MiWidget()` se usa igual que cualquier otro widget de Flutter como `Text()` o `ElevatedButton()`.

---
### Partes importantes

| Parte | Significado |
|---|---|
| `class` | Palabra reservada de Dart para crear una clase |
| `StatelessWidgetejemplo` | El nombre que nosotros le damos al widget |
| `extends StatelessWidget` | Le dice a Flutter que esta clase es un widget sin estado |
| `@override` | Indica que vamos a reescribir el método `build` que ya existe en Flutter |
| `Widget build` | Método obligatorio que construye lo que se ve en pantalla |
| `BuildContext context` | Información sobre dónde está el widget dentro de la app |
| `return` | Lo que devuelve el widget, o sea lo que se muestra en pantalla |

---

## ¿Por qué crear nuestros propios widgets?

En lugar de escribir todo el código en un solo lugar, podemos **separarlo en partes** más pequeñas y reutilizables.
