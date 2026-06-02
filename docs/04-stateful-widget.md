# StatefulWidget en Flutter

> Un widget que sí puede cambiar. Cuando el estado se actualiza, la pantalla se redibuja automáticamente.

---

## ¿Qué es un StatefulWidget?

Un `StatefulWidget` es un widget **con estado**, lo que significa que puede **cambiar y actualizarse** mientras la app está en uso.

> 📌 La diferencia clave con `StatelessWidget`: aquí la pantalla **se puede redibujar** cuando los datos cambian.

---

## Lo que hicimos en clase

Al final del `main.dart` creamos `MiWidgetStateful` y lo usamos junto a `MiWidget`:

```dart
body: Center(
  child: Column(
    children: [
      MiWidget(),           // StatelessWidget — no cambia
      MiWidgetStateful(),   // StatefulWidget — sí cambia
      // ...
    ],
  ),
),
```

---

## Estructura básica — siempre son dos clases

Un `StatefulWidget` **siempre se compone de dos clases**. Así lo escribimos en clase:

```dart
// Clase 1: el widget en sí
class MiWidgetStateful extends StatefulWidget {
  @override
  State<MiWidgetStateful> createState() => _MiWidgetStatefulState();
}

// Clase 2: el estado del widget (donde viven los datos y la lógica)
class _MiWidgetStatefulState extends State<MiWidgetStateful> {
  String mensaje = 'Soy un StatefulWidget';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(mensaje),

        ElevatedButton(
          onPressed: () {
            setState(() {
              mensaje = 'Texto actualizado';
            });
          },
          child: Text('Cambiar texto'),
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

---

## El método setState()

`setState()` es el método más importante. Le dice a Flutter que **algo cambió** y debe **redibujar el widget**.

```dart
// ❌ Sin setState — la pantalla NO se actualiza aunque el dato cambie
mensaje = 'Texto actualizado';

// ✅ Con setState — la pantalla SÍ se actualiza
setState(() {
  mensaje = 'Texto actualizado';
});
```

> 📌 En nuestro ejemplo: cuando el usuario presiona el botón, `setState` cambia el valor de `mensaje` y Flutter actualiza el `Text` en pantalla automáticamente.

---

## Paso a paso: cómo funciona nuestro ejemplo

**1.** El widget inicia con `mensaje = 'Soy un StatefulWidget'`

**2.** Flutter muestra ese texto en pantalla con `Text(mensaje)`

**3.** El usuario presiona `ElevatedButton`

**4.** Se ejecuta el `onPressed`:
```dart
onPressed: () {
  setState(() {
    mensaje = 'Texto actualizado';
  });
},
```

**5.** Flutter detecta el `setState`, ejecuta `build()` de nuevo y muestra el nuevo texto

---

## Ejemplo clásico — el contador original de Flutter

Este es el contador que venía en el proyecto por defecto (lo comentamos en clase para reemplazarlo):

```dart
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;  // variable de estado

  void _incrementCounter() {
    setState(() {
      _counter++;  // cambia el estado → Flutter redibuja
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('$_counter'),  // muestra el valor actual
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: Icon(Icons.add),
      ),
    );
  }
}
```

---

## StatelessWidget vs StatefulWidget

| | StatelessWidget | StatefulWidget |
|---|---|---|
| ¿Cambia la UI? | ❌ No | ✅ Sí |
| ¿Tiene setState? | ❌ No | ✅ Sí |
| ¿Cuántas clases? | 1 | 2 |
| Ejemplo en clase | `MiWidget` | `MiWidgetStateful` |
| Uso típico | Texto fijo, íconos | Formularios, contadores, listas |

---

## Ciclo de vida básico

```
createState()      → se crea el estado (una sola vez)
       │
   build()         → construye la UI y la muestra en pantalla
       │
setState() llamado → algo cambió → Flutter llama build() de nuevo
       │
   build()         → la UI se actualiza con los nuevos datos
       │
  dispose()        → limpieza cuando el widget desaparece (opcional)
```

---

> 💡 **Tip:** Las variables que cambian con `setState()` deben declararse en la clase `_MiWidgetStatefulState`, **no dentro** del `build()`. Si las declaras dentro del `build()`, se resetean cada vez que Flutter redibuja la pantalla.
