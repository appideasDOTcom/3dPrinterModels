# FDM mechanism design notes

Working figures and hard-won results from designing printed enclosures in this
repo. Read this before designing a snap fit, a press fit, a living hinge, or any
feature meant to flex. Every number here was either computed and then confirmed
against a print, or measured with `.claude/tools/scad`.

Material constants used throughout, for PLA:

| | |
|---|---|
| Young's modulus `E` | ~3500 MPa |
| Flexural strength | ~60 MPa |
| Yield strain | 2–3% |
| Density | 1.24 g/cm³ |

## Compliance: know what can actually flex

**This is the single most important thing on this page.** A snap fit only works
if one member can deflect. Before designing any detent, work out the force.

```
I = b·t³/12          second moment, b = width, t = thickness
k = 3EI/L³           cantilever spring rate, L = free length
F = k·δ              force to deflect by δ
ε = 3tδ/(2L²)        peak surface strain — keep under ~1.5% for PLA
```

Thickness is cubed in both `I` and the stiffness, so it dominates everything.
Doubling thickness is 8× the force.

**`L` is root-to-LOAD, not root-to-tip.** The load is at the hook, and any finger
that continues past its hook is dead weight — it adds no compliance. Getting this
wrong cost 46% here: quoting the finger's 17.7 mm overall length instead of the
14.65 mm to its hook understated stiffness as 23 N/mm when it was 41, and root
stress as 27 MPa when it was 39. Measure the arm to the *contact surface*, and
when the hook has a land, to the corner that actually bears.

**Width is the one free lever.** Look at what `b` does and does not appear in:

```
k = 3EI/L³  ∝ b        force scales with width
ε = 3tδ/(2L²)          no width term at all
```

So widening a finger buys holding force at *zero* cost in strain. When a design
is stress-limited — as any short cantilever in PLA quickly is — width is the
first thing to spend and the last thing to be short of. Here 36 → 48 mm was +33%
of grip at an unchanged 39.147 MPa. The only cost is that a release lever working
against that spring gets proportionally harder.

**An empirical stress ceiling beats a textbook one.** PLA interlayer strength is
usually quoted around 40 MPa, but the number that matters is what *this* filament
on *this* printer survives. The first finger in this repo ran at 39.2 MPa and was
assembled repeatedly without cracking, which licenses later designs up to that
figure with far more confidence than a handbook value. When a part survives, write
down the stress it survived at.

**A closed loop cannot flex.** A collar wrapping a box is not a cantilever; its
ends are restrained by the loop and by whatever caps it. The first version of
the battery case put detent beads on a 6 mm-deep collar, 1.6 mm thick, needing
0.25 mm of deflection:

```
I = 20 × 1.6³/12 = 6.83 mm⁴
k = 3 × 3500 × 6.83 / 6³ = 332 N/mm
F = 83 N per bead → ~330 N for four
```

75 lbf, and that's a *lower bound* — hoop stiffness makes it worse. The detents
were decoration; the printed lid simply fell off. Retention moved to fingers
hanging free below the collar, 36 × 10 × 1.2 mm:

```
k = 3 × 3500 × 5.18 / 10³ = 54 N/mm → ~21 N each
```

Same job, a sixteenth of the force. **A finger's stiffness comes from its own
dimensions, not from where it sits**, so putting one on the "stiff" short wall
of a box costs nothing — which means you can put latches wherever the release
motion is, not wherever the structure seems softest.

## Snap fits

**Spring force is not felt force.** The ramp converts it, and the two ramps of a
detent can differ. For a face at angle θ from horizontal, moving vertically:

```
F_felt = F_spring × cot(θ)
```

A gentle insertion ramp (60°, `cot` = 0.58) and an abrupt retention face (35°,
`cot` = 1.43) give easy-on and hard-off from one spring:

| | |
|---|---|
| Spring force, two fingers at 0.39 mm | 42.5 N |
| Push to close | ~25 N |
| Pull straight off | ~61 N |

Add ~40% for friction. Quote felt numbers to people, not spring numbers.

**Which face is which depends on the assembly direction.** A lid descends onto a
base, so the *upper* face of a bead on the base is the insertion ramp and the
*lower* face is what resists pull-off. Easy to get backwards; it inverts both the
tuning and the printability constraint.

