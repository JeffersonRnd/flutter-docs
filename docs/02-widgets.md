# Widgets básicos en Flutter
### Text, Input, Button y Formulario

> Los widgets son los bloques de construcción de cualquier app en Flutter. Todo lo que ves en pantalla es un widget.

---

## ¿Qué es un Widget?

Un widget es un componente visual. Puede ser un texto, un botón, un campo de texto, un ícono, etc. En Flutter **todo es un widget**, incluso la pantalla completa.

---

## 1. Widget Text

El widget `Text` muestra un texto en pantalla.

### Ejemplo básico

```dart
Text('Hola, Flutter!')
```

### Con estilos

```dart
Text(
  'Hola, Flutter!',
  style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
  ),
)
```

| Propiedad | Descripción |
|---|---|
| `fontSize` | Tamaño de la fuente |
| `fontWeight` | Grosor del texto (bold, normal) |
| `color` | Color del texto |
| `textAlign` | Alineación (center, left, right) |

---

## 2. Widget TextField (Input)

El widget `TextField` permite al usuario escribir texto.

### Ejemplo básico
```dart
TextField()
```
### Con estilo
```dart
TextField(
  decoration: InputDecoration(
    labelText: 'Escribe tu nombre',
    hintText: 'Ej: Juan',
    border: OutlineInputBorder(),
  ),
)
```
### Capturar lo que escribe el usuario

Para leer el valor del `TextField` se usa un `TextEditingController`:

```dart
// 1. Crear el controlador
final TextEditingController _controller = TextEditingController();

// 2. Asignarlo al TextField
TextField(
  controller: _controller,
  decoration: InputDecoration(
    labelText: 'Nombre',
    border: OutlineInputBorder(),
  ),
)

// 3. Leer el valor cuando lo necesites
print(_controller.text); // imprime lo que escribió el usuario
```

| Propiedad | Descripción |
|---|---|
| `controller` | Controla y lee el texto ingresado |
| `labelText` | Etiqueta que aparece sobre el campo |
| `hintText` | Texto de sugerencia dentro del campo |
| `obscureText: true` | Oculta el texto (para contraseñas) |
| `keyboardType` | Tipo de teclado (email, número, etc.) |

---

## 3. Widget Button

Flutter tiene varios tipos de botones:

### ElevatedButton (botón con sombra)

```dart
ElevatedButton(
  onPressed: () {
    print('Botón presionado');
  },
  child: Text('Aceptar'),
)
```

### TextButton (botón de texto plano)

```dart
TextButton(
  onPressed: () {
    print('Texto presionado');
  },
  child: Text('Cancelar'),
)
```

### OutlinedButton (botón con borde)

```dart
OutlinedButton(
  onPressed: () {
    print('Outline presionado');
  },
  child: Text('Ver más'),
)
```

### Con estilo personalizado

```dart
ElevatedButton(
  onPressed: () {},
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
  ),
  child: Text('Enviar'),
)
```
## Resumen

| Widget | Para qué sirve |
|---|---|
| `Text` | Mostrar texto en pantalla |
| `TextField` | Capturar texto del usuario |
| `ElevatedButton` | Botón principal con acción |
| `TextButton` | Botón secundario sin fondo |
| `OutlinedButton` | Botón con borde visible |

---

> 💡 **Tip:** Usa `SizedBox(height: 16)` entre widgets para darles espacio vertical sin necesidad de configuraciones complejas.
