# AI Fundamentals — Plan

A free-form, explorable map of AI fundamentals on this site. Not a linear book: every topic is a standalone note, written in any order, explained the way I understood it — through text, images, drawings, diagrams, demos, or whatever fits the idea best.

Notes are written in **Obsidian** and pushed to **GitHub**; the site pulls them in automatically.

## Why written-first (and not YouTube first)

- **The goal is to learn the fundamentals.** Explaining something in my own words is the Feynman technique in its purest form: gaps in understanding can't hide.
- **Video is expensive.** Scripting, recording, editing, and upload cadence take 5–10× longer than writing — time that goes to production, not learning.
- **Notes compound.** Any note can be revisited and improved once a later topic teaches something new; a published video is frozen.
- **It fits the site.** Learning Notes is already the most active section, and a map of fundamentals fills the portfolio gap by showing depth at a glance.
- **YouTube stays optional.** The best notes can later become videos — the explanation is already tested.

## Principles

1. **The map is the backbone, not a chapter order.** The mindmap shows the whole territory; I explore it in whatever order curiosity takes me.
2. **Every note stands on its own.** Prerequisites are links (`builds-on`), not a forced sequence.
3. **Explain it my way.** Each note uses whatever made the idea click: prose, math, hand drawings, diagrams, animations, interactive demos, code.
4. **Publish early, grow over time.** Notes carry a maturity status (🌱 seed → 🌿 growing → 🌳 solid). A rough note is better than an unpublished one.
5. **Open questions are public.** The template's *Open Questions* section stays in the published note — showing what I don't understand yet is part of the method.
6. **Build it to understand it.** Where it helps, implement from scratch (plain Python / NumPy before frameworks).

## Fundamentals vs. Learning Notes

| | Fundamentals | Learning Notes |
|---|---|---|
| Purpose | Fundamentals, explained my way | Reactions to papers and news |
| Organisation | Mindmap of topics, linked | Chronological |
| Editing | Grows and gets revised | Mostly written once |

Learning Notes link into the Fundamentals (e.g. "see *Attention*") — recent-paper commentary grounded in fundamentals I've worked through myself.

## Workflow: Obsidian → GitHub → site

```
Obsidian vault
└── Learn/AI-Fundamentals/            ← a git clone of github.com/franciscomesquitaAI/AI-Fundamentals
    ├── map.md                 ← the mindmap (the roadmap as a nested list)
    ├── DFS-BFS.md             ← one note per topic
    ├── A-Star.md
    ├── demos/                 ← interactive HTML/JS demos
    └── drawings/              ← Excalidraw sources (not published as pages)
          │
          │  git push   (terminal, or the Obsidian Git plugin)
          ▼
github.com/franciscomesquitaAI/AI-Fundamentals
          │
          │  submodule — same as Learning_Notes (update_submodules.sh)
          ▼
franciscomesquitaAI.github.io/_fundamentals/   ← Jekyll collection, rendered at /fundamentals/<note>/
```

**Improvement over the Learning Notes setup:** no wrapper post per note. The submodule *is* the Jekyll collection, and each note's Obsidian properties *are* its Jekyll front matter. Writing a note = write in Obsidian, push, update submodule. Nothing to copy by hand.

Only the `AI-Fundamentals` folder is a repo — the rest of the vault (private notes, work notes) is never pushed.

### One-time Obsidian setup

