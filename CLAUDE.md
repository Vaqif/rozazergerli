# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

The official one-page website for Roza Zərgərli (singer, theatre director, actress). There is no build system, package manager or tests. The entire site is one hand-written file, `index.html`, with inline CSS and vanilla JS (an ES5-style IIFE with no dependencies). Only Google Fonts is loaded from outside.

- `index.html` holds all markup, CSS, JS and translations (~96 KB). The photos it displays live in `img/` (`hero.jpg`, `portrait.jpg`, `gallery-01…11.jpg`) and are referenced by relative path.
- **Deployment:** GitHub Pages serves the root of the `main` branch of `github.com/Vaqif/rozazergerli` at https://rozazergerli.com (DNS on Cloudflare). A push to `main` goes live within 1–2 minutes. Do not delete the `CNAME` file, because it holds the custom domain.
- `photos/` holds the original source photos, kept only as a backup. The page does not reference them.
- **Never embed images as base64 `data:` URIs.** The site originally did this, and the resulting 2.2 MB HTML took about 20 s to download. The reveal script sits at the end of the file, so every `.reveal` section stayed blank until the download finished.
- `README.md` and `YENILEME.md` (both in Azerbaijani, written for the non-technical site owner) cover deployment and step-by-step content updates, When you change a structure these guides describe (show markup, `data-shows` format, i18n keys, photo anchors), update the guides too. `README.txt` is the older short version of the README.

To preview, open `index.html` in a browser or serve the folder (`python3 -m http.server`). The YouTube modal and the Spotify/Apple Music embeds only work on a real domain (see "Sandbox detection" below).

## Working with the file

- The `var I18N=` translation table is a single ~24 KB line near the end of the script. Find it with `grep -n 'var I18N=' index.html`, and edit it with an exact string replacement in a script rather than by reading the line in full.
- To change a photo, overwrite the matching file in `img/`. Resize it to about 1200 px wide first; no HTML change is needed.
- The site copy is written in Azerbaijani first. Russian and English come from the translation table.

## Architecture

**Page structure.** A fixed `.nav` sits above `<main>`, which holds sections in this order: hero, `#haqqinda` (about), `#musiqi`, `#konsertler`, `#sehne` (stage/theatre), `#videolar`, `#qalereya`, `#xeberler` (news), `#mediakit` (brand partnerships), `#elaqe` (contact). The lightbox (`#lb`) and video modal (`#modal`) come after that, then the footer. The section anchors are Azerbaijani words, and the nav links point to them.

**Theming.** Colour tokens are CSS custom properties on `:root` (a dark "garnet/gold" palette by default). A light palette applies in three places: under `prefers-color-scheme: light` (guarded by `:not([data-theme="dark"])`), under `[data-theme="light"]`, and again for `[data-theme="dark"]`. If you change a token, update all of these blocks. The footer `#theme` button saves the choice to `localStorage['rz-theme']`.

**i18n (AZ/RU/EN).** Any element with `data-i18n="key"` gets its **innerHTML** replaced from `I18N[key][lang]` in the script near the end of the file. `META[lang]` holds the page title and meta description.
- The Azerbaijani text is written twice: once in the HTML and once in `I18N`. Changing visible copy means editing the HTML text **and** all three language strings in `I18N`. Otherwise the text changes back when someone switches language.
- Because the value goes into innerHTML, translations carry their markup, for example `<i>.</i>` in section headings and `<span class="tag">` in `ct_msk`.
- Language is chosen in this order: `localStorage['rz-lang']`, then a `#az`/`#ru`/`#en` URL hash, then `navigator.language`, then `az`.

**Video.** Any element with `data-yt="<YouTube ID>"` (disco cards, track play buttons, video cards, the hero CTA) opens the `#modal` YouTube iframe. The current featured clip ID `wkLrPWz6hgQ` appears in many places (hero, first disc, first track, big video card, first news item). Replace every occurrence when a new clip is featured. Thumbnails are loaded from `i.ytimg.com/vi/<id>/…` and `onerror` removes them if missing.

**Sandbox detection.** If the hostname matches `claude.ai`/`claudeusercontent.com`, the page adds the `.sandboxed` class to `<html>`. Videos then open on YouTube in a new tab, and the Spotify/Apple iframes are swapped for fallback links.

**Concerts and countdown.** Each show is an `<li class="show">` in `<ul class="shows">`. The countdown reads `#countdown[data-shows]`, a `;`-separated list of `ISO-datetime-with-offset|i18n-city-key` entries in chronological order. When adding or removing a show, keep three things in sync: the `<li>`, its `data-shows` entry, and its `ct_*`/`v_*` keys in `I18N`. The countdown strips any `<span…` from the city string, so tag spans are safe to use there. Once every date has passed, it shows `I18N.cd_done`.

**Motion.** Elements with `.reveal` or `.reveal-stagger` get the `.in` class from an IntersectionObserver. `[data-count]` / `[data-suffix]` numbers count up when they come into view. The page also has hero parallax, sparks, and a gold "dust" cursor trail on fine pointers. All of these are skipped under `prefers-reduced-motion`. The `#ticker` code is dead, because the page has no element with that id.

**Contact form.** This is client-side only. `#send` checks the `[required]` fields and shows the `#ok` message. **Nothing is sent anywhere.** Real delivery would need a backend or a form service.

## Pitfalls and checks

- **A missing `>` does not show up as a visible HTML error.** The browser parses the next tag as attributes of the unclosed tag. With `data-i18n` this does real damage: `setLang` then overwrites the whole wrapper, and content disappears. Earlier, six section headings lost their `<h2>` and lead paragraph this way. After editing markup, run a tag-balance check with Python's `html.parser`.
- **Layout breakpoints:** the nav switches to the burger menu at `max-width:1180px`. Below that width the AZ/RU menu labels overflow the bar. Test layout changes in all three languages at 320px, 375px, 1024px and 1181px: Russian strings (menu, form `<select>` options) are the longest, and `document.documentElement.scrollWidth` must equal the viewport width.
- **Hidden-then-animated elements** (`opacity:0` plus an animation) must also appear in the `prefers-reduced-motion` override block. Otherwise they stay invisible for users who have reduced motion enabled, because the global rule sets `animation:none`.
