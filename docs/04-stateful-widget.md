# StatefulWidget en Flutter

> Un widget que sí puede cambiar. Cuando el estado se actualiza, la pantalla se redibuja automáticamente.

---

## ¿Qué es un StatefulWidget?

Un `StatefulWidget` es un widget **con estado**, lo que significa que puede **cambiar y actualizarse** mientras la app está en uso.

> 📌 La diferencia clave con `StatelessWidget`: aquí la pantalla **se puede redibujar** cuando los datos cambian.

---
## Creamos un StatefulWidget

Al final del archivo `main.dart` creamos nuestro primer widget personalizado:

```dart
class StatefulWidgetejemplo extends StatefulWidget {
  @override
  State<StatefulWidgetejemplo> createState() => _StatefulWidgetejemploState();
}

class _StatefulWidgetejemploState extends State<StatefulWidgetejemplo> {
  String mensaje = 'Hola';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(mensaje),
        ElevatedButton(
          onPressed: () {
            setState(() {
              mensaje = 'Hola Mundo';
            });
          },
          child: Text('Cambiar'),
        ),
      ],
    );
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
      // Llamamos al otro widget acá
      StatefulWidgetejemplo(),
      // ...otros widgets
    ],
  ),
),
```
---

## Estructura básica — siempre son dos clases

Un `StatefulWidget` **siempre se compone de dos clases**. Así lo escribimos en clase:

```dart
// Clase 1: el widget en sí
class StatefulWidgetejemplo extends StatefulWidget {
  @override
  State<StatefulWidgetejemplo> createState() => _StatefulWidgetejemploState();
}

// Clase 2: el estado del widget (donde viven los datos y la lógica)
class _StatefulWidgetejemploState extends State<StatefulWidgetejemplo> {
  String mensaje = 'Hola';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(mensaje),
        ElevatedButton(
          onPressed: () {
            setState(() {
              mensaje = 'Hola Mundo';
            });
          },
          child: Text('Cambiar'),
        ),
      ],
    );
  }
}
```

### ¿Qué hace cada parte?

| Parte | Descripción |
|---|---|
| `StatefulWidget` | El widget en sí. No contiene lógica, solo crea el estado |
| `createState()` | Conecta el widget con su clase de estado |
| `State<MiWidgetStateful>` | Aquí viven los datos y el método `build()` |
| `String mensaje` | Variable de estado — cuando cambia, la pantalla se redibuja |
| `setState()` | Le avisa a Flutter que algo cambió y que tiene que redibujar |
