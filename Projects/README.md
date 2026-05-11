# Projects/

> Todo el trabajo activo, organizado por etapa del ciclo de vida. Cada proyecto vive en exactamente una subcarpeta en un momento dado.

---

## Subcarpetas

| Carpeta        | Descripción                                                                |     |
| ----------------| ----------------------------------------------------------------------------| -----|
| `Active/`      | Proyectos en desarrollo activo                                             |     |
| `Experiments/` | Prototipos, pruebas de concepto, sandboxes                                 |     |
| `Maintenance/` | Proyectos estables que reciben solo correcciones o actualizaciones menores |     |

---

## Ciclo de vida

```
Experiments/ → Active/ → Maintenance/ → (Archive or Delete)
```

— Un proyecto empieza en `Experiments/` cuando es incierto, se mueve a `Active/` cuando hay compromiso, y a `Maintenance/` cuando está completo en funcionalidades.

---

##  Convenciones

— Cada proyecto debe tener su propio `README.md` dentro de su carpeta describiendo su propósito, stack y estado actual.

---

## Para Agentes IA

— Cuando se te pida trabajar en un proyecto, comprueba primero en qué etapa del ciclo de vida está. Prioriza los proyectos en `Active/` para nuevas funcionalidades. Trata los proyectos en `Maintenance/` de forma conservadora — prefiere cambios mínimos y seguros. `Experiments/` puede tratarse con más libertad.
