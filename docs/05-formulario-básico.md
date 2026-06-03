# Formulario básico
---

Creamos un formulario simple que permite al usuario escribir un nombre, guardarlo en una lista que se muestra en pantalla en tiempo real, y limpiar el campo automáticamente después de guardar.

Para este formulario usamos **dos widgets propios**:
- `TituloFormulario` — un StatelessWidget que solo muestra el título
- `Formulario` — un StatefulWidget que maneja toda la lógica

---

## Parte 1: TituloFormulario (StatelessWidget)

```dart
class TituloFormulario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('FORMULARIO', style: TextStyle(fontSize: 24, color: Colors.brown));
  }
}
```

Este widget solo muestra el título del formulario. No cambia, no tiene lógica, por eso es StatelessWidget. Se usa adentro del `Formulario`.

---

## Parte 2: Formulario (StatefulWidget)

### Primera clase — declara el widget

```dart
class Formulario extends StatefulWidget {
  @override
  State<Formulario> createState() => _FormularioState();
}
```

Su único trabajo es declarar el widget y conectar con la segunda clase `_FormularioState` donde vive todo.

---

### Segunda clase — aquí vive todo

#### Paso 1: Declarar el controlador y la lista

```dart
class _FormularioState extends State<Formulario> {
  final TextEditingController _controller = TextEditingController();
  List<String> nombres = [];
```

`TextEditingController` es el puente entre el `TextField` y nuestro código, sin él no podemos leer lo que el usuario escribió. `List<String> nombres = []` es la lista vacía donde vamos a guardar los nombres.

---

#### Paso 2: El título usando nuestro StatelessWidget

```dart
TituloFormulario(),
```

Acá llamamos al widget que creamos arriba. En lugar de escribir el `Text` directamente, lo separamos en su propio widget.

---

#### Paso 3: El campo de texto con ancho reducido

```dart
SizedBox(
  width: 300,
  child: TextField(
    controller: _controller,
    decoration: InputDecoration(
      labelText: 'Escribe un nombre',
      border: OutlineInputBorder(),
    ),
  ),
),
```

`SizedBox` con `width: 300` reduce el ancho del campo, sin él ocuparía toda la pantalla. `controller: _controller` conecta el campo con el controlador para poder leer lo que el usuario escribe.

---

#### Paso 4: El botón que guarda y limpia

```dart
ElevatedButton(
  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
  onPressed: () {
    setState(() {
      nombres.add(_controller.text);
      _controller.clear();
    });
  },
  child: Text('Guardar'),
),
```

Adentro del `setState` hay dos cosas:

`nombres.add(_controller.text)` agrega el texto escrito al final de la lista.

`_controller.clear()` limpia el campo de texto después de guardar, así el usuario no tiene que borrarlo manualmente. Esta línea la agregamos después porque en la primera versión el campo quedaba con el texto anterior.

---

#### Paso 5: La lista que muestra los nombres

```dart
Column(
  children: nombres.map((nombre) => ListTile(title: Text(nombre))).toList(),
),
```

`nombres.map(...)` recorre cada nombre de la lista y lo convierte en un `ListTile`. `.toList()` convierte el resultado en una lista que `Column` puede mostrar. Cada vez que se presiona Guardar, `setState` redibuja esta parte con el nuevo nombre agregado.

---

## El código completo

```dart
class TituloFormulario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('FORMULARIO', style: TextStyle(fontSize: 24, color: Colors.brown));
  }
}

class Formulario extends StatefulWidget {
  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final TextEditingController _controller = TextEditingController();
  List<String> nombres = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TituloFormulario(),

        SizedBox(
          width: 300,
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Escribe un nombre',
              border: OutlineInputBorder(),
            ),
          ),
        ),

        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          onPressed: () {
            setState(() {
              nombres.add(_controller.text);
              _controller.clear();
            });
          },
          child: Text('Guardar'),
        ),

        Column(
          children: nombres.map((nombre) => ListTile(title: Text(nombre))).toList(),
        ),
      ],
    );
  }
}
```

---

## ¿Cómo llamar al Formulario desde el body?

Tienes dos opciones:

**Opción 1 — comentar todo el body anterior y poner solo esto:**

```dart
body: Center(
  child: Formulario(),
),
```

**Opción 2 — llamarlo dentro del Column junto a otros widgets:**

```dart
body: Center(
  child: Column(
    children: [
      Formulario(),
    ],
  ),
),
```

La opción 1 es la más limpia cuando el formulario es toda la pantalla.

---

## ¿Cómo funciona todo junto?

**1.** El usuario escribe un nombre en el `TextField`

**2.** Presiona el botón **Guardar**

**3.** Se ejecuta el `setState` con dos acciones: agrega el nombre a la lista y limpia el campo

**4.** Flutter detecta el `setState` y redibuja la pantalla

**5.** El `Column` muestra el nuevo nombre agregado en la lista

**6.** El campo queda vacío listo para escribir otro nombre

---

## Resumen

| Parte | Para qué sirve |
|---|---|
| `TituloFormulario` | StatelessWidget que muestra el título |
| `Formulario` | StatefulWidget que maneja toda la lógica |
| `TextEditingController` | Lee lo que el usuario escribió en el TextField |
| `List<String> nombres` | Lista donde se guardan los nombres |
| `nombres.add(...)` | Agrega un nombre al final de la lista |
| `_controller.clear()` | Limpia el campo de texto después de guardar |
| `setState()` | Avisa a Flutter que la lista cambió para redibujar |
| `SizedBox width: 300` | Reduce el ancho del TextField |
| `.map(...).toList()` | Convierte la lista de nombres en widgets ListTile |
