# 3dPrinterModels

Personal OpenSCAD sources and the printable models generated from them; published designs live at
<https://www.thingiverse.com/costmo/designs>. One top-level directory per model or project. `.scad` sources sit
beside their exports, except where a `STL/` subdirectory already exists (e.g. `Measuring Cups/STL/`) — put exports
there.

Printers in play: **Ender 3 Pro** (default target), **printerx** (the ostmoxy custom printer, `printerx/`), and a
Prusa i3 derivative (`prusa/`).

## Measure, never compute

**Every number you report about a model must come out of OpenSCAD, not out of arithmetic you did by reading the
source.** Tracing variable definitions across files, following `include` chains, and multiplying things by hand is
the single most reliable way to produce a confident, wrong answer — these models nest variables deeply enough that
hand-derivation fails silently. OpenSCAD will answer exactly, in well under a second, every time.

`.claude/tools/scad` is the harness. It wraps the local OpenSCAD (2026.02, at
`/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD`; override with `$OPENSCAD_BIN`). Run
`.claude/tools/scad --help`, or `--help` on any subcommand.

| Question | Command |
|---|---|
| What is this variable or expression worth? | `scad eval FILE topThickness 'cutoutXY + toleranceGap'` |
| How big is this model? | `scad measure FILE` |
| How big is just this piece? | `scad measure FILE -m 'wireTrap()'` |
| How far apart are those holes? | `scad measure FILE -m 'screwHoles()'` — measure the *negative* volume |
| How thick is the wall at this height? | `scad slice FILE --at z=10` |
| Does it compile clean? Is it manifold? | `scad check FILE` |
| What does it actually look like? | `scad view FILE --views iso,front,right,top` |
| What does the inside look like? | `scad view FILE --views right --cut x=30` |
| Will it fit the bed? How much filament? | `scad measure FILE` |
| Did a boolean orphan any geometry? | `scad components FILE` |
| Do these two parts actually fit together? | `scad fit BASE.scad LID.scad` |
| How much play is there, and on which axis? | `scad fit A B --sweep x:0,0.5,0.05` |
| Give me a mesh | `scad export FILE -o out.stl` |

Every subcommand takes `-D var=val` (repeatable) to override variables, so "what if the wall were 4 mm" is a
measurement, not a guess.

### How to use it well

- **`eval` is nearly free** (~0.1 s — it evaluates no geometry). Reach for it the moment a number is in question.
  It resolves the full `include` chain, so it answers questions about values defined in some other file too.
- **`-m 'expr()'` isolates one module.** The wrapper uses `use <>`, so the module still sees its own file's
  variables but the file's top-level output is not rendered. If the expression itself references a top-level
  variable of the file (e.g. `-m 'translate([bodyWidth,0,0]) foot()'`), add `--include`.
- **Measuring negative volumes is the trick for feature geometry.** Hole modules, nut traps, and cutouts are real
  geometry when called on their own: the bounding box of `screwHoles()` gives centre-to-centre spacing plus one
  hole diameter, which is an exact answer to a question that is very easy to get wrong by reading code.
- **`slice` measures a real cross-section**, not an intended one — it intersects the mesh with a thin slab and
  reports the extents plus the solid area in that plane. Use it for wall thickness, clearance gaps, and "is there
  actually material there".
- **Look at the renders.** `view` prints the PNG paths; read them back and judge the geometry against the
  requirement. A render that looks wrong is worth more than a bounding box that looks right.
- Renders default to a temp dir so they never land in the repo. `--out DIR` keeps them somewhere on purpose.
- Overlays (axes, scale ruler, mesh edges) are on by default. Keep them: in a flat-on view, a feature whose top
  face is coplanar-facing with the body behind it shades identically and **disappears entirely** without edges.
  `--clean` turns the overlays off when you want a plain picture.
- Named views are true orthographic and verified: `front` looks down +Y (X right, Z up), `right` looks down −X
  (Y left, Z up), `top` looks down −Z (X right, Y up), plus `back`, `left`, `bottom`, `iso`.

### Prove it, don't just check it

A measurement that agrees with you is worth very little on its own. Three habits
turn the harness from a spell-checker into a proof:

- **Predict, then measure.** Work the number out by hand first and say it, then
  run the tool. When `slice` returns 646.40 mm² and you predicted
  670.40 − 15 × 1.6 = 646.40, the geometry is right and you know why. When it
  disagrees, you have found something — every real defect this repo has caught
  showed up as a prediction that missed.
- **Pair every clean result with a control that must fail.** "No interference"
  and "the test is broken" produce identical output — OpenSCAD reports empty
  geometry for both. So drive the parts together deliberately and confirm you
  get the collision you can compute. A control that lands on the predicted
  number is what makes the clean result mean something.
- **Watch for a preloaded baseline.** If some other feature is already
  interfering, the first non-zero sample in a sweep tells you nothing; the point
  where the curve *turns up* is where a new feature engages. `scad fit --sweep`
  reports both.

### After every model change