**Printability decides which face can be abrupt.** A downward-facing surface
needs to be ≥45° from horizontal or short enough to bridge (a few tenths of a
millimetre is free). Print orientation therefore sets the constraint, and the
two halves of an assembly usually print in opposite orientations — the base
upright, the lid inverted — so the *same* feature has opposite limits on each.
Work out which face ends up facing down on the bed before choosing angles.

**Parameterise the engagement, derive the rest.** Make one variable the actual
interference, and derive bead protrusion, groove depth and clearances from it:

```
snap_engage = 0.39;                       // the only number to tune
snap_ledge_proud = snap_engage;
snap_shank_clearance = lid_clearance + collar_thinckness - finger_thickness;
```

Force scales linearly with it, and the mating features can never desynchronise.
Put shared dimensions in a file both parts include — two independent copies of a
fit *will* drift, and you find out on the printer.

**Separate location from retention.** They want different stiffnesses and
different tuning. In this repo: snap fingers hold the lid down, small crush ribs
locate it laterally, each with its own engagement variable.

**Preload the finger, or engagement is whatever the errors leave you.** This one
cost three printed iterations. A hook whose tip reaches *exactly* to the face it
rides on has zero resting deflection, so every error subtracts straight out of
engagement and nothing puts any back:

| | |
|---|---|
| Designed overlap | 0.39 mm |
| Locator ribs spreading the collar the finger hangs from | −0.20 mm |
| Two knife-edge ramp tips printing rounded | −0.1 to −0.3 mm |
| Left over | ~0 |

The symptom is diagnostic and worth recognising: **the catch works when you press
the finger in with a finger, and not otherwise.** That is not a mispositioned
catch or a weak spring — it is a hook standing off its seat. Do not tune
engagement to fix it; it will not close the gap.

The fix is to make the hook reach *past* the face by `snap_preload`, so it is
always sprung against it. Two things follow. The standoff is designed out rather
than toleranced out, and the contact force is free friction — `k × preload`,
around 12 N per finger here, which alone holds a 40 g lid.

Preload is not free: travel becomes `preload + engage`, and root strain is
`3tδ/(2L²)`. Budget the length first, then spend it.

**Blunt every tip that sets a dimension.** A pointed ramp apex prints rounded and
loses a tenth or two of its reach — on a 0.39 mm feature that is most of it.
Give the hook a short vertical *land* between its two ramps and the catch a flat
tip. Vertical faces print to size; points do not. The land is also what actually
rides the mating face, so a tapered arm buys nothing over it — once the finger
deflects, only its innermost point touches anyway.

**A release grab is only as good as its arm — check it against brute force.**
Put the finger-pull on the latch and it is tempting to assume it helps. Work out
what it actually costs. For a grab at distance `b` from the root releasing a hook
at distance `a`:

```
F = delta * 6EI / (b^2 * (3a - b))          for b <= a
```

On this lid the grab started at the collar's bottom edge, `b` = 6 mm against a
hook at `a` = 14.65 mm, and releasing one finger from there took **189 N** —
while pulling the lid straight off took 59 N. The grab was three times *harder*
than brute force, so it had never functioned as a release lever at all; every
successful open was really the lid dishing. Moving it to `b` = 13.2 mm dropped it
to 48 N. The curve flattens past the hook, so there is no reason to chase the
finger's tip.

The general check: **if prying at the grab costs more than pulling the part off,
the grab is a handle, not a latch release.** Compare the two numbers before
believing in the feature.

Grab *width* does not enter that arithmetic at all — leverage is the arm alone.
Width buys evenness: a narrow grab on a wide finger pulls the middle and lets the
outer thirds lag, so the hook peels instead of releasing across its full width.

**Slot the spring out of the wall to get length.** A finger hanging below a
collar is only as long as the overhang. Cutting two relief slots so it is a
strip of the wall itself, rooted at the seam, tripled the length here and made
full wall thickness affordable:

| Finger | Travel | Root stress |
|---|---|---|
| 1.2 × 10 mm, hung below the collar | 1.0 mm | 42 MPa |
| 1.6 × 10 mm, hung below the collar | 1.0 mm | 61 MPa |
| 1.6 × 17.7 mm, slotted out of the wall | 1.0 mm | 27 MPa |

PLA interlayer strength is around 40 MPa and the finger prints with its layers
stacked along its length, so bending loads it the weak way — the first two rows
are a part that breaks on assembly. Round the top of each slot: that end is the
root, and the most stressed point on the part.

Slots pay a second dividend. They cut the finger loose from whatever else is
attached to that wall, which is what let the locator ribs push the finger off
its seat in the first place.

