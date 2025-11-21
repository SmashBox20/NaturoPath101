Product Requirements — NaturoPath: 101

Overview
- NaturoPath: 101 is a cross-platform (mobile, tablet, desktop, web) searchable catalog of 101 common conditions with plant/herbal remedies, phytochemical breakdowns, harvesting/preparation guidance, evidence tags, high-quality images, and safety/contraindication notes.
- Target platforms: Android (Play), iOS (App Store), macOS, Windows (Microsoft Store), Linux (optional), and web (PWA).
- Primary UI implementation: Flutter (Dart) for a single codebase compiling to mobile and desktop.
- Architecture: Flutter front-end, optional backend (Node/GraphQL or Firebase) for sync & content updates. Medicine Cabinet (premium) defaults to local-only storage (encrypted) for privacy; cloud sync optional with explicit consent and enhanced compliance.

Core Features
- Catalog of 101 conditions (searchable by condition name, synonyms, ICD-like keywords).
- Plant pages (per plant) with:
  - Scientific name, common names, taxonomy
  - Multiple images with alt text
  - Phytochemical list (names + PubChem/CAS where available)
  - Known or proposed mechanisms of action
  - Preparation methods (tea, tincture, poultice, topical)
  - Dosage guidance (traditional ranges & safety limits)
  - Harvesting/sustainability guidance
  - Contraindications, pregnancy/lactation warnings
  - Evidence level and references (PubMed / pharmacopeia links)
- Condition pages with:
  - Brief overview, common symptoms, red flags (when to see a doctor)
  - Linked plant(s) and quick-usage boxes
  - Evidence & references
- Search:
  - Fast typeahead, fuzzy search, synonym mapping
  - Filters: evidence level, route of administration, contraindications (pregnancy, children), severity
- Images:
  - Multiple high-resolution images per plant
  - Local caching & offline download bundles
- Offline:
  - Content bundles available for download (selectable)
- Premium Medicine Cabinet:
  - Add prescriptions by name or barcode/OCR
  - Map medications to active ingredients (RxNorm/OpenFDA)
  - Compare active ingredients to herb phytochemicals and known interaction rules
  - Return severity-coded alerts with rationale & references
  - Store medicine cabinet local-only by default (encrypted) — cloud sync optional
- Account & subscription:
  - Email/password (optional OAuth)
  - IAP: Apple / Google in-app purchases for mobile; Stripe for web
- Content moderation & provenance:
  - Evidence level tags (traditional / in_vitro / animal / human_trial / strong_clinical)
  - Each content item must include references or "traditional-use" flag and publish date
  - Advisory board sign-off workflow for clinical claims

Safety & Legal
- Prominent in-app disclaimer: app is informational only, not a healthcare provider. Users must consult clinicians before starting, stopping, or substituting prescription medications.
- Safety ribbon on every plant/condition (pregnancy, children, autoimmune, anticoagulants, CYP interactions).
- Advisory board: at least one licensed herbalist + one clinician (MD/DO/PharmD).
- Content review workflow and versioning.
- Data protection: default medicine cabinet local-only and encrypted; if cloud sync required, evaluate HIPAA applicability and sign BAA with storage provider.

Tech Stack (recommended)
- Frontend: Flutter (Dart), Riverpod or Provider for state, flutter_local_notifications
- Backend (optional): Node.js + GraphQL (Apollo) or Firebase (Firestore + Cloud Functions) for content updates
- DB: PostgreSQL for canonical content; Elasticsearch or OpenSearch for search functionality (hosted or managed)
- Image CDN: Cloudflare / AWS CloudFront + S3 (or Firebase Storage)
- Pharm/Drug data: RxNorm (US), OpenFDA, DrugBank (license required), PubChem for phytochemical mapping
- Payment: Apple/Google IAP for mobile, Stripe for web
- CI/CD: GitHub Actions for builds, Fastlane for mobile app store automation
- Analytics: Privacy-respecting (no PHI), e.g., posthog self-hosted or Amplitude with strict filtering

Monetization & Pricing
- Free tier: sample content (e.g., 10 conditions), typeahead, basic plant pages
- Standard: one-time purchase OR subscription — full content, offline bundles
- Premium: subscription — medicine cabinet, interaction checks, priority updates
- Suggested prices:
  - Standard: $9.99 one-time OR $2.99/month or $19.99/year
  - Premium: $5.99–$9.99/month or $49.99/year
- App store notes: follow Apple/Google guidelines for in-app purchases; do not charge externally for features unlocked inside the app in a way that violates store policies.

Content Roadmap (phased)
- Phase 0 (2–4 weeks): finalize editorial board, legal review, build content template, create first 15–25 fully reviewed entries
- Phase 1 (8–12 weeks): build Flutter MVP, 50 conditions fully populated, search, standard tier, basic offline
- Phase 2 (8 weeks): add medicine cabinet (local-only), interaction engine initial rule-set, 101 completed content, advisory board review
- Phase 3 (4–6 weeks): app stores submission, marketing, practitioner outreach

Acceptance Criteria
- Search returns relevant results with fuzzy/synonym matching
- Each of 101 condition pages links to at least one plant page
- Medicine cabinet is encrypted locally; interaction check returns severity-coded results with references
- Prominent disclaimer and "when to seek medical care" information on condition pages
- Content must be reviewed & signed off by advisory board before publishing

Deliverables provided with this handoff:
- Data schema (JSON)
- Sample content entries (3–6 examples)
- CSV list of 101 condition names for content population
- Flutter starter skeleton (models + service stubs)
- Disclaimer, privacy & security guidance
