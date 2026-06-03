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

## ¿Qué hace cada parte?

### Primera clase
| Parte | Significado |
|---|---|
| `class` | Palabra reservada de Dart para crear una clase |
| `StatefulWidgetejemplo` | El nombre que nosotros le damos al widget |
| `extends` | Significa que esta clase hereda todo de lo que viene después |
| `StatefulWidget` | Lo que hereda, le dice a Flutter que es un widget con estado |
| `@override` | Indica que vamos a reescribir el método `createState` que ya existe en Flutter |
| `State<StatefulWidgetejemplo>` | El tipo de dato que devuelve el método, un estado ligado a esta clase |
| `createState()` | Método obligatorio que crea el estado y conecta con la segunda clase |
| `=>` | Forma corta de escribir return en Dart |
| `_StatefulWidgetejemploState()` | La segunda clase donde vive todo el estado y la lógica |
---
### Segunda clase
| Parte | Significado |
|---|---|
| `class` | Palabra reservada de Dart para crear una clase |
| `_StatefulWidgetejemploState` | El nombre de la segunda clase, el guión bajo significa que es privada |
| `extends` | Significa que esta clase hereda todo de lo que viene después |
| `State<StatefulWidgetejemplo>` | Lo que hereda, la conecta directamente con la primera clase |
| `String` | El tipo de dato de la variable, en este caso texto |
| `mensaje` | El nombre de la variable que vamos a usar en pantalla |
| `= 'Hola'` | El valor inicial de esa variable |
| `@override` | Indica que vamos a reescribir el método `build` que ya existe en Flutter |
| `Widget` | El tipo de dato que devuelve el método build |
| `build` | Método obligatorio que construye lo que se ve en pantalla |
| `BuildContext context` | Información sobre dónde está el widget dentro de la app |
| `return` | Lo que devuelve el método, o sea lo que se muestra en pantalla |
| `setState()` | Le avisa a Flutter que algo cambió y tiene que redibujar la pantalla |
| `mensaje = 'Hola Mundo'` | El nuevo valor que toma la variable cuando se presiona el botón |
