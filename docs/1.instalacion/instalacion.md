# Flutter + VS Code + Chrome
### Guía de inicio rápido para Windows — Sin emulador

> Ejecuta tu primera app Flutter directamente en Google Chrome, sin necesidad de un emulador Android.

---

## 📋 Requisitos previos

| Herramienta | Descripción |
|---|---|
| [Flutter SDK](https://docs.flutter.dev/install/manual) | Framework principal |
| [Visual Studio Code](https://code.visualstudio.com/) | Editor recomendado |
| [Google Chrome](https://www.google.com/chrome/) | Se usará como dispositivo |

---

## 1. Instalar el SDK de Flutter

Descarga el ZIP del SDK desde la página oficial:

🔗 https://docs.flutter.dev/install/manual

Descomprime el archivo en el disco que prefieras. Se recomienda una ruta sin espacios:

```
D:\develop\flutter
```

> ⚠️ Evita rutas como `C:\Program Files\` ya que pueden causar problemas de permisos.

---

## 2. Agregar Flutter al PATH del sistema

Para que Windows reconozca el comando `flutter` desde cualquier terminal:

1. Presiona `Win + S` y busca **Variables de entorno del sistema**
2. Clic en **Editar las variables de entorno del sistema**
3. Clic en **Variables de entorno...**
4. En la sección **Variables del sistema**, selecciona **Path** → **Editar**
5. Clic en **Nuevo** y escribe la ruta a la carpeta `bin` de Flutter:
   ```
   D:\develop\flutter\bin
   ```
6. **Aceptar** en todas las ventanas
7. **Reinicia VS Code** para que tome los cambios

Verifica la instalación en una terminal nueva:

```bash
flutter doctor
```

---

## 3. Instalar extensiones en VS Code

Abre el panel de extensiones con `Ctrl + Shift + X` e instala:

| Extensión | Propósito |
|---|---|
| **Flutter** | Soporte principal: debugging, hot reload, comandos |
| **Dart** | Soporte del lenguaje Dart |
| **Awesome Flutter Snippets** | Atajos para widgets comunes |
| **Flutter Widget Snippets** | Snippets adicionales de widgets |
| **Dart Import** | Organiza imports automáticamente |

---

## 4. Habilitar Flutter Web

Abre la terminal integrada de VS Code con `Ctrl + `` ` `` ` y ejecuta:

```bash
flutter config --enable-web
```

Luego actualiza Flutter:

```bash
flutter upgrade
```

> ✅ Solo necesitas hacer esto una vez.

---

## 5. Crear un nuevo proyecto

**Opción A — Desde VS Code (recomendado):**

1. Presiona `Ctrl + Shift + P`
2. Escribe **Flutter: New Project** y selecciónalo
3. Selecciona **Application**
4. Elige la carpeta donde guardar el proyecto
5. Escribe el nombre del proyecto (sin mayúsculas ni espacios, ej: `mi_app`)
6. Presiona `Enter`

**Opción B — Desde la terminal:**

```bash
flutter create mi_app
cd mi_app
code .
```

---

## 6. Seleccionar Chrome como dispositivo

En la **barra inferior de VS Code** haz clic sobre el selector de dispositivos y elige:

```
Chrome (web)
```

Si Chrome no aparece, verifica con:

```bash
flutter devices
```

---

## 7. Ejecutar la aplicación

Primero abre el archivo principal del proyecto:

```
lib/main.dart
```

Luego ejecuta con cualquiera de estas formas:

| Método | Acción |
|---|---|
| `Ctrl + F5` | Ejecutar sin depuración (más rápido) |
| `F5` | Ejecutar con depuración |
| Terminal | `flutter run -d chrome` |

Flutter compilará el proyecto y abrirá Chrome automáticamente. 🚀

> 💡 **Hot Reload:** cada vez que guardes con `Ctrl + S`, la app se actualiza automáticamente en Chrome sin necesidad de volver a ejecutar.

---

## 8. Verificar el entorno

```bash
flutter doctor
```

| Estado | Significado |
|---|---|
| ✅ Flutter | SDK instalado correctamente |
| ✅ Chrome | Listo para ejecutar apps web |
| ⚠️ Android toolchain | No necesario si usas solo Chrome |
| ⚠️ Visual Studio | Solo necesario para apps de escritorio Windows |

---

## 📁 Estructura del proyecto

```
mi_app/
├── lib/
│   └── main.dart       ← Código principal de la app
├── web/                ← Archivos para la versión web
├── android/
├── ios/
└── pubspec.yaml        ← Dependencias del proyecto
```

---

## 🔗 Recursos útiles

- [Documentación oficial de Flutter](https://docs.flutter.dev/)
- [API de Flutter](https://api.flutter.dev/)
- [Canal de YouTube oficial](https://www.youtube.com/c/flutterdev)
