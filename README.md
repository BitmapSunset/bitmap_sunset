<h1 align="center">🟧 Bitmap Sunset 🌇 <br> Exploring the Bitcoin Multiverse<br></h1>

<p align="center">
  <a href="https://ordinals.com/content/42d68f827add0681426a541d861293e24db5f8928b042c4dd5a83704fc2aa8cfi0"><img src="https://img.shields.io/badge/🚀_Launch_App-v0.0.11-orange?style=for-the-badge" alt="Launch BitmapSunset"/></a>
  <a href="https://magiceden.io/ordinals/marketplace/bitmapsunset"><img src="https://img.shields.io/badge/🛒_Support_on-Magic_Eden-purple?style=for-the-badge" alt="Magic Eden Marketplace"/></a>
  <a href="https://x.com/i/chat/group_join/g1998381136075002019/OS4j4rmw6E"><img src="https://img.shields.io/badge/💬_Join_Chat-X-black?style=for-the-badge" alt="Join X Chat"/></a>
</p>

<div align="center">
<a href="nfts/pics/bitmap_599.png"><img src="nfts/pics/bitmap_599.png" width="92%"/></a>
</div>

<br>

<!--------------------------------------------------------------------------------------------------------------------------->
<!--------------------------------------------------------------------------------------------------------------------------->
<!--------------------------------------------------------------------------------------------------------------------------->
##
<details>
<summary><strong>1. Abstract</strong></summary>
  
BitmapSunset is a fully onchain 3D metaverse application built on Bitcoin Ordinals. It transforms the entire Bitcoin blockchain into a navigable three-dimensional landscape, where each of the over 900,000 mined Bitcoin blocks is represented as a discrete tile in a persistent, shared world. Bitmap owners can inscribe scripts onto their blocks to place 3D models, images, geometric primitives, and other visual content into this world, creating permanent, censorship-resistant builds that are visible to all users.

The application runs entirely in the browser, reads data exclusively from the Bitcoin blockchain via ordinals recursive endpoints, and requires no wallet connection, no proprietary server infrastructure, and no user accounts. Everything that exists in the BitmapSunset world is a Bitcoin inscription. The application itself is a Bitcoin inscription. While the application requires no servers of its own, it depends on ordinals content servers to deliver inscription data — the same decentralized infrastructure that serves all ordinals applications.

This white paper describes the architecture, scripting system, tokenomics, bootstrapping mechanism, security model, and future direction of BitmapSunset.

</details>

<!--------------------------------------------------------------------------------------------------------------------------->
<!--------------------------------------------------------------------------------------------------------------------------->
<!--------------------------------------------------------------------------------------------------------------------------->
##
<details>
<summary><strong>2. Introduction</strong></summary>

### The Problem

The concept of a digital metaverse has been explored extensively, yet existing implementations share common limitations: centralized infrastructure, mutable state controlled by platform operators, dependency on external servers, and the impermanence of digital assets. When a centralized metaverse platform shuts down, the worlds built within it disappear. Users own nothing; they rent access to someone else's servers.

The Bitcoin Ordinals protocol introduced a paradigm shift by enabling arbitrary data to be inscribed directly onto the Bitcoin blockchain. The Bitmap protocol extended this by assigning each Bitcoin block a unique digital identity, claimable as an ordinal inscription. Together, these innovations created the raw material for a new kind of metaverse: one where both the land and the structures built upon it exist as permanent, immutable Bitcoin inscriptions.

### The Vision

BitmapSunset realizes this potential. It is a 3D world engine that interprets the Bitcoin blockchain as terrain and ordinal inscriptions as building instructions. Every bitmap block becomes a buildable tile. Every script inscription becomes a permanent structure. The result is a shared, persistent, permissionless metaverse where ownership is enforced by Bitcoin's consensus mechanism and content is stored on the most secure and decentralized ledger in existence.

The project has been in continuous development for over two years, representing a sustained, independent engineering effort to create a genuinely decentralized spatial computing platform on Bitcoin.

</details>

<!--------------------------------------------------------------------------------------------------------------------------->
<!--------------------------------------------------------------------------------------------------------------------------->
<!--------------------------------------------------------------------------------------------------------------------------->
##
<details>
<summary><strong>3. Foundational Concepts</strong></summary>

### Bitcoin Ordinals

Bitcoin Ordinals is a protocol that assigns a unique serial number to each individual satoshi, allowing arbitrary data to be attached to it as an inscription. Inscriptions are stored in Bitcoin's witness data and are propagated, validated, and stored by every full node on the network. This makes inscriptions permanent, censorship-resistant, and verifiable without reliance on any external infrastructure.

### Bitmap

Bitmap is a metaprotocol built on Ordinals that maps each Bitcoin block to a unique digital asset. A bitmap is claimed by inscribing a specific pattern that references a block number. Once claimed, a bitmap functions as a deed to a specific tile in the BitmapSunset world. There are as many bitmaps as there are mined Bitcoin blocks, currently exceeding 900,000.

### Parent-Child Inscriptions

The Ordinals protocol supports parent-child relationships between inscriptions. A child inscription references a parent, establishing a verifiable ownership chain. BitmapSunset uses this mechanism to link build scripts to bitmaps: a script inscribed as a child of a bitmap is interpreted as the building instructions for that bitmap's tile in the 3D world. Only the bitmap owner can inscribe children on their own bitmap, enforcing property rights at the protocol level.

### Recursive Endpoints

Ordinals recursive endpoints allow inscriptions to reference and load the content of other inscriptions by their ID. BitmapSunset uses recursive endpoints to fetch script data, 3D models, images, and other assets at runtime. This means the entire application, including all user-generated content, operates within the ordinals sandbox without requiring any proprietary API calls or dedicated server infrastructure.

</details>

<!--------------------------------------------------------------------------------------------------------------------------->
<!--------------------------------------------------------------------------------------------------------------------------->
<!--------------------------------------------------------------------------------------------------------------------------->
##
<details>
<summary><strong>4. System Architecture</strong></summary>

### Application Delivery

BitmapSunset is itself an ordinal inscription. The application code, including the 3D rendering engine, script compiler, virtual machine, and user interface, is inscribed on the Bitcoin blockchain. Users access it by navigating to the inscription's content URL on any ordinals-compatible content server. This eliminates single points of failure in application delivery: as long as the Bitcoin network operates and ordinals content servers exist, BitmapSunset is accessible.

### Rendering Engine

The rendering engine is a custom-built WebGL-based 3D graphics pipeline written in TypeScript, without reliance on third-party frameworks. This architectural decision was made to achieve full control over the rendering stack, which is essential for displaying a massive world composed of over 900,000 discrete tiles, each potentially containing user-generated 3D content.

The world layout follows the ordinalswallet bitmap map convention, arranging all Bitcoin blocks in a 1000-column grid. The engine renders this grid with configurable mirror reflections at the boundaries, creating the visual impression of an infinite, seamless landscape extending in all directions.

### Script Compiler and Virtual Machine

User-authored scripts are written in the BitmapSunset Script language (BSS), a domain-specific text format designed for compactness. The compiler parses BSS source text, validates syntax and semantics, and emits a compact binary representation. This binary is encoded into a BMP image file for inscription. The choice of the BMP format is no coincidence: scripts for bitmap, stored as bitmaps. Every inscribed script appears as a visible image on ordinals explorers, turning each new inscription into a recognizable visual signature that sparks curiosity and draws attention to the application.

At runtime, the virtual machine decodes BMP inscriptions back into binary, then interprets the instruction stream to instantiate 3D objects, apply transforms, set colors, and execute referenced subscripts.

</details>

<!--------------------------------------------------------------------------------------------------------------------------->
<!--------------------------------------------------------------------------------------------------------------------------->
<!--------------------------------------------------------------------------------------------------------------------------->
##
<details>
<summary><strong>5. The BitmapSunset Script Language</strong></summary>

BSS is a declarative, line-oriented scripting language purpose-built for describing 3D scenes within the constraints of onchain storage. Every script begins with a version header for backward compatibility, followed by resource declarations, transform chains, and rendering commands.

### Script Structure

| Component | Description |
|---|---|
| **Version Header** | `BSS 0 0 11` — Required first line. Identifies the script version for backward compatibility. |
| **Resource Slots** | `resource <slot> <inscription_id>` — Registers an inscription (model, image, or script) into a numbered slot for reuse. |
| **Bind Commands** | `bind <slot> [transforms] <type>` — Instantiates a resource as a 3D object. Types: model, quad, billboard, mosaic, script. |
| **Transforms** | `scale X Y Z`, `translate X Y Z`, `rotate Rx Ry Rz` — Applied in sequence to position and orient objects. |
| **Primitives** | `sphere`, `cube`, `cone`, `circle`, `triangle`, `squpyr`, `tripyr` — Built-in geometric shapes requiring no inscription. |
| **Coloring** | `color <hex>`, `bitmaps <count> <ids>`, `pixels <count> <colors>` — Colors bitmap tiles on the map. |

### Rendering Modes

Objects can be rendered in solid mode (filled, opaque surfaces) or wire mode (wireframe outlines). Both modes can be applied simultaneously to the same object, which is useful for visualization during editing. The rendering mode is specified as a keyword in the bind command or after a primitive declaration.

### Composability

BSS supports two powerful mechanisms for cross-referencing content across the world:

- **Script referencing:** A script can load and execute another script inscription using `bind <slot> script`. The referenced script runs with full transform support, enabling code reuse, collaborative building, and modular scene composition.

- **Bitmap cloning:** The `bitmap <number>` command creates a live link to another bitmap's most recent build. When the source bitmap is updated, all clones automatically reflect the change, enabling efficient multi-bitmap deployments from a single source.

### Compilation and Encoding

The BSS compiler performs a multi-stage pipeline: source text is parsed and validated, then emitted as a compact binary instruction stream. This binary is encoded into the pixel data of a BMP image file. The resulting BMP file is the artifact inscribed onto the blockchain. At runtime, the process reverses: the BMP is decoded, the binary is extracted, and the virtual machine executes the instructions. A full round-trip verification ensures encoding integrity before export.

</details>

<!--------------------------------------------------------------------------------------------------------------------------->
<!--------------------------------------------------------------------------------------------------------------------------->
<!--------------------------------------------------------------------------------------------------------------------------->
##
<details>
<summary><strong>6. The BitmapSunset Collection</strong></summary>

### Overview

The BitmapSunset collection consists of 600 unique ordinal inscriptions, numbered 0 through 599. Each BitmapSunset is a piece of generative art: a screenshot captured during the development process of the application, documenting the evolving visual state of the 3D world engine. These images were collected organically over the course of development, making each one a historical artifact of the project's progression.

<div align="center">
<a href="nfts/bitmap_sunset.png"><img src="nfts/bitmap_sunset.png" width="92%"/></a>
</div>

### Utility

BitmapSunset holders receive concrete in-application utility:

- **Billboard control:** Each OG BitmapSunset (0–99) corresponds to a billboard structure positioned over a 100x100 bitmap patch in the 3D world. Holders can replace the default sunset image with any inscription of their choosing and rule over their patch, creating a persistent, high-visibility display space.

- **Bootstrapping authority:** OG sunset holders (0–99) can inscribe scripts on their sunsets that specify which bitmaps should be loaded first when any user opens the application. This priority loading mechanism gives sunset holders the ability to curate the initial user experience. Holders can promote multiple bitmaps and even lend or monetize bootstrap slots by including other bitmap owners in their loading queue. Bootstrap support for sunsets 100–599 is planned for v0.0.12.

- **Mosaic placement:** Sunset scripts can stamp images flat on the ground plane at specific coordinates, enabling ground-level art, territorial markers, and large-scale visual compositions visible from altitude.

### Collection Tiers

| Range | Trait | Description |
|---|---|---|
| **0–99** | OG | Original founder sunsets. Billboards positioned over 100x100 bitmap patches in the central map cell. First to load, highest visibility. Bootstrapping authority active. Future evolution into floating islands with parceling and building capabilities. |
| **100–599** | Mirror | Extended collection. Billboard placement and bootstrapping authority planned for v0.0.12. |

The collection is available on Magic Eden for secondary trading. Expansion to 1,000 items is planned, with future sunsets potentially covering additional blockchain landscapes within the multiverse framework.

</details>

<!--------------------------------------------------------------------------------------------------------------------------->
<!--------------------------------------------------------------------------------------------------------------------------->
<!--------------------------------------------------------------------------------------------------------------------------->
##
<details>
<summary><strong>7. Bootstrapping and Caching</strong></summary>

### The Discovery Problem

With over 900,000 bitmaps in existence, the application faces a fundamental discovery challenge: it cannot know which bitmaps contain builds without querying each one individually. Sequential scanning from block 0 to the chain tip is impractical for initial load times. A mechanism is needed to prioritize the most active and curated content.

### Solution Architecture

Bootstrapping solves this through a hierarchical priority loading system:

1. **Phase 1:** The application fetches OG BitmapSunset scripts (sunsets 0–99), ordered by sunset number. These scripts contain `bitmaps` commands that identify which bitmaps should be loaded.

