# CLAUDE.md

Context for an AI assistant (or developer) picking up this repo. Read this first, then `README.md` for the product-level overview.

## What this repo is

A single-page, static English course app (`index.html`, ~680KB, no build step) hosted on Azure Static Web Apps, gated by Microsoft Entra ID sign-in via `staticwebapp.config.json`.

## Session summary (2026-09 to 2026-10)

**Implemented:**
- Added a "Privacy" link to the top nav (next to "Sign out") that opens an in-app consent/cookie modal. It reuses the existing `summaries-card` modal pattern (`state.showPrivacy` flag, `openPrivacyModal()` / `closePrivacyModal()`, `trapModalFocus`/`releaseModalFocus` for focus trapping and Escape-to-close). CSS added as `.privacy-body` on top of existing theme variables, so it follows light/dark mode automatically. See `privacyModalHtml()` in `index.html`.
- Added `README.md` and `README.txt` (plain-text mirror) documenting the course content, features, repo layout, local-run instructions, deployment, and access control.
- Added this `CLAUDE.md`.

**Verified:**
- Code reviewed by inspection against the existing, already-working `courseSummariesModalHtml()` pattern — structurally identical (same overlay/close/focus-trap mechanics), so expected to behave the same.
- The app was opened in a local Chrome window for manual visual confirmation, but **no automated browser test was run** — this environment has no Node.js, Python, or browser-automation tooling (Playwright/chromium-cli) installed, so clicking through the modal (open/close via X, overlay click, Escape; light and dark theme) has not been confirmed by the assistant itself.

**Open items:**
- Manual confirmation that the Privacy modal renders and closes correctly (X button, overlay click, Escape) in both themes is still outstanding — do this before treating the feature as fully verified.
- If automated UI verification is wanted going forward, this machine needs Node.js + Playwright (or chromium-cli) installed; none of those were available this session.

## Gotchas / rules encountered this session

- **Git remote is outside org policy.** This repo's remote (`github.com/jwirawan-bxb/english-course-app`) is a personal GitHub account, not Azure DevOps or the GitHub "Bit-By-Bit-NYC" org required by this user's organization policy. The user has explicitly acknowledged this and asked to proceed anyway; future sessions should still flag it before pushing, since the policy says it "will be blocked soon."
- **No build/test tooling in this environment.** There's no `package.json`/Node project — it's a hand-authored static HTML file. Don't assume `npm test` or similar exists.
- **`/.auth/me` fails gracefully.** `loadUser()` in `index.html` wraps its fetch in try/catch specifically so the app still renders (as "Guest") when previewed locally outside Azure — don't add error UI around this, it's intentional.
- **One HTML file holds everything.** Markup, CSS, and all JS (course content, quiz logic, modals) live in `index.html`. There's no module system or bundler — new features should follow the existing inline `<style>`/`<script>` + template-literal-render pattern already used throughout (see `renderCourse()` and the `*ModalHtml()` functions).

## Setup / running

No build step. See `README.md` → "Running locally" and "Deployment" for exact commands (`python -m http.server`, Azure SWA CLI for auth testing, GitHub Actions auto-deploy on push to `main`).