1. `scad check FILE` — errors, warnings, and manifoldness.
2. `scad measure FILE` — compare the real bounding box against what the change was supposed to do.
3. `scad components FILE` — a boolean that orphans geometry still reports as manifold; this is the check
   that catches islands, and islands fall out of the print.
4. `scad view FILE --views iso,<the view that shows the change>` — and actually look at the image.
5. For anything that mates, `scad fit` both halves, with a control.

Report what the tools said. If a dimension is in your answer, it came from step 2, not from your head.

## Hard rules

- **Never generate or hand-edit `.stl`, `.gcode`, or `.FCStd` files.** They are build outputs — regenerate them
  with `scad export` instead. Slicing stays with the user.
- **Never edit vendor, firmware, or downloaded-model trees.** Read them for reference, but do not modify:
  `Marlin/`, `Marlin-RepRap/`, `BIGTREETECH-SKR-mini-E3/`, `BTT-SKR/`, `TFT24/`, `obsolete - Touch screen firmware/`,
  `prusa/Original-Prusa-i3/`, `printerx/thirdparty/`, `Brush holder/BOSL2/`, and Thingiverse imports that ship a
  `LICENSE.txt`/`SOURCES.txt` (`Customizable_card_box/`, `Decorative_Cat_and_Dinosaur/`,
  `Hatchbox_Spool_Drawers (1)/`, `Play_Doh_Extruder_Remixed/`).
- **Ask for real-world measurements.** Motor bodies, board footprints, tubing OD, bracket spacing — those come
  from the user's calipers, and he supplies them as needed. Everything about the model itself you can measure
  yourself, so measure it.
- **Never take dimensions or feature placement from a product photo.** Marketing images are staged: perspective,
  lens distortion, and art direction all move things. They are context for what a part is, never evidence for
  where a hole goes. If a spec is missing, ask — do not infer it from a picture.
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
   (holes, nut traps, cutouts), so intent is legible at the `difference()` call site *and so the harness can
   measure them in isolation*. Reusable shapes take parameters with sensible defaults. Keep
   `difference()`/`union()` nesting to 3–4 children deep; break deeper structures into sub-modules. Define modules
   at a canonical origin and apply `translate()`/`rotate()` at the call site, not inside the module.
4. **Composition last.** The final output is a single call (or a small set) at the bottom of the file, so
   sub-components can be previewed by commenting out calls without touching model logic.
5. **Aesthetic details.** Chamfer or fillet exterior edges; 1.5–2.0 mm radius unless the part says otherwise.
6. **Overshoot through-cuts.** Subtracted geometry must extend past both surfaces (`translate([0,0,-1])` and
   `height + 2`). Coincident faces leave z-fighting in preview and zero-thickness skins in the render.
7. **Verify with the harness**, per the loop above. For complex parts, build in iterable steps and measure as
   you go rather than emitting one monolith and hoping.

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

Assume the Ender 3 Pro unless the file or the request targets printerx or the Prusa. `scad measure` checks bed fit
against 220 × 220 × 250 by default; pass `--bed X,Y,Z` for another machine.

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
Match the value already in the file you're editing (`scad eval FILE m3NutDiameter`) rather than imposing a new one.

## Repo conventions

- **Style.** Hand-authored files use camelCase variables, Allman braces, and spaces inside call parens:
  `cylinder( h = 4.5, r = 4.0, $fn=6 )`. Match the file you're in; imported models keep their own style.
- **Header comment.** A `/** ... */` block at the top: what the part is, what it mounts to, and `costmo: <date>`.
- **`Module- <name>.scad`.** In `costmo Bracket/`, files with this prefix are optional add-ons `include`d by the
  parent model. Keep new add-ons to that pattern.
- **Shared code.** `printerx/Shared-modules.scad` holds modules used by more than one printerx component
  (e.g. `essCurve`) — reach for it before writing a new helper there. `Brush holder/` is the only tree that uses
  BOSL2; don't introduce that dependency elsewhere.

## Reference

Two files carry the accumulated engineering knowledge. They are not background
reading — load the relevant one before you design, or you will re-derive it
wrongly.

- **`.claude/reference/fdm-design-notes.md`** — read before designing anything
  that flexes, snaps, presses together, or spans a cutout. Carries the
  compliance arithmetic (`k = 3EI/L³`), snap-fit ramp mechanics, tolerance and
  slop strategy, thin-web strength, and fillet practice, with the measured
  numbers behind each. The headline: *a closed loop cannot flex* — a detent on
  one needs ~330 N and simply will not work.
- **`.claude/reference/openscad-gotchas.md`** — read when a measurement looks
  wrong, before hand-rolling a `use <>` wrapper, and before importing SVG. Every
  entry produced silently incorrect geometry here.

## Delegating

For a self-contained modeling task — a new bracket, holder, box, or mount — hand it to the `openscad-3d` subagent
(`.claude/agents/openscad-3d.md`), which carries this standard and the harness. Handle small edits to an existing
file inline.

After any model change, state: print orientation, whether supports are needed, and the two or three variables the
user is most likely to want to tune.
