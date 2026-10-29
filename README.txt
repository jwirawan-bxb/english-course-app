English Communication & Grammar Mastery
========================================

A self-paced, browser-based English course covering everyday communication
and core grammar -- from titles and sentence building through the perfect
tenses -- with lessons, quizzes, milestone exams, and pronunciation
practice. It's a single-page app hosted on Azure Static Web Apps and
protected by Microsoft Entra ID sign-in.

Course content
--------------
 1. English Communication Guide       - Addressing people using titles, general & formal titles, interjections
 2. English Grammar Essentials        - Verb forms, personal pronouns, building blocks of a sentence
 3. Auxiliaries & Sentence Patterns   - Sentence patterns; to be, to do, to have, and modals
 4. Simple Present                    - Overview, when to use it, habit practice
 5. Present Continuous                - Overview, when to use it
 6. Non-Progressive Verbs             - Formula, verb categories, verbs that shift meaning
 7. Simple Past                       - Overview; affirmative, negative, and interrogative forms
 8. Past Continuous                   - Overview, primary uses, examples in context
 9. Present Perfect                   - Overview, when to use it, comparison with other tenses
10. Present Perfect Continuous        - Overview, when to use it
11. Past Perfect                      - Overview, when to use it

Assessments: four milestone exams (Communication Foundations; Present &
Continuous; Past & Perfect; Perfect Tenses) plus a final exam.

Features
--------
- Lessons and quizzes with per-question explanations and progress tracking
- Pronunciation practice using the browser's speech synthesis (listen) and
  speech recognition (speak) -- works best in Chrome or Edge, and needs
  microphone permission
- Progress saved locally in the browser (localStorage), so learners can
  pick up where they left off on the same device
- Single sign-on through Microsoft Entra ID; the signed-in user is read
  from /.auth/me
- Privacy/consent notice in the navigation
- Bit by Bit branding with light and dark modes

Repository layout
------------------
index.html                    The entire app: markup, styles, scripts, and course content
staticwebapp.config.json      Requires sign-in for every route; redirects 401s to Entra ID login
.github/workflows/...yml      GitHub Actions workflow that deploys to Azure Static Web Apps
update.bat                    Windows helper: commit all changes and push
README.md / README.txt        This file, in Markdown and plain-text form
CLAUDE.md                     Session/handover notes for AI assistants working on this repo

Running locally
----------------
No build step is needed. Open index.html in a browser, or serve the
folder:

    python -m http.server 8000
    (then visit http://localhost:8000)

Sign-in (/.auth/*) only works on Azure. To test authentication locally,
use the Azure Static Web Apps CLI
(https://learn.microsoft.com/azure/static-web-apps/static-web-apps-cli-overview):

    npx @azure/static-web-apps-cli start .

Deployment
----------
Every push to main triggers the Azure Static Web Apps CI/CD workflow,
which uploads the repo root as the site (no build). Pull requests against
main get a staging preview environment that's removed when the PR closes.

The workflow needs the repository secret
AZURE_STATIC_WEB_APPS_API_TOKEN_PURPLE_SKY_0E55E000F.

Quick update (Windows):
Double-click update.bat to stage everything, commit with the message
"update via Claude", and push -- which redeploys the site.

Access control
--------------
staticwebapp.config.json limits every route to the "authenticated" role.
Anyone who isn't signed in is redirected to /.auth/login/aad. To limit
access to specific users or groups, set this up in the Static Web App's
Entra ID settings or assign custom roles.
