# Graphics/

> Todos los recursos visuales. La sección más grande y estructurada del espacio de trabajo.

---

## Subcarpetas

| Carpeta        | Descripción                                        |     |
| ----------------| ----------------------------------------------------| -----|
| `Backgrounds/` | Fondos de escena y entorno                         |     |
| `Colors/`      | Paletas de color, muestras y archivos de tema      |     |
| `Cursors/`     | Punteros personalizados                            |     |
| `Icons/`       | Conjuntos de iconos e iconos individuales          |     |
| `Photos/`      | Fotografías                                        |     |
| `Sprites/`     | Sprites de personajes y objetos                    |     |
| `Textures/`    | Texturas                                           |     |
| `Tilesets/`    | Mapas de tiles para construcción de escenas/juegos |     |
| `UI/`          | Componentes de interfaz y layouts                  |     |

---

## Convenciones

- Formatos preferidos: `.png` (transparencia), `.jpg` (fotos), `.svg` (vectores), `.aseprite` / `.psd` (fuentes editables).

- Mantén los archivos fuente (`.psd`, `.ai`, `.aseprite`) junto a sus exportaciones en la misma subcarpeta, o en una subcarpeta `_src/` dentro de ella.

---

## Para Agentes IA

- Al generar o colocar recursos visuales, determina siempre primero la subcategoría correcta. `Photos/` es para fotografías; `UI/` para elementos de interfaz; nunca los mezcles. Las paletas de color y tokens de tema van en `Colors/`, no dispersos por otras subcarpetas.
