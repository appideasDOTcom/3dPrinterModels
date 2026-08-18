# 3dPrinterModels

Personal OpenSCAD sources and the printable models generated from them; published designs live at
<https://www.thingiverse.com/costmo/designs>. One top-level directory per model or project. `.scad` sources sit
beside their exports, except where a `STL/` subdirectory already exists (e.g. `Measuring Cups/STL/`) — put exports
there.

Printers in play: **Ender 3 Pro** (default target), **printerx** (the ostmoxy custom printer, `printerx/`), and a
Prusa i3 derivative (`prusa/`).

## Hard rules

- **Never run the OpenSCAD binary, a slicer, or any render/export command.** Author and edit `.scad` files only —
  rendering and slicing are the user's step.
- **Never generate or hand-edit `.stl`, `.gcode`, or `.FCStd` files.** They are build outputs.
- **Never edit vendor, firmware, or downloaded-model trees.** Read them for reference, but do not modify:
  `Marlin/`, `Marlin-RepRap/`, `BIGTREETECH-SKR-mini-E3/`, `BTT-SKR/`, `TFT24/`, `obsolete - Touch screen firmware/`,
  `prusa/Original-Prusa-i3/`, `printerx/thirdparty/`, `Brush holder/BOSL2/`, and Thingiverse imports that ship a
  `LICENSE.txt`/`SOURCES.txt` (`Customizable_card_box/`, `Decorative_Cat_and_Dinosaur/`,
  `Hatchbox_Spool_Drawers (1)/`, `Play_Doh_Extruder_Remixed/`).
- Output valid OpenSCAD only — no pseudocode, no `// add geometry here` placeholders, no partial snippets when a
  whole file is what's needed.

## OpenSCAD authoring standard

1. **Render quality.** Every file opens with `$fa = 1;` and `$fs = 0.1;`. Never set `$fn` globally — it overrides
   both and fixes segment count regardless of shape size. Per-call `$fn` is correct and used throughout this repo
   for faceted features: `$fn=6` for hex nut traps and hex head recesses, `$fn=64` where a circle must be smooth.
2. **Named variables.** Every dimension is a named variable declared above the modules. No bare numeric literals in
   geometry calls. Descriptive names (`mountWidth`, not `w`); tolerances get their own variables
   (`toleranceGap`, `clearance`) so they can be tuned independently of the dimensions they modify.
3. **Modules.** Encapsulate every distinct part and reusable shape in a named module — including negative volumes
   (holes, nut traps, cutouts), so intent is legible at the `difference()` call site. Reusable shapes take
   parameters with sensible defaults. Keep `difference()`/`union()` nesting to 3–4 children deep; break deeper
   structures into sub-modules. Define modules at a canonical origin and apply `translate()`/`rotate()` at the call
   site, not inside the module.
4. **Composition last.** The final output is a single call (or a small set) at the bottom of the file, so
   sub-components can be previewed by commenting out calls without touching model logic.
5. **Aesthetic details.** Chamfer or fillet exterior edges; 1.5–2.0 mm radius unless the part says otherwise.
6. **Verify before finalizing.** Re-read the geometry for correctness. For complex parts, plan the build order in
   iterable steps rather than emitting one monolith.

### File template

```scad
/**
 * [Part name] — what it is and what it attaches to.
 *
 * costmo: YYYY-MM-DD
 */

/* Render quality */
$fa = 1;
$fs = 0.1;

/* --- Dimensions (mm) --- */
bodyWidth = 40.0;

/* --- Tolerances --- */
clearance = 0.2;

/* --- Modules --- */
module body()
{
  cube( [bodyWidth, bodyHeight, bodyDepth] );
}

module screwHole( diameter = 3.2, depth = 10 )
{
  cylinder( h = depth, d = diameter );
}

/* --- Output --- */
difference()
{
  body();
  screwHoles();
}
```

## Printer constraints

Assume the Ender 3 Pro unless the file or the request targets printerx or the Prusa.

| Parameter | Value | Notes |
|---|---|---|
| Print bed | 220 × 220 × 250 mm | Max part envelope |
| Default wall thickness | 3.0 mm | Minimum for structural parts |
| Screw hole clearance | +0.2 mm over nominal | M3 → 3.2 mm dia |
| Press-fit clearance | −0.1 to 0 mm | Tune per material |
| Minimum feature size | 0.8 mm | 2 × 0.4 mm nozzle width |
| Layer height (reference) | 0.2 mm | For snap-fits and layer-aligned features |
| Default fillet radius | 1.5–2.0 mm | Exterior edges |

### Fasteners

| Fastener | Clearance hole | Counterbore dia | Nut trap (across flats, `$fn=6`) | Notes |
|---|---|---|---|---|
| M3 | 3.2 mm | 6.5 mm | ~6.4 mm | Boards, brackets — most common here |
| M4 | 4.3 mm | 8.5 mm | ~7.7 mm | Extrusion T-nuts |
| M5 | 5.3 mm | 10.0 mm | ~8.8 mm | 2020 extrusion end caps |

Nut-trap diameters vary with filament and printer; existing files set `m3NutDiameter` between 6.3 and 6.9 mm.
Match the value already used in the file you're editing rather than imposing a new one.

## Repo conventions

- **Style.** Hand-authored files use camelCase variables, Allman braces, and spaces inside call parens:
  `cylinder( h = 4.5, r = 4.0, $fn=6 )`. Match the file you're in; imported models keep their own style.
- **Header comment.** A `/** ... */` block at the top: what the part is, what it mounts to, and `costmo: <date>`.
- **`Module- <name>.scad`.** In `costmo Bracket/`, files with this prefix are optional add-ons `include`d by the
  parent model. Keep new add-ons to that pattern.
- **Shared code.** `printerx/Shared-modules.scad` holds modules used by more than one printerx component
  (e.g. `essCurve`) — reach for it before writing a new helper there. `Brush holder/` is the only tree that uses
  BOSL2; don't introduce that dependency elsewhere.
- **Ask, don't guess, on measurements.** Real-world dimensions (motor bodies, board footprints, tubing OD) come
  from the user's calipers. Ask rather than inventing a plausible number.

## Working on a model

For a self-contained modeling task — a new bracket, holder, box, or mount — delegate to the `openscad-3d`
subagent (`.claude/agents/openscad-3d.md`), which carries this standard plus the geometry patterns. Handle
edits to an existing file inline when the change is small and the context is already loaded.

After any model change, state: print orientation, whether supports are needed, and the two or three variables
the user is most likely to want to tune.