2. **Phase 2:** Border-land bitmaps (0–999) are fetched, as these occupy the visible edges of the initial viewport.

3. **Phase 3:** Sequential fetching proceeds from bitmap 1000 upward through the entire chain.

Critically, bootstrapped bitmaps can themselves reference additional bitmaps, creating a chaining effect. A single sunset can bootstrap a network of builds through transitive references. This gives sunset holders significant curatorial power over the world's initial presentation without requiring any centralized coordination.

Even without a sunset or a low-number bitmap, any user of the application can highlight a bitmap with the mouse cursor and force it to be loaded on demand, ensuring that no build is permanently hidden.

> **Note:** Bootstrap support for sunsets 100–599 is planned for v0.0.12. Once enabled, Phase 1 will expand to include all 600 sunsets, extending priority loading authority to the full collection.

### Local Caching and Continuous Synchronization

As the world grows, re-downloading all bitmap data on every session becomes impractical. A planned local cache will store fetched scripts and world data on the user's device, allowing the application to launch almost instantly by rendering from cached state rather than streaming everything from scratch.

However, the world is not static. Builders continuously inscribe new scripts and update existing ones. The bootstrapping mechanism serves a dual purpose here: beyond initial discovery, it provides the backbone for continuous synchronization. On each session, the application will walk the bootstrap sequence and compare timestamps against cached data, detecting which bitmaps have been updated since the last visit. Only changed scripts are re-fetched, while the rest of the world loads from local storage. This means that even once all 900,000+ bitmaps have been cached, a lightweight polling process will keep running in the background to ensure the world stays current — new builds appear, updated scripts replace old ones, and the local cache gradually converges on the live state of the blockchain.

### Economic Implications

Bootstrapping creates a natural value hierarchy. OG BitmapSunset holders and low-number bitmap owners have guaranteed early visibility. High-number bitmap owners can gain visibility through relationships with sunset holders, creating organic economic incentives around curation, promotion, and collaborative building. Sunset holders can monetize bootstrap slots by lending priority positions in their loading queue to other bitmap owners.

</details>

<!--------------------------------------------------------------------------------------------------------------------------->
<!--------------------------------------------------------------------------------------------------------------------------->
<!--------------------------------------------------------------------------------------------------------------------------->
##
<details>
<summary><strong>8. Block War</strong></summary>

### Concept

Block War is the default multiverse mode in BitmapSunset, transforming it into a shared, competitive canvas. In Block War mode, the application renders cross-bitmap commands from all loaded scripts, meaning that builders can visually affect bitmaps they do not own. Switching to Bitmap mode enforces property rights: each bitmap displays only the scripts inscribed by its owner.

Think of it as a shared canvas layered on top of the standard world — players can enhance each other's builds, place graffiti, or wage territorial pixel wars.

### Mechanics

Block War leverages the `bitmaps`, `pixels`, and `mosaic` commands to enable cross-bitmap interaction. From your own bitmap's script, you can target any other bitmap on the map. Switching to Bitmap mode restricts rendering so that only the owner's commands take effect on their tile. Block War mode reveals the full competitive layer: every loaded script's cross-bitmap commands become visible.

The same script commands used for normal building apply in Block War. The difference is scope: a builder's `pixels` command can paint bitmaps they do not own, their `mosaic` command can stamp images on foreign ground, and their 3D structures can occupy contested territory.

### Strategic Dimensions

- **Territorial control:** Players use the `pixels` command to paint bitmaps in faction colors across large swaths of the map, visible to all Block War participants.

- **Visual occupation:** The `mosaic` command allows players to stamp logos, flags, or images on the ground plane of contested bitmaps.

- **Structural presence:** 3D models and primitive shapes can be placed to create visible landmarks and territorial markers.

- **Script stacking:** Multiple Block War scripts can accumulate effects on a single bitmap, creating collaboratively or competitively layered scenes.

All Block War inscriptions are permanent. They persist on the blockchain indefinitely, creating an immutable record of territorial contests and collaborative builds.

</details>

<!--------------------------------------------------------------------------------------------------------------------------->
<!--------------------------------------------------------------------------------------------------------------------------->
<!--------------------------------------------------------------------------------------------------------------------------->
##
<details>
<summary><strong>9. Security Model</strong></summary>

BitmapSunset was designed with the goal of reducing trust requirements wherever possible. Every architectural decision, from building a custom rendering engine to avoiding third-party JavaScript dependencies, was made to minimize the attack surface and eliminate the need for users to trust anything beyond the Bitcoin blockchain itself.

### No External Trust Requirements

- **No wallet connection:** The application never requests wallet credentials, private keys, recovery phrases, or transaction signatures.

- **No external links:** The application does not navigate to external websites or load resources from outside the ordinals sandbox.

- **No software installation:** No browser extensions, downloads, or additional software are required.

- **No user accounts:** There is no identity system, login mechanism, or personal data collection.

### Verification

Users are encouraged to verify the BitmapSunset inscription ID through the official @BitmapSunset X account before using the application. The application version is displayed in the settings panel for confirmation. Recommended security practices include using a dedicated browser profile, a virtual machine, or private browsing mode without wallet extensions installed.

</details>

<!--------------------------------------------------------------------------------------------------------------------------->
<!--------------------------------------------------------------------------------------------------------------------------->
<!--------------------------------------------------------------------------------------------------------------------------->
##
<details>
<summary><strong>10. The Multiverse Architecture</strong></summary>

### Mirror System

BitmapSunset's rendering engine uses a two-level mirror system that serves both as a visual seamlessness technique and as the structural foundation for a cross-chain multiverse.

At the first level, each blockchain is rendered as a **9-cell patch**: one root cell containing the actual blockchain data, surrounded by 8 mirror cells. The mirror cells are symmetrically reflected copies of the root — mirrored on the X axis, the Z axis, or both — eliminating visible seams at every boundary. From the ground, the mirroring is imperceptible: a user flying across the landscape sees a continuous, infinite-looking world rather than a tiled grid with hard edges. The number of mirror cells rendered is configurable (0–7) as a performance setting.

### From Mirrors to Multiverse

The same 1+8 spatial pattern repeats at a higher level to form the multiverse. Bitcoin's 9-cell patch (root + 8 mirrors) occupies the center position. Eight surrounding positions, each itself a 9-cell patch (root + 8 mirrors), are reserved for additional blockchain landscapes. The architecture is recursive: the same structure used to make a single blockchain seamless is reused to tile multiple blockchains into a unified navigable world.

In the current release, only the Bitcoin blockchain is displayed. The surrounding blockchain positions are not yet populated. The mirror cells function purely as seamless world extension, creating the visual impression of an infinite Bitcoin landscape. When cross-chain support is added, each surrounding position would render a different blockchain's map protocol (such as .dogemap or other .\*map equivalents), with its own root cell and its own 8 mirrors.

### Navigation and Spawn

Users spawn in the center of the Bitcoin root cell — the primary, non-mirrored representation of the blockchain. This is where the OG BitmapSunset billboards (0–99) are positioned, ensuring they are the first structures visible to every user. Flying outward, a user crosses into Bitcoin's mirror cells, then eventually into the territory of neighboring blockchain patches. Each blockchain's root cell contains its own unique content; its surrounding mirrors reflect that content seamlessly.

### Design Principles

This design preserves Bitcoin's primacy: it occupies the center, loads first, and is the default experience. Other blockchains are accessible but peripheral, reflecting Bitcoin's position as the foundational layer. Mirror sunsets (100–599) are planned for billboard placement on the mirror cells that border neighboring blockchain patches, giving them visibility at the crossroads between chains while keeping the OG billboards in the most prominent central position.

</details>

<!--------------------------------------------------------------------------------------------------------------------------->
<!--------------------------------------------------------------------------------------------------------------------------->
<!--------------------------------------------------------------------------------------------------------------------------->
##
<details>
<summary><strong>11. Development Roadmap</strong></summary>

### v0.0.12 — Next Release

- **Rotating camera** mode for cinematic orbital viewing around bitmaps and builds.
- **Reinscription support** as a lower-cost alternative to parent-child inscriptions for updating bitmap scripts, enabling sub-1-sat inscription fees.
- **Bootstrap support for sunsets 100–599**, extending priority loading authority to the full Mirror collection.
- **Rendering improvements** across all mirror maps and high-number bitmaps.

### BSS Language Evolution

- **New shape primitives:** text, cylinder, and tube opcodes.
- **Texture on shapes:** ability to apply inscription textures to primitive shapes, not just quads and models.
- **Push/pop transform stack:** opcodes for hierarchical transforms, enabling grouped object positioning.
- **Script comments:** support for inline comments, line information, and formatting.
- **Loop and control flow:** iteration and conditional logic, evolving BSS toward a full virtual machine with program counter and execution context.
- **BSS language specification** published on GitHub, enabling AI-assisted vibe coding where language models can generate valid BitmapSunset scripts from natural language descriptions.
- **Official bitmap color/image format** support for the emerging bitmap protocol standard.

### Editor and User Experience

- **Bitmap directory and teleportation:** a pre-fetched gallery of all bitmaps that contain builds, allowing users to click and teleport directly to active builds.
- **BMP import:** the ability to extract the original script text from a previously inscribed BMP file, enabling script recovery and inspection.
- **Asset library window:** an in-editor browser for selecting inscription resources.
- **Enhanced script error reporting** with interactive input, clickable error navigation, verbose logging, and configurable log limits.
- **Camera sensitivity controls:** rotation speed setting and smoother auto-rotation transitions.
- **Mobile support:** touch controls, free camera for mobile, and performance configuration presets for mobile devices.

### World and Gameplay

- **Floating islands:** OG billboards (0–99) will be transformed into giant cubic bitmaps — 3D structures where holders can display images on all sides and build on top. These floating islands will feature parceling, enabling subdivided building within a sunset holder's domain. Each floating island could host its own lobby area.
- **Billboard placement for Mirror sunsets** (100–599): dedicated 2D billboard positions on mirror cells bordering neighboring blockchain patches, complementary to but distinct from OG floating islands.
- **Parceling system:** individual bitmaps will be subdividable, allowing builders to work at finer spatial resolution within a single tile. Support for Bitmon parcels planned first, followed by inscribing additional parcel data onchain.
- **Playable characters and avatars:** BRC-420 avatar integration at human scale, with skeletal animation (skinning) support for animated characters.
- **Third-person camera:** a camera mode that follows avatars, enabling cinematic exploration of bitmap creations.
- **Interactive inscription display:** rendering other ordinal inscriptions as interactive screens on quads and billboards, allowing HTML inscriptions, videos, and other onchain applications to be displayed and interacted with inside the 3D world. This would enable portals between BitmapSunset and other ordinals applications.
- **GLSL billboards:** shader-based dynamic billboards for more expressive visual content.
- **Collection expansion** to 1,000 BitmapSunset items.

### Performance and Streaming

- **Reduce shape vertex count** for lighter inscriptions and better rendering performance.
- **Default model scale normalization** so that imported GLTF models appear at a reasonable size without requiring manual scale adjustments.
- **Streaming controls:** user-configurable fetch frequency and resource consumption visibility.
- **Rune-based priority ranking** for bitmap loading, leveraging the `/r/utxo` recursive endpoint to weight loading order by rune holdings.

### Rendering

- **Order-independent transparency (OIT)** for correct alpha blending of overlapping transparent surfaces.
- **Multiple light sources** and physically-based rendering (PBR) for more realistic scene illumination.
- **Virtual texturing** and model instancing for large-scale world rendering.
- **Depth buffer precision improvements** for reducing visual artifacts at distance.

### Long-Term Vision

- **Physics engine** to enable interaction with the world: collision detection, gravity, and drivable vehicles including the puppet kart.
- **Networking and multiplayer** so that users can see each other's avatars in real time, transforming BitmapSunset from a single-player exploration tool into a shared social space.
- **Spatial indexing** for models, enabling efficient collision queries and proximity-based interactions at scale.
- **Cross-chain multiverse rendering** with support for additional blockchain landscapes displayed in surrounding 9-cell patches alongside Bitcoin's central patch. Each blockchain rendered as its own root cell with 8 mirrors, navigable by flying across patch boundaries.
- **Progressive open-sourcing** of the full codebase to enable community-driven development and scaling beyond a solo developer effort.
- **Minecraft-style terrain and sandbox features** that were prototyped in early development and set aside for the onchain release, planned for reintroduction.
- **Onchain builder rankings** to surface and reward the most active and creative builders in the world.

</details>

<!--------------------------------------------------------------------------------------------------------------------------->
<!--------------------------------------------------------------------------------------------------------------------------->
<!--------------------------------------------------------------------------------------------------------------------------->
##
<details>
<summary><strong>12. Conclusion</strong></summary>

BitmapSunset represents a fundamentally different approach to digital world-building. It does not ask users to trust a company, depend on a server, or hope that a platform will continue to exist. Every component of the system, from the application itself to the land it renders to the structures built upon it, exists as a permanent Bitcoin inscription.

