# 🤝 Cómo colaborar

¡Gracias por tu interés en aportar a **Flutter Docs**! Este repositorio crece con
ejercicios y apuntes de la comunidad. Para mantener todo ordenado, sigue estas
pautas al agregar contenido nuevo.

---

## 📂 Estructura del repositorio

```
flutter-docs-main/
├── README.md              # Índice general (documentación + ejercicios)
├── docs/                  # Apuntes teóricos numerados
│   ├── 01-instalacion.md
│   ├── 02-widgets-básicos.md
│   └── ...
└── ejercicios/            # Ejercicios prácticos
    ├── greetly.md
    ├── tap_like.md
    ├── quick_signup.md
    └── img/                # Imágenes usadas por los .md de ejercicios
```

---

## ➕ Agregar un nuevo ejercicio

1. **Crea el archivo** en `ejercicios/nombre_del_ejercicio.md` (nombre en
   `snake_case`, igual que el repo de la app si tiene uno).
2. **Sigue esta plantilla exacta** (es la que usan `greetly.md`, `tap_like.md`
   y `quick_signup.md`):

   ```markdown
   # NombreDelEjercicio

   App Flutter simple que practica **[tema/concepto principal]**: `Widget1`, `Widget2`, etc.

   ## 🔗 Repositorio de la App

   [github.com/usuario/nombre_del_ejercicio](https://github.com/usuario/nombre_del_ejercicio)

   ## 🖼️ Código

   ![Código de NombreDelEjercicio](img/nombre_del_ejercicio-code.png)

   ## ▶️ App corriendo

   ![NombreDelEjercicio en funcionamiento](img/nombre_del_ejercicio-app.png)
   ```

3. **Agrega las imágenes** a `ejercicios/img/` usando el mismo prefijo que el
   ejercicio:
   - `nombre_del_ejercicio-code.png` → captura del código relevante.
   - `nombre_del_ejercicio-app.png` → captura de la app corriendo.

4. **Actualiza el `README.md` principal**, agregando una fila nueva en la
   tabla de la sección `## 💻 Ejercicios`:

   ```markdown
   | [nombre_del_ejercicio](ejercicios/nombre_del_ejercicio.md) | Breve descripción del concepto que practica |
   ```

---

## ➕ Agregar un nuevo tema de documentación (`docs/`)

1. **Crea el archivo** en `docs/NN-nombre-del-tema.md`, donde `NN` es el
   siguiente número disponible en secuencia (por ejemplo, si el último es
   `05-formulario-básico.md`, el nuevo sería `06-...md`).
2. Usa un título principal (`#`) con el nombre del tema y desarrolla el
   contenido con ejemplos de código en bloques ` ```dart `.
3. **Actualiza el `README.md` principal**, agregando una fila nueva en la
   tabla de la sección `## 📚 Documentación`, respetando el orden numérico:

   ```markdown
   | 06 | [Nombre del Tema](docs/06-nombre-del-tema.md) | Breve descripción |
   ```

---

## ✅ Checklist antes de abrir tu Pull Request

- [ ] El archivo nuevo está en la carpeta correcta (`docs/` o `ejercicios/`).
- [ ] El nombre del archivo sigue la convención existente.
- [ ] Si es un ejercicio, incluye las dos imágenes (`-code.png` y `-app.png`)
      en `ejercicios/img/`.
- [ ] Actualicé la tabla correspondiente en el `README.md` principal.
- [ ] El contenido está en español, con emojis en los encabezados igual que
      el resto del repo (📘 📚 💻 🔗 🖼️ ▶️).

---

## 🚀 Cómo enviar tu contribución

1. Haz un **fork** del repositorio.
2. Crea una rama descriptiva: `git checkout -b agrega-ejercicio-nombre`.
3. Realiza tus cambios siguiendo esta guía.
4. Haz commit con un mensaje claro: `git commit -m "Agrega ejercicio: nombre"`.
5. Sube tu rama y abre un **Pull Request** describiendo brevemente qué
   agregaste.

¡Toda contribución que siga esta estructura es bienvenida! 🎉
