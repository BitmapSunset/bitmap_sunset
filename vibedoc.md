# BitmapSunset - VibeDoc 0.0.1

**App version:** v0.0.11

**Script version:** BSS 0 0 11

**Source:** github.com/BitmapSunset/bitmap_sunset

## Table of Contents

1. [What is BitmapSunset?](#1-what-is-bitmapsunset)

2. [Prerequisites](#2-prerequisites)

3. [Navigation & Controls](#3-navigation--controls)

4. [The Interface](#4-the-interface)

5. [Script Language Basics](#5-script-language-basics)

6. [Displaying Images (Quads)](#6-displaying-images-quads)

7. [Displaying 3D Models](#7-displaying-3d-models)

8. [Primitive Shapes](#8-primitive-shapes)

9. [Billboard & Mosaic](#9-billboard--mosaic)

10. [Bitmap Painting](#10-bitmap-painting)

11. [Block War](#11-block-war)

12. [Referencing Other Scripts & Bitmaps](#12-referencing-other-scripts--bitmaps)

13. [Using the Visual Editor](#13-using-the-visual-editor)

14. [Exporting & Inscribing to a Bitmap](#14-exporting--inscribing-to-a-bitmap)

15. [Bootstrapping](#15-bootstrapping)

16. [Inscribing a Bootstrapping Script to a BitmapSunset](#16-inscribing-a-bootstrapping-script-to-a-bitmapsunset)

17. [Updating Scripts](#17-updating-scripts)

18. [Scale Reference](#18-scale-reference)

19. [Security & Safety](#19-security--safety)

20. [Troubleshooting](#20-troubleshooting)

21. [Quick Reference Card](#21-quick-reference-card)

---

## 1. What is BitmapSunset?

BitmapSunset is a 3D metaverse application built on Bitcoin Ordinals. It visualizes the entire Bitcoin blockchain as a landscape of bitmap blocks — over 900,000 of them — laid out in a navigable 3D world.

As a builder, you can inscribe scripts onto your bitmaps that place 3D models, images, shapes, and more into the world. Anyone running the app can fly around and see what you've built. Everything lives permanently onchain as Bitcoin inscriptions.

**Key concepts:**

- A **bitmap** is a Bitcoin block claimed as an ordinal. Each one corresponds to a tile in the 3D world.

- A **BitmapSunset** (numbered 0–599) is a special ordinal from the BitmapSunset collection. **OG sunsets (0–99)** are the original founder pieces with billboard control and bootstrapping authority. **Sunsets 100–599** are an extended set that will gain billboard placement and bootstrap support in future releases.

- A **script** is a plain text file (compiled to a `.bmp` image) that tells the app what to display on your bitmap.

---

## 2. Prerequisites

**To explore:** Nothing at all. Anyone can launch the app and look around the world.

**To build locally:** Nothing. You can write scripts and preview your creations without owning anything.

**To build onchain (inscribe your world):** You need to own a bitmap. Any bitmap lets you inscribe a script as a child inscription, making your build permanent and visible to everyone.

**To get bootstrapped (priority loading):** You need an OG BitmapSunset (0–99) or a low-number bitmap (0–999). This lets your builds load first when anyone opens the app. Bootstrap support for sunsets 100–599 is planned for v0.0.12.

**Recommended browser:** Chrome or Brave with **hardware acceleration enabled** in your browser settings. Firefox works but performance may be lower.

**App link:** Use the most current link from the @BitmapSunset X (Twitter) bio. Once the app loads, verify the version reads `BitmapSunset 0011` in the app settings.

---

## 3. Navigation & Controls

### Camera movement

BitmapSunset uses a free-flight camera. You can navigate the world at any altitude, from ground level to a bird's-eye view of the entire blockchain landscape.

- **WASD** or **Arrow keys** — move the camera forward, backward, left, and right.

- **Mouse** — look around by clicking and dragging.

- **Scroll wheel** — adjust movement speed.

### Speed behavior

Camera speed changes depending on what you're doing:

- **Editor open** — camera speed is slow, tuned for precision placement.

- **Editor closed** — camera speed is fast, tuned for exploring the map.

Toggle the **edit** button off and on to switch between fast exploration and slow editing.

### Finding a specific bitmap

If you know a bitmap number but can't find it visually:

1. Click **edit** to open the script panel.

2. Type `editBitmap <number>` in the script (e.g., `editBitmap 50000`).

3. The camera will teleport directly to that bitmap's location on the map.

You can also change the `editBitmap` number directly in the script text at any time to jump to a different location — it updates live.

### Fetch mode

When you first open the app, bitmap data isn't loaded yet. Click the **fetch** button in the toolbar to start downloading onchain scripts. As data loads, builds will appear across the map. Hover your mouse cursor over bitmaps to trigger individual downloads.

### Edit mode interactions

When the script editor is open, you have additional mouse interactions for painting bitmaps:

- **Shift + left-click and drag** — paint blocks with the selected color.

- **Ctrl + left-click and drag** — erase (clear blocks of their color).

- **Ctrl + Shift + left-click** — fetch and execute the script attached to a block.

The script updates dynamically as you paint. It can also be modified manually, and errors are displayed in the console.

### Flat view

Click **flat** in the toolbar to switch to a top-down 2D view. This is useful for seeing which bitmaps are colored (via `pixels` commands) and where mosaics are placed. Click **flat** again to return to the 3D perspective.

---

## 4. The Interface

When BitmapSunset loads, you see a 3D viewport with the bitmap landscape and a toolbar across the top of the screen. Here is what every element does.

### Top Toolbar

The toolbar runs along the top edge of the app window. From left to right:

| Button | What it does |
|---|---|
| **fetch** | Toggles blockchain data fetching on/off. When active (green), the app downloads bitmap scripts from the blockchain. When off (red), no new data is loaded. You must click this to start seeing onchain builds. |
| **flat** | Toggles between 3D terrain and a flat top-down map view. Flat mode is useful for getting an overview of colored bitmaps and mosaics. |
| **background** | Opens a color picker to change the viewport background color. The colored swatch next to it shows the current background. |
| **multiverse** | A dropdown to switch between **Block War** (default — cross-bitmap commands from all scripts are rendered) and **Bitmap** (only the bitmap owner's scripts are rendered on their tile). See Section 11. |
| **shade 2 / shade 1 / shade 0** | Shader/render pass toggles. These control which rendering layers are visible. Useful for debugging visual issues. |
| **edit** | Toggles the **Scripts Panel** open or closed. This is where you write and edit your build scripts. |
| **settings** | Opens the **Settings Panel** with camera, rendering, and DMT options. |
| **console** | Toggles the **Console Panel**, which shows script compilation and error messages. |
| **help** | Opens the help/info overlay. |

### Scripts Panel

When you click **edit**, the Scripts Panel appears on the left side of the screen. This is your main workspace for building.

**Title bar:** Shows "scripts" on the left. On the right side of the title bar you'll find the script toolbar icons:

| Icon | What it does |
|---|---|
| **+** (plus) | Duplicates the currently selected object in the scene. |
| **Gizmo tools** (three icons) | Switch between **Translate** (move), **Rotate**, and **Scale** gizmo modes. Click one, then click an object in the 3D view to manipulate it with the mouse. |
| **Pen icon** | Toggles direct text editing mode in the script area. |
| **color** + swatch | Click the color swatch to pick a color. This sets the color for the `color` command and for primitives. |
| **💾** (floppy disk) | **Export BMP** — compiles your script into a `.bmp` file and saves it to your computer. This is the file you inscribe onchain. |
| **📋** (clipboard) | Copies/exports the script content. |
| **❌** (close) | Closes the Scripts Panel. |

**Script text area:** The large dark area below the toolbar is where your script text appears in green monospace font. You can type directly into it. Changes are reflected in the 3D viewport in real time.

### Console Panel

When you click **console**, a panel appears at the bottom of the screen. It shows compilation feedback in green text:

- `Script text parsed successfully` — your script syntax is correct.

- `Script binary written successfully` — the script was compiled to binary.

- `Script bitmap written successfully` — the binary was encoded into a BMP image.

- `Script bitmap read successfully` — the BMP was decoded back and verified.

- `Binary read successfully` — full round-trip verification passed.

If there are errors, the console will show the line and column number where parsing failed (e.g., `ERROR L3 C5 invalid token`). This is your primary debugging tool.

### 3D Viewport

The main area of the screen shows the bitmap landscape in 3D. Key things you'll see:

- **Bitmap blocks** — the grid of tiles representing Bitcoin blocks. Each block can have its own color and 3D content.

- **Floating green numbers** — bitmap numbers that appear when you're close enough to read them. They help you identify which bitmap you're looking at.

- **Billboards** — tall structures along the edges where BitmapSunset holders display images.

- **Your objects** — any models, quads, primitives, or mosaics placed by scripts. Selected objects show an **orange wireframe outline** in the editor.

### Settings Panel

Click **settings** to access detailed options organized into categories:

**DMT (Digital Matter Theory):**

- **Multiverse** — switch between Block War (default) and Bitmap modes.

- **Mirror** (0–7) — number of concentric mirror rings rendered around the root cell. 0 displays only the central root cell, 1 adds the first ring of 8 mirrored copies, 2 adds a second ring of 16, and so on. Higher values look more expansive but cost performance.

- **Lod Quality** (0–100) — level of detail. Lower values improve performance.

- **Lod On Altitude** — automatically reduces detail at high altitude.

- **Base Level** — ground plane style: Zero, Difficulty, or Custom.

- **Block Level** — individual block style: Zero or TxOutput.

**Camera:**

- **Target FPS** — frame rate cap (default 60). Lowering to 30 reduces camera sensitivity.

- **FOV** — field of view angle.

- **Far Plane** — draw distance.

**Rendering:**

- **SSAO** — screen-space ambient occlusion (realistic shadows, costs performance).

- **Sky / Atmosphere** — toggle physically-based sky rendering.

- **Background Color** — custom background when sky is disabled.

---

## 5. Script Language Basics

Every BitmapSunset script is a plain text file. Here's the general structure:

```
BSS 0 0 11
editBitmap <bitmap_number>
editSunset <sunset_number>
<resource definitions>
<control + object commands>
<bitmaps/pixels commands>
```

### Header (required)

The very first line must always be the version header. It must match the app version you're targeting.

```
BSS 0 0 11
```

This reads as: *BitmapSunsetScript version 0.0.11*. The app uses this header for backward compatibility when the script language evolves.

### Editor Commands (optional, local only)

These commands are convenience tools for the local editor. They are ignored by the virtual machine when a script is fetched onchain.

| Command | Purpose |
|---|---|
| `editBitmap <number>` | Teleports the editor camera to the specified bitmap. Useful for previewing your build in context. |
| `editSunset <number>` | Selects which sunset billboard you're editing (0–599). |

**Example:**

```
editBitmap 12345
editSunset 5
```

This moves your editor camera to bitmap 12345 and targets sunset billboard #5.

### Resource Slots

Before you can display anything, you must register inscription IDs into numbered slots. This lets you reference the same inscription multiple times without repeating the full 66-character ID.

```
resource <slot_index> <inscription_id>
```

**Example:**

```
resource 0 a1b2c3d4e5f6a1b2c3d4e5f6a1b2c3d4e5f6a1b2c3d4e5f6a1b2c3d4e5f6a1b2i0
resource 1 f6e5d4c3b2a1f6e5d4c3b2a1f6e5d4c3b2a1f6e5d4c3b2a1f6e5d4c3b2a1f6e5i0
```

Slot 0 and slot 1 now hold inscription references that you can use in `bind` commands throughout your script.

---

## 6. Displaying Images (Quads)

A **quad** is a flat rectangular surface used to display an image inscription in 3D space — think of it as a custom billboard or poster.

### Basic quad

```
resource 0 <inscription_id_of_your_image>
bind 0 scale 10000 10000 10000 quad
```

This places a flat image in the world using the inscription registered in slot 0.

### Positioning with translate and rotate

You can control where the quad appears and how it's oriented:

```
bind 0 scale 10000 10000 10000 translate 5000 10 5000 rotate 90 0 0 quad
```

- **`translate X Y Z`** — moves the object to the given coordinates.

- **`rotate Rx Ry Rz`** — rotates the object by the given degrees around each axis.

**Tip:** If you can't find your quad, try large scale values first (like `10000 10000 10000`) and work your way down.

---

## 7. Displaying 3D Models

Use the `model` keyword to display a 3D model inscription. Models must be in **GLTF format**.

### Basic model

```
resource 0 <inscription_id_of_your_gltf_model>
bind 0 scale 10000 10000 10000 model
```

Models need large scale values to be visible. Always start with `scale 10000 10000 10000` and adjust from there.

### Full example with positioning

```
resource 0 <inscription_id_of_your_gltf_model>
scale 5000 5000 5000 translate 5000 2000 5000 rotate 2 45 0 bind 0 solid model
```

- **`solid`** — enables solid rendering (as opposed to wireframe). Add this keyword for opaque models.

- **`wire`** — enables wireframe rendering. Use this instead of `solid` to display models or shapes as wireframe outlines.

### Control commands and object commands

A script line consists of **control commands** followed by an **object command**. Control commands — `bind`, `scale`, `translate`, `rotate`, `sx`/`sy`/`sz`, `tx`/`ty`/`tz`, `rx`/`ry`/`rz`, `solid`, `wire`, and `color` — can appear in **any order** before the object command. The object command (`model`, `quad`, `mosaic`, `billboard`, `script`, `sphere`, `cube`, etc.) terminates the statement.

A full example:

```
scale X Y Z translate X Y Z rotate Rx Ry Rz bind <slot> solid model
```

This is equivalent to:

```
bind <slot> solid rotate Rx Ry Rz translate X Y Z scale X Y Z model
```

Both produce the same result — the control commands are collected and the object command triggers rendering.

### Per-axis shorthand transforms

Instead of providing all three values with `scale`, `translate`, or `rotate`, you can set individual axes using shorthand tokens:

| Shorthand | Equivalent |
|---|---|
| `sx <value>` | Scale X only |
| `sy <value>` | Scale Y only |
| `sz <value>` | Scale Z only |
| `tx <value>` | Translate X only |
| `ty <value>` | Translate Y only |
| `tz <value>` | Translate Z only |
| `rx <value>` | Rotate around X axis |
| `ry <value>` | Rotate around Y axis |
| `rz <value>` | Rotate around Z axis |

**Example:**

```
sy 5000 ry 45 bind 0 solid model
```

This scales the model on the Y axis only and rotates 45° around Y.

---

## 8. Primitive Shapes

You can place built-in geometric shapes without needing any inscription at all.

### Basic usage

```
color ff0000
scale 10000 10000 10000 sphere
```

This creates a red sphere the size of a bitmap block.

### Available primitives

`sphere`, `cube`, `cone`, `circle`, `triangle`, `squpyr` (square pyramid), `tripyr` (triangular pyramid)

### Solid and wireframe

Each primitive can be rendered as **solid** (filled) or **wire** (wireframe outline), or both at the same time. This is useful for visualizing shapes during editing.

```
tx 100000 tz 0 solid triangle tz 1000 wire triangle
```

This draws a solid triangle at position X=100000, then a wireframe copy of the same triangle offset by 1000 on the Z axis.

### Setting color

The `color` command sets the color (as a hex value without the `#`) for the **next** primitive shape in the script.

```
color 00ff00
scale 5000 5000 5000 cube
color 0000ff
scale 3000 3000 3000 translate 5000 5000 5000 sphere
color ff00ff
scale 4000 4000 4000 translate 2000 0 2000 squpyr
```

This places a green cube, a blue sphere, and a magenta square pyramid at different positions.

### Displaying all primitives in a row

Here's a script that showcases every primitive side by side, each as both solid and wireframe:

```
BSS 0 0 11
translate 0 0 0
scale 100000 100000 100000
tx 100000 tz 0 solid triangle tz 1000 wire triangle
tx 200000 tz 0 solid quad tz 1000 wire quad
tx 300000 tz 0 solid circle tz 1000 wire circle
tx 400000 tz 0 solid cube tz 1000 wire cube
tx 500000 tz 0 solid tripyr tz 1000 wire tripyr
tx 600000 tz 0 solid squpyr tz 1000 wire squpyr
tx 700000 tz 0 solid cone tz 1000 wire cone
tx 800000 tz 0 solid sphere tz 1000 wire sphere
```

> **Known issue (v0.0.11):** The `color` command may unintentionally affect the bitmap tile color in addition to the shape. `color` is a control command that should only affect primitives and models — it has no relationship to the `bitmaps`/`pixels` painting commands. This bug is being tracked for the next release.

---

## 9. Billboard & Mosaic

### Billboard

If you own an OG BitmapSunset (0–99), you can replace the default sunset image on your billboard with a custom inscription:

```
editSunset <your_sunset_number>
resource 0 <inscription_id_of_image>
bind 0 billboard
```

**Example:**

```
editSunset 5
resource 0 <inscription_id_of_image>
bind 0 billboard
```

This changes sunset billboard #5 to display your custom image.

> **Note:** Billboard placement for sunsets 100–599 is planned for a future release. These billboards will be positioned on other mirror cells of the map, overlooking other blockchain landscapes (such as .dogemap and other .\*map protocols). Currently, only OG sunsets (0–99) have positioned billboards in the central map cell.

### Mosaic

A mosaic draws an image flat on the ground at specific map coordinates:

```
resource 0 <inscription_id_of_image>
bind 0 translate <X> 0 <Z> mosaic
```

**Example:**

```
resource 0 <inscription_id_of_image>
bind 0 translate 500 0 300 mosaic
```

This stamps the image onto the ground at coordinates (500, 300). Mosaics are visible when looking down from altitude and serve as ground-level art or territorial markers. They're especially impactful in **flat** view mode (click the **flat** button in the toolbar to see them as a 2D map).

---

## 10. Bitmap Painting

The `bitmaps` and `pixels` commands are special painting and fetching commands that operate independently from the `color` control command. They let you color specific bitmaps on the map:

```
bitmaps <count> <bitmap_number_1> <bitmap_number_2> ...
pixels <count> <hex_color_1> <hex_color_2> ...
```

**Example** — color bitmap 12345 orange:

```
bitmaps 1 12345
pixels 1 ff7f00
```

### Coloring many bitmaps at once

You can reference large numbers of bitmaps in a single script. The `bitmaps` command takes a count followed by that many bitmap numbers, and `pixels` takes a count followed by that many hex colors — one color per bitmap.

```
bitmaps 140
83184 85184 85185 85186 85187 85188 85190 86189 80183 81183
82183 85183 86179 86180 86181 86182 86183 75182 75183 76180
...
pixels 140
57beff 57beff 57beff 57beff 57beff 57beff 57beff 57beff 57beff 57beff
...
```

This paints large areas of the map in a single color — useful for faction territory in Block War (see Section 11), or simply to make your corner of the blockchain visible from altitude.

**Important:** Any bitmap referenced in the `bitmaps` command will also be queued for fetching after your script loads. This is the foundation of the **bootstrapping** system (see Section 15).

---

## 11. Block War

### What is Block War?

Block War is the default multiverse mode and transforms BitmapSunset into a shared, competitive canvas. In Block War mode, the app renders cross-bitmap commands from all loaded scripts — meaning builders can visually affect bitmaps they do not own. Switching to Bitmap mode enforces property rights: each bitmap displays only its owner's rendering commands on its own tile.

Think of it as a competitive layer on top of the standard world: players can enhance each other's builds, place "graffiti," or wage territorial pixel wars — all from their own bitmap's script.

### How to switch modes

In the top toolbar, find the **multiverse** dropdown. The app opens in **Block War** mode by default. Switch to **Bitmap** to see only owner-inscribed content.

### How it works with scripts

Block War uses the same script commands as normal building. You still inscribe your script as a child of **your own** bitmap — the difference is in **scope**. The `bitmaps`, `pixels`, and `mosaic` commands can target any bitmap on the map, not just your own.

- **Block War mode (default):** Cross-bitmap commands from **all** loaded scripts become visible. Your `pixels` command can paint bitmaps you don't own, your `mosaic` command can stamp images on foreign ground, and your 3D structures can occupy contested territory.

- **Bitmap mode:** Only the bitmap owner's rendering commands take effect on their tile. Cross-bitmap commands from other scripts are ignored.

**Example** — color someone else's bitmap red from your own script:

```
BSS 0 0 11
bitmaps 1 <target_bitmap_number>
pixels 1 ff0000
```

This colors the target bitmap red on the map — visible to everyone in Block War mode. Combined with `mosaic` (to stamp images on the ground) and primitive shapes, you can claim visual territory across the entire blockchain landscape.

### Block War strategies

- **Color the map:** Use `pixels` to paint bitmaps in your faction's color across large swaths of the map, visible to all Block War participants.

- **Stamp your mark:** Use `mosaic` to place logos, flags, or images on the ground plane of contested bitmaps.

- **Build structures:** Place 3D models or primitives to create visible landmarks and territorial markers.

- **Stack effects:** Multiple scripts from different builders can accumulate effects on a single bitmap, creating collaboratively or competitively layered scenes.

### Important notes

- Block War is the default mode when opening the app. Cross-bitmap effects are visible immediately.

- Switching to Bitmap mode hides all cross-bitmap commands — only the bitmap owner's rendering commands are applied to their tile.

- All Block War inscriptions are permanent. They persist on the blockchain indefinitely, creating an immutable record of territorial contests and collaborative builds.

---

## 12. Referencing Other Scripts & Bitmaps

One of BitmapSunset's most powerful features is the ability to reference external content — either a specific script inscription or another bitmap's entire world. This enables collaboration, code reuse, and efficient multi-bitmap builds without re-inscribing large scripts.

### `script` — Reference a specific script inscription

Use `bind <slot> script` to load and execute another script inscription inside your own:

```
resource 3 <inscription_id_of_another_script>
bind 3 script
```

**How it works:** The app fetches the inscription registered in slot 3 and executes it as if its content were inlined into your script. The referenced script runs with full transform support — you can scale, translate, and rotate it just like a model or quad.

**Use cases:**

- Reuse a complex, expensive script across multiple bitmaps without re-inscribing it.

- Let other people reference **your** script on their bitmaps — collaborative building.

- Keep referencing an old script version even after you've inscribed an update on your bitmap (old inscriptions remain onchain and referenceable by their ID).

**Example** — reference someone's script and position it:

```
resource 3 <inscription_id_of_script>
scale 5000 5000 5000 translate 2000 0 2000 bind 3 solid script
```

### `bitmap` — Clone another bitmap's world

Instead of pointing to a specific inscription, you can reference an entire bitmap by its number:

```
bitmap 444
```

**How it works:** The app looks up bitmap 444, finds its latest child inscription (the most recent script), and loads that build. No resource slot or `bind` is needed — just the bitmap number.

**Key differences from `script`:**

- `bitmap` is a **live link**: if bitmap 444 gets a new inscription, every script referencing `bitmap 444` will automatically reflect the updated build.

- `bitmap` does **not** support transforms (scale, translate, rotate are ignored). The referenced world loads at its original position and scale.

- `bitmap` takes a bitmap number directly, not an inscription ID.

**Use cases:**

- Deploy the same world to multiple bitmaps. Inscribe your main build on one bitmap, then use `bitmap <number>` on all others.

- When you update your main bitmap, all clones update automatically — no need to re-inscribe on every bitmap.

- The most efficient way to manage a network of builds from a single source.

**Example** — one main build, multiple clones:

```
# On bitmap 12345 (your main build):
BSS 0 0 11
resource 0 <inscription_id_of_model>
scale 5000 5000 5000 bind 0 solid model
```

```
# On any other bitmap (clone):
BSS 0 0 11
bitmap 12345
```

Now if you update bitmap 12345 with a new child inscription, every bitmap using `bitmap 12345` will reflect the change automatically.

---

## 13. Using the Visual Editor

The visual editor lets you manipulate objects with mouse-based gizmos instead of editing raw script text.

1. Click the **edit** button in the top toolbar to open the Scripts Panel.

2. The default script is pre-populated — you can modify it or clear it entirely.

3. Use `editBitmap <number>` to navigate the camera to any bitmap on the map.

4. Use the **gizmo toolbar icons** in the Scripts Panel title bar:

   - **Translate** (move) — click the icon, then click your object and drag it to a new position.

   - **Rotate** — click the icon, then grab the rotation gizmo rings to spin the object.

   - **Scale** — click the icon, then drag the scale handles to resize.

   - **+** (Duplicate) — creates a copy of the selected object.

5. When you manipulate objects with the gizmos, the **script text updates automatically** to reflect your changes. Selected objects display an **orange wireframe outline** in the 3D view.

6. You can also edit the script text directly — changes are reflected in real time in the 3D view.

**Tips:**

- Toggle the **edit** button off and on to reset the camera focus to your bitmap.

- When the script panel is hidden, camera speed increases for faster map navigation.

- When editing, camera speed slows down for precision work.

- Open the **console** panel to see if your script compiled successfully. Green messages mean everything is OK; errors will show line and column numbers.

---

## 14. Exporting & Inscribing to a Bitmap

This is how you make your build permanent and visible to everyone onchain.

### Step 1: Build your world

Write your script and verify it looks correct in the editor's 3D preview. Check the console for any parse errors.

### Step 2: Trim the script

Remove any default resources, objects, or commands you're not using. Every byte costs sats to inscribe, so a leaner script means a cheaper inscription. Remove `editBitmap` and `editSunset` lines too — they're ignored onchain but still take up bytes.

### Step 3: Export the BMP

Click the **💾 (floppy disk) icon** in the Scripts Panel toolbar. It saves a `.bmp` file to your computer.

The script gets compiled into a binary format for the BitmapSunset virtual machine. The BMP image encodes your entire script as colored pixels — this is the file you'll inscribe. The console will confirm with green success messages:

```
Script text parsed successfully
Script binary written successfully
Script bitmap written successfully
```

### Step 4: Inscribe the BMP as a child of your bitmap

1. Go to any inscription service that supports parent/child inscriptions.

2. Upload the `.bmp` file.

3. Set the **parent** to the **inscription ID of your bitmap** (this is the ordinal inscription ID, not the bitmap number).

4. Inscribe it.

Once confirmed on the blockchain, your build is permanently onchain. Anyone running BitmapSunset will see your creation when they visit your bitmap.

### Complete example — a world with a 3D model, floor image, and avatar

```
BSS 0 0 11
editBitmap 12345
editSunset 5
resource 0 <inscription_id_of_gltf_model>
scale 5000 5000 5000 translate 5000 2000 5000 rotate 2 45 0 bind 0 solid model
resource 1 <inscription_id_of_floor_image>
scale 10000 10000 10000 translate 5000 10 5000 rotate 90 0 0 bind 1 solid quad
resource 2 <inscription_id_of_avatar_model>
scale 8000 8000 8000 translate 5000 6000 5000 rotate 0 0 0 bind 2 solid model
bitmaps 1 12345
pixels 1 ff7f00
```

This script places a 3D model, lays an image on the ground, adds an avatar model, and colors bitmap 12345 orange on the map. It compiles to approximately 342 bytes as a BMP.

---

## 15. Bootstrapping

### The Problem

BitmapSunset displays over 900,000 bitmaps. When the app launches, it needs to decide which bitmaps to fetch first. There's no way to know which bitmaps have builds without checking all of them one by one.

### The Solution: Bootstrapping

OG BitmapSunset holders (0–99) can inscribe a script on their sunset that tells the app **which bitmaps to load first**. This controls the loading queue for every user's browser.

> **Note:** Bootstrap support for sunsets 100–599 is planned for v0.0.12. Currently, only OG sunsets (0–99) participate in the bootstrap loading phase.

### Loading Order

The app fetches data in this order:

1. **OG BitmapSunset scripts** (sunsets 0–99), ordered by sunset number.

2. **Bitmap border lands** (bitmaps 0–999).

3. **Sequentially** from bitmap 1000 up to 900,000.

If your bitmap number is high (e.g. 500000), it won't load until the app works through hundreds of thousands of others — unless it's been bootstrapped by an OG sunset holder.

### How Bootstrapping Works

When you inscribe a script on your OG BitmapSunset that references a bitmap number in the `bitmaps` command, that bitmap gets added to the **priority loading queue**.

**Example:** Your sunset script references bitmap 50000:

```
bitmaps 1 50000
```

Now bitmap 50000 loads right at app startup, because it's referenced by a sunset that's fetched in phase 1.

### Chaining Bitmaps

You can chain multiple bitmaps together. In your sunset script, reference your main bitmap. In that bitmap's script, reference more bitmaps:

```
Sunset #5 → loads bitmap 50000
Bitmap 50000 → loads bitmap 150000, bitmap 200000
```

This way, a single sunset can bootstrap an entire network of builds.

### Without a Sunset

If you don't own an OG BitmapSunset or a low-number bitmap, users can still view your build by:

1. Navigating to your bitmap location in the 3D world.

2. Clicking the **fetch** button in the toolbar.

3. Hovering the mouse cursor over your bitmap.

This manually triggers a download and display of your build. It's just not automatic at launch.

---

## 16. Inscribing a Bootstrapping Script to an OG BitmapSunset

> **Note:** This section applies to OG BitmapSunset holders (0–99). Bootstrap support for sunsets 100–599 is coming in v0.0.12.

### Step 1: Write the bootstrapping script

```
BSS 0 0 11
editSunset <your_sunset_number>
resource 0 <inscription_id_for_billboard_image>
bind 0 billboard
bind 0 translate 700 0 600 mosaic
bitmaps 1 <your_bitmap_number>
pixels 1 ff7f00
```

**What each line does:**

- `editSunset <number>` — targets your sunset billboard in the local editor (ignored onchain).

- `bind 0 billboard` — displays the resource image on your sunset billboard in the 3D world.

- `bind 0 translate 700 0 600 mosaic` — also draws the image flat on the ground at coordinates (700, 600).

- `bitmaps 1 <number>` — **this is the bootstrapping line.** It tells the app to load the specified bitmap when this sunset is fetched.

- `pixels 1 ff7f00` — colors the bootstrapped bitmap orange on the map.

### Step 2: Export the BMP

Click the 💾 icon to save the `.bmp` file. Check the console for success messages.

### Step 3: Inscribe as a child of your sunset

1. Go to your preferred inscription service.

2. Upload the `.bmp` file.

3. Set the **parent** to the **inscription ID of your OG BitmapSunset** (the sunset's ordinal inscription ID, not a bitmap).

4. Inscribe.

Once confirmed, every time the app launches and fetches your sunset, it will also queue your bitmap for immediate loading.

### Bootstrapping Multiple Bitmaps

You can bootstrap several bitmaps from a single sunset:

```
bitmaps 3 50000 150000 200000
pixels 3 ff7f00 00ff00 0000ff
```

This loads three bitmaps at startup, each colored differently on the map. You can also lend bootstrap priority to other people's bitmaps — a potential monetization or collaboration path.

---

## 17. Updating Scripts

### On a bitmap

Inscribe a new `.bmp` child on the same bitmap. The app automatically loads the **most recent** child inscription. Your old script inscription remains onchain but is superseded.

### On a sunset

Same process — inscribe a new `.bmp` child on the same sunset. The newest child takes precedence.

### Backward compatibility

Scripts written for `BSS 0 0 10` (v0.0.10) use older syntax (e.g. the `image` keyword instead of `resource`/`bind`/`quad`). These still render when fetched. However, if you're writing new scripts, always use `BSS 0 0 11` syntax. A parent script in `0 0 10` can call a child script in `0 0 11`, but the main/parent script should ideally be updated to `0 0 11` for full compatibility.

### v0.0.10 vs v0.0.11 syntax comparison

| v0.0.10 | v0.0.11 equivalent |
|---|---|
| `image <W> <H> <inscription_id>` | `resource <slot> <inscription_id>` + `bind <slot> scale W H 1 quad` |

---

## 18. Scale Reference

| Scale Value | Relative Size |
|---|---|
| `1 1 1` | Smallest possible object |
| `100 100 100` | Human-sized (good for avatars) |
| `1000 1000 1000` | Building-sized |
| `10000 10000 10000` | Size of an entire bitmap block |
| `50000 50000 50000` | Larger than a bitmap — will overlap neighbors |
| `100000 100000 100000` | Covers multiple bitmaps (used for large primitive showcases) |

### Coordinate system

- **X** = horizontal axis

- **Y** = vertical axis (height)

- **Z** = depth axis

**Note:** In the current version, objects can extend beyond your bitmap's boundaries. Proper clamping on the horizontal plane is planned for a future release. The vertical axis will remain unlimited — build as tall as you want.

---

## 19. Security & Safety

BitmapSunset is a fully onchain application. It runs entirely in your browser and reads data exclusively from the Bitcoin blockchain via ordinals recursive endpoints.

### BitmapSunset will never ask for:

- Your recovery phrase, private keys, or wallet credentials.

- To connect your wallet, sign messages, sign transactions, transfer funds or assets.

- To navigate to external links or websites.

- To download or execute any additional software or browser extensions.

- To verify your identity, account or any personal information.

- To enable any permissions.

### Best practices:

- Always verify the BitmapSunset inscription ID using trusted sources (the official @BitmapSunset X account).

- Use a secure browser profile, a virtual machine, or private mode without wallet extensions.

- There is no wallet connection from within the app. Inscription and transactions happen through external services like unisat.

- If something feels suspicious, double-check via official channels.

### Disclaimer

- BitmapSunset is provided **"AS IS"** and **"AS AVAILABLE"** without warranties, guarantees, or support of any kind.

- You acknowledge and accept all risks associated with using blockchain-based applications, including financial losses.

- You are solely responsible for securing your private keys, Bitcoin, and other digital assets.

- We are not liable for any damages, losses, or security breaches resulting from the use of this application.

- By using BitmapSunset, you confirm that you understand and accept these terms.

---

## 20. Troubleshooting

### "ERROR L0 C0 invalid magic / invalid token / invalid version"

- The `BSS 0 0 11` header must be the **very first line** of the script. Nothing before it — no blank lines, no spaces.

- Make sure you're running app version 0.0.11 (check in settings — it should read `BitmapSunset 0011`).

- If you copied the script from X/Twitter, check that no timestamp or extra text was accidentally pasted at the end.

### Model not showing

- Start with `scale 10000 10000 10000`. Models often appear tiny at small scales.

- It might be hidden inside another object — try increasing the scale dramatically to locate it.

- Double-check that the inscription ID is correct and points to a valid GLTF model.

### Image not showing on quad

- Make sure you used `quad` (not `model`) for image inscriptions. `model` is for GLTF 3D files only.

- Try `scale 10000 10000 10000` to make it large enough to find.

### Camera too sensitive / spinning too fast

- Reduce the **target FPS** to 30 in the app settings.

- Enable **hardware acceleration** in your browser settings.

- Use **Chrome** or **Brave** (Firefox performance is lower).

- Disable resource-heavy settings in the app: mirror count, LOD, SSAO, sky/atmosphere rendering.

### Bootstrapped bitmap not auto-loading

- You still need to click the **fetch** button for bitmap world data to start downloading.

- Bootstrapping controls the **order** of loading, not whether fetching is active.

- Loading consistency may vary — this is a known issue being investigated.

### Models not visible on mirror maps

- Known bug in v0.0.11. Models appear on the primary (A) mirror but may not render on other mirrors.

- Using `editBitmap` teleports you to the A mirror where models are visible.

- Fix planned for the next release.

### Block War scripts not appearing

- Check that the **multiverse** dropdown in the toolbar is still set to **Block War** (this is the default, but you may have switched to Bitmap mode).

- Block War scripts are only rendered when Block War mode is active.

### Console shows errors

- Open the **console** panel (click **console** in the toolbar) to see the exact error line and column.

- Common causes: misspelled keywords, wrong number of arguments, missing inscription ID, extra whitespace before the `BSS` header.

- Green messages = success. Red/error messages = something needs fixing.

### Nothing happens when I click Export (💾)

- Check the console panel for error messages. If the script failed to parse, the export will not produce a valid file.

- Make sure the `BSS 0 0 11` header is present and correct.

---

## 21. Quick Reference Card

```
BSS 0 0 11                          ← version header (always first line)
editBitmap <number>                  ← teleport editor to bitmap (local only)
editSunset <number>                  ← select sunset billboard (local only)
resource <slot> <inscription_id>     ← register inscription to a slot
bind <slot> scale X Y Z model        ← display 3D model
bind <slot> scale X Y Z quad         ← display flat image
bind <slot> billboard                ← display on sunset billboard
bind <slot> translate X Y Z mosaic   ← draw on ground
bind <slot> scale X Y Z translate X Y Z rotate Rx Ry Rz solid model
                                     ← full example (control commands can be in any order before the object command)
bind <slot> ... wire model           ← wireframe rendering mode
sx|sy|sz <value>                     ← per-axis scale shorthand
tx|ty|tz <value>                     ← per-axis translate shorthand
rx|ry|rz <value>                     ← per-axis rotate shorthand
color <hex>                          ← set color for next primitive
scale X Y Z sphere                   ← sphere primitive
scale X Y Z cube                     ← cube primitive
scale X Y Z cone                     ← cone primitive
scale X Y Z circle                   ← flat circle primitive
scale X Y Z triangle                 ← triangle primitive
scale X Y Z squpyr                   ← square pyramid primitive
scale X Y Z tripyr                   ← triangular pyramid primitive
bitmaps <count> <num1> <num2> ...    ← bootstrap / chain bitmaps
pixels <count> <hex1> <hex2> ...     ← color bitmaps on the map
bitmap <number>                      ← clone another bitmap's latest build (live link, no transforms)
resource <slot> <script_id>          ← reference a specific script inscription
bind <slot> script                   ← execute referenced script (supports transforms)
```

### Toolbar Quick Reference

| Button | Purpose |
|---|---|
| **fetch** | Start/stop downloading onchain data |
| **flat** | Toggle top-down 2D map view |
| **background** | Change viewport background color |
| **multiverse** | Switch Block War (default) / Bitmap mode |
| **shade 0/1/2** | Toggle render layers |
| **edit** | Open/close the script editor |
| **settings** | Open camera, rendering, DMT options |
| **console** | Show/hide compilation messages |
| **help** | Open help overlay |

### Script Editor Quick Reference

| Icon | Purpose |
|---|---|
| **+** | Duplicate selected object |
| **Gizmo tools** | Switch translate / rotate / scale mode |
| **Pen** | Toggle text editing |
| **color swatch** | Pick color for primitives |
| **💾** | Export script as .bmp file |
| **📋** | Copy/export script |
| **❌** | Close editor |

### Inscription Cheat Sheet

| What | Parent | File |
|---|---|---|
| Build on your bitmap | Inscription ID of your bitmap | Exported `.bmp` |
| Bootstrap from your OG sunset | Inscription ID of your OG sunset (0–99) | Exported `.bmp` |
| Update an existing build | Same parent as before (bitmap or sunset) | New `.bmp` (newest child wins) |
| Block War (affect other bitmaps) | Inscription ID of your own bitmap | Exported `.bmp` (use cross-bitmap commands like `pixels`, `mosaic`) |