**Full wall thickness removes both seams at once.** Matching the finger to the
wall it continues makes it a rectangular extension, flush inside and out. No step
on the inside, no seam on the outside, and the root fillet a thin finger needs
goes away with them. It costs `(t₂/t₁)³` in stiffness, so it is only affordable
once the finger is long enough.

**Where retention sits decides how it resists a peel.** Straight pull-off is the
easy case. The real load is someone lifting one edge, which pivots the lid about
the opposite rim and gives them a lever on everything inboard of it. Latches on
the centreline of a 83 mm span see a 2:1 disadvantage — 117 N of straight
pull-off became ~58 N at a long edge.

The tempting fix is to split each latch in two and move the halves out toward the
corners, closer to the lifted edge. **It makes things worse.** With a rigid lid,
a latch at distance `y` from the pivot rises by `δ_edge · y/span`, so latches at
different `y` do not release together — the near one reaches full deflection and
lets go while the far one has barely closed its seat gap. You get sequential
release at roughly half the peak resistance instead of two latches acting at once.
Latches on the centreline all rise equally, which is why the centred position is
already optimal for a two-latch layout.

Real improvement means latches on the *lifted* wall itself, and that is not free
either: **every finger you add multiplies the closing force.** Going from two
fingers to six here would have taken the press-to-close from 63 N to about 130 N
— trading a satisfying close for edge-lift resistance the part may never need.
Decide which load actually occurs before paying for it.

## Fit and slop

**Do not chase slop by tightening a whole perimeter.** A 420 mm perimeter pocket
that is 0.1 mm too tight binds or splits a corner, and binding is a far worse
outcome than a little play. Localise instead: a few 3 mm crush ribs with a
0.10–0.20 mm interference and a tapered lead-in take up the play with local
deformation rather than demanding whole-perimeter accuracy.

**Measure the play; do not assume it.** Sweep one part against the other and
find where interference begins (`scad fit --sweep`). On this case that turned a
vague "it wobbles" into: ±0.30 mm along X, ±0.10 mm along Y — which immediately
identified the cause, since the detent grooves were slots running along X and
constrained nothing in that direction. The fix followed from the measurement.

**A groove that is longer than its bead constrains nothing along its length.**
Obvious in hindsight; invisible until measured.

## Thin webs, cutouts and logos

A web spanning a cutout, loaded by a finger:

```
σ = 3FL / (2·w·t²)
```

**Scaling a cutout does not strengthen its webs.** Shrink the artwork and both
the span `L` and the web width `w` scale together — they cancel exactly. A logo
cut at 60 mm and the same logo at 20 mm both break at 5–6 N:

| Logo width | Web width | Breaks near |
|---|---|---|
| 60 mm | 4.5 mm | 5.2 N |
| 20 mm | 1.5 mm | 5.8 N |

Only thickness helps (it is squared), and thickness is usually fixed by the
panel. **So the fix is relocation, not resizing** — move the cutout off any
panel that gets loaded or flexed. Size governs printability only: keep webs
above 0.8 mm (2 × 0.4 mm nozzle).

## Fillets at cantilever roots

Fillet the root of anything that flexes. It is simultaneously the peak-stress
section and, on a printed part, a layer boundary loaded in tension — the two
failure modes stack. `inner_fillet( d, l )` lives in `Battery Case - shared.scad`
(originally from `printery/models/common/shapes.scad`).

Two things to plan for:

- **Size the fillet against the clearance it eats.** Deriving it, e.g.
  `fillet = 2 × (shank_clearance − collar_clearance)`, lands it exactly flush
  with the neighbouring surface and never intrudes on a sliding fit.
- **Root fillets stiffen the member.** They shorten the effective cantilever, and
  `k ∝ 1/L³`. On this case two small fillets added roughly 10% — enough that the
  first print feels firmer than the arithmetic promised. Expect it and leave the
  engagement variable handy.

Also fillet the tension corner of any tab people pull on. Whether that is the
top or the underside depends on the pull direction: an upward pull puts the
*underside* root in tension.

## Closing a slot beats leaving it open

Bridging the top of the USB slot rather than running it out through the wall's
edge cost nothing in print time and turned the front wall from two halves joined
at a sill into a continuous wall. Measured at the seam: 646.40 → 670.40 mm² of
bearing ring, so the lid's shoulder gained full support. A 12.5 mm flat bridge
is routine for FDM. The only cost is that a cable must be threaded rather than
dropped in from above.