- **Links:** set *Files & Links → New link format* to **Relative path to file** (currently *Absolute path in vault*, which would break on the site). Keep *Use [[Wikilinks]]* **off** (already off). Links then look like `[DFS, BFS](DFS-BFS.md)`, which work in Obsidian *and* on the site (GitHub Pages' `jekyll-relative-links` turns `.md` links into page URLs).
- **File names:** hyphenated, no spaces (`Attention-QKV.md`, not `Attention QKV.md`) — they become URLs.
- **Images:** keep using the image uploader (as in Learning Notes, images go to imgur) — works everywhere with no path issues.
- **Excalidraw:** keep sources in `drawings/`; export PNG/SVG and embed the uploaded image in the note. Optionally enable the plugin's *Auto-export SVG*.
- **Template:** update `Templates/Foundational knowledge template.md` with the properties below.

### Note properties (= Jekyll front matter)

```yaml
---
title: "DFS & BFS"
subtitle: "Two ways to get lost in a maze, systematically"
status: seed                 # seed | growing | solid
builds-on: [State-Representation]
related: [A-Star]
mathjax: false               # true if the note has math
mermaid: false               # true if the note has Mermaid diagrams
updated: 2026-10-03
---
```

Body follows the existing *Foundational knowledge* template: Definition / Overview → Key Concepts → How It Works → Example / Visualization → Applications → Notes / Insights → References → Open Questions.

## How it looks on the site

- **Fundamentals page (navbar link)** — `map.md` rendered as an **interactive mindmap** with [markmap](https://markmap.js.org/) (CDN): zoom, pan, collapsible branches, same look as the Obsidian mindmap. Topics with a published note are clickable and show their status emoji; topics without a note stay grey. The filling-in map *is* the progress indicator.
- **Note page** — the note, plus: status badge, `builds-on` / `related` links, automatic backlinks ("referenced by…"), last updated.
- **Paths (optional, later)** — curated routes through existing notes, e.g. *From neuron to GPT*.

### `map.md`

The roadmap as a nested Markdown list (the format markmap reads). Linking a topic is just adding a link when its note exists:

```markdown
# AI Learning Mindmap
## Classical AI Algorithms
### Search & Planning
- [DFS, BFS](DFS-BFS.md)
- A*, heuristic evaluation
- State representation & transition functions
...
```

Topics that appear in several areas (attention in Deep Learning *and* LLM Internals; data pipelines in ML Core *and* AI Systems) link to the **same note** — one explanation, reachable from several branches.

### Site-side changes

```
franciscomesquitaAI.github.io/
├── _config.yml               ← collection, defaults, relative_links for collections
├── _fundamentals/                   ← submodule → AI-Fundamentals
├── _layouts/note.html        ← status, builds-on, related, backlinks
├── _includes/
│   ├── mathjax.html          ← math (site currently has none)
│   ├── mermaid.html          ← Mermaid diagrams (Obsidian renders them natively)
│   └── demo.html             ← iframe embed for demos/*.html
└── Fundamentals.html         ← explanation + markmap mindmap (live; map currently in _includes/fundamentals-map.md)
```

```yaml
navbar-links:
  Fundamentals: "Fundamentals"
  Learning Notes: "LearningNotes"
  Projects: "Projects"
  Publications: "Publications"

collections:
  fundamentals:
    output: true
    permalink: /fundamentals/:name/

relative_links:
  collections: true            # make [x](Note.md) links work inside the collection

defaults:
  - scope: { path: "", type: "fundamentals" }
    values:
      layout: "note"
      comments: true
```

`_fundamentals/drawings/` and `_fundamentals/README.md` are excluded from the build.

## Media toolbox

| Medium | In Obsidian | On the site |
|---|---|---|
| Text + math | `$$...$$` | MathJax |
| Hand drawings | Excalidraw → export → upload | Image |
| Diagrams | ```` ```mermaid ```` blocks | Mermaid include |
| Animations | GIF / MP4 upload | Image / video |
| Interactive demos | `demos/<name>.html` (self-contained HTML/JS) | Embedded via `demo.html` |
| Heavier demos | Link to Colab / Hugging Face Space | Link or embed |
| Code | Fenced code blocks | Syntax-highlighted |

**Gotchas to verify during setup:**
- Math: kramdown can mangle `_` and `*` inside single-`$` inline math. Prefer `$$...$$` (kramdown treats inline `$$` as inline math), or test what MathJax config handles both.
- Obsidian-only syntax doesn't render on the site: `[[wikilinks]]`, `![[embeds]]`, callouts (`> [!note]`), `%%comments%%`. Callouts and comments could get a small styling/strip step later if needed.

## Existing material to migrate

Already in the vault (`Learn/Notes/`):
- `Fundamental Learning - AI Mindmap.md` → becomes `map.md`
- `DFS-BFS.md` → template only, not written yet — natural first note
- `Classical AI Algorithms.md` → hub note with a `[[DFS-BFS]]` wikilink; superseded by the map (the area branch replaces hub notes)

## Status

- ✅ **Fundamentals tab live** (`Fundamentals.html`): explanation + interactive markmap mindmap. Subtitle: *"What I cannot create, I do not understand."* (Feynman).
- The map currently lives in `_includes/fundamentals-map.md`. Once the `AI-Fundamentals` repo exists, it moves to `map.md` there and the page includes it from the submodule.

## Next steps

1. **Create the `AI-Fundamentals` GitHub repo** and clone it into the vault at `Learn/AI-Fundamentals/`; move the three existing files in; apply the Obsidian link settings.
2. **Build the site side** — submodule at `_fundamentals/`, `note.html` layout, markmap `Fundamentals.md`, MathJax / Mermaid / demo includes, navbar link; run locally to verify links, math, and the map.
3. **Write DFS-BFS as the first note** — with at least one non-text medium (a drawing of the traversal order, or a small step-through demo) — and use it as the template for the rest.
