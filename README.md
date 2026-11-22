# bombe-mtm

**Máquina de Turing Multicinta (MTM) que reproduce los principios de la Máquina Bombe, con simulación abstracta de la Máquina Enigma.**

Proyecto Final — Lenguajes Formales y Autómatas (Entrega: viernes 4 de diciembre de 2026).

## Estructura del monorepo y dueños de módulo

| Carpeta | Dueño | Contenido |
| --- | --- | --- |
| `spec/` | **A · Arquitecto teórico** | `mtm_schema.json`, `encoding.md` |
| `enigma/` | **B · Enigma** | `wirings.py`, `enigma_ref.py`, `gen_enigma_mtm.py`, `machines/enc_*.mtm.json` |
| `engine/` | **C · Motor MTM** | `mtm.py`, `compose.py`, `trace.py`, `multi2single.py`, `export_jflap.py` |
| `bombe/` | **D · Bombe** | `odometer.mtm.json`, `crib.mtm.json`, `bombe_main.mtm.json`, `menu.py`, `diagonal_board.py` |
| `tests/` | **E · Integración y QA** | Pruebas de contrato, unitarias, propiedades, co-simulación y sistema |
| `demo/` | **E · Integración y QA** | `cli.py` y `casos/` (aceptación, rechazo, falso positivo) |
| `report/` | **A · Arquitecto teórico** | `main.tex` y `sec01.tex` ... `sec09.tex` (Overleaf / LaTeX) |

## Inicio rápido

```bash
make setup
make test
make demo CASE=accept
make trace CASE=reject
```

## Reglas de trabajo

- **Rama `main` siempre en verde**; cada cambio entra por Pull Request desde `feat/<modulo>`.
- **Revisión cruzada**: `A <-> B`, `C <-> D`, y `E` revisa todos.
- **Convención de commits**: `tipo(módulo): descripción` (ej. `feat(enigma): doble paso`).
- **Oráculo único de pruebas**: `enigma/enigma_ref.py`.
