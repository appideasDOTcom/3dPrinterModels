# OpenSCAD traps

Behaviours that produced silently wrong geometry in this repo. Each one cost a
real error, and none of them announce themselves.

## `use <>` does not import `$fa` / `$fs` / `$fn`

Modules come across; the special variables do not. A wrapper that calls an
imported module without restating them renders at OpenSCAD's *defaults*
(`$fa = 12`, `$fs = 2`) — an M3 hole comes out a hexagon and every curved
dimension is wrong. Measuring one module of the ESP mount this way reported
54.839 × 58.699 × 11.610 when the truth was 55.119 × 58.929 × 11.700.

`.claude/tools/scad -m` handles this by reading the target file's own values and
restating them. If you hand-roll a wrapper, do the same.

## `use <>` is not transitive

A module that file A only `use`s is not visible to something that `use`s A.
Calling it fails with "Ignoring unknown module" and yields empty geometry — which
looks exactly like a part that legitimately renders nothing. Wrap it in a module
defined *in* the file you are targeting.

## Empty geometry is indistinguishable from a broken test

OpenSCAD prints "Current top level object is empty" for both an intersection
that genuinely has no overlap and a script whose modules failed to resolve. Never
accept an empty result as proof of a fit. Pair it with a control that must
collide, and check the control against a figure you worked out by hand — on this
case, driving the lid 0.5 mm past its shoulder had to produce 646.40 mm² × 0.5 =
323.2 mm³, and it produced exactly that.

## A polygon edge has one slope

Building a ramp profile as a polygon anchored at the far side of its parent wall
does *not* give the ramp the angle you named — the edge runs from the anchor to
the tip, so the angle is set by the whole span, not by the protrusion. Specifying
35°/60° faces but anchoring 1.2 mm back produced 12°/16° faces and moved the
catch surfaces 0.45 mm. Anchor the profile so each edge's endpoints lie on the
face you intend, and derive the back points from the intended slope:

```scad
back_z = tip_z - ((proud + embed) * tan( angle ));   // not proud * tan(angle)
```

## `inner_fillet`'s material sits behind its origin

Measured extents for `inner_fillet( d = 4, l = 10 )`: `[-2,-2,0]` to `[0,0,10]`.
So despite the "place the origin at the corner" comment, the origin belongs one
radius *into the void* from the corner. Placed on the corner itself, the whole
fillet is buried inside existing material and does nothing.

## SVG import

- Scale is 96 dpi (1 px = 0.2646 mm) when the file carries explicit `width`/
  `height` in px. The `dpi` argument does not override that. Use
  `resize( [w, 0], auto = [false, true] )` to get a real millimetre size while
  preserving the aspect.
- `center = true` centres the SVG *document box*, not the artwork inside it. A
  `viewBox` with a non-zero origin leaves the art off-centre by that origin,
  scaled — 0.7 mm on a 60 mm logo here. Correct by translating by
  `viewBox_origin * scale`.
- A filled polygon in a logo is often the *field* of the mark with the strokes as
  negative space, so cutting it produces an opening with the strokes as fragile
  bridges rather than the strokes as slots. Render it and look before believing
  either reading. `difference() { hull() shape; shape; }` gives the inverse.

## Measuring a minimum feature width

`offset()` is 2D only, and erosion alone shrinks everything rather than isolating
thin parts. Use a morphological opening — erode then dilate by the same radius —
which deletes only features narrower than `2r`, and compare areas:

```scad
offset( r = 0.6 ) offset( r = -0.6 ) shape();   // kills anything under 1.2 mm
```

Reading widths off an SVG's point list is not a substitute: doing that here gave
2.7 mm for webs that measured 4.5 mm.
