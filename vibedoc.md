# BitmapSunset - VibeDoc 0.0.13

**App version:** v0.0.13

**Script version:** BSS 0 0 13

**Source:** github.com/BitmapSunset/bitmap_sunset

## Table of Contents

1. [What is BitmapSunset?](#1-what-is-bitmapsunset)

2. [Prerequisites](#2-prerequisites)

3. [Navigation & Controls](#3-navigation--controls)

4. [The Interface](#4-the-interface)

5. [Using the Visual Editor](#5-using-the-visual-editor)

6. [Script Language Basics](#6-script-language-basics)

7. [Displaying Images (Quads)](#7-displaying-images-quads)

8. [Displaying 3D Models](#8-displaying-3d-models)

9. [Primitive Shapes](#9-primitive-shapes)

10. [Billboard & Mosaic](#10-billboard--mosaic)

11. [Bitmap Painting](#11-bitmap-painting)

12. [Referencing Other Scripts & Bitmaps](#12-referencing-other-scripts--bitmaps)

13. [Exporting & Inscribing to a Bitmap](#13-exporting--inscribing-to-a-bitmap)

14. [Bootstrapping](#14-bootstrapping)

15. [Updating Scripts](#15-updating-scripts)

16. [Scale Reference](#16-scale-reference)

17. [Security & Safety](#17-security--safety)

18. [Troubleshooting](#18-troubleshooting)

19. [Quick Reference Card](#19-quick-reference-card)

20. [Glossary](#20-glossary)

---

## 1. What is BitmapSunset?

BitmapSunset is a 3D metaverse application built on Bitcoin Ordinals, the protocol created by [@rodarmor](https://x.com/rodarmor). The application itself is a Bitcoin inscription: the rendering engine, script compiler, virtual machine, and user interface are all inscribed on the Bitcoin blockchain. It visualizes the entire Bitcoin blockchain as a landscape of bitmap blocks (one per mined block, extending automatically as new blocks are added) laid out in a navigable 3D world.

As a builder, you can inscribe scripts onto your bitmaps that place 3D models, images, shapes, and more into the world. Anyone running the app can fly around and see what you've built. Everything lives permanently onchain as Bitcoin inscriptions.

**Key concepts:**

- A **bitmap** is a Bitcoin block claimed as an ordinal, based on the bitmap protocol created by [@blockamoto](https://x.com/blockamoto). Each one corresponds to a tile in the 3D world.

- A **BitmapSunset** (numbered 0 and up, currently 650+) is a special ordinal from the BitmapSunset collection. Each BitmapSunset is a development screenshot captured during the building process, so new items are added at the pace of ongoing development. There are three tiers:

  - **OG sunsets (0–99):** The original collection pieces with billboard control and bootstrapping authority. Each OG sunset corresponds to a billboard structure positioned over a 100×100 bitmap patch in the 3D world. In a future release, OG billboards will evolve into **cubitmaps**: giant floating 3D structures with parceling and building capabilities.

  - **Extended sunsets (100–599):** An extended set that will gain bootstrap support (targeted for v0.0.14) and dedicated 2D billboard placement in a future release.

  - **Expansion sunsets (600+):** Ongoing expansion. New screenshots captured during active development. The collection is planned to expand to 1,000 items over time.

- **Mosaic placement:** The `mosaic` command stamps images flat on the ground plane at map-space positions corresponding to bitmap numbers. Currently available to all bitmap owners and BitmapSunset holders alike. In a future release, mosaic will become a BitmapSunset-exclusive feature.

- A **script** is a plain text file (compiled to a `.bmp` image) that tells the app what to display on your bitmap.

---

## 2. Prerequisites

**To explore:** Nothing at all. Anyone can launch the app and look around the world.

**To build locally:** Nothing. You can write scripts and preview your creations without owning anything.

**To build onchain (inscribe your world):** You need to own a bitmap. Any bitmap lets you inscribe a script as a child inscription, making your build permanent and visible to everyone. Only the bitmap owner can inscribe children on their own bitmap; property rights are enforced at the protocol level by the Ordinals parent-child mechanism.

**To get bootstrapped (priority loading):** You need an OG BitmapSunset (0–99). This lets you control which bitmaps load first when anyone opens the app. A hardcoded seed list of bitmaps also loads alongside sunset-discovered bitmaps. Bootstrap support for sunsets 100–599 is targeted for v0.0.14.

**Recommended browser:** Brave, Chrome, Firefox, or Safari with **hardware acceleration enabled** in your browser settings. Edge works but performance may be lower.

**App link:** Use the most current link from the @BitmapSunset X (Twitter) bio. Once the app loads, verify the version: the browser tab title reads `BitmapSunset 0 0 13` and the script editor's console header reads `Bitmap Sunset 0 0 13`.

---

## 3. Navigation & Controls

BitmapSunset offers multiple camera modes. The default **free-flight camera** lets you navigate at any altitude, from ground level to a bird's-eye view of the entire blockchain landscape. A **third-person (TPS) camera** mode lets you walk on bitmaps as a character with physics-based movement.

### Desktop controls

**Movement and camera:**

| Input | Action |
|---|---|
| **WASD / Arrow keys** | Move the camera (or character in TPS) |
| **Left-click + drag** | Look around / orbit |
| **Space** | Thrust upward (TPS jetpack) |
| **Scroll wheel** | Movement speed (free camera) / player size (TPS) |
| **Shift + scroll wheel** | Camera distance (TPS only) |

**Keyboard shortcuts:**

| Key | Action |
|---|---|
| **E** | Toggle Free / TPS camera |
| **C** | Toggle orbit mode |
| **G** | Open or close the script editor |
| **T** | Open the Teleport window |
| **R** | Open settings |
| **H** | Open help |
| **B** | Open debug window (shows debug controls including a No VSync toggle; lives as an extra icon in the settings window header) |
| **F** | Toggle fullscreen |
| **Escape** | Cancel active gizmo drag (reverts transforms) / blur focused input |

**Edit-mode bitmap interactions** (active only when the script editor is open):

- **Shift + left-click and drag**: paint blocks with the selected color.
- **Ctrl + left-click and drag**: erase blocks.
- **Double-click a bitmap**: fetch its onchain script and open it in a new editor tab.

The script updates dynamically as you paint. You can also edit the text manually; errors surface in the console.

### Mobile controls

Mobile is a first-class surface. Secondary windows (settings, scripts, help) auto-maximize on first open, and a conservative quality tier (**Rare**) is applied by default on touch devices.

- **On-screen joystick** (drag on the left half of the viewport): equivalent to WASD.
- **One-finger drag** (right half): look around.
- **Two consecutive two-finger taps** (second two-finger touch within 500 ms of the first): toggle orbit mode (same as **C** on desktop).
- **Double-tap** (within 300 ms, less than 30 px of motion): toggle Free / TPS camera (same as **E** on desktop).
- **Pinch**: adjust zoom / movement speed.

To fetch and open an onchain script on mobile, use the Teleport window or type a bitmap number into the `#` input next to the **+** button on the tab bar (see §4 "Scripts Panel"). The mouse-only double-click-to-fetch gesture has no touch equivalent in v0.0.13.

Script editing is available but relies on the on-screen keyboard. Bitmap painting (Shift/Ctrl modifiers) is desktop-only in v0.0.13; mobile authoring is geared toward exploration, script loading, and tab editing.

### Speed behavior

Opening the script editor switches the camera to free-flight mode, which has a lower default speed than TPS. Closing the editor restores the previous camera mode. Both speeds are independently adjustable (scroll wheel in free-flight, settings slider in TPS).

### Third-person camera (TPS)

Press **E** to toggle between free-flight and TPS mode. In TPS, a 3D character model spawns at the current camera position, snaps to the ground height of the bitmap below, and the camera follows it from behind with mouse yaw/pitch and adjustable distance.

TPS mode includes basic physics:

- **Gravity** pulls the character downward toward the bitmap surface.
- **Collision** against bitmap blocks. The character slides along walls rather than stopping and automatically steps up small elevation changes.
- **Thrust** (Space) adds vertical acceleration, allowing the character to fly above the terrain temporarily.
- **Animation** transitions automatically between idle, walk, fall, and thrust states with smooth crossfading between skeletal animations.

Movement speed scales with camera distance; zooming closer increases acceleration and max velocity for precise ground-level navigation.

### Orbit camera

Press **C** or open the script editor to rotate the camera around the bitmap you're editing. Use the **mouse wheel** (or pinch on mobile) to control the orbit radius. A smooth AUTO transition synchronizes the camera when entering or exiting orbit mode.

### Teleport

Press **T** to open the Teleport window, type a bitmap number, and press Enter (or tap **go**) to fly directly to that bitmap. You can also change the `block <number>` value in the script editor; it updates live as you type.

### Fetch mode

When you first open the app, bitmap data isn't loaded yet. Click the **fetch** button in the toolbar to start downloading onchain scripts. As data loads, builds appear across the map. On desktop, double-click a bitmap to trigger an individual download; on mobile, the active fetch queue handles loading in the background while you navigate.

### Flat view

Click **flat** in the toolbar to switch to a top-down 2D view. This is useful for seeing which bitmaps are colored (via `pixels` commands) and where mosaics are placed. Click **flat** again to return to the 3D perspective.

---

## 4. The Interface

When BitmapSunset loads, you see a 3D viewport with the bitmap landscape and a toolbar across the top of the screen. Here is what every element does.

### Top Toolbar

The toolbar runs along the top edge of the app window. From left to right:

| Button | What it does |
|---|---|
| **fetch** | Toggles blockchain data fetching on/off. When active (green online icon), the app downloads bitmap scripts from the blockchain. When off (red offline icon), no new data is loaded. You must click this to start seeing onchain builds. |
| **flat** | Toggles between 3D terrain and a flat top-down map view. Useful for getting an overview of colored bitmaps and mosaics. |
| **script** | Toggles the **Scripts Panel** open or closed (shortcut: **G**). |
| **teleport** | Opens the Teleport window to fly directly to a bitmap number (shortcut: **T**). |
| **ban** | Opens the **Ban List** window to block specific bitmap numbers or inscription hashes. |
| **canvas** | Icon-only button that toggles the 3D viewport between fullscreen and a movable/resizable window. Windowed geometry is persisted. |
| **help** | Opens the help overlay (shortcut: **H**). |
| **settings** | Icon-only button that opens the **Settings Panel** with Performance / Camera / Atmosphere / DMT / Network sliders (shortcut: **R**). The settings window's header carries a bug icon that opens the **Debug** window. |
| **pin** (thumbtack) | Pins the toolbar so it stays visible. When unpinned, the toolbar slides out of view (1.5 s after the app launches) and reappears when the mouse touches the top edge of the viewport. |

### Scripts Panel

Click **script** (or press **G**) and the Scripts Panel appears on the left side of the screen. This is your main workspace for building. The panel is organized into several components from top to bottom: a toolbar, a tab bar, the code editor, and an embedded console.

**Script toolbar:** The top row of the panel contains these icons:

| Icon | What it does |
|---|---|
| **trash** | Hides the current tab after a confirmation prompt. The tab is removed from the tab bar but remains in the overflow dropdown, so you can restore it by selecting it there. Known issue: trash should permanently delete the tab but currently only hides it, same as the tab's **X** button. |
| **recycle** | Resets the current tab to the default starter template. |
| **wrap** | Toggles word-wrap on or off for the editor textarea and syntax overlay. State is persisted. |
| **settings** (gear, small) | Opens the 15-swatch **syntax highlighting palette** popup to recolor the editor (keywords, numbers, hex, inscription hash, inscription name, bitmap, console, errors, and so on). |
| **+** (plus) | Duplicates the currently selected object in the scene. |
| **delete** (minus) | Removes the currently selected object from the script. |
| **pen** (color picker) | Click the swatch to pick a color for the `color` command and painted primitives. |
| **export** | Compiles the current tab, runs the round-trip, and downloads a `.bmp` **inscription artifact** (`bitmap_<N>.bmp`). This is the file you inscribe onchain. Disabled when the tab has compile errors. |
| **save** | Downloads the current tab as a `.bss` **source file** (`bitmap_<N>.bss`). Use this for local backup or to share editable scripts. |

**Tab bar:** Below the toolbar, a tab bar supports multiple scripts simultaneously. Each tab keeps its own text, compile state, tokenization cache, and error list.

| Action | What it does |
|---|---|
| **Click tab** | Switch to that script. The editor and 3D view update immediately. |
| **Double-click tab label** | Rename the tab inline. |
| **Drag tab** | Reorder tabs. A drop indicator shows where the tab will land. |
| **X button on tab** | Close the tab (hides it; still accessible via the overflow dropdown, no confirmation). |
| **+ button** | When the `#` field next to it is empty, create a new tab pre-populated with the BSS 0 0 13 starter (header + `block <N>` + `sunset 1` + `inscription runestone <hash>` + a `scale ... model runestone` example). |
| **`#` bitmap input** | Text field immediately right of **+**. Type a bitmap number (with or without a leading `#`) and press Enter (or click **+**) to create a tab pre-populated with that bitmap's edit target, teleport the camera to it, and auto-fetch its onchain script. This is the mobile-friendly replacement for the desktop double-click-to-fetch gesture. |
| **Overflow dropdown** | An expand button on the right side of the tab bar opens a dropdown listing every tab (visible and hidden) alphabetically, with a check mark next to tabs currently visible in the tab bar. Clicking a row switches to that tab; if it was closed (hidden), selecting it from the dropdown re-opens it in the tab bar. Closed tabs persist here for the session; there is no way to remove them permanently. |
| **Double-click a bitmap** (in the 3D view) | Fetch the script attached to that bitmap and open it in a new tab. |

**Code editor:** The main text area features:

- **Line number gutter**: line numbers displayed along the left edge, updating in real time as you type.

- **Syntax highlighting**: keywords, numbers, inscription IDs, and other tokens are color-coded via an overlay that scrolls in sync with the text. Each tab caches its own tokenization.

- **Status bar**: a bar at the bottom of the editor showing the number of compile errors and the current caret position (`Ln N, Col M`).

Changes to the script text are reflected in the 3D viewport in real time.

### Embedded Console

The console is embedded directly below the code editor inside the Scripts Panel, separated by a **draggable splitter**. Drag the splitter up or down to resize the editor and console panes.

The console shows a single success line after compilation, e.g.:

```
compiled successfully in 12 ms, .bmp size: 3 ko
```

This confirms the full round-trip passed: text → binary → BMP → binary → text.

If there are errors, the console displays them with line and column numbers (e.g., `line 3, col 5: invalid token`). **Clickable errors:** hover over an error message to highlight it, then click to jump the cursor directly to the error's line and column in the editor. This is your primary debugging tool.

### 3D Viewport

The main area of the screen shows the bitmap landscape in 3D. The world layout follows the [@ordinalswallet](https://x.com/ordinalswallet) bitmap map convention, arranging all Bitcoin blocks in a 1000-column grid. Key things you'll see:

- **Bitmap blocks**: the grid of tiles representing Bitcoin blocks. Each block can have its own color and 3D content.

- **Floating green numbers**: bitmap numbers that appear when you're close enough to read them. They help you identify which bitmap you're looking at.

- **Billboards**: tall structures along the edges where BitmapSunset holders display images.

- **Your objects**: any models, quads, primitives, or mosaics placed by scripts. Selected objects show a **cyan highlight overlay** in the editor. Hovered objects render in front of the scene (X-ray).

### Settings Panel

Click **settings** (or press **R**) to access detailed options organized into categories. All settings are automatically saved to your browser's localStorage and restored on the next visit. Desktop defaults run at the **Legendary** tier for rendering sliders (Atmosphere, IBL, SSAO, Render, Precision, LOD, Mirrors, Texture) and 4096 for Models; the **IFrame** tier defaults to **Junk** (0 fetches per tick) to avoid bandwidth on first launch; raise it manually after clicking **fetch**. Touch devices start at **Rare** (Precision included).

Almost every quality slider uses a 1–6 tier scale that maps to named presets:

| Tier | Name |
|---|---|
| 1 | Junk |
| 2 | Common |
| 3 | Uncommon |
| 4 | Rare |
| 5 | Epic |
| 6 | Legendary |

A seventh label, **Custom**, is shown on the composite **Quality** readout when you manually mix the underlying sliders so they no longer match a single preset.

**Performance:**

- **Frame**: read-only current frame timing.
- **Max FPS**: 30 / 60 / 120 / 240 / MAX. The default is MAX on first launch; saved settings persist across sessions.
- **Quality** (1–6): composite preset for downstream sliders.
- **Texture** (1–6): global mip-level cap for model and flag textures.
- **Atmosphere** (1–6): sky + aerial raymarch resolution. At tier 6 (Legendary), Atmosphere also enables per-pixel aerial perspective for accurate sky blending on distant geometry.
- **IBL** (1–6): cubemap / prefilter resolution for image-based lighting.
- **SSAO** (1–6): screen-space ambient occlusion resolution and sample count (bilateral blur, R8 storage).
- **Render** (1–6): overall render-target resolution scale.
- **Precision** (1–6): depth-buffer precision tier. Tier ≥ 4 enables per-pixel log-depth for accurate horizon blending at altitude; lower tiers use cheaper per-vertex depth that can show z-fighting on distant cells.
- **LOD** (1–6): geometry level of detail. Lower tiers drop far cells to fewer faces.
- **Mirrors** (1–6): concentric mirror rings around the root Bitcoin cell. The root cell holds the actual blockchain map; each ring adds symmetrically reflected copies (X, Z, or both) so the horizon has no visible seam. Higher tiers look more expansive but cost more frames.
- **Models** (0–4096): max number of simultaneously rendered glTF models. Slider uses a quadratic curve so low-end values are easier to dial in.
- **IFrame** (1–6): caps the number of HTML-inscription iframe fetches per tick (Junk = 0 / Common = 5 / Uncommon = 10 / Rare = 25 / Epic = 50 / Legendary = 100). Raising this makes HTML-billboard content fill in faster at the cost of bandwidth and per-iframe memory.

**Camera:**

- **Position**: read-only current camera position.
- **TPS Speed** (0–100): camera orbit / follow speed while in third-person mode.
- **Free Speed** (0–100): free-flight camera speed. Also used when the script editor is open, since the editor switches the camera to free-flight mode.
- **Look Speed** (0–100): rotation sensitivity when dragging the mouse.
- **FOV** (1–89°): field of view in degrees.
- **Player Size** (0.5–20): TPS character size. Also sets the orbit radius in orbit mode.
- **Player Speed** (0–100): ground-plane movement speed of the TPS character across the bitmap surface.
- **Player Distance** (1–80): follow distance for the TPS camera.

**Atmosphere:**

- **Sun Time** (5–18.5): wall-clock sun position, rendered as HH:MM next to the slider. Two-way synced with Sun Altitude.
- **Sun Altitude** (0–1): normalized sun elevation.
- **Sun Azimuth** (0–1): horizontal sun direction.

**DMT (Digital Matter Theory):** DMT treats Bitcoin block data as the raw material for digital worlds. These settings control how the blockchain landscape is rendered and structured. Items are listed in UI order:

- **Background**: viewport background color when the sky is disabled.
- **Base Level**: ground-plane style: `Zero` (flat) or `Difficulty` (terrain heights derived from Bitcoin difficulty).
- **Block Level**: individual block style: `Zero` (flat blocks) or `TxOutput` (height per block derived from the total BTC value transacted in the block).
- **Block Number**: toggle the floating bitmap numbers on each tile.
- **Sunset Flags**: toggle the OG-sunset flag billboards. Each flag is placed at the center of its 100×100 bitmap patch.
- **Sunset Numbers**: toggle the floating OG-sunset index labels above each flag.
- **Border Lands**: toggle rendering of the border lands (bitmaps 0–999).
- **Edited Bitmaps**: overlay marker highlighting bitmaps that have a locally-edited script tab open in the editor.
- **Hover Highlight**: pink tile tint + floating triangle + bitmap-number label on the block under the cursor.

**Network:**

- **Network**: read-only fetch stats.
- **Main Rate**: 10 / 25 / 50 / 100 requests/sec for bitmap data fetches.
- **Script Rate**: 1 / 3 / 5 / 10 requests/sec for script-child inscription fetches.

### Ban List Window

Open the **ban** button in the toolbar. The window has a text input, a row of five tabs, and a scrollable list of active bans.

| Tab | Contents |
|---|---|
| **universal** | Block numbers and inscription hashes. Input is interpreted as a block number or hash depending on format. |
| **image** | Inscription hashes banned as images (auto-populated when an image fails to decode). |
| **script** | Inscription hashes banned as scripts (auto-populated when a script fails to decode). |
| **model** | Inscription hashes banned as models (manual only). |
| **inscription** | Inscription hashes banned as inscriptions (manual only). |

Input is sanitized to alphanumeric characters on the way in. On the **universal** tab, the list is grouped under **blocks** and **hashes** headers; the other tabs show only inscription hashes. Each tab has its own **clear** action. Bans are persisted in your browser's localStorage and take effect immediately; banned content is skipped during fetch and will not render in the 3D world.

Images and scripts that fail to decode or parse are auto-added to their **per-type** ban list (a broken image goes to the **image** tab, a broken script to the **script** tab) so malformed content doesn't retry on every session. The **model** and **inscription** tabs are for manual bans only. Image inscriptions that return a 404 are added to the **universal** ban list as a negative cache.

### Mirror System and Multiverse Architecture

BitmapSunset’s rendering engine uses a two-level mirror system that serves both as a visual seamlessness technique and as the structural foundation for a future cross-chain multiverse.

At the first level, the Bitcoin blockchain is rendered as a **root cell** surrounded by concentric **rings of mirror cells** (configurable via the Mirror setting above). Each ring adds symmetrically reflected copies of the root, eliminating visible seams at boundaries. From the ground, the mirroring is imperceptible: you see a continuous, infinite-looking world rather than a tiled grid with hard edges.

At the second level, the mirror pattern repeats to form the multiverse. Bitcoin’s root cell and its surrounding mirror rings occupy the center position. Eight surrounding positions are reserved for additional blockchain landscapes (such as .dogemap and other .*map protocols), each with its own root cell and mirror rings. Users spawn in the center of the Bitcoin root cell, where OG BitmapSunset billboards (0–99) are positioned. Flying outward eventually crosses into mirror cells and then into neighboring blockchain territory.

In the current release, only the Bitcoin blockchain is displayed. The surrounding positions are not yet populated.

---

## 5. Using the Visual Editor

The visual editor lets you manipulate objects with mouse-based gizmos instead of editing raw script text.

1. Click the **script** button (or press **G**) to open the Scripts Panel.

2. The first tab is pre-populated with a v0.0.13 starter (`BSS 0 0 13` header + a runestone inscription + a `model runestone` example); modify it, reset it with the **recycle** icon, or clear it entirely. Use the **+** button in the tab bar to create additional tabs for working on multiple scripts simultaneously.

3. Navigate to a bitmap by editing the `block <number>` value in the script, press **T** to open the Teleport window, or **double-click** a bitmap in the 3D view to fetch its onchain script into a new tab. Drag tabs to reorder them.

4. Click an object in the 3D view to select it. A **unified gizmo** appears at the object's center with three types of handles:

   - **Axis arrows**: drag to translate the object along X, Y, or Z. Plane handles between axes translate along two axes simultaneously.

   - **Quarter-arc rings**: drag to rotate around X, Y, or Z.

   - **Diagonal strips**: drag to scale along one axis, a pair, or uniformly (central triangle).

   Use the **+** toolbar icon to duplicate the selected object, or **delete** to remove it.

5. When you manipulate objects with the gizmo, the **script text updates automatically** to reflect your changes. Selected objects display a **cyan highlight overlay** in the 3D view. Hovered objects render in front of the scene (X-ray). Press **Escape** to cancel a gizmo drag and revert to the pre-drag transforms.

6. You can also edit the script text directly; syntax highlighting and line numbers help you read and navigate the code. Changes are reflected in real time in the 3D view.

7. Check the **embedded console** below the editor for compilation status. Green messages mean success; click on error messages to jump directly to the error location in the script.

### Painting mode

While the editor is open, you can paint individual bitmaps directly on the map without writing `bitmaps`/`pixels` lines by hand:

- **Shift + left-click and drag**: paint each bitmap you hover with the current pen color.
- **Ctrl + left-click and drag**: erase the paint from each bitmap you hover.

The pen color is set via the **pen** icon in the script toolbar (a color picker). Each paint or erase action edits the active script's `bitmaps` / `pixels` lines automatically — the script text and the 3D view stay in sync. Painting is a desktop-only interaction in v0.0.13 (no mobile equivalent).

**Tips:**

- Use **Teleport** (T) or edit the `block <number>` in the script to move the camera to a specific bitmap.
- The script editor switches the camera to free-flight mode, which has its own speed setting (adjustable via scroll wheel or the Free Speed slider in settings).
- The **status bar** at the bottom of the editor shows the error count and your caret position (Ln N, Col M) at a glance.
- **Double-click** a tab label to rename it. **Drag** a tab to reorder.
- Toggle **word-wrap** (in the script toolbar) if your pixel lists or long inscription IDs make the editor scroll horizontally. The syntax overlay and line numbers stay in sync either way.
- Click the palette button to open the **syntax-highlighting palette** and retune the editor colors (comments, keywords, numbers, hex, type, default, inscription hash, inscription name, bitmap, console, error background, error foreground, background, opacity, debug). Palette state is persisted.

---

## 6. Script Language Basics

Every BitmapSunset script is a plain text file. Here's the general structure:

```
BSS 0 0 13
<inscription declarations>
block <bitmap_number>
sunset <sunset_number>
<control + object commands>
<bitmaps/pixels commands>
```

All `inscription` declarations must come **before** any other command (after the header). Once a non-inscription token is parsed, any later `inscription` line is rejected. The order of `block`, `sunset`, control + object commands, and `bitmaps`/`pixels` among themselves is flexible, but the writer always emits them in the canonical order shown above.

### Header (required)

The very first line must always be the version header. It must match the app version you're targeting.

```
BSS 0 0 13
```

This reads as: *BitmapSunset Script version 0.0.13*.

### Target commands (`block` and `sunset`)

`block <number>` and `sunset <number>` tell the virtual machine which bitmap and which sunset billboard your script is building on.

| Command | Purpose |
|---|---|
| `block <number>` | The bitmap this script targets. When the script runs onchain, the parent bitmap inscription determines the target; the author's `block` value is used in the editor, where no parent inscription exists. In practice the editor always emits a `block` line so you can preview placement locally. |
| `sunset <number>` | The sunset this script targets, for billboard and mosaic commands. Same precedence as `block`: onchain, the parent sunset inscription determines the target; the author's value is used in the editor. Valid range in v0.0.13: 0–99. Values outside this range are rejected by the parser. Support for 100–599 is targeted for v0.0.14. |

`block` accepts `color` as a modifier (tile tint). `sunset` accepts `color`, `translate`, `billboard`, and `mosaic` as modifiers.

**Example:**

```
inscription flag <inscription_id_of_image>
inscription tile <inscription_id_of_image>
color 0xFF8800 block 12345
color 0xFF0000 billboard flag translate 500 0 300 mosaic tile sunset 5
```

This sets the build target to bitmap 12345 (tinted orange), and sunset billboard #5 (filled red, with `flag` as the billboard image and `tile` stamped on the ground at map position 500, 300).

### Named inscriptions

Before you can display anything, register inscription IDs under short **names** with the `inscription` command. Named inscriptions let you reference the same inscription from multiple statements, and the names survive the binary round-trip so readers of your onchain script see meaningful identifiers.

```
inscription <name> <inscription_id>
```

Names are 1–16 characters: first character must be a letter; remaining characters may be alphanumeric. All BSS keywords are reserved and rejected as names: `inscription`, `color`, `bitmaps`, `pixels`, `model`, `scale`, `rotate`, `translate`, `block`, `sunset`, `cube`, `sphere`, `script`, `bitmap`, `wire`, `quad`, `circle`, `triangle`, `tripyr`, `squpyr`, `cone`, `billboard`, `mosaic`, `bind`, `alpha`.

**Example:**

```
inscription poster a1b2c3d4e5f6a1b2c3d4e5f6a1b2c3d4e5f6a1b2c3d4e5f6a1b2c3d4e5f6a1b2i0
inscription statue f6e5d4c3b2a1f6e5d4c3b2a1f6e5d4c3b2a1f6e5d4c3b2a1f6e5d4c3b2a1f6e5i0
```

You can now reference either inscription from any later statement by putting the name directly after the object keyword: `quad poster`, `model statue`, `billboard flag`, `mosaic tile`, `script subscene`.

### Comments

Lines starting with `#` (and `#` anywhere mid-line) are comments. The v0.0.13 compiler **preserves comments across the binary round-trip**: your onchain inscription carries the comment bytes, and any viewer re-decoding the script will see them. Because comments cost inscription bytes, keep them purposeful (author tag, intent, non-obvious hex color reminders).

```
# My first build: runestone avatar anchored at the center
inscription avatar <hash>   # rigged glTF
scale 5000 5000 5000 model avatar
```

### Hex literals

Colors and pixel values use the `0xRRGGBB` form (`0x` prefix, 6 hex digits). A combined `0xRRGGBBAA` form (8 hex digits) sets both color and alpha in a single token.

```
color 0xFF8800 scale 10000 10000 10000 cube
color 0xFF880080 sphere
pixels 3 0xFF0000 0x00FF00 0x0000FF
```

---

## 7. Displaying Images (Quads)

A **quad** is a flat rectangular surface used to display an image inscription in 3D space — think of it as a custom billboard or poster.

> **SVG and HTML support:** SVG inscriptions render natively on quads, billboards, and mosaics. HTML inscriptions render on billboards via an iframe overlay (not on quads, mosaics, or other shapes; see §10).

### Basic quad

```
inscription poster <inscription_id_of_your_image>
scale 10000 10000 10000 quad poster
```

This places a flat image in the world using the named `poster` resource.

### Positioning with translate and rotate

You can control where the quad appears and how it's oriented:

```
scale 10000 10000 10000 translate 5000 10 5000 rotate 90 0 0 quad poster
```

- **`translate X Y Z`**: moves the object to the given coordinates. Values are clamped to the range -10100 to 10100.

- **`rotate Rx Ry Rz`**: rotates the object by the given degrees around each axis. Values are clamped to the range 0 to 360.

**Tip:** If you can't find your quad, try large scale values first (like `10000 10000 10000`) and work your way down.

---

## 8. Displaying 3D Models

Use the `model` keyword to display a 3D model inscription. Models must be in **glTF format** (binary `.glb`). Draco-compressed meshes (KHR_draco_mesh_compression) are supported. Skeletal animation with crossfading is supported for rigged models.

### Basic model

```
inscription statue <inscription_id_of_your_gltf_model>
scale 10000 10000 10000 model statue
```

Models need large scale values to be visible. Always start with `scale 10000 10000 10000` and adjust from there.

### Full example with positioning

```
inscription statue <inscription_id_of_your_gltf_model>
scale 5000 5000 5000 translate 5000 2000 5000 rotate 2 45 0 model statue
```

### Control commands and object commands

A script line consists of **control commands** followed by an **object command**. Control commands (`scale X Y Z`, `translate X Y Z`, `rotate Rx Ry Rz`, `color 0xRRGGBB`) can appear in **any order** before the object command. Shapes also support `wire` and `alpha 0xBB` (see Section 9 for details); models do not: `model` accepts only `scale`, `translate`, `rotate`, and `color 0xRRGGBB` (6-digit only; the 8-digit `0xRRGGBBAA` combined form is rejected on models because they do not support alpha). The object command (`model`, `quad`, `script`, `sphere`, `cube`, etc.) terminates the statement and takes the inscription name as a direct argument (e.g., `quad poster`, `model statue`). `billboard <name>` and `mosaic <name>` are inscription-binding modifiers consumed by the `sunset` command rather than standalone object commands (see Section 10).

A full example:

```
scale X Y Z translate X Y Z rotate Rx Ry Rz model <name>
```

This is equivalent to:

```
rotate Rx Ry Rz translate X Y Z scale X Y Z model <name>
```

Both produce the same result; the control commands are collected and the object command triggers rendering.

### Per-object alpha

You can override the default fully-opaque alpha for shapes and quads with the `alpha` modifier, which takes a hex byte. You can also use the combined `0xRRGGBBAA` form (8 hex digits) to set both color and alpha in a single token:

```
alpha 0x80 color 0x00FF00 scale 5000 5000 5000 sphere
color 0x00FF0080 scale 5000 5000 5000 sphere
```

Both lines produce the same result: a half-transparent green sphere. Combine `alpha` with `color` on primitives to make translucent decorations.

---

## 9. Primitive Shapes

You can place built-in geometric shapes without needing any inscription at all.

### Basic usage

```
color 0xFF0000 scale 10000 10000 10000 sphere
```

This creates a red sphere the size of a bitmap block.

### Available primitives

**2D:** `triangle`, `quad`, `circle`

**3D:** `tripyr` (triangular pyramid), `squpyr` (square pyramid), `cube`, `cone`, `sphere`

`quad` is a flat rectangular plane. When used standalone with a `color` command, it renders as a colored surface. When bound to a named inscription (via `quad <name>`), it renders as a textured surface (see Section 7).

### Wireframe

Primitives render filled (solid) by default. The `wire` modifier renders the next shape as wireframe outlines. It applies only to shapes, not models. Filled rendering is the default for every shape, so no explicit `solid` keyword is needed; simply omit `wire`.

```
translate 1000 500 1000 triangle
translate 1000 500 2000 wire triangle
```

This draws a filled triangle at (1000, 500, 1000) and a wireframe copy offset by 1000 on Z.

### Setting color

The `color` modifier sets the color (as a `0xRRGGBB` hex literal) for a primitive shape or quad. It must appear on the same line as the object command it applies to. On textured quads (`quad <name>`) it tints the sampled image; on primitives it fills or outlines the geometry.

```
color 0x00FF00 scale 5000 5000 5000 cube
color 0x0000FF scale 3000 3000 3000 translate 5000 5000 5000 sphere
color 0xFF00FF scale 4000 4000 4000 translate 2000 0 2000 squpyr
```

This places a green cube, a blue sphere, and a magenta square pyramid at different positions.

### Displaying all primitives in a row

Here's a script that places one of every primitive across the bitmap:

```
BSS 0 0 13
block 199452
sunset 1
color 0xff3030 scale 800 800 800 translate 1200 500 2000 cube
color 0x30ff50 scale 800 800 800 translate 2800 500 2000 rotate 0 25 0 sphere
color 0x3080ff scale 800 800 800 translate 4400 500 2000 cone
color 0xffaa20 scale 800 800 800 translate 6000 500 2000 rotate 0 15 0 tripyr
color 0xff40dd scale 800 800 800 translate 7600 500 2000 rotate 0 30 0 squpyr
color 0x20dddd scale 800 800 800 translate 1200 500 3800 rotate 90 0 0 circle
```

> **Note:** A `color` on the same line as the `block` command (e.g., `color 0xFF0000 block 12345`) also sets the bitmap tile tint; this is by design and independent from the `bitmaps`/`pixels` painting commands, which set per-bitmap colors explicitly.

---

## 10. Billboard & Mosaic

### Billboard

If you own an OG BitmapSunset (0–99), you can replace the default sunset image on your billboard with a custom inscription (image, SVG, or HTML):

```
inscription flag <inscription_id_of_image>
billboard flag sunset <your_sunset_number>
```

**Example:**

```
inscription flag <inscription_id_of_image>
billboard flag sunset 5
```

This changes sunset billboard #5 to display your custom image.

You can optionally add a `color` to fill the billboard with a solid color instead of (or before) an image:

```
color 0xFF0000 billboard flag sunset 5
```

This fills sunset billboard #5 with red and then overlays the `flag` image on top. If the image covers the full billboard, the color acts as a fallback; if the image has transparency, the color shows through.

The `flag` inscription can be an **image** or **SVG** (rendered natively as a texture), or **any other inscription type** (HTML, recursive, etc.) which renders as a sandboxed iframe overlay. Iframes carry a performance cost (per-iframe memory, fetch budget gated by the **IFrame** quality setting); image/SVG is preferred when possible.

> **Note:** Dedicated 2D billboard placement for sunsets 100–599 is planned for a future release. These billboards will be positioned on mirror cells of the map bordering neighboring blockchain landscapes (such as .dogemap and other .\*map protocols), complementary to but distinct from OG cubitmaps. Currently, only OG sunsets (0–99) have positioned billboards in the central map cell.

> **Future evolution:** OG billboards (0–99) are planned to evolve into **cubitmaps**: giant floating 3D structures where holders can display images on all sides and build on top. These cubitmaps will feature parceling, enabling subdivided building within a sunset holder's domain, and could each host their own lobby area.

### Mosaic

A mosaic draws an image flat on the ground at a specific map-space position, where coordinates correspond to bitmap numbers:

```
inscription tile <inscription_id_of_image>
translate <X> 0 <Z> mosaic tile sunset <your_sunset_number>
```

**Example:**

```
inscription tile <inscription_id_of_image>
translate 500 0 300 mosaic tile sunset 5
```

This stamps the image onto the ground at bitmap position (500, 300) on the map. Mosaics are visible when looking down from altitude and serve as ground-level art or territorial markers. They're especially impactful in **flat** view mode (click the **flat** button in the toolbar to see them as a 2D map).

> **Resource kind:** `mosaic` and shapes (including `quad`) accept **image** or **SVG** inscriptions only. Binding an HTML-only inscription to a mosaic or shape surfaces an error in the editor console. HTML inscriptions are allowed on `billboard` only, where they render in a sandboxed iframe overlay.

> **Note:** The `mosaic` command is currently available to all bitmap owners and BitmapSunset holders. In a future release, mosaic will become a BitmapSunset-exclusive feature.

---

## 11. Bitmap Painting

The `bitmaps` and `pixels` commands are special painting and fetching commands that operate independently from the `color` control command. They let you color specific bitmaps anywhere on the map — not just your own — turning BitmapSunset into a shared, onchain pixel war played across the whole blockchain landscape:

```
bitmaps <count> <bitmap_number_1> <bitmap_number_2> ...
pixels <count> <hex_color_1> <hex_color_2> ...
```

**Example**: color bitmap 12345 orange:

```
bitmaps 1 12345
pixels 1 0xFF7F00
```

### Coloring many bitmaps at once

You can reference large numbers of bitmaps in a single script. The `bitmaps` command takes a count followed by that many bitmap numbers, and `pixels` takes a count followed by that many `0xRRGGBB` colors, one color per bitmap.

```
bitmaps 140
83184 85184 85185 85186 85187 85188 85190 86189 80183 81183
82183 85183 86179 86180 86181 86182 86183 75182 75183 76180
...
pixels 140
0x57BEFF 0x57BEFF 0x57BEFF 0x57BEFF 0x57BEFF 0x57BEFF 0x57BEFF 0x57BEFF 0x57BEFF 0x57BEFF
...
```

This paints large areas of the map in a single color — useful for faction territory or simply to make your corner of the blockchain visible from altitude.

### Cross-bitmap painting (the pixel war)

The application renders **cross-bitmap commands from all loaded scripts**: any script can paint any bitmap, and every owner sees every other builder's contributions layered over their tile. Think of it as a public graffiti layer on top of the canonical world: players can enhance each other's builds, plant territorial markers, or wage pixel wars — all from their own bitmap's script.

You still inscribe your script as a child of your **own** bitmap; the difference is in **scope**. The `bitmaps`, `pixels`, and `mosaic` commands can target any bitmap on the map.

**Example**: color someone else's bitmap red from your own script:

```
BSS 0 0 13
bitmaps 1 <target_bitmap_number>
pixels 1 0xFF0000
```

The target bitmap turns red on the map, visible to everyone. Combined with `mosaic` (to stamp images on the ground) and primitive shapes, you can claim visual territory across the entire blockchain landscape.

### Strategies

- **Color the map:** Use `pixels` to paint bitmaps in your faction's color across large swaths of the map, visible from altitude.
- **Stamp your mark:** Use `mosaic` to place logos, flags, or images on the ground plane of contested bitmaps.
- **Stack effects:** Multiple scripts from different builders accumulate color and mosaic effects on a single bitmap, creating collaboratively or competitively layered scenes.

### Important notes

- Property rights at the **inscription** layer (only a bitmap's owner can inscribe a child script on it) are still enforced by the Ordinals protocol; cross-bitmap painting only changes what your viewer renders, not who can author.
- Effects are visible the moment the referenced bitmaps are fetched. Any bitmap referenced in `bitmaps` will also be queued for fetching after your script loads — this is the foundation of the **bootstrapping** system (see Section 14).
- All inscriptions are permanent and persist on the blockchain indefinitely, creating an immutable record of territorial contests and collaborative builds.

---

## 12. Referencing Other Scripts & Bitmaps

Scripts can reference external content — either a specific script inscription or another bitmap's entire world. This avoids re-inscribing the same content across multiple bitmaps.

### `script`: Reference a specific script inscription

Use `script <name>` to load and execute another script inscription inside your own:

```
inscription subscene <inscription_id_of_another_script>
script subscene
```

**How it works:** The app fetches the named inscription and executes it as if its content were inlined into your script. The referenced script runs at its authored transforms. To reposition a subscene, author its internal objects at the coordinates you want them, or wrap them in a model.

**Use cases:**

- Reuse a complex, expensive script across multiple bitmaps without re-inscribing it.
- Let other people reference **your** script on their bitmaps — collaborative building.
- Keep referencing an old script version even after you've inscribed an update on your bitmap (old inscriptions remain onchain and referenceable by their ID).

**Example**: reference another script and let it draw its own content:

```
inscription subscene <inscription_id_of_script>
script subscene
```

### `bitmap`: Clone another bitmap's world

Instead of pointing to a specific inscription, you can reference an entire bitmap by its number:

```
bitmap 444
```

**How it works:** The app looks up bitmap 444, finds its latest child inscription (the most recent script), and loads that build. No `inscription` declaration or `bind` is needed, just the bitmap number.

**Key differences from `script`:**

- `bitmap` is a **live link**: if bitmap 444 gets a new inscription, every script referencing `bitmap 444` will automatically reflect the updated build.

- `bitmap` does **not** support modifiers; the parser rejects all modifiers on `bitmap`. The referenced world loads at its original position and scale.

- `bitmap` takes a bitmap number directly, not an inscription ID.

**Use cases:**

- Deploy the same world to multiple bitmaps. Inscribe your main build on one bitmap, then use `bitmap <number>` on all others.

- When you update your main bitmap, all clones update automatically, no need to re-inscribe on every bitmap.

- The most efficient way to manage a network of builds from a single source.

**Example**: one main build, multiple clones:

```
# On bitmap 12345 (your main build):
BSS 0 0 13
inscription statue <inscription_id_of_model>
scale 5000 5000 5000 model statue
```

```
# On any other bitmap (clone):
BSS 0 0 13
bitmap 12345
```

Now if you update bitmap 12345 with a new child inscription, every bitmap using `bitmap 12345` will reflect the change automatically.

> **Recursion limit:** Combined `script <name>` and `bitmap <N>` reference chains are capped at **8 levels deep**. Scripts that try to recurse deeper are rejected at boot, protecting viewers from fetch bombs and cyclic references.

---

## 13. Exporting & Inscribing to a Bitmap

This is how you make your build permanent and visible to everyone onchain.

### Step 1: Build your world

Write your script and verify it looks correct in the editor's 3D preview. Check the console for any parse errors.

### Step 2: Trim the script

Remove any default `inscription` lines, objects, or commands you're not using. Every byte costs sats to inscribe, so a leaner script means a cheaper inscription. Keep the `block` and `sunset` lines; `block` carries the target bitmap and tile color; `sunset` carries the target sunset number, optional billboard color, and triggers any pending billboard / mosaic binds into the binary as separate objects. Comments are useful for documentation but they **do** cost bytes; keep them purposeful (author tag, non-obvious intent).

### Step 3: Save the source or export the BMP

The script toolbar has two distinct buttons:

| Button | Purpose |
|---|---|
| **save** | Downloads the editor text as a `.bss` source file (`bitmap_<N>.bss`). Use this for local backup, sharing editable scripts, or versioning outside the browser. |
| **export** | Compiles the script, runs the full round-trip (text → binary → BMP → binary → text), and downloads the resulting `.bmp` (`bitmap_<N>.bmp`). This is the file you'll inscribe. Disabled when the tab has compile errors. |

Click **export**. The console confirms success with a single line (e.g., `compiled successfully in 12 ms, .bmp size: 3 ko`).

The BMP encodes your entire script as colored pixels. On ordinals explorers, this means your inscription appears as a visible image, a recognizable visual signature for each onchain build.

### Step 4: Inscribe the BMP as a child of your bitmap

1. Go to any inscription service that supports parent/child inscriptions.
2. Upload the `.bmp` file.
3. Set the **parent** to the **inscription ID of your bitmap** (this is the ordinal inscription ID, not the bitmap number).
4. Inscribe it.

Once confirmed on the blockchain, your build is permanently onchain. Anyone running BitmapSunset will see your creation when they visit your bitmap.

### Complete example: a world with a 3D model, floor image, and avatar

```
BSS 0 0 13
inscription statue <inscription_id_of_gltf_model>
inscription floor <inscription_id_of_floor_image>
inscription avatar <inscription_id_of_avatar_model>
scale 5000 5000 5000 translate 5000 2000 5000 rotate 2 45 0 model statue
scale 10000 10000 10000 translate 5000 10 5000 rotate 90 0 0 quad floor
scale 8000 8000 8000 translate 5000 6000 5000 rotate 0 0 0 model avatar
bitmaps 1 12345
pixels 1 0xFF7F00
```

This script places a 3D model, lays an image on the ground, adds an avatar model, and colors bitmap 12345 orange on the map.

### Inscribing: cost & size tips

- **Cheap**: primitives (`cube`, `sphere`, etc.) with a `color`: they carry no inscription ID, just an opcode + color.
- **Moderate**: one or two named inscriptions + a few `model`/`quad` statements.
- **Expensive per byte**: dense `pixels` / `bitmaps` lists, long inscription IDs, and comments you chose to keep.
- **Keep your `block <N>` / `sunset <N>` lines; they drive editor placement.** The editor always emits them. Onchain, the parent inscription determines the target, but the editor needs these lines to preview your build. Only unused `inscription` declarations are safe to strip.
- **Round-trip is deterministic**: the `.bmp` the editor exports is byte-identical to what the reader will parse, so a green console means the onchain script will render the same way.

### Recipes: common workflows

These are the short walk-throughs readers most often assemble from the sections above.

**1. First build on your bitmap**

```
BSS 0 0 13
inscription statue <inscription_id_of_gltf_model>
block <your_bitmap_number>
scale 5000 5000 5000 translate 5000 1000 5000 model statue
```

Preview by editing the `block` number, export, inscribe with parent = your bitmap's inscription ID. Keep `block <your_bitmap_number>`: the virtual machine uses the author's `block` value as the canonical target (falling back to the parent inscription only when no `block` is declared).

**2. Bootstrap a bitmap from your OG sunset**

```
BSS 0 0 13
inscription flag <billboard_image>
billboard flag sunset <your_sunset_number>
bitmaps 1 <your_bitmap_number>
pixels 1 0xFF7F00
```

Inscribe as a child of your OG sunset inscription; the `bitmaps` entry queues your bitmap into Phase 1 loading.

**3. Clone one build across many bitmaps**

Inscribe your full build on one bitmap (say 12345), then inscribe this trivial child on every other bitmap you want to mirror it:

```
BSS 0 0 13
bitmap 12345
```

When you update bitmap 12345, every clone reflects the change automatically, no re-inscription per bitmap.

**4. Cross-bitmap graffiti raid**

```
BSS 0 0 13
inscription logo <inscription_id_of_logo_svg>
bitmaps 5 10000 20000 30000 40000 50000
pixels 5 0xFF0000 0xFF0000 0xFF0000 0xFF0000 0xFF0000
translate 10 0 10 mosaic logo sunset 0
```

Inscribed as a child of **your own** bitmap, this paints five foreign bitmaps red and stamps your logo on the ground. Visible to every viewer.

**5. Update an existing build**

Inscribe a new `.bmp` child on the same parent (bitmap or sunset). The newest child wins; the old inscription remains onchain and referenceable by ID if you or others want to fall back.

**6. Mobile-only authoring**

- Type or paste a script, use the `block <N>` line to preview, tap **export** to download a `.bmp`.
- Drag tabs to reorder; double-tap a tab to rename.

Painting (Shift/Ctrl modifiers) is desktop-only in v0.0.13; plan mobile sessions around script editing and exploration, and finish paint-heavy builds on a laptop.

---

## 14. Bootstrapping

### The Problem

BitmapSunset displays every mined Bitcoin block as a bitmap. When the app launches, it needs to decide which bitmaps to fetch first. There's no way to know which bitmaps have builds without checking all of them one by one.

### The Solution: Bootstrapping

OG BitmapSunset holders (0–99) can inscribe a script on their sunset that tells the app **which bitmaps to load first**. This controls the loading queue for every user’s browser.

> **Note:** Bootstrap support for sunsets 100–599 is targeted for v0.0.14. Currently, only OG sunsets (0–99) participate in the bootstrap loading phase.

### Loading Order

The app fetches data in this order:

1. **Phase 1:** OG BitmapSunset scripts (sunsets 0–99), ordered by sunset number.

2. **Phase 2:** Seed bitmaps: a hardcoded seed list is fetched alongside sunset-discovered bitmaps. Both sources feed the same bootstrap queue; additional bitmaps chain transitively via `bitmaps` commands in scripts.

If your bitmap number isn’t in the seed list and isn’t bootstrapped by a sunset holder, users can still load it manually by navigating to it and double-clicking.

### How Bootstrapping Works

When you inscribe a script on your OG BitmapSunset that references a bitmap number in the `bitmaps` command, that bitmap gets added to the **priority loading queue**.

**Example:** Your sunset script references bitmap 50000:

```
bitmaps 1 50000
```

Now bitmap 50000 loads right at app startup, because it’s referenced by a sunset that’s fetched in phase 1.

### Inscribing a Bootstrapping Script

Here’s how to write and inscribe a bootstrapping script for an OG BitmapSunset (0–99).

**Step 1: Write the script**

```
BSS 0 0 13
inscription flag <inscription_id_for_billboard_image>
billboard flag translate 700 0 600 mosaic flag sunset <your_sunset_number>
bitmaps 1 <your_bitmap_number>
pixels 1 0xFF7F00
```

**What each line does:**

- `billboard flag`: displays the named `flag` inscription on your sunset billboard.
- `translate 700 0 600 mosaic flag`: also draws the image flat on the ground at bitmap position (700, 600) on the map.
- `sunset <number>`: the sunset this script targets. The author-declared value drives the billboard/mosaic binds; the parent sunset inscription is used only as a fallback when no `sunset` is present.
- `bitmaps 1 <number>`: **this is the bootstrapping line.** It tells the app to load the specified bitmap when this sunset is fetched.
- `pixels 1 0xFF7F00`: colors the bootstrapped bitmap orange on the map.

**Step 2: Export the BMP**

Click the **export** icon to compile and download the `.bmp` file. Check the console for success messages. Use **save** if you also want a `.bss` source backup.

**Step 3: Inscribe as a child of your sunset**

1. Go to your preferred inscription service.

2. Upload the `.bmp` file.

3. Set the **parent** to the **inscription ID of your OG BitmapSunset** (the sunset’s ordinal inscription ID, not a bitmap).

4. Inscribe.

Once confirmed, every time the app launches and fetches your sunset, it will also queue your bitmap for immediate loading.

### Bootstrapping Multiple Bitmaps

You can bootstrap several bitmaps from a single sunset:

```
bitmaps 3 50000 150000 200000
pixels 3 0xFF7F00 0x00FF00 0x0000FF
```

This loads three bitmaps at startup, each colored differently on the map. You can also lend bootstrap priority to other people’s bitmaps, a potential monetization or collaboration path.

### Chaining Bitmaps

You can chain multiple bitmaps together. In your sunset script, reference your main bitmap. In that bitmap’s script, reference more bitmaps:

```
Sunset #5 → loads bitmap 50000
Bitmap 50000 → loads bitmap 150000, bitmap 200000
```

This way, a single sunset can bootstrap an entire network of builds.

> **Chain depth cap:** Transitive `bitmap <N>` and `script <name>` references are capped at **8 hops**. A sunset chain like Sunset → A → B → … that tries to recurse past the ninth hop will stop at the cap.

### Without a Sunset

If you don’t own an OG BitmapSunset or a low-number bitmap, users can still view your build by:

1. Navigating to your bitmap location in the 3D world.

2. Clicking the **fetch** button in the toolbar.

3. Double-clicking on the bitmap.

This manually triggers a download and display of your build. It’s just not automatic at launch.

### Caching

The app maintains an **IndexedDB cache** for inscription content. Text inscriptions (scripts, bitmap-page JSON, blockheight) and binary blobs (images, glTF models, resolved SVG references) are stored on your device after their first fetch; subsequent sessions serve cached inscriptions instantly while still walking the bootstrap sequence to discover newly-inscribed builds. What's **not** cached is the per-session world state; the bootstrap queue and per-bitmap discovery still re-run on launch, just much faster because most inscriptions are already local.

---

## 15. Updating Scripts

### On a bitmap

Inscribe a new `.bmp` child on the same bitmap. The app automatically loads the **most recent** child inscription. Your old script inscription remains onchain but is superseded.

### On a sunset

Same process: inscribe a new `.bmp` child on the same sunset. The newest child takes precedence.

### Backward compatibility

Older onchain scripts (`BSS 0 0 9` through `BSS 0 0 12`) still render correctly; the current app keeps dedicated readers for each prior version. If you're writing new scripts, always use `BSS 0 0 13`.

### Version compatibility

| From | To | Changes |
|---|---|---|
| v0.0.9 | v0.0.10 | Identical script syntax; no script-level changes. |
| v0.0.10 | v0.0.11 | Unified `image` command replaced with separate object commands (`quad`, `model`, `script`) and `billboard`/`mosaic` modifiers on `sunset`; resources remain index-based |
| v0.0.11 | v0.0.12 | Identical script syntax; app-only changes (SVG support, orbit camera, ban list, teleport, canvas window) |
| v0.0.12 | v0.0.13 | **Named inscriptions** (`inscription <name> <hash>` + `model <name>`/`quad <name>`/…) replace the v0.0.12 `resource <hash>` keyword and numeric-slot form; **`BLOCK` object type removed**: `block` is now exclusively the target command, not a drawable primitive; **9-byte binary header** with filesize for EOF validation; **comment opcodes** round-trip `#` comments through the binary; **`0x` hex prefix** is the canonical emit form for `color` and `pixels`; **`editBitmap` / `editSunset` keywords renamed** to `block` / `sunset`; editor **inscription-kind validation** rejects HTML inscriptions bound to `mosaic` or shapes (including `quad`). **Stricter parser:** unknown opcodes rejected, `solid` keyword removed (filled is the default), per-axis shorthand tokens removed (`sx`/`sy`/`sz`/`tx`/`ty`/`tz`/`rx`/`ry`/`rz`: use the three-component `scale`/`translate`/`rotate` forms instead), duplicate modifiers rejected, modifier ordering enforced in the binary encoding (scale→translate→rotate→wire→bind→color→alpha; the text parser accepts any order and normalizes), inscription declarations must precede shapes, canonical encoding enforced (most compact form required), modifier state resets between shapes, dangling modifiers rejected. |

---

## 16. Scale Reference

| Scale Value | Relative Size |
|---|---|
| `1 1 1` | Smallest possible object (minimum) |
| `100 100 100` | Human-sized (good for avatars) |
| `1000 1000 1000` | Building-sized |
| `10000 10000 10000` | Size of an entire bitmap block |
| `50000 50000 50000` | Larger than a bitmap, will overlap neighbors |
| `65535 65535 65535` | Maximum scale (covers multiple bitmaps) |

### Coordinate system

- **X** = horizontal axis

- **Y** = vertical axis (height)

- **Z** = depth axis

Scale values are clamped to the range **1–65535** per axis. Translate values are clamped to **-10100–10100**. Rotate values are clamped to **0–360** degrees.

**Note:** In the current version, objects can extend beyond your bitmap's boundaries. Proper clamping on the horizontal plane is planned for a future release. The vertical axis will remain unlimited; build as tall as you want.

---

## 17. Security & Safety

BitmapSunset is a fully onchain application. It runs entirely in your browser and reads data exclusively from the Bitcoin blockchain via ordinals recursive endpoints. While the application requires no servers of its own, it depends on ordinals content servers to deliver inscription data, the same decentralized infrastructure that serves all ordinals applications.

### BitmapSunset will never ask for:

- Your recovery phrase, private keys, or wallet credentials.

- To connect your wallet, sign messages, sign transactions, transfer funds or assets.

- To navigate to external links or websites. The application does not load resources from outside the ordinals sandbox.

- To download or execute any additional software or browser extensions.

- To verify your identity, account or any personal information.

- To enable any permissions.

- To create a user account, log in, or provide any personal data. There is no identity system, login mechanism, or personal data collection.

### Content Filtering

BitmapSunset includes multiple layers of content filtering to protect users from malicious or unwanted content:

- **SVG sanitization:** SVG inscriptions are processed through a tag/attribute allowlist; unsafe URI protocols are blocked. Recursive SVG references are bounded by depth, count, and per-blob size limits.
- **Ban list:** Users can ban content (block numbers, inscription hashes, images, scripts, models) from a dedicated window. Bans persist locally and take effect immediately.
- **Auto-ban on failure:** Content that fails to decode or parse is automatically banned per-type so malformed inscriptions don't retry every session.
- **Negative caching:** Persistent fetch failures are cached locally; transient errors are retried with backoff.
- **Size caps:** Inscription blobs and glTF model buffers are bounded by hard size limits.
- **Model hardening:** glTF parsing validates buffer bounds and MIME fields; a wall-clock deadline aborts pathological decode loops.
- **Binary reader hardening:** Header fields, pixel-data bounds, and declared filesize are validated before decoding. Every rejection path is tagged and covered by tests.
- **Resource-kind gate:** Object commands reject inscriptions whose content type isn't compatible (e.g., HTML on `mosaic`).
- **Reference recursion cap:** `script <name>` and `bitmap <N>` reference chains are capped to prevent fetch bombs and cyclic references.
- **Iframe sandbox:** HTML inscriptions render in a heavily restricted sandbox: no same-origin access, no credentials, no top-navigation, no device or media APIs, no referrer leak. Inscription IDs are validated before the iframe loads.
- **Anti-phishing indicator:** When you interact with an inscription, every iframe gets a visible outline and an "external content" badge so a hostile child inscription can't impersonate the app UI.
- **Strict CSP:** The app ships with a strict Content-Security-Policy that disallows inline scripts and locks down network/origin behavior.
- **DOM write-surface audit:** All dynamic DOM is constructed via safe APIs, with build-time guards against unsafe patterns.
- **Storage validators:** Every value read from local storage is type-checked; malformed entries are ignored rather than trusted.

### Best practices:

- Always verify the BitmapSunset inscription ID using trusted sources (the official @BitmapSunset X account).

- Use a secure browser profile, a virtual machine, or private mode without wallet extensions.

- There is no wallet connection from within the app. Inscription and transactions happen through external inscription services.

- If something feels suspicious, double-check via official channels.

### DISCLAIMER

- BitmapSunset is provided **"AS IS"** and **"AS AVAILABLE"** without warranties, guarantees, or support of any kind.

- You acknowledge and accept all risks associated with using blockchain-based applications, including financial losses.

- You are solely responsible for securing your private keys, Bitcoin, and other digital assets.

- The creators are not liable for any damages, losses, or security breaches resulting from the use of this application.

- BitmapSunset inscriptions are not investments and carry no expectation of financial return.

- While inscriptions are permanently stored on the Bitcoin blockchain, access to them depends on ordinals content servers and infrastructure outside the creators' control.

- All inscriptions are permanent and irreversible; once data is inscribed, it cannot be modified or deleted.

- It is your responsibility to comply with any applicable laws and regulations in your jurisdiction.

- By using BitmapSunset, you confirm that you understand and accept these terms.

---

## 18. Troubleshooting

### "line 1, col 1: invalid magic / invalid token / invalid version"

- The `BSS 0 0 13` header must be the **very first line** of the script. Nothing before it; no blank lines, no spaces.

- Make sure you're running app version 0.0.13 (check in settings; it should read `BitmapSunset 0 0 13`).

- If you copied the script from X/Twitter, check that no timestamp or extra text was accidentally pasted at the end.

### Model not showing

- Start with `scale 10000 10000 10000`. Models often appear tiny at small scales.

- It might be hidden inside another object; try increasing the scale dramatically to locate it.

- Double-check that the inscription ID is correct and points to a valid glTF model.

### Image not showing on quad

- Make sure you used `quad` (not `model`) for image inscriptions. `model` is for glTF 3D files only.

- Try `scale 10000 10000 10000` to make it large enough to find.

### SVG inscription not rendering

- Verify the inscription has `svg+xml` content type. Other XML formats are not supported.

- The SVG may contain blocked content (e.g., `javascript:` URLs or `data:` URIs). These are stripped by the sanitizer for security.

- Check if the SVG references external resources that exceed the size or recursion limits.

### Camera too sensitive / spinning too fast

- Adjust the **Look Speed** slider (0–100) in settings to reduce camera rotation sensitivity.

- Reduce the **Max FPS** to 30 in the app settings.

- Enable **hardware acceleration** in your browser settings.

- Use **Chrome** or **Brave** (Firefox performance is lower).

- Disable resource-heavy settings in the app: mirror count, LOD, SSAO, sky/atmosphere rendering.

### Bootstrapped bitmap not auto-loading

- You still need to click the **fetch** button for bitmap world data to start downloading.

- Bootstrapping controls the **order** of loading, not whether fetching is active.

- Loading consistency may vary; this is a known issue being investigated.

### Models not visible on mirror maps

- Known bug in v0.0.13. Models appear on the primary (A) mirror but may not render on other mirrors.

- Editing `block <N>` teleports you to the A mirror where models are visible.

- Fix is being investigated.

### Mosaic shows "requires image or svg" error

- The inscription you bound to `mosaic` is an HTML inscription. Swap it for an image or SVG, or move it to `billboard` (which accepts HTML via the iframe overlay).

### v0.0.13 binary rejected with filesize error

- The `.bmp` you tried to load has an inconsistent filesize field in its binary header. Re-export from the editor rather than hand-editing the BMP.

### Console shows errors

- Check the **embedded console** below the code editor in the Scripts Panel for the exact error line and column.
- **Click on an error message** to jump directly to the error location in the script.
- Common causes: misspelled keywords, wrong number of arguments, missing inscription ID, extra whitespace before the `BSS` header.
- Green messages = success. Red/error messages = something needs fixing.

### Nothing happens when I click Export

- The **export** button is disabled when the current tab has compile errors. Clear the errors first.
- Check the embedded console for the exact failure line.
- Make sure the `BSS 0 0 13` header is present and on the very first line.

### Content not loading (banned)

- Check the **ban list** panel; you may have previously banned the block number or inscription hash. Check all five tabs (universal, image, script, model, inscription). Remove the ban entry to restore loading. Images and scripts that fail to decode are auto-banned to their per-type tab.

### Common error messages

| Message (as shown in the console) | Usual cause |
|---|---|
| `invalid magic` / `invalid version` | The `BSS 0 0 13` header is missing, misspelled, or preceded by whitespace. |
| `invalid token` | Unknown keyword. Check spelling and capitalization. |
| `binary: binary offset out of range` | The v0.0.13 binary's declared filesize doesn't match the decoded stream. Re-export. |
| `mosaic '<name>' requires image or svg (got iframed inscription)` | You bound an HTML inscription to `mosaic`. Use an image or SVG, or switch to `billboard`. |
| `shape '<name>' requires image or svg (got iframed inscription)` | You bound an HTML inscription to a shape (`quad`, `cube`, etc.). Use an image or SVG, or switch to `billboard`. |
| `invalid first argument to model` / `invalid first argument to quad` | The inscription name after `model` or `quad` was not declared with `inscription <name> <hash>`. |
| `'<modifier>' not allowed on <command>` | A modifier was used on a command that doesn't accept it (e.g., `color` on `bitmap`, `wire` on `model`). |
| `invalid bind` | The `billboard` or `mosaic` argument is not a valid inscription name. |
| `invalid color` | The `color` argument is not a valid `0xRRGGBB` hex literal. |
| `invalid block` | A bitmap number is out of the valid index range. |
| bitmap/pixels count mismatch | The `<count>` prefix doesn't match the number of entries that follow. |

### Performance tuning

If the app runs slowly, the biggest performance levers live in **Settings** (press **R**) under **Performance**. All sliders use the 1–6 tier scale (Junk / Common / Uncommon / Rare / Epic / Legendary):

| Lever | Effect |
|---|---|
| **Quality** | Composite preset. Drop to 4 (Rare) for a mobile-grade profile in one click. |
| **Mirrors** | Number of concentric mirror rings around the root cell. Dropping from 6 to 2–3 recovers substantial frame time. |
| **LOD** | Geometry level-of-detail tier for far cells. Lower tiers render distant cells as fewer faces. |
| **SSAO** | Screen-space ambient occlusion resolution + sample count. Drop to 1 (Junk = off) if you don't need contact shadows. |
| **IBL** | Image-based lighting cubemap / prefilter resolution. Lower tiers trade reflection sharpness for VRAM and bandwidth. |
| **Atmosphere** | Sky + aerial raymarch resolution. Drop for a cheaper sky. Tier 6 also enables per-pixel aerial perspective; drop to 5 to skip it. |
| **Render** | Overall render-target resolution scale. Halving this is a blunt but effective frame-rate knob. |
| **Precision** | Depth-buffer precision tier. Drop to 3 or lower to skip per-pixel log-depth and gain some fragment-shader headroom (may introduce z-fighting on distant cells). |
| **Texture** | Global mip-level cap for model and flag textures. Saves VRAM and bandwidth. |
| **Models** (0–4096) | Caps the number of glTF models rendered simultaneously. Useful in dense districts. |
| **IFrame** (1–6) | Caps HTML-inscription iframe fetches per tick. Junk = 0, Legendary = 100. Lower = less bandwidth, HTML billboards fill in slower. |
| **Max FPS** | Cap to 30 if your device's thermal budget is the limiting factor. |

On mobile (touch-detected), the app defaults to the **Rare (4)** tier across Atmosphere / IBL / SSAO / Render / Precision / LOD / Mirrors / Texture and a matching Models cap. Tune further from there.

---

> **For the full development roadmap, technical architecture, and collection mechanics, see the [BitmapSunset Vibe Paper](vibepaper.md).**

## 19. Quick Reference Card

```
BSS 0 0 13                              ← version header (always first line)
# comment                                ← preserved through the binary (costs bytes)
inscription <name> <inscription_id>      ← register inscription under a name (must come before any other command)
block <number>                           ← build target bitmap (used in editor; onchain, the parent inscription is the target)
sunset <number>                          ← target sunset for billboard / mosaic (valid: 0–99 in v0.0.13; used in editor; onchain, the parent inscription is the target)
scale X Y Z model <name>                 ← display 3D model
scale X Y Z quad <name>                  ← display flat image (image/SVG only)
billboard <name> sunset <N>              ← display on sunset billboard (optional: prefix with color 0xRRGGBB)
translate X Y Z mosaic <name> sunset <N> ← draw on ground (X/Z = bitmap numbers; image/SVG only)
scale X Y Z translate X Y Z rotate Rx Ry Rz model <name>
                                         ← full example (control commands can appear in any order before the object command)
wire                                     ← wireframe mode (shapes only; inline modifier, same line as object)
color 0xRRGGBB                           ← set color (inline modifier, same line as object)
color 0xRRGGBBAA                         ← combined color + alpha (8 hex digits)
alpha 0xBB                               ← override alpha for shape/quad (inline modifier, default 0xFF)
scale X Y Z triangle                     ← triangle primitive (2D)
scale X Y Z quad                         ← flat quad primitive (2D, or textured with inscription)
scale X Y Z circle                       ← circle primitive (2D)
scale X Y Z tripyr                       ← triangular pyramid primitive (3D)
scale X Y Z squpyr                       ← square pyramid primitive (3D)
scale X Y Z cube                         ← cube primitive (3D)
scale X Y Z cone                         ← cone primitive (3D)
scale X Y Z sphere                       ← sphere primitive (3D)
bitmaps <count> <num1> <num2> ...        ← bootstrap / chain bitmaps
pixels  <count> 0xRRGGBB 0xRRGGBB ...    ← color bitmaps on the map
bitmap <number>                          ← clone another bitmap's latest build (live link, no transforms)
inscription <name> <script_id>           ← reference a specific script inscription (same syntax)
script <name>                            ← execute referenced script (no modifiers allowed)
```

### Toolbar Quick Reference

Listed left-to-right in the actual topnav order:

| Button | Purpose |
|---|---|
| **fetch** | Start/stop downloading onchain data |
| **flat** | Toggle top-down 2D map view |
| **script** | Open/close the script editor (shortcut: **G**) |
| **teleport** | Open the Teleport window (shortcut: **T**) |
| **ban** | Open the Ban List window |
| **canvas** (icon) | Toggle fullscreen / movable window |
| **help** | Open help overlay (shortcut: **H**) |
| **settings** (icon) | Open Performance / Camera / Atmosphere / DMT / Network sliders (shortcut: **R**) |
| **pin** (thumbtack) | Pin toolbar visible / auto-hide |

### Script Editor Quick Reference

| Element | Purpose |
|---|---|
| **Tab bar** | Switch between scripts; double-click to rename; drag to reorder |
| **+ (tab bar)** | Create new tab with the v0.0.13 starter template (when the `#` field is empty) |
| **`#` (tab bar)** | Type a bitmap number + Enter to create a tab pre-loaded with that bitmap's onchain script and teleport the camera to it |
| **Double-click bitmap** (desktop) | Fetch onchain script into a new tab (mouse-only; on mobile use the `#` input or Teleport) |
| **+** (toolbar) | Duplicate selected object |
| **delete** | Remove selected object from script |
| **pen** (color picker) | Pick color for primitives |
| **settings** (gear) | Open syntax highlighting palette |
| **wrap** | Toggle word-wrap on the editor + syntax overlay |
| **save** | Download `.bss` source |
| **export** | Compile + download `.bmp` inscription artifact |
| **recycle** | Reset to the starter template |
| **trash** | Hide the current tab (with confirmation); same effect as **X**: the tab remains in the overflow dropdown. Known issue: should permanently delete but currently only hides |
| **close** | Close the editor panel |
| **Status bar** | Shows error count and caret position (Ln N, Col M) |
| **Click error** | Jump cursor to error location in script |

### Keyboard shortcuts (desktop)

| Key | Action |
|---|---|
| **WASD / Arrows** | Move camera (free) or character (TPS) |
| **Left-click drag** | Look around / orbit |
| **Scroll wheel** | Speed (free) / player size (TPS) |
| **Shift + wheel** | Camera distance (TPS) |
| **Space** | Thrust upward (TPS) |
| **E** | Toggle Free / TPS camera |
| **C** | Toggle orbit mode |
| **G** | Open/close the script editor |
| **T** | Open the Teleport window |
| **R** | Settings |
| **H** | Help |
| **B** | Debug window |
| **F** | Toggle fullscreen |
| **Escape** | Cancel active gizmo drag (reverts transforms) / blur focused input |
| **Shift + left-click drag** | Paint bitmaps with the pen color (editor open) |
| **Ctrl + left-click drag** | Erase paint from bitmaps (editor open) |
| **Double-click bitmap** | Fetch its onchain script into a new tab (editor open) |

### Mobile gestures

| Gesture | Action |
|---|---|
| **Left-half drag** | On-screen joystick (WASD equivalent) |
| **Right-half drag** | Look around |
| **Two consecutive two-finger taps** (within 500 ms) | Toggle orbit mode (same as **C** on desktop) |
| **Double-tap** | Toggle Free / TPS camera (same as **E** on desktop) |
| **Pinch** | Zoom / adjust speed |

To fetch an onchain script on mobile, use the Teleport window (**T**) or type a bitmap number into the `#` input on the script editor's tab bar. The desktop double-click-to-fetch gesture has no touch equivalent.

### Inscription Cheat Sheet

| What | Parent | File |
|---|---|---|
| Build on your bitmap | Inscription ID of your bitmap | Exported `.bmp` |
| Bootstrap from your OG sunset | Inscription ID of your OG sunset (0–99) | Exported `.bmp` |
| Update an existing build | Same parent as before (bitmap or sunset) | New `.bmp` (newest child wins) |
| Cross-bitmap painting (affect other bitmaps) | Inscription ID of your own bitmap | Exported `.bmp` (use cross-bitmap commands like `pixels`, `mosaic`) |

---

## 20. Glossary

| Term | Meaning |
|---|---|
| **bitmap** | A Bitcoin block claimed as an ordinal under the bitmap protocol. One bitmap = one tile in the 3D world. |
| **sunset** | A BitmapSunset collection inscription (0–99 OG, 100–599 extended, 600+ expansion). |
| **OG sunset** | BitmapSunset 0–99. Owns a billboard in the central map cell and carries bootstrapping authority. Future evolution: cubitmap. |
| **billboard** | A vertical image surface positioned over a 100×100 bitmap patch. Currently placed for OG sunsets only. |
| **mosaic** | A flat image stamped on the ground plane at map-space coordinates (image or SVG; not HTML). |
| **cubitmap** *(planned)* | Giant floating 3D structure that OG billboards will evolve into, with parceling and building on all sides. |
| **BSS / script** | BitmapSunset Script, the text source you write, compiled into binary and inscribed as a BMP. |
| **inscription (keyword)** | The BSS declaration `inscription <name> <hash>` that registers an ordinal inscription under a short name for later use via `quad <name>`, `model <name>`, `billboard <name>`, etc. |
| **bind** | Binary opcode that links a named inscription to an object. In text, use the direct-argument form instead (`model <name>`, `quad <name>`, etc.). |
| **inscription** | Arbitrary data attached to a single satoshi on the Bitcoin blockchain via the Ordinals protocol. |
| **parent / child** | Ordinals parent-child relationship. A BitmapSunset build script is inscribed as a child of a bitmap or sunset inscription. |
| **recursive endpoint** | `/r/...` URL on an ordinals content server that lets inscriptions load each other's content at runtime. |
| **Bitmap Boot** | Execution path for a script inscribed as a child of a bitmap. Parent sets the target tile. |
| **Sunrise Boot** | Execution path for a script inscribed as a child of a sunset. Parent sets the billboard and bootstrap queue. |
| **flat mode** | Top-down 2D view of the map, useful for seeing `pixels` / `mosaic` placement. |
| **cross-bitmap painting** | The default cross-bitmap rendering model: every builder's cross-bitmap commands are visible to every viewer. An onchain pixel war played across the whole map. |
| **bootstrapping** | OG-sunset-controlled priority loading. `bitmaps` commands inside a sunset script queue those bitmaps for Phase 1 loading. |
| **multiverse architecture** | The cross-chain tiling framework where Bitcoin's root cell is surrounded by 8 reserved positions for additional blockchain landscapes. Architectural term only; no in-app toggle carries this name in v0.0.13. |
| **round-trip** | The editor pipeline: source → binary → BMP → binary → source. A green console means the export is deterministic and onchain-safe. |
| **OCI (On-Chain Index)** | On-chain index maintained by [@boppleton](https://x.com/boppleton), mapping bitmap numbers to satoshi IDs, covering ~942k bitmaps. |
| **round-trip / fuzzer** | Editor-side and build-side validation layers that catch malformed inputs before they reach either the onchain BMP or the live VM. |