The project demonstrates that a functional, interactive, visually rich 3D metaverse can operate entirely onchain, within the constraints of the ordinals sandbox, and without any centralized infrastructure. The BSS scripting language provides a purpose-built tool for spatial expression on Bitcoin. The bootstrapping system creates a decentralized curation mechanism. Block War introduces competitive social dynamics that emerge naturally from the permissionless nature of the protocol.

Bitcoin is the most secure, decentralized, and enduring digital infrastructure ever created. BitmapSunset builds a world on top of it. Every block that Bitcoin mines adds new land to the map. Every inscription adds new content to the world. The result is a metaverse that grows with Bitcoin itself, as permanent and uncensorable as the blockchain that sustains it.

</details>

<!--------------------------------------------------------------------------------------------------------------------------->
<!--------------------------------------------------------------------------------------------------------------------------->
<!--------------------------------------------------------------------------------------------------------------------------->

<br>
<div>
<a href="nfts/pics/bitmap_598.png"><img src="nfts/thumbs/bitmap_598.png" width="15%"/></a>
<a href="nfts/pics/bitmap_597.png"><img src="nfts/thumbs/bitmap_597.png" width="15%"/></a>
<a href="nfts/pics/bitmap_596.png"><img src="nfts/thumbs/bitmap_596.png" width="15%"/></a>
<a href="nfts/pics/bitmap_595.png"><img src="nfts/thumbs/bitmap_595.png" width="15%"/></a>
<a href="nfts/pics/bitmap_594.png"><img src="nfts/thumbs/bitmap_594.png" width="15%"/></a>
<a href="nfts/pics/bitmap_593.png"><img src="nfts/thumbs/bitmap_593.png" width="15%"/></a>
<a href="nfts/pics/bitmap_592.png"><img src="nfts/thumbs/bitmap_592.png" width="15%"/></a>
<a href="nfts/pics/bitmap_591.png"><img src="nfts/thumbs/bitmap_591.png" width="15%"/></a>
<a href="nfts/pics/bitmap_590.png"><img src="nfts/thumbs/bitmap_590.png" width="15%"/></a>
<a href="nfts/pics/bitmap_589.png"><img src="nfts/thumbs/bitmap_589.png" width="15%"/></a>
<a href="nfts/pics/bitmap_588.png"><img src="nfts/thumbs/bitmap_588.png" width="15%"/></a>
<a href="nfts/pics/bitmap_587.png"><img src="nfts/thumbs/bitmap_587.png" width="15%"/></a>
<a href="nfts/pics/bitmap_586.png"><img src="nfts/thumbs/bitmap_586.png" width="15%"/></a>
<a href="nfts/pics/bitmap_585.png"><img src="nfts/thumbs/bitmap_585.png" width="15%"/></a>
<a href="nfts/pics/bitmap_584.png"><img src="nfts/thumbs/bitmap_584.png" width="15%"/></a>
<a href="nfts/pics/bitmap_583.png"><img src="nfts/thumbs/bitmap_583.png" width="15%"/></a>
<a href="nfts/pics/bitmap_582.png"><img src="nfts/thumbs/bitmap_582.png" width="15%"/></a>
<a href="nfts/pics/bitmap_581.png"><img src="nfts/thumbs/bitmap_581.png" width="15%"/></a>
<a href="nfts/pics/bitmap_580.png"><img src="nfts/thumbs/bitmap_580.png" width="15%"/></a>
<a href="nfts/pics/bitmap_579.png"><img src="nfts/thumbs/bitmap_579.png" width="15%"/></a>
<a href="nfts/pics/bitmap_578.png"><img src="nfts/thumbs/bitmap_578.png" width="15%"/></a>
<a href="nfts/pics/bitmap_577.png"><img src="nfts/thumbs/bitmap_577.png" width="15%"/></a>
<a href="nfts/pics/bitmap_576.png"><img src="nfts/thumbs/bitmap_576.png" width="15%"/></a>
<a href="nfts/pics/bitmap_575.png"><img src="nfts/thumbs/bitmap_575.png" width="15%"/></a>
<a href="nfts/pics/bitmap_574.png"><img src="nfts/thumbs/bitmap_574.png" width="15%"/></a>
<a href="nfts/pics/bitmap_573.png"><img src="nfts/thumbs/bitmap_573.png" width="15%"/></a>
<a href="nfts/pics/bitmap_572.png"><img src="nfts/thumbs/bitmap_572.png" width="15%"/></a>
<a href="nfts/pics/bitmap_571.png"><img src="nfts/thumbs/bitmap_571.png" width="15%"/></a>
<a href="nfts/pics/bitmap_570.png"><img src="nfts/thumbs/bitmap_570.png" width="15%"/></a>
<a href="nfts/pics/bitmap_569.png"><img src="nfts/thumbs/bitmap_569.png" width="15%"/></a>
<a href="nfts/pics/bitmap_568.png"><img src="nfts/thumbs/bitmap_568.png" width="15%"/></a>
<a href="nfts/pics/bitmap_567.png"><img src="nfts/thumbs/bitmap_567.png" width="15%"/></a>
<a href="nfts/pics/bitmap_566.png"><img src="nfts/thumbs/bitmap_566.png" width="15%"/></a>
<a href="nfts/pics/bitmap_565.png"><img src="nfts/thumbs/bitmap_565.png" width="15%"/></a>
<a href="nfts/pics/bitmap_564.png"><img src="nfts/thumbs/bitmap_564.png" width="15%"/></a>
<a href="nfts/pics/bitmap_563.png"><img src="nfts/thumbs/bitmap_563.png" width="15%"/></a>
<a href="nfts/pics/bitmap_562.png"><img src="nfts/thumbs/bitmap_562.png" width="15%"/></a>
<a href="nfts/pics/bitmap_561.png"><img src="nfts/thumbs/bitmap_561.png" width="15%"/></a>
<a href="nfts/pics/bitmap_560.png"><img src="nfts/thumbs/bitmap_560.png" width="15%"/></a>
<a href="nfts/pics/bitmap_559.png"><img src="nfts/thumbs/bitmap_559.png" width="15%"/></a>
<a href="nfts/pics/bitmap_558.png"><img src="nfts/thumbs/bitmap_558.png" width="15%"/></a>
<a href="nfts/pics/bitmap_557.png"><img src="nfts/thumbs/bitmap_557.png" width="15%"/></a>
<a href="nfts/pics/bitmap_556.png"><img src="nfts/thumbs/bitmap_556.png" width="15%"/></a>
<a href="nfts/pics/bitmap_555.png"><img src="nfts/thumbs/bitmap_555.png" width="15%"/></a>
<a href="nfts/pics/bitmap_554.png"><img src="nfts/thumbs/bitmap_554.png" width="15%"/></a>
<a href="nfts/pics/bitmap_553.png"><img src="nfts/thumbs/bitmap_553.png" width="15%"/></a>
<a href="nfts/pics/bitmap_552.png"><img src="nfts/thumbs/bitmap_552.png" width="15%"/></a>
<a href="nfts/pics/bitmap_551.png"><img src="nfts/thumbs/bitmap_551.png" width="15%"/></a>
<a href="nfts/pics/bitmap_550.png"><img src="nfts/thumbs/bitmap_550.png" width="15%"/></a>
<a href="nfts/pics/bitmap_549.png"><img src="nfts/thumbs/bitmap_549.png" width="15%"/></a>
<a href="nfts/pics/bitmap_548.png"><img src="nfts/thumbs/bitmap_548.png" width="15%"/></a>
<a href="nfts/pics/bitmap_547.png"><img src="nfts/thumbs/bitmap_547.png" width="15%"/></a>
<a href="nfts/pics/bitmap_546.png"><img src="nfts/thumbs/bitmap_546.png" width="15%"/></a>
<a href="nfts/pics/bitmap_545.png"><img src="nfts/thumbs/bitmap_545.png" width="15%"/></a>
<a href="nfts/pics/bitmap_544.png"><img src="nfts/thumbs/bitmap_544.png" width="15%"/></a>
<a href="nfts/pics/bitmap_543.png"><img src="nfts/thumbs/bitmap_543.png" width="15%"/></a>
<a href="nfts/pics/bitmap_542.png"><img src="nfts/thumbs/bitmap_542.png" width="15%"/></a>
<a href="nfts/pics/bitmap_541.png"><img src="nfts/thumbs/bitmap_541.png" width="15%"/></a>
<a href="nfts/pics/bitmap_540.png"><img src="nfts/thumbs/bitmap_540.png" width="15%"/></a>
<a href="nfts/pics/bitmap_539.png"><img src="nfts/thumbs/bitmap_539.png" width="15%"/></a>
<a href="nfts/pics/bitmap_538.png"><img src="nfts/thumbs/bitmap_538.png" width="15%"/></a>
<a href="nfts/pics/bitmap_537.png"><img src="nfts/thumbs/bitmap_537.png" width="15%"/></a>
<a href="nfts/pics/bitmap_536.png"><img src="nfts/thumbs/bitmap_536.png" width="15%"/></a>
<a href="nfts/pics/bitmap_535.png"><img src="nfts/thumbs/bitmap_535.png" width="15%"/></a>
<a href="nfts/pics/bitmap_534.png"><img src="nfts/thumbs/bitmap_534.png" width="15%"/></a>
<a href="nfts/pics/bitmap_533.png"><img src="nfts/thumbs/bitmap_533.png" width="15%"/></a>
<a href="nfts/pics/bitmap_532.png"><img src="nfts/thumbs/bitmap_532.png" width="15%"/></a>
<a href="nfts/pics/bitmap_531.png"><img src="nfts/thumbs/bitmap_531.png" width="15%"/></a>
<a href="nfts/pics/bitmap_530.png"><img src="nfts/thumbs/bitmap_530.png" width="15%"/></a>
<a href="nfts/pics/bitmap_529.png"><img src="nfts/thumbs/bitmap_529.png" width="15%"/></a>
<a href="nfts/pics/bitmap_528.png"><img src="nfts/thumbs/bitmap_528.png" width="15%"/></a>
<a href="nfts/pics/bitmap_527.png"><img src="nfts/thumbs/bitmap_527.png" width="15%"/></a>
<a href="nfts/pics/bitmap_526.png"><img src="nfts/thumbs/bitmap_526.png" width="15%"/></a>
<a href="nfts/pics/bitmap_525.png"><img src="nfts/thumbs/bitmap_525.png" width="15%"/></a>
<a href="nfts/pics/bitmap_524.png"><img src="nfts/thumbs/bitmap_524.png" width="15%"/></a>
<a href="nfts/pics/bitmap_523.png"><img src="nfts/thumbs/bitmap_523.png" width="15%"/></a>
<a href="nfts/pics/bitmap_522.png"><img src="nfts/thumbs/bitmap_522.png" width="15%"/></a>
<a href="nfts/pics/bitmap_521.png"><img src="nfts/thumbs/bitmap_521.png" width="15%"/></a>
<a href="nfts/pics/bitmap_520.png"><img src="nfts/thumbs/bitmap_520.png" width="15%"/></a>
<a href="nfts/pics/bitmap_519.png"><img src="nfts/thumbs/bitmap_519.png" width="15%"/></a>
<a href="nfts/pics/bitmap_518.png"><img src="nfts/thumbs/bitmap_518.png" width="15%"/></a>
<a href="nfts/pics/bitmap_517.png"><img src="nfts/thumbs/bitmap_517.png" width="15%"/></a>
<a href="nfts/pics/bitmap_516.png"><img src="nfts/thumbs/bitmap_516.png" width="15%"/></a>
<a href="nfts/pics/bitmap_515.png"><img src="nfts/thumbs/bitmap_515.png" width="15%"/></a>
<a href="nfts/pics/bitmap_514.png"><img src="nfts/thumbs/bitmap_514.png" width="15%"/></a>
<a href="nfts/pics/bitmap_513.png"><img src="nfts/thumbs/bitmap_513.png" width="15%"/></a>
<a href="nfts/pics/bitmap_512.png"><img src="nfts/thumbs/bitmap_512.png" width="15%"/></a>
<a href="nfts/pics/bitmap_511.png"><img src="nfts/thumbs/bitmap_511.png" width="15%"/></a>
<a href="nfts/pics/bitmap_510.png"><img src="nfts/thumbs/bitmap_510.png" width="15%"/></a>
<a href="nfts/pics/bitmap_509.png"><img src="nfts/thumbs/bitmap_509.png" width="15%"/></a>
<a href="nfts/pics/bitmap_508.png"><img src="nfts/thumbs/bitmap_508.png" width="15%"/></a>
<a href="nfts/pics/bitmap_507.png"><img src="nfts/thumbs/bitmap_507.png" width="15%"/></a>
<a href="nfts/pics/bitmap_506.png"><img src="nfts/thumbs/bitmap_506.png" width="15%"/></a>
<a href="nfts/pics/bitmap_505.png"><img src="nfts/thumbs/bitmap_505.png" width="15%"/></a>
<a href="nfts/pics/bitmap_504.png"><img src="nfts/thumbs/bitmap_504.png" width="15%"/></a>
<a href="nfts/pics/bitmap_503.png"><img src="nfts/thumbs/bitmap_503.png" width="15%"/></a>
<a href="nfts/pics/bitmap_502.png"><img src="nfts/thumbs/bitmap_502.png" width="15%"/></a>
<a href="nfts/pics/bitmap_501.png"><img src="nfts/thumbs/bitmap_501.png" width="15%"/></a>
<a href="nfts/pics/bitmap_500.png"><img src="nfts/thumbs/bitmap_500.png" width="15%"/></a>
<a href="nfts/pics/bitmap_499.png"><img src="nfts/thumbs/bitmap_499.png" width="15%"/></a>
<a href="nfts/pics/bitmap_498.png"><img src="nfts/thumbs/bitmap_498.png" width="15%"/></a>
<a href="nfts/pics/bitmap_497.png"><img src="nfts/thumbs/bitmap_497.png" width="15%"/></a>
<a href="nfts/pics/bitmap_496.png"><img src="nfts/thumbs/bitmap_496.png" width="15%"/></a>
<a href="nfts/pics/bitmap_495.png"><img src="nfts/thumbs/bitmap_495.png" width="15%"/></a>
<a href="nfts/pics/bitmap_494.png"><img src="nfts/thumbs/bitmap_494.png" width="15%"/></a>
<a href="nfts/pics/bitmap_493.png"><img src="nfts/thumbs/bitmap_493.png" width="15%"/></a>
<a href="nfts/pics/bitmap_492.png"><img src="nfts/thumbs/bitmap_492.png" width="15%"/></a>
<a href="nfts/pics/bitmap_491.png"><img src="nfts/thumbs/bitmap_491.png" width="15%"/></a>
<a href="nfts/pics/bitmap_490.png"><img src="nfts/thumbs/bitmap_490.png" width="15%"/></a>
<a href="nfts/pics/bitmap_489.png"><img src="nfts/thumbs/bitmap_489.png" width="15%"/></a>
<a href="nfts/pics/bitmap_488.png"><img src="nfts/thumbs/bitmap_488.png" width="15%"/></a>
<a href="nfts/pics/bitmap_487.png"><img src="nfts/thumbs/bitmap_487.png" width="15%"/></a>
<a href="nfts/pics/bitmap_486.png"><img src="nfts/thumbs/bitmap_486.png" width="15%"/></a>
<a href="nfts/pics/bitmap_485.png"><img src="nfts/thumbs/bitmap_485.png" width="15%"/></a>
<a href="nfts/pics/bitmap_484.png"><img src="nfts/thumbs/bitmap_484.png" width="15%"/></a>
<a href="nfts/pics/bitmap_483.png"><img src="nfts/thumbs/bitmap_483.png" width="15%"/></a>
<a href="nfts/pics/bitmap_482.png"><img src="nfts/thumbs/bitmap_482.png" width="15%"/></a>
<a href="nfts/pics/bitmap_481.png"><img src="nfts/thumbs/bitmap_481.png" width="15%"/></a>
<a href="nfts/pics/bitmap_480.png"><img src="nfts/thumbs/bitmap_480.png" width="15%"/></a>
<a href="nfts/pics/bitmap_479.png"><img src="nfts/thumbs/bitmap_479.png" width="15%"/></a>
<a href="nfts/pics/bitmap_478.png"><img src="nfts/thumbs/bitmap_478.png" width="15%"/></a>
<a href="nfts/pics/bitmap_477.png"><img src="nfts/thumbs/bitmap_477.png" width="15%"/></a>
<a href="nfts/pics/bitmap_476.png"><img src="nfts/thumbs/bitmap_476.png" width="15%"/></a>
<a href="nfts/pics/bitmap_475.png"><img src="nfts/thumbs/bitmap_475.png" width="15%"/></a>
<a href="nfts/pics/bitmap_474.png"><img src="nfts/thumbs/bitmap_474.png" width="15%"/></a>
<a href="nfts/pics/bitmap_473.png"><img src="nfts/thumbs/bitmap_473.png" width="15%"/></a>
<a href="nfts/pics/bitmap_472.png"><img src="nfts/thumbs/bitmap_472.png" width="15%"/></a>
<a href="nfts/pics/bitmap_471.png"><img src="nfts/thumbs/bitmap_471.png" width="15%"/></a>
<a href="nfts/pics/bitmap_470.png"><img src="nfts/thumbs/bitmap_470.png" width="15%"/></a>
<a href="nfts/pics/bitmap_469.png"><img src="nfts/thumbs/bitmap_469.png" width="15%"/></a>
<a href="nfts/pics/bitmap_468.png"><img src="nfts/thumbs/bitmap_468.png" width="15%"/></a>
<a href="nfts/pics/bitmap_467.png"><img src="nfts/thumbs/bitmap_467.png" width="15%"/></a>
<a href="nfts/pics/bitmap_466.png"><img src="nfts/thumbs/bitmap_466.png" width="15%"/></a>
<a href="nfts/pics/bitmap_465.png"><img src="nfts/thumbs/bitmap_465.png" width="15%"/></a>
<a href="nfts/pics/bitmap_464.png"><img src="nfts/thumbs/bitmap_464.png" width="15%"/></a>
<a href="nfts/pics/bitmap_463.png"><img src="nfts/thumbs/bitmap_463.png" width="15%"/></a>
<a href="nfts/pics/bitmap_462.png"><img src="nfts/thumbs/bitmap_462.png" width="15%"/></a>
<a href="nfts/pics/bitmap_461.png"><img src="nfts/thumbs/bitmap_461.png" width="15%"/></a>
<a href="nfts/pics/bitmap_460.png"><img src="nfts/thumbs/bitmap_460.png" width="15%"/></a>
<a href="nfts/pics/bitmap_459.png"><img src="nfts/thumbs/bitmap_459.png" width="15%"/></a>
<a href="nfts/pics/bitmap_458.png"><img src="nfts/thumbs/bitmap_458.png" width="15%"/></a>
<a href="nfts/pics/bitmap_457.png"><img src="nfts/thumbs/bitmap_457.png" width="15%"/></a>
<a href="nfts/pics/bitmap_456.png"><img src="nfts/thumbs/bitmap_456.png" width="15%"/></a>
<a href="nfts/pics/bitmap_455.png"><img src="nfts/thumbs/bitmap_455.png" width="15%"/></a>
<a href="nfts/pics/bitmap_454.png"><img src="nfts/thumbs/bitmap_454.png" width="15%"/></a>
<a href="nfts/pics/bitmap_453.png"><img src="nfts/thumbs/bitmap_453.png" width="15%"/></a>
<a href="nfts/pics/bitmap_452.png"><img src="nfts/thumbs/bitmap_452.png" width="15%"/></a>
<a href="nfts/pics/bitmap_451.png"><img src="nfts/thumbs/bitmap_451.png" width="15%"/></a>
<a href="nfts/pics/bitmap_450.png"><img src="nfts/thumbs/bitmap_450.png" width="15%"/></a>
<a href="nfts/pics/bitmap_449.png"><img src="nfts/thumbs/bitmap_449.png" width="15%"/></a>
<a href="nfts/pics/bitmap_448.png"><img src="nfts/thumbs/bitmap_448.png" width="15%"/></a>
<a href="nfts/pics/bitmap_447.png"><img src="nfts/thumbs/bitmap_447.png" width="15%"/></a>
<a href="nfts/pics/bitmap_446.png"><img src="nfts/thumbs/bitmap_446.png" width="15%"/></a>
<a href="nfts/pics/bitmap_445.png"><img src="nfts/thumbs/bitmap_445.png" width="15%"/></a>
<a href="nfts/pics/bitmap_444.png"><img src="nfts/thumbs/bitmap_444.png" width="15%"/></a>
<a href="nfts/pics/bitmap_443.png"><img src="nfts/thumbs/bitmap_443.png" width="15%"/></a>
<a href="nfts/pics/bitmap_442.png"><img src="nfts/thumbs/bitmap_442.png" width="15%"/></a>
<a href="nfts/pics/bitmap_441.png"><img src="nfts/thumbs/bitmap_441.png" width="15%"/></a>
<a href="nfts/pics/bitmap_440.png"><img src="nfts/thumbs/bitmap_440.png" width="15%"/></a>
<a href="nfts/pics/bitmap_439.png"><img src="nfts/thumbs/bitmap_439.png" width="15%"/></a>
<a href="nfts/pics/bitmap_438.png"><img src="nfts/thumbs/bitmap_438.png" width="15%"/></a>
<a href="nfts/pics/bitmap_437.png"><img src="nfts/thumbs/bitmap_437.png" width="15%"/></a>
<a href="nfts/pics/bitmap_436.png"><img src="nfts/thumbs/bitmap_436.png" width="15%"/></a>
<a href="nfts/pics/bitmap_435.png"><img src="nfts/thumbs/bitmap_435.png" width="15%"/></a>
<a href="nfts/pics/bitmap_434.png"><img src="nfts/thumbs/bitmap_434.png" width="15%"/></a>
<a href="nfts/pics/bitmap_433.png"><img src="nfts/thumbs/bitmap_433.png" width="15%"/></a>
<a href="nfts/pics/bitmap_432.png"><img src="nfts/thumbs/bitmap_432.png" width="15%"/></a>
<a href="nfts/pics/bitmap_431.png"><img src="nfts/thumbs/bitmap_431.png" width="15%"/></a>
<a href="nfts/pics/bitmap_430.png"><img src="nfts/thumbs/bitmap_430.png" width="15%"/></a>
<a href="nfts/pics/bitmap_429.png"><img src="nfts/thumbs/bitmap_429.png" width="15%"/></a>
<a href="nfts/pics/bitmap_428.png"><img src="nfts/thumbs/bitmap_428.png" width="15%"/></a>
<a href="nfts/pics/bitmap_427.png"><img src="nfts/thumbs/bitmap_427.png" width="15%"/></a>
<a href="nfts/pics/bitmap_426.png"><img src="nfts/thumbs/bitmap_426.png" width="15%"/></a>
<a href="nfts/pics/bitmap_425.png"><img src="nfts/thumbs/bitmap_425.png" width="15%"/></a>
<a href="nfts/pics/bitmap_424.png"><img src="nfts/thumbs/bitmap_424.png" width="15%"/></a>
<a href="nfts/pics/bitmap_423.png"><img src="nfts/thumbs/bitmap_423.png" width="15%"/></a>
<a href="nfts/pics/bitmap_422.png"><img src="nfts/thumbs/bitmap_422.png" width="15%"/></a>
<a href="nfts/pics/bitmap_421.png"><img src="nfts/thumbs/bitmap_421.png" width="15%"/></a>
<a href="nfts/pics/bitmap_420.png"><img src="nfts/thumbs/bitmap_420.png" width="15%"/></a>
<a href="nfts/pics/bitmap_419.png"><img src="nfts/thumbs/bitmap_419.png" width="15%"/></a>
<a href="nfts/pics/bitmap_418.png"><img src="nfts/thumbs/bitmap_418.png" width="15%"/></a>
<a href="nfts/pics/bitmap_417.png"><img src="nfts/thumbs/bitmap_417.png" width="15%"/></a>
<a href="nfts/pics/bitmap_416.png"><img src="nfts/thumbs/bitmap_416.png" width="15%"/></a>
<a href="nfts/pics/bitmap_415.png"><img src="nfts/thumbs/bitmap_415.png" width="15%"/></a>
<a href="nfts/pics/bitmap_414.png"><img src="nfts/thumbs/bitmap_414.png" width="15%"/></a>
<a href="nfts/pics/bitmap_413.png"><img src="nfts/thumbs/bitmap_413.png" width="15%"/></a>
<a href="nfts/pics/bitmap_412.png"><img src="nfts/thumbs/bitmap_412.png" width="15%"/></a>
<a href="nfts/pics/bitmap_411.png"><img src="nfts/thumbs/bitmap_411.png" width="15%"/></a>
<a href="nfts/pics/bitmap_410.png"><img src="nfts/thumbs/bitmap_410.png" width="15%"/></a>
<a href="nfts/pics/bitmap_409.png"><img src="nfts/thumbs/bitmap_409.png" width="15%"/></a>
<a href="nfts/pics/bitmap_408.png"><img src="nfts/thumbs/bitmap_408.png" width="15%"/></a>
<a href="nfts/pics/bitmap_407.png"><img src="nfts/thumbs/bitmap_407.png" width="15%"/></a>
<a href="nfts/pics/bitmap_406.png"><img src="nfts/thumbs/bitmap_406.png" width="15%"/></a>
<a href="nfts/pics/bitmap_405.png"><img src="nfts/thumbs/bitmap_405.png" width="15%"/></a>
<a href="nfts/pics/bitmap_404.png"><img src="nfts/thumbs/bitmap_404.png" width="15%"/></a>
<a href="nfts/pics/bitmap_403.png"><img src="nfts/thumbs/bitmap_403.png" width="15%"/></a>
<a href="nfts/pics/bitmap_402.png"><img src="nfts/thumbs/bitmap_402.png" width="15%"/></a>
<a href="nfts/pics/bitmap_401.png"><img src="nfts/thumbs/bitmap_401.png" width="15%"/></a>
<a href="nfts/pics/bitmap_400.png"><img src="nfts/thumbs/bitmap_400.png" width="15%"/></a>
<a href="nfts/pics/bitmap_399.png"><img src="nfts/thumbs/bitmap_399.png" width="15%"/></a>
<a href="nfts/pics/bitmap_398.png"><img src="nfts/thumbs/bitmap_398.png" width="15%"/></a>
<a href="nfts/pics/bitmap_397.png"><img src="nfts/thumbs/bitmap_397.png" width="15%"/></a>
<a href="nfts/pics/bitmap_396.png"><img src="nfts/thumbs/bitmap_396.png" width="15%"/></a>
<a href="nfts/pics/bitmap_395.png"><img src="nfts/thumbs/bitmap_395.png" width="15%"/></a>
<a href="nfts/pics/bitmap_394.png"><img src="nfts/thumbs/bitmap_394.png" width="15%"/></a>
<a href="nfts/pics/bitmap_393.png"><img src="nfts/thumbs/bitmap_393.png" width="15%"/></a>
<a href="nfts/pics/bitmap_392.png"><img src="nfts/thumbs/bitmap_392.png" width="15%"/></a>
<a href="nfts/pics/bitmap_391.png"><img src="nfts/thumbs/bitmap_391.png" width="15%"/></a>
<a href="nfts/pics/bitmap_390.png"><img src="nfts/thumbs/bitmap_390.png" width="15%"/></a>
<a href="nfts/pics/bitmap_389.png"><img src="nfts/thumbs/bitmap_389.png" width="15%"/></a>
<a href="nfts/pics/bitmap_388.png"><img src="nfts/thumbs/bitmap_388.png" width="15%"/></a>
<a href="nfts/pics/bitmap_387.png"><img src="nfts/thumbs/bitmap_387.png" width="15%"/></a>
<a href="nfts/pics/bitmap_386.png"><img src="nfts/thumbs/bitmap_386.png" width="15%"/></a>
<a href="nfts/pics/bitmap_385.png"><img src="nfts/thumbs/bitmap_385.png" width="15%"/></a>
<a href="nfts/pics/bitmap_384.png"><img src="nfts/thumbs/bitmap_384.png" width="15%"/></a>
<a href="nfts/pics/bitmap_383.png"><img src="nfts/thumbs/bitmap_383.png" width="15%"/></a>
<a href="nfts/pics/bitmap_382.png"><img src="nfts/thumbs/bitmap_382.png" width="15%"/></a>
<a href="nfts/pics/bitmap_381.png"><img src="nfts/thumbs/bitmap_381.png" width="15%"/></a>
<a href="nfts/pics/bitmap_380.png"><img src="nfts/thumbs/bitmap_380.png" width="15%"/></a>
<a href="nfts/pics/bitmap_379.png"><img src="nfts/thumbs/bitmap_379.png" width="15%"/></a>
<a href="nfts/pics/bitmap_378.png"><img src="nfts/thumbs/bitmap_378.png" width="15%"/></a>
<a href="nfts/pics/bitmap_377.png"><img src="nfts/thumbs/bitmap_377.png" width="15%"/></a>
<a href="nfts/pics/bitmap_376.png"><img src="nfts/thumbs/bitmap_376.png" width="15%"/></a>
<a href="nfts/pics/bitmap_375.png"><img src="nfts/thumbs/bitmap_375.png" width="15%"/></a>
<a href="nfts/pics/bitmap_374.png"><img src="nfts/thumbs/bitmap_374.png" width="15%"/></a>
<a href="nfts/pics/bitmap_373.png"><img src="nfts/thumbs/bitmap_373.png" width="15%"/></a>
<a href="nfts/pics/bitmap_372.png"><img src="nfts/thumbs/bitmap_372.png" width="15%"/></a>
<a href="nfts/pics/bitmap_371.png"><img src="nfts/thumbs/bitmap_371.png" width="15%"/></a>
<a href="nfts/pics/bitmap_370.png"><img src="nfts/thumbs/bitmap_370.png" width="15%"/></a>
<a href="nfts/pics/bitmap_369.png"><img src="nfts/thumbs/bitmap_369.png" width="15%"/></a>
<a href="nfts/pics/bitmap_368.png"><img src="nfts/thumbs/bitmap_368.png" width="15%"/></a>
<a href="nfts/pics/bitmap_367.png"><img src="nfts/thumbs/bitmap_367.png" width="15%"/></a>
<a href="nfts/pics/bitmap_366.png"><img src="nfts/thumbs/bitmap_366.png" width="15%"/></a>
<a href="nfts/pics/bitmap_365.png"><img src="nfts/thumbs/bitmap_365.png" width="15%"/></a>
<a href="nfts/pics/bitmap_364.png"><img src="nfts/thumbs/bitmap_364.png" width="15%"/></a>
<a href="nfts/pics/bitmap_363.png"><img src="nfts/thumbs/bitmap_363.png" width="15%"/></a>
<a href="nfts/pics/bitmap_362.png"><img src="nfts/thumbs/bitmap_362.png" width="15%"/></a>
<a href="nfts/pics/bitmap_361.png"><img src="nfts/thumbs/bitmap_361.png" width="15%"/></a>
<a href="nfts/pics/bitmap_360.png"><img src="nfts/thumbs/bitmap_360.png" width="15%"/></a>
<a href="nfts/pics/bitmap_359.png"><img src="nfts/thumbs/bitmap_359.png" width="15%"/></a>
<a href="nfts/pics/bitmap_358.png"><img src="nfts/thumbs/bitmap_358.png" width="15%"/></a>
<a href="nfts/pics/bitmap_357.png"><img src="nfts/thumbs/bitmap_357.png" width="15%"/></a>
<a href="nfts/pics/bitmap_356.png"><img src="nfts/thumbs/bitmap_356.png" width="15%"/></a>
<a href="nfts/pics/bitmap_355.png"><img src="nfts/thumbs/bitmap_355.png" width="15%"/></a>
<a href="nfts/pics/bitmap_354.png"><img src="nfts/thumbs/bitmap_354.png" width="15%"/></a>
<a href="nfts/pics/bitmap_353.png"><img src="nfts/thumbs/bitmap_353.png" width="15%"/></a>
<a href="nfts/pics/bitmap_352.png"><img src="nfts/thumbs/bitmap_352.png" width="15%"/></a>
<a href="nfts/pics/bitmap_351.png"><img src="nfts/thumbs/bitmap_351.png" width="15%"/></a>
<a href="nfts/pics/bitmap_350.png"><img src="nfts/thumbs/bitmap_350.png" width="15%"/></a>
<a href="nfts/pics/bitmap_349.png"><img src="nfts/thumbs/bitmap_349.png" width="15%"/></a>
<a href="nfts/pics/bitmap_348.png"><img src="nfts/thumbs/bitmap_348.png" width="15%"/></a>
<a href="nfts/pics/bitmap_347.png"><img src="nfts/thumbs/bitmap_347.png" width="15%"/></a>
<a href="nfts/pics/bitmap_346.png"><img src="nfts/thumbs/bitmap_346.png" width="15%"/></a>
<a href="nfts/pics/bitmap_345.png"><img src="nfts/thumbs/bitmap_345.png" width="15%"/></a>
<a href="nfts/pics/bitmap_344.png"><img src="nfts/thumbs/bitmap_344.png" width="15%"/></a>
<a href="nfts/pics/bitmap_343.png"><img src="nfts/thumbs/bitmap_343.png" width="15%"/></a>
<a href="nfts/pics/bitmap_342.png"><img src="nfts/thumbs/bitmap_342.png" width="15%"/></a>
<a href="nfts/pics/bitmap_341.png"><img src="nfts/thumbs/bitmap_341.png" width="15%"/></a>
<a href="nfts/pics/bitmap_340.png"><img src="nfts/thumbs/bitmap_340.png" width="15%"/></a>
<a href="nfts/pics/bitmap_339.png"><img src="nfts/thumbs/bitmap_339.png" width="15%"/></a>
<a href="nfts/pics/bitmap_338.png"><img src="nfts/thumbs/bitmap_338.png" width="15%"/></a>
<a href="nfts/pics/bitmap_337.png"><img src="nfts/thumbs/bitmap_337.png" width="15%"/></a>
<a href="nfts/pics/bitmap_336.png"><img src="nfts/thumbs/bitmap_336.png" width="15%"/></a>
<a href="nfts/pics/bitmap_335.png"><img src="nfts/thumbs/bitmap_335.png" width="15%"/></a>
<a href="nfts/pics/bitmap_334.png"><img src="nfts/thumbs/bitmap_334.png" width="15%"/></a>
<a href="nfts/pics/bitmap_333.png"><img src="nfts/thumbs/bitmap_333.png" width="15%"/></a>
<a href="nfts/pics/bitmap_332.png"><img src="nfts/thumbs/bitmap_332.png" width="15%"/></a>
<a href="nfts/pics/bitmap_331.png"><img src="nfts/thumbs/bitmap_331.png" width="15%"/></a>
<a href="nfts/pics/bitmap_330.png"><img src="nfts/thumbs/bitmap_330.png" width="15%"/></a>
<a href="nfts/pics/bitmap_329.png"><img src="nfts/thumbs/bitmap_329.png" width="15%"/></a>
<a href="nfts/pics/bitmap_328.png"><img src="nfts/thumbs/bitmap_328.png" width="15%"/></a>
<a href="nfts/pics/bitmap_327.png"><img src="nfts/thumbs/bitmap_327.png" width="15%"/></a>
<a href="nfts/pics/bitmap_326.png"><img src="nfts/thumbs/bitmap_326.png" width="15%"/></a>
<a href="nfts/pics/bitmap_325.png"><img src="nfts/thumbs/bitmap_325.png" width="15%"/></a>
<a href="nfts/pics/bitmap_324.png"><img src="nfts/thumbs/bitmap_324.png" width="15%"/></a>
<a href="nfts/pics/bitmap_323.png"><img src="nfts/thumbs/bitmap_323.png" width="15%"/></a>
<a href="nfts/pics/bitmap_322.png"><img src="nfts/thumbs/bitmap_322.png" width="15%"/></a>
<a href="nfts/pics/bitmap_321.png"><img src="nfts/thumbs/bitmap_321.png" width="15%"/></a>
<a href="nfts/pics/bitmap_320.png"><img src="nfts/thumbs/bitmap_320.png" width="15%"/></a>
<a href="nfts/pics/bitmap_319.png"><img src="nfts/thumbs/bitmap_319.png" width="15%"/></a>
<a href="nfts/pics/bitmap_318.png"><img src="nfts/thumbs/bitmap_318.png" width="15%"/></a>
<a href="nfts/pics/bitmap_317.png"><img src="nfts/thumbs/bitmap_317.png" width="15%"/></a>
<a href="nfts/pics/bitmap_316.png"><img src="nfts/thumbs/bitmap_316.png" width="15%"/></a>
<a href="nfts/pics/bitmap_315.png"><img src="nfts/thumbs/bitmap_315.png" width="15%"/></a>
<a href="nfts/pics/bitmap_314.png"><img src="nfts/thumbs/bitmap_314.png" width="15%"/></a>
<a href="nfts/pics/bitmap_313.png"><img src="nfts/thumbs/bitmap_313.png" width="15%"/></a>
<a href="nfts/pics/bitmap_312.png"><img src="nfts/thumbs/bitmap_312.png" width="15%"/></a>
<a href="nfts/pics/bitmap_311.png"><img src="nfts/thumbs/bitmap_311.png" width="15%"/></a>
<a href="nfts/pics/bitmap_310.png"><img src="nfts/thumbs/bitmap_310.png" width="15%"/></a>
<a href="nfts/pics/bitmap_309.png"><img src="nfts/thumbs/bitmap_309.png" width="15%"/></a>
<a href="nfts/pics/bitmap_308.png"><img src="nfts/thumbs/bitmap_308.png" width="15%"/></a>
<a href="nfts/pics/bitmap_307.png"><img src="nfts/thumbs/bitmap_307.png" width="15%"/></a>
<a href="nfts/pics/bitmap_306.png"><img src="nfts/thumbs/bitmap_306.png" width="15%"/></a>
<a href="nfts/pics/bitmap_305.png"><img src="nfts/thumbs/bitmap_305.png" width="15%"/></a>
<a href="nfts/pics/bitmap_304.png"><img src="nfts/thumbs/bitmap_304.png" width="15%"/></a>
<a href="nfts/pics/bitmap_303.png"><img src="nfts/thumbs/bitmap_303.png" width="15%"/></a>
<a href="nfts/pics/bitmap_302.png"><img src="nfts/thumbs/bitmap_302.png" width="15%"/></a>
<a href="nfts/pics/bitmap_301.png"><img src="nfts/thumbs/bitmap_301.png" width="15%"/></a>
<a href="nfts/pics/bitmap_300.png"><img src="nfts/thumbs/bitmap_300.png" width="15%"/></a>
<a href="nfts/pics/bitmap_299.png"><img src="nfts/thumbs/bitmap_299.png" width="15%"/></a>
<a href="nfts/pics/bitmap_298.png"><img src="nfts/thumbs/bitmap_298.png" width="15%"/></a>
<a href="nfts/pics/bitmap_297.png"><img src="nfts/thumbs/bitmap_297.png" width="15%"/></a>
<a href="nfts/pics/bitmap_296.png"><img src="nfts/thumbs/bitmap_296.png" width="15%"/></a>
<a href="nfts/pics/bitmap_295.png"><img src="nfts/thumbs/bitmap_295.png" width="15%"/></a>
<a href="nfts/pics/bitmap_294.png"><img src="nfts/thumbs/bitmap_294.png" width="15%"/></a>
<a href="nfts/pics/bitmap_293.png"><img src="nfts/thumbs/bitmap_293.png" width="15%"/></a>
<a href="nfts/pics/bitmap_292.png"><img src="nfts/thumbs/bitmap_292.png" width="15%"/></a>
<a href="nfts/pics/bitmap_291.png"><img src="nfts/thumbs/bitmap_291.png" width="15%"/></a>
<a href="nfts/pics/bitmap_290.png"><img src="nfts/thumbs/bitmap_290.png" width="15%"/></a>
<a href="nfts/pics/bitmap_289.png"><img src="nfts/thumbs/bitmap_289.png" width="15%"/></a>
<a href="nfts/pics/bitmap_288.png"><img src="nfts/thumbs/bitmap_288.png" width="15%"/></a>
<a href="nfts/pics/bitmap_287.png"><img src="nfts/thumbs/bitmap_287.png" width="15%"/></a>
<a href="nfts/pics/bitmap_286.png"><img src="nfts/thumbs/bitmap_286.png" width="15%"/></a>
<a href="nfts/pics/bitmap_285.png"><img src="nfts/thumbs/bitmap_285.png" width="15%"/></a>
<a href="nfts/pics/bitmap_284.png"><img src="nfts/thumbs/bitmap_284.png" width="15%"/></a>
<a href="nfts/pics/bitmap_283.png"><img src="nfts/thumbs/bitmap_283.png" width="15%"/></a>
<a href="nfts/pics/bitmap_282.png"><img src="nfts/thumbs/bitmap_282.png" width="15%"/></a>
<a href="nfts/pics/bitmap_281.png"><img src="nfts/thumbs/bitmap_281.png" width="15%"/></a>
<a href="nfts/pics/bitmap_280.png"><img src="nfts/thumbs/bitmap_280.png" width="15%"/></a>
<a href="nfts/pics/bitmap_279.png"><img src="nfts/thumbs/bitmap_279.png" width="15%"/></a>
<a href="nfts/pics/bitmap_278.png"><img src="nfts/thumbs/bitmap_278.png" width="15%"/></a>
<a href="nfts/pics/bitmap_277.png"><img src="nfts/thumbs/bitmap_277.png" width="15%"/></a>
<a href="nfts/pics/bitmap_276.png"><img src="nfts/thumbs/bitmap_276.png" width="15%"/></a>
<a href="nfts/pics/bitmap_275.png"><img src="nfts/thumbs/bitmap_275.png" width="15%"/></a>
<a href="nfts/pics/bitmap_274.png"><img src="nfts/thumbs/bitmap_274.png" width="15%"/></a>
<a href="nfts/pics/bitmap_273.png"><img src="nfts/thumbs/bitmap_273.png" width="15%"/></a>
<a href="nfts/pics/bitmap_272.png"><img src="nfts/thumbs/bitmap_272.png" width="15%"/></a>
<a href="nfts/pics/bitmap_271.png"><img src="nfts/thumbs/bitmap_271.png" width="15%"/></a>
<a href="nfts/pics/bitmap_270.png"><img src="nfts/thumbs/bitmap_270.png" width="15%"/></a>
<a href="nfts/pics/bitmap_269.png"><img src="nfts/thumbs/bitmap_269.png" width="15%"/></a>
<a href="nfts/pics/bitmap_268.png"><img src="nfts/thumbs/bitmap_268.png" width="15%"/></a>
<a href="nfts/pics/bitmap_267.png"><img src="nfts/thumbs/bitmap_267.png" width="15%"/></a>
<a href="nfts/pics/bitmap_266.png"><img src="nfts/thumbs/bitmap_266.png" width="15%"/></a>
<a href="nfts/pics/bitmap_265.png"><img src="nfts/thumbs/bitmap_265.png" width="15%"/></a>
<a href="nfts/pics/bitmap_264.png"><img src="nfts/thumbs/bitmap_264.png" width="15%"/></a>
<a href="nfts/pics/bitmap_263.png"><img src="nfts/thumbs/bitmap_263.png" width="15%"/></a>
<a href="nfts/pics/bitmap_262.png"><img src="nfts/thumbs/bitmap_262.png" width="15%"/></a>
<a href="nfts/pics/bitmap_261.png"><img src="nfts/thumbs/bitmap_261.png" width="15%"/></a>
<a href="nfts/pics/bitmap_260.png"><img src="nfts/thumbs/bitmap_260.png" width="15%"/></a>
<a href="nfts/pics/bitmap_259.png"><img src="nfts/thumbs/bitmap_259.png" width="15%"/></a>
<a href="nfts/pics/bitmap_258.png"><img src="nfts/thumbs/bitmap_258.png" width="15%"/></a>
<a href="nfts/pics/bitmap_257.png"><img src="nfts/thumbs/bitmap_257.png" width="15%"/></a>
<a href="nfts/pics/bitmap_256.png"><img src="nfts/thumbs/bitmap_256.png" width="15%"/></a>
<a href="nfts/pics/bitmap_255.png"><img src="nfts/thumbs/bitmap_255.png" width="15%"/></a>
<a href="nfts/pics/bitmap_254.png"><img src="nfts/thumbs/bitmap_254.png" width="15%"/></a>
<a href="nfts/pics/bitmap_253.png"><img src="nfts/thumbs/bitmap_253.png" width="15%"/></a>
<a href="nfts/pics/bitmap_252.png"><img src="nfts/thumbs/bitmap_252.png" width="15%"/></a>
<a href="nfts/pics/bitmap_251.png"><img src="nfts/thumbs/bitmap_251.png" width="15%"/></a>
<a href="nfts/pics/bitmap_250.png"><img src="nfts/thumbs/bitmap_250.png" width="15%"/></a>
<a href="nfts/pics/bitmap_249.png"><img src="nfts/thumbs/bitmap_249.png" width="15%"/></a>
<a href="nfts/pics/bitmap_248.png"><img src="nfts/thumbs/bitmap_248.png" width="15%"/></a>
<a href="nfts/pics/bitmap_247.png"><img src="nfts/thumbs/bitmap_247.png" width="15%"/></a>
<a href="nfts/pics/bitmap_246.png"><img src="nfts/thumbs/bitmap_246.png" width="15%"/></a>
<a href="nfts/pics/bitmap_245.png"><img src="nfts/thumbs/bitmap_245.png" width="15%"/></a>
<a href="nfts/pics/bitmap_244.png"><img src="nfts/thumbs/bitmap_244.png" width="15%"/></a>
<a href="nfts/pics/bitmap_243.png"><img src="nfts/thumbs/bitmap_243.png" width="15%"/></a>
<a href="nfts/pics/bitmap_242.png"><img src="nfts/thumbs/bitmap_242.png" width="15%"/></a>
<a href="nfts/pics/bitmap_241.png"><img src="nfts/thumbs/bitmap_241.png" width="15%"/></a>
<a href="nfts/pics/bitmap_240.png"><img src="nfts/thumbs/bitmap_240.png" width="15%"/></a>
<a href="nfts/pics/bitmap_239.png"><img src="nfts/thumbs/bitmap_239.png" width="15%"/></a>
<a href="nfts/pics/bitmap_238.png"><img src="nfts/thumbs/bitmap_238.png" width="15%"/></a>
<a href="nfts/pics/bitmap_237.png"><img src="nfts/thumbs/bitmap_237.png" width="15%"/></a>
<a href="nfts/pics/bitmap_236.png"><img src="nfts/thumbs/bitmap_236.png" width="15%"/></a>
<a href="nfts/pics/bitmap_235.png"><img src="nfts/thumbs/bitmap_235.png" width="15%"/></a>
<a href="nfts/pics/bitmap_234.png"><img src="nfts/thumbs/bitmap_234.png" width="15%"/></a>
<a href="nfts/pics/bitmap_233.png"><img src="nfts/thumbs/bitmap_233.png" width="15%"/></a>
<a href="nfts/pics/bitmap_232.png"><img src="nfts/thumbs/bitmap_232.png" width="15%"/></a>
<a href="nfts/pics/bitmap_231.png"><img src="nfts/thumbs/bitmap_231.png" width="15%"/></a>
<a href="nfts/pics/bitmap_230.png"><img src="nfts/thumbs/bitmap_230.png" width="15%"/></a>
<a href="nfts/pics/bitmap_229.png"><img src="nfts/thumbs/bitmap_229.png" width="15%"/></a>
<a href="nfts/pics/bitmap_228.png"><img src="nfts/thumbs/bitmap_228.png" width="15%"/></a>
<a href="nfts/pics/bitmap_227.png"><img src="nfts/thumbs/bitmap_227.png" width="15%"/></a>
<a href="nfts/pics/bitmap_226.png"><img src="nfts/thumbs/bitmap_226.png" width="15%"/></a>
<a href="nfts/pics/bitmap_225.png"><img src="nfts/thumbs/bitmap_225.png" width="15%"/></a>
<a href="nfts/pics/bitmap_224.png"><img src="nfts/thumbs/bitmap_224.png" width="15%"/></a>
<a href="nfts/pics/bitmap_223.png"><img src="nfts/thumbs/bitmap_223.png" width="15%"/></a>
<a href="nfts/pics/bitmap_222.png"><img src="nfts/thumbs/bitmap_222.png" width="15%"/></a>
<a href="nfts/pics/bitmap_221.png"><img src="nfts/thumbs/bitmap_221.png" width="15%"/></a>
<a href="nfts/pics/bitmap_220.png"><img src="nfts/thumbs/bitmap_220.png" width="15%"/></a>
<a href="nfts/pics/bitmap_219.png"><img src="nfts/thumbs/bitmap_219.png" width="15%"/></a>
<a href="nfts/pics/bitmap_218.png"><img src="nfts/thumbs/bitmap_218.png" width="15%"/></a>
<a href="nfts/pics/bitmap_217.png"><img src="nfts/thumbs/bitmap_217.png" width="15%"/></a>
<a href="nfts/pics/bitmap_216.png"><img src="nfts/thumbs/bitmap_216.png" width="15%"/></a>
<a href="nfts/pics/bitmap_215.png"><img src="nfts/thumbs/bitmap_215.png" width="15%"/></a>
<a href="nfts/pics/bitmap_214.png"><img src="nfts/thumbs/bitmap_214.png" width="15%"/></a>
<a href="nfts/pics/bitmap_213.png"><img src="nfts/thumbs/bitmap_213.png" width="15%"/></a>
<a href="nfts/pics/bitmap_212.png"><img src="nfts/thumbs/bitmap_212.png" width="15%"/></a>
<a href="nfts/pics/bitmap_211.png"><img src="nfts/thumbs/bitmap_211.png" width="15%"/></a>
<a href="nfts/pics/bitmap_210.png"><img src="nfts/thumbs/bitmap_210.png" width="15%"/></a>
<a href="nfts/pics/bitmap_209.png"><img src="nfts/thumbs/bitmap_209.png" width="15%"/></a>
<a href="nfts/pics/bitmap_208.png"><img src="nfts/thumbs/bitmap_208.png" width="15%"/></a>
<a href="nfts/pics/bitmap_207.png"><img src="nfts/thumbs/bitmap_207.png" width="15%"/></a>
<a href="nfts/pics/bitmap_206.png"><img src="nfts/thumbs/bitmap_206.png" width="15%"/></a>
<a href="nfts/pics/bitmap_205.png"><img src="nfts/thumbs/bitmap_205.png" width="15%"/></a>
<a href="nfts/pics/bitmap_204.png"><img src="nfts/thumbs/bitmap_204.png" width="15%"/></a>
<a href="nfts/pics/bitmap_203.png"><img src="nfts/thumbs/bitmap_203.png" width="15%"/></a>
<a href="nfts/pics/bitmap_202.png"><img src="nfts/thumbs/bitmap_202.png" width="15%"/></a>
<a href="nfts/pics/bitmap_201.png"><img src="nfts/thumbs/bitmap_201.png" width="15%"/></a>
<a href="nfts/pics/bitmap_200.png"><img src="nfts/thumbs/bitmap_200.png" width="15%"/></a>
<a href="nfts/pics/bitmap_199.png"><img src="nfts/thumbs/bitmap_199.png" width="15%"/></a>
<a href="nfts/pics/bitmap_198.png"><img src="nfts/thumbs/bitmap_198.png" width="15%"/></a>
<a href="nfts/pics/bitmap_197.png"><img src="nfts/thumbs/bitmap_197.png" width="15%"/></a>
<a href="nfts/pics/bitmap_196.png"><img src="nfts/thumbs/bitmap_196.png" width="15%"/></a>
<a href="nfts/pics/bitmap_195.png"><img src="nfts/thumbs/bitmap_195.png" width="15%"/></a>
<a href="nfts/pics/bitmap_194.png"><img src="nfts/thumbs/bitmap_194.png" width="15%"/></a>
<a href="nfts/pics/bitmap_193.png"><img src="nfts/thumbs/bitmap_193.png" width="15%"/></a>
<a href="nfts/pics/bitmap_192.png"><img src="nfts/thumbs/bitmap_192.png" width="15%"/></a>
<a href="nfts/pics/bitmap_191.png"><img src="nfts/thumbs/bitmap_191.png" width="15%"/></a>
<a href="nfts/pics/bitmap_190.png"><img src="nfts/thumbs/bitmap_190.png" width="15%"/></a>
<a href="nfts/pics/bitmap_189.png"><img src="nfts/thumbs/bitmap_189.png" width="15%"/></a>
<a href="nfts/pics/bitmap_188.png"><img src="nfts/thumbs/bitmap_188.png" width="15%"/></a>
<a href="nfts/pics/bitmap_187.png"><img src="nfts/thumbs/bitmap_187.png" width="15%"/></a>
<a href="nfts/pics/bitmap_186.png"><img src="nfts/thumbs/bitmap_186.png" width="15%"/></a>
<a href="nfts/pics/bitmap_185.png"><img src="nfts/thumbs/bitmap_185.png" width="15%"/></a>
<a href="nfts/pics/bitmap_184.png"><img src="nfts/thumbs/bitmap_184.png" width="15%"/></a>
<a href="nfts/pics/bitmap_183.png"><img src="nfts/thumbs/bitmap_183.png" width="15%"/></a>
<a href="nfts/pics/bitmap_182.png"><img src="nfts/thumbs/bitmap_182.png" width="15%"/></a>
<a href="nfts/pics/bitmap_181.png"><img src="nfts/thumbs/bitmap_181.png" width="15%"/></a>
<a href="nfts/pics/bitmap_180.png"><img src="nfts/thumbs/bitmap_180.png" width="15%"/></a>
<a href="nfts/pics/bitmap_179.png"><img src="nfts/thumbs/bitmap_179.png" width="15%"/></a>
<a href="nfts/pics/bitmap_178.png"><img src="nfts/thumbs/bitmap_178.png" width="15%"/></a>
<a href="nfts/pics/bitmap_177.png"><img src="nfts/thumbs/bitmap_177.png" width="15%"/></a>
<a href="nfts/pics/bitmap_176.png"><img src="nfts/thumbs/bitmap_176.png" width="15%"/></a>
<a href="nfts/pics/bitmap_175.png"><img src="nfts/thumbs/bitmap_175.png" width="15%"/></a>
<a href="nfts/pics/bitmap_174.png"><img src="nfts/thumbs/bitmap_174.png" width="15%"/></a>
<a href="nfts/pics/bitmap_173.png"><img src="nfts/thumbs/bitmap_173.png" width="15%"/></a>
<a href="nfts/pics/bitmap_172.png"><img src="nfts/thumbs/bitmap_172.png" width="15%"/></a>
<a href="nfts/pics/bitmap_171.png"><img src="nfts/thumbs/bitmap_171.png" width="15%"/></a>
<a href="nfts/pics/bitmap_170.png"><img src="nfts/thumbs/bitmap_170.png" width="15%"/></a>
<a href="nfts/pics/bitmap_169.png"><img src="nfts/thumbs/bitmap_169.png" width="15%"/></a>
<a href="nfts/pics/bitmap_168.png"><img src="nfts/thumbs/bitmap_168.png" width="15%"/></a>
<a href="nfts/pics/bitmap_167.png"><img src="nfts/thumbs/bitmap_167.png" width="15%"/></a>
<a href="nfts/pics/bitmap_166.png"><img src="nfts/thumbs/bitmap_166.png" width="15%"/></a>
<a href="nfts/pics/bitmap_165.png"><img src="nfts/thumbs/bitmap_165.png" width="15%"/></a>
<a href="nfts/pics/bitmap_164.png"><img src="nfts/thumbs/bitmap_164.png" width="15%"/></a>
<a href="nfts/pics/bitmap_163.png"><img src="nfts/thumbs/bitmap_163.png" width="15%"/></a>
<a href="nfts/pics/bitmap_162.png"><img src="nfts/thumbs/bitmap_162.png" width="15%"/></a>
<a href="nfts/pics/bitmap_161.png"><img src="nfts/thumbs/bitmap_161.png" width="15%"/></a>
<a href="nfts/pics/bitmap_160.png"><img src="nfts/thumbs/bitmap_160.png" width="15%"/></a>
<a href="nfts/pics/bitmap_159.png"><img src="nfts/thumbs/bitmap_159.png" width="15%"/></a>
<a href="nfts/pics/bitmap_158.png"><img src="nfts/thumbs/bitmap_158.png" width="15%"/></a>
<a href="nfts/pics/bitmap_157.png"><img src="nfts/thumbs/bitmap_157.png" width="15%"/></a>
<a href="nfts/pics/bitmap_156.png"><img src="nfts/thumbs/bitmap_156.png" width="15%"/></a>
<a href="nfts/pics/bitmap_155.png"><img src="nfts/thumbs/bitmap_155.png" width="15%"/></a>
<a href="nfts/pics/bitmap_154.png"><img src="nfts/thumbs/bitmap_154.png" width="15%"/></a>
<a href="nfts/pics/bitmap_153.png"><img src="nfts/thumbs/bitmap_153.png" width="15%"/></a>
<a href="nfts/pics/bitmap_152.png"><img src="nfts/thumbs/bitmap_152.png" width="15%"/></a>
<a href="nfts/pics/bitmap_151.png"><img src="nfts/thumbs/bitmap_151.png" width="15%"/></a>
<a href="nfts/pics/bitmap_150.png"><img src="nfts/thumbs/bitmap_150.png" width="15%"/></a>
<a href="nfts/pics/bitmap_149.png"><img src="nfts/thumbs/bitmap_149.png" width="15%"/></a>
<a href="nfts/pics/bitmap_148.png"><img src="nfts/thumbs/bitmap_148.png" width="15%"/></a>
<a href="nfts/pics/bitmap_147.png"><img src="nfts/thumbs/bitmap_147.png" width="15%"/></a>
<a href="nfts/pics/bitmap_146.png"><img src="nfts/thumbs/bitmap_146.png" width="15%"/></a>
<a href="nfts/pics/bitmap_145.png"><img src="nfts/thumbs/bitmap_145.png" width="15%"/></a>
<a href="nfts/pics/bitmap_144.png"><img src="nfts/thumbs/bitmap_144.png" width="15%"/></a>
<a href="nfts/pics/bitmap_143.png"><img src="nfts/thumbs/bitmap_143.png" width="15%"/></a>
<a href="nfts/pics/bitmap_142.png"><img src="nfts/thumbs/bitmap_142.png" width="15%"/></a>
<a href="nfts/pics/bitmap_141.png"><img src="nfts/thumbs/bitmap_141.png" width="15%"/></a>
<a href="nfts/pics/bitmap_140.png"><img src="nfts/thumbs/bitmap_140.png" width="15%"/></a>
<a href="nfts/pics/bitmap_139.png"><img src="nfts/thumbs/bitmap_139.png" width="15%"/></a>
<a href="nfts/pics/bitmap_138.png"><img src="nfts/thumbs/bitmap_138.png" width="15%"/></a>
<a href="nfts/pics/bitmap_137.png"><img src="nfts/thumbs/bitmap_137.png" width="15%"/></a>
<a href="nfts/pics/bitmap_136.png"><img src="nfts/thumbs/bitmap_136.png" width="15%"/></a>
<a href="nfts/pics/bitmap_135.png"><img src="nfts/thumbs/bitmap_135.png" width="15%"/></a>
<a href="nfts/pics/bitmap_134.png"><img src="nfts/thumbs/bitmap_134.png" width="15%"/></a>
<a href="nfts/pics/bitmap_133.png"><img src="nfts/thumbs/bitmap_133.png" width="15%"/></a>
<a href="nfts/pics/bitmap_132.png"><img src="nfts/thumbs/bitmap_132.png" width="15%"/></a>
<a href="nfts/pics/bitmap_131.png"><img src="nfts/thumbs/bitmap_131.png" width="15%"/></a>
<a href="nfts/pics/bitmap_130.png"><img src="nfts/thumbs/bitmap_130.png" width="15%"/></a>
<a href="nfts/pics/bitmap_129.png"><img src="nfts/thumbs/bitmap_129.png" width="15%"/></a>
<a href="nfts/pics/bitmap_128.png"><img src="nfts/thumbs/bitmap_128.png" width="15%"/></a>
<a href="nfts/pics/bitmap_127.png"><img src="nfts/thumbs/bitmap_127.png" width="15%"/></a>
<a href="nfts/pics/bitmap_126.png"><img src="nfts/thumbs/bitmap_126.png" width="15%"/></a>
<a href="nfts/pics/bitmap_125.png"><img src="nfts/thumbs/bitmap_125.png" width="15%"/></a>
<a href="nfts/pics/bitmap_124.png"><img src="nfts/thumbs/bitmap_124.png" width="15%"/></a>
<a href="nfts/pics/bitmap_123.png"><img src="nfts/thumbs/bitmap_123.png" width="15%"/></a>
<a href="nfts/pics/bitmap_122.png"><img src="nfts/thumbs/bitmap_122.png" width="15%"/></a>
<a href="nfts/pics/bitmap_121.png"><img src="nfts/thumbs/bitmap_121.png" width="15%"/></a>
<a href="nfts/pics/bitmap_120.png"><img src="nfts/thumbs/bitmap_120.png" width="15%"/></a>
<a href="nfts/pics/bitmap_119.png"><img src="nfts/thumbs/bitmap_119.png" width="15%"/></a>
<a href="nfts/pics/bitmap_118.png"><img src="nfts/thumbs/bitmap_118.png" width="15%"/></a>
<a href="nfts/pics/bitmap_117.png"><img src="nfts/thumbs/bitmap_117.png" width="15%"/></a>
<a href="nfts/pics/bitmap_116.png"><img src="nfts/thumbs/bitmap_116.png" width="15%"/></a>
<a href="nfts/pics/bitmap_115.png"><img src="nfts/thumbs/bitmap_115.png" width="15%"/></a>
<a href="nfts/pics/bitmap_114.png"><img src="nfts/thumbs/bitmap_114.png" width="15%"/></a>
<a href="nfts/pics/bitmap_113.png"><img src="nfts/thumbs/bitmap_113.png" width="15%"/></a>
<a href="nfts/pics/bitmap_112.png"><img src="nfts/thumbs/bitmap_112.png" width="15%"/></a>
<a href="nfts/pics/bitmap_111.png"><img src="nfts/thumbs/bitmap_111.png" width="15%"/></a>
<a href="nfts/pics/bitmap_110.png"><img src="nfts/thumbs/bitmap_110.png" width="15%"/></a>
<a href="nfts/pics/bitmap_109.png"><img src="nfts/thumbs/bitmap_109.png" width="15%"/></a>
<a href="nfts/pics/bitmap_108.png"><img src="nfts/thumbs/bitmap_108.png" width="15%"/></a>
<a href="nfts/pics/bitmap_107.png"><img src="nfts/thumbs/bitmap_107.png" width="15%"/></a>
<a href="nfts/pics/bitmap_106.png"><img src="nfts/thumbs/bitmap_106.png" width="15%"/></a>
<a href="nfts/pics/bitmap_105.png"><img src="nfts/thumbs/bitmap_105.png" width="15%"/></a>
<a href="nfts/pics/bitmap_104.png"><img src="nfts/thumbs/bitmap_104.png" width="15%"/></a>
<a href="nfts/pics/bitmap_103.png"><img src="nfts/thumbs/bitmap_103.png" width="15%"/></a>
<a href="nfts/pics/bitmap_102.png"><img src="nfts/thumbs/bitmap_102.png" width="15%"/></a>
<a href="nfts/pics/bitmap_101.png"><img src="nfts/thumbs/bitmap_101.png" width="15%"/></a>
<a href="nfts/pics/bitmap_100.png"><img src="nfts/thumbs/bitmap_100.png" width="15%"/></a>
<a href="nfts/pics/bitmap_099.png"><img src="nfts/thumbs/bitmap_099.png" width="15%"/></a>
<a href="nfts/pics/bitmap_098.png"><img src="nfts/thumbs/bitmap_098.png" width="15%"/></a>
<a href="nfts/pics/bitmap_097.png"><img src="nfts/thumbs/bitmap_097.png" width="15%"/></a>
<a href="nfts/pics/bitmap_096.png"><img src="nfts/thumbs/bitmap_096.png" width="15%"/></a>
<a href="nfts/pics/bitmap_095.png"><img src="nfts/thumbs/bitmap_095.png" width="15%"/></a>
<a href="nfts/pics/bitmap_094.png"><img src="nfts/thumbs/bitmap_094.png" width="15%"/></a>
<a href="nfts/pics/bitmap_093.png"><img src="nfts/thumbs/bitmap_093.png" width="15%"/></a>
<a href="nfts/pics/bitmap_092.png"><img src="nfts/thumbs/bitmap_092.png" width="15%"/></a>
<a href="nfts/pics/bitmap_091.png"><img src="nfts/thumbs/bitmap_091.png" width="15%"/></a>
<a href="nfts/pics/bitmap_090.png"><img src="nfts/thumbs/bitmap_090.png" width="15%"/></a>
<a href="nfts/pics/bitmap_089.png"><img src="nfts/thumbs/bitmap_089.png" width="15%"/></a>
<a href="nfts/pics/bitmap_088.png"><img src="nfts/thumbs/bitmap_088.png" width="15%"/></a>
<a href="nfts/pics/bitmap_087.png"><img src="nfts/thumbs/bitmap_087.png" width="15%"/></a>
<a href="nfts/pics/bitmap_086.png"><img src="nfts/thumbs/bitmap_086.png" width="15%"/></a>
<a href="nfts/pics/bitmap_085.png"><img src="nfts/thumbs/bitmap_085.png" width="15%"/></a>
<a href="nfts/pics/bitmap_084.png"><img src="nfts/thumbs/bitmap_084.png" width="15%"/></a>
<a href="nfts/pics/bitmap_083.png"><img src="nfts/thumbs/bitmap_083.png" width="15%"/></a>
<a href="nfts/pics/bitmap_082.png"><img src="nfts/thumbs/bitmap_082.png" width="15%"/></a>
<a href="nfts/pics/bitmap_081.png"><img src="nfts/thumbs/bitmap_081.png" width="15%"/></a>
<a href="nfts/pics/bitmap_080.png"><img src="nfts/thumbs/bitmap_080.png" width="15%"/></a>
<a href="nfts/pics/bitmap_079.png"><img src="nfts/thumbs/bitmap_079.png" width="15%"/></a>
<a href="nfts/pics/bitmap_078.png"><img src="nfts/thumbs/bitmap_078.png" width="15%"/></a>
<a href="nfts/pics/bitmap_077.png"><img src="nfts/thumbs/bitmap_077.png" width="15%"/></a>
<a href="nfts/pics/bitmap_076.png"><img src="nfts/thumbs/bitmap_076.png" width="15%"/></a>
<a href="nfts/pics/bitmap_075.png"><img src="nfts/thumbs/bitmap_075.png" width="15%"/></a>
<a href="nfts/pics/bitmap_074.png"><img src="nfts/thumbs/bitmap_074.png" width="15%"/></a>
<a href="nfts/pics/bitmap_073.png"><img src="nfts/thumbs/bitmap_073.png" width="15%"/></a>
<a href="nfts/pics/bitmap_072.png"><img src="nfts/thumbs/bitmap_072.png" width="15%"/></a>
<a href="nfts/pics/bitmap_071.png"><img src="nfts/thumbs/bitmap_071.png" width="15%"/></a>
<a href="nfts/pics/bitmap_070.png"><img src="nfts/thumbs/bitmap_070.png" width="15%"/></a>
<a href="nfts/pics/bitmap_069.png"><img src="nfts/thumbs/bitmap_069.png" width="15%"/></a>
<a href="nfts/pics/bitmap_068.png"><img src="nfts/thumbs/bitmap_068.png" width="15%"/></a>
<a href="nfts/pics/bitmap_067.png"><img src="nfts/thumbs/bitmap_067.png" width="15%"/></a>
<a href="nfts/pics/bitmap_066.png"><img src="nfts/thumbs/bitmap_066.png" width="15%"/></a>
<a href="nfts/pics/bitmap_065.png"><img src="nfts/thumbs/bitmap_065.png" width="15%"/></a>
<a href="nfts/pics/bitmap_064.png"><img src="nfts/thumbs/bitmap_064.png" width="15%"/></a>
<a href="nfts/pics/bitmap_063.png"><img src="nfts/thumbs/bitmap_063.png" width="15%"/></a>
<a href="nfts/pics/bitmap_062.png"><img src="nfts/thumbs/bitmap_062.png" width="15%"/></a>
<a href="nfts/pics/bitmap_061.png"><img src="nfts/thumbs/bitmap_061.png" width="15%"/></a>
<a href="nfts/pics/bitmap_060.png"><img src="nfts/thumbs/bitmap_060.png" width="15%"/></a>
<a href="nfts/pics/bitmap_059.png"><img src="nfts/thumbs/bitmap_059.png" width="15%"/></a>
<a href="nfts/pics/bitmap_058.png"><img src="nfts/thumbs/bitmap_058.png" width="15%"/></a>
<a href="nfts/pics/bitmap_057.png"><img src="nfts/thumbs/bitmap_057.png" width="15%"/></a>
<a href="nfts/pics/bitmap_056.png"><img src="nfts/thumbs/bitmap_056.png" width="15%"/></a>
<a href="nfts/pics/bitmap_055.png"><img src="nfts/thumbs/bitmap_055.png" width="15%"/></a>
<a href="nfts/pics/bitmap_054.png"><img src="nfts/thumbs/bitmap_054.png" width="15%"/></a>
<a href="nfts/pics/bitmap_053.png"><img src="nfts/thumbs/bitmap_053.png" width="15%"/></a>
<a href="nfts/pics/bitmap_052.png"><img src="nfts/thumbs/bitmap_052.png" width="15%"/></a>
<a href="nfts/pics/bitmap_051.png"><img src="nfts/thumbs/bitmap_051.png" width="15%"/></a>
<a href="nfts/pics/bitmap_050.png"><img src="nfts/thumbs/bitmap_050.png" width="15%"/></a>
<a href="nfts/pics/bitmap_049.png"><img src="nfts/thumbs/bitmap_049.png" width="15%"/></a>
<a href="nfts/pics/bitmap_048.png"><img src="nfts/thumbs/bitmap_048.png" width="15%"/></a>
<a href="nfts/pics/bitmap_047.png"><img src="nfts/thumbs/bitmap_047.png" width="15%"/></a>
<a href="nfts/pics/bitmap_046.png"><img src="nfts/thumbs/bitmap_046.png" width="15%"/></a>
<a href="nfts/pics/bitmap_045.png"><img src="nfts/thumbs/bitmap_045.png" width="15%"/></a>
<a href="nfts/pics/bitmap_044.png"><img src="nfts/thumbs/bitmap_044.png" width="15%"/></a>
<a href="nfts/pics/bitmap_043.png"><img src="nfts/thumbs/bitmap_043.png" width="15%"/></a>
<a href="nfts/pics/bitmap_042.png"><img src="nfts/thumbs/bitmap_042.png" width="15%"/></a>
<a href="nfts/pics/bitmap_041.png"><img src="nfts/thumbs/bitmap_041.png" width="15%"/></a>
<a href="nfts/pics/bitmap_040.png"><img src="nfts/thumbs/bitmap_040.png" width="15%"/></a>
<a href="nfts/pics/bitmap_039.png"><img src="nfts/thumbs/bitmap_039.png" width="15%"/></a>
<a href="nfts/pics/bitmap_038.png"><img src="nfts/thumbs/bitmap_038.png" width="15%"/></a>
<a href="nfts/pics/bitmap_037.png"><img src="nfts/thumbs/bitmap_037.png" width="15%"/></a>
<a href="nfts/pics/bitmap_036.png"><img src="nfts/thumbs/bitmap_036.png" width="15%"/></a>
<a href="nfts/pics/bitmap_035.png"><img src="nfts/thumbs/bitmap_035.png" width="15%"/></a>
<a href="nfts/pics/bitmap_034.png"><img src="nfts/thumbs/bitmap_034.png" width="15%"/></a>
<a href="nfts/pics/bitmap_033.png"><img src="nfts/thumbs/bitmap_033.png" width="15%"/></a>
<a href="nfts/pics/bitmap_032.png"><img src="nfts/thumbs/bitmap_032.png" width="15%"/></a>
<a href="nfts/pics/bitmap_031.png"><img src="nfts/thumbs/bitmap_031.png" width="15%"/></a>
<a href="nfts/pics/bitmap_030.png"><img src="nfts/thumbs/bitmap_030.png" width="15%"/></a>
<a href="nfts/pics/bitmap_029.png"><img src="nfts/thumbs/bitmap_029.png" width="15%"/></a>
<a href="nfts/pics/bitmap_028.png"><img src="nfts/thumbs/bitmap_028.png" width="15%"/></a>
<a href="nfts/pics/bitmap_027.png"><img src="nfts/thumbs/bitmap_027.png" width="15%"/></a>
<a href="nfts/pics/bitmap_026.png"><img src="nfts/thumbs/bitmap_026.png" width="15%"/></a>
<a href="nfts/pics/bitmap_025.png"><img src="nfts/thumbs/bitmap_025.png" width="15%"/></a>
<a href="nfts/pics/bitmap_024.png"><img src="nfts/thumbs/bitmap_024.png" width="15%"/></a>
<a href="nfts/pics/bitmap_023.png"><img src="nfts/thumbs/bitmap_023.png" width="15%"/></a>
<a href="nfts/pics/bitmap_022.png"><img src="nfts/thumbs/bitmap_022.png" width="15%"/></a>
<a href="nfts/pics/bitmap_021.png"><img src="nfts/thumbs/bitmap_021.png" width="15%"/></a>
<a href="nfts/pics/bitmap_020.png"><img src="nfts/thumbs/bitmap_020.png" width="15%"/></a>
<a href="nfts/pics/bitmap_019.png"><img src="nfts/thumbs/bitmap_019.png" width="15%"/></a>
<a href="nfts/pics/bitmap_018.png"><img src="nfts/thumbs/bitmap_018.png" width="15%"/></a>
<a href="nfts/pics/bitmap_017.png"><img src="nfts/thumbs/bitmap_017.png" width="15%"/></a>
<a href="nfts/pics/bitmap_016.png"><img src="nfts/thumbs/bitmap_016.png" width="15%"/></a>
<a href="nfts/pics/bitmap_015.png"><img src="nfts/thumbs/bitmap_015.png" width="15%"/></a>
<a href="nfts/pics/bitmap_014.png"><img src="nfts/thumbs/bitmap_014.png" width="15%"/></a>
<a href="nfts/pics/bitmap_013.png"><img src="nfts/thumbs/bitmap_013.png" width="15%"/></a>
<a href="nfts/pics/bitmap_012.png"><img src="nfts/thumbs/bitmap_012.png" width="15%"/></a>
<a href="nfts/pics/bitmap_011.png"><img src="nfts/thumbs/bitmap_011.png" width="15%"/></a>
<a href="nfts/pics/bitmap_010.png"><img src="nfts/thumbs/bitmap_010.png" width="15%"/></a>
<a href="nfts/pics/bitmap_009.png"><img src="nfts/thumbs/bitmap_009.png" width="15%"/></a>
<a href="nfts/pics/bitmap_008.png"><img src="nfts/thumbs/bitmap_008.png" width="15%"/></a>
<a href="nfts/pics/bitmap_007.png"><img src="nfts/thumbs/bitmap_007.png" width="15%"/></a>
<a href="nfts/pics/bitmap_006.png"><img src="nfts/thumbs/bitmap_006.png" width="15%"/></a>
<a href="nfts/pics/bitmap_005.png"><img src="nfts/thumbs/bitmap_005.png" width="15%"/></a>
<a href="nfts/pics/bitmap_004.png"><img src="nfts/thumbs/bitmap_004.png" width="15%"/></a>
<a href="nfts/pics/bitmap_003.png"><img src="nfts/thumbs/bitmap_003.png" width="15%"/></a>
<a href="nfts/pics/bitmap_002.png"><img src="nfts/thumbs/bitmap_002.png" width="15%"/></a>
<a href="nfts/pics/bitmap_001.png"><img src="nfts/thumbs/bitmap_001.png" width="15%"/></a>
<a href="nfts/pics/bitmap_000.png"><img src="nfts/thumbs/bitmap_000.png" width="15%"/></a>
</div>

<div align="center">

## $\color{red}{\textsf{DISCLAIMER}}$

BitmapSunset is provided "AS IS" and "AS AVAILABLE" without warranties, guarantees, or support of any kind. You acknowledge and accept all risks associated with using blockchain-based applications, including financial losses. You are solely responsible for securing your private keys, Bitcoin, and other digital assets. The creators are not liable for any damages, losses, or security breaches resulting from the use of this application. BitmapSunset inscriptions are not investments and carry no expectation of financial return. While inscriptions are permanently stored on the Bitcoin blockchain, access to them depends on ordinals content servers and infrastructure outside the creators' control. All inscriptions are permanent and irreversible — once data is inscribed, it cannot be modified or deleted. It is your responsibility to comply with any applicable laws and regulations in your jurisdiction. By using BitmapSunset, you confirm that you understand and accept these terms.

</div>