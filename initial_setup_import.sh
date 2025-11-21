#!/usr/bin/env bash
set -euo pipefail

# Script: initial_setup_import.sh
# Purpose: Create branch, add project files for NaturoPath:101, commit, push, open PR.
# Usage: Run from the repository root after ensuring you are authenticated with gh CLI.
#
# Notes:
# - The script will attempt to create branch 'initial-setup'. If that branch exists locally or remotely,
#   it will create 'initial-setup-1', 'initial-setup-2', ... until an available name is found.
# - Requires `gh` (GitHub CLI) to open the PR. If gh is not available, the script will push the branch,
#   and print the git branch name; you can open the PR manually or install gh.
# - Adjust remote name if not 'origin'.

REMOTE=${REMOTE:-origin}
BASE_BRANCH=${BASE_BRANCH:-$(git rev-parse --abbrev-ref @{upstream} 2>/dev/null | sed 's@.*/@@' || echo main)}

# Find available initial-setup branch name
branch_base="initial-setup"
branch="$branch_base"
i=1
while git ls-remote --exit-code --heads $REMOTE refs/heads/$branch >/dev/null 2>&1; do
  branch="${branch_base}-${i}"
  i=$((i+1))
done

echo "Creating branch: $branch (base: $BASE_BRANCH)"
git fetch $REMOTE $BASE_BRANCH
git checkout -b "$branch" "refs/remotes/$REMOTE/$BASE_BRANCH" || git checkout -b "$branch" "$BASE_BRANCH"

# Create files (exact content as provided)
# product-requirements.md
cat > product-requirements.md <<'EOF'
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
  - Each content item must include references or “traditional-use” flag and publish date
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
- Prominent disclaimer and “when to seek medical care” information on condition pages
- Content must be reviewed & signed off by advisory board before publishing

Deliverables provided with this handoff:
- Data schema (JSON)
- Sample content entries (3–6 examples)
- CSV list of 101 condition names for content population
- Flutter starter skeleton (models + service stubs)
- Disclaimer, privacy & security guidance
EOF

# data-schema.json
cat > data-schema.json <<'EOF'
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "title": "NaturoPath Data Schema",
  "type": "object",
  "definitions": {
    "Phytochemical": {
      "type": "object",
      "properties": {
        "name": { "type": "string" },
        "synonyms": { "type": "array", "items": { "type": "string" } },
        "cas_number": { "type": ["string", "null"] },
        "pubchem_cid": { "type": ["integer", "null"] },
        "known_actions": { "type": "string" },
        "notes": { "type": "string" }
      },
      "required": ["name"]
    },
    "Image": {
      "type": "object",
      "properties": {
        "url": { "type": "string" },
        "alt_text": { "type": "string" },
        "type": { "type": "string", "enum": ["whole_plant","leaf","flower","fruit","processed","preparation"] }
      },
      "required": ["url", "alt_text"]
    }
  },
  "properties": {
    "condition": {
      "type": "object",
      "properties": {
        "id": { "type": "string" },
        "name": { "type": "string" },
        "synonyms": { "type": "array", "items": { "type": "string" } },
        "overview": { "type": "string" },
        "symptoms": { "type": "array", "items": { "type": "string" } },
        "red_flags": { "type": "string" },
        "recommended_plants": {
          "type": "array",
          "items": { "type": "string" }
        },
        "evidence_level": { "type": "string", "enum": ["traditional","in_vitro","animal","human_trial","strong_clinical"] },
        "references": { "type": "array", "items": { "type": "string", "format": "uri" } }
      },
      "required": ["id","name"]
    },
    "plant": {
      "type": "object",
      "properties": {
        "id": { "type": "string" },
        "scientific_name": { "type": "string" },
        "common_names": { "type": "array", "items": { "type": "string" } },
        "family": { "type": "string" },
        "description": { "type": "string" },
        "phytochemicals": {
          "type": "array",
          "items": { "$ref": "#/definitions/Phytochemical" }
        },
        "preparations": {
          "type": "array",
          "items": {
            "type": "object",
            "properties": {
              "method": { "type": "string" },
              "ingredients": { "type": "string" },
              "dosage": { "type": "string" },
              "duration": { "type": "string" },
              "notes": { "type": "string" }
            },
            "required": ["method"]
          }
        },
        "harvesting": { "type": "string" },
        "sustainability": { "type": "string" },
        "contraindications": { "type": "string" },
        "pregnancy_lactation_warning": { "type": "string" },
        "evidence_level": { "type": "string", "enum": ["traditional","in_vitro","animal","human_trial","strong_clinical"] },
        "images": {
          "type": "array",
          "items": { "$ref": "#/definitions/Image" }
        },
        "references": { "type": "array", "items": { "type": "string", "format": "uri" } }
      },
      "required": ["id","scientific_name"]
    }
  },
  "required": ["condition","plant"]
}
EOF

# sample-entries.json
cat > sample-entries.json <<'EOF'
{
  "entries": [
    {
      "condition": {
        "id": "cond-001",
        "name": "Common Cold",
        "synonyms": ["Upper respiratory infection", "Viral cold"],
        "overview": "A self-limited viral infection of the upper respiratory tract with runny nose, sore throat, sneezing and cough.",
        "symptoms": ["runny nose", "sore throat", "cough", "sneezing", "malaise"],
        "red_flags": "High fever, difficulty breathing, chest pain, symptoms >14 days, or sudden worsening — seek medical care.",
        "recommended_plants": ["plant-001"],
        "evidence_level": "human_trial",
        "references": ["https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3228576/"]
      },
      "plant": {
        "id": "plant-001",
        "scientific_name": "Echinacea purpurea",
        "common_names": ["Echinacea", "Purple coneflower"],
        "family": "Asteraceae",
        "description": "Traditionally used to support immune function and reduce duration of upper respiratory infections.",
        "phytochemicals": [
          {
            "name": "Alkamides",
            "synonyms": ["alkylamides"],
            "cas_number": null,
            "pubchem_cid": null,
            "known_actions": "Immune-modulating; interacts with CB2 and cytokine pathways.",
            "notes": "Profile varies by plant part and species."
          },
          {
            "name": "Cichoric acid",
            "synonyms": ["cichoric acid"],
            "cas_number": "70170-75-1",
            "pubchem_cid": 5281775,
            "known_actions": "Antioxidant; may influence immune signaling.",
            "notes": ""
          }
        ],
        "preparations": [
          {
            "method": "Tincture (1:5, 60% alcohol)",
            "ingredients": "Fresh or dried root/above-ground parts; alcohol",
            "dosage": "1–2 mL, 2–3 times daily for adults (traditional).",
            "duration": "Short-term during acute illness; avoid long continuous use without supervision.",
            "notes": "Commercial tinctures vary in concentration; follow label guidance."
          },
          {
            "method": "Infusion (tea)",
            "ingredients": "1–2 tsp dried herb per 250 mL boiling water",
            "dosage": "1 cup 2–3 times daily",
            "duration": "Short-term use for acute symptoms",
            "notes": ""
          }
        ],
        "harvesting": "Above-ground parts at flowering; roots in fall. Dry rapidly to prevent mold.",
        "sustainability": "Prefer cultivated sources; avoid wild overharvesting.",
        "contraindications": "Use cautiously in autoimmune disease; consult clinician if immunosuppressed.",
        "pregnancy_lactation_warning": "Limited data; consult clinician before use.",
        "evidence_level": "human_trial",
        "images": [
          {
            "url": "https://example.com/images/echinacea_whole.jpg",
            "alt_text": "Echinacea purpurea whole plant with purple flowers",
            "type": "whole_plant"
          }
        ],
        "references": [
          "https://pubmed.ncbi.nlm.nih.gov/15230848/",
          "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3228576/"
        ]
      }
    },
    {
      "condition": {
        "id": "cond-002",
        "name": "Insomnia",
        "synonyms": ["Difficulty sleeping", "Trouble falling asleep"],
        "overview": "Difficulty initiating or maintaining sleep that impacts daytime functioning.",
        "symptoms": ["difficulty falling asleep", "frequent awakenings", "non-restorative sleep"],
        "red_flags": "Sudden onset with severe daytime impairment, medication interactions, or underlying psychiatric/medical conditions — seek medical evaluation.",
        "recommended_plants": ["plant-002"],
        "evidence_level": "human_trial",
        "references": ["https://pubmed.ncbi.nlm.nih.gov/"]
      },
      "plant": {
        "id": "plant-002",
        "scientific_name": "Valeriana officinalis",
        "common_names": ["Valerian"],
        "family": "Caprifoliaceae",
        "description": "Root traditionally used for sleep aid and mild anxiety relief.",
        "phytochemicals": [
          {
            "name": "Valerenic acids",
            "synonyms": [],
            "cas_number": null,
            "pubchem_cid": null,
            "known_actions": "Proposed GABAergic modulation; CNS depressant effects.",
            "notes": ""
          }
        ],
        "preparations": [
          {
            "method": "Tincture",
            "ingredients": "Root in alcohol",
            "dosage": "0.5–2 mL before bedtime (follow product label)",
            "duration": "Short-term use; discuss with clinician for chronic insomnia.",
            "notes": "May interact with sedative medications and alcohol."
          }
        ],
        "harvesting": "Roots in fall, when energy is highest; dry carefully.",
        "sustainability": "Cultivated sources preferred.",
        "contraindications": "Avoid with sedatives, benzodiazepines, heavy alcohol use; caution with liver disease.",
        "pregnancy_lactation_warning": "Not recommended during pregnancy or breastfeeding without medical supervision.",
        "evidence_level": "human_trial",
        "images": [
          {
            "url": "https://example.com/images/valerian_root.jpg",
            "alt_text": "Valeriana officinalis dried root",
            "type": "processed"
          }
        ],
        "references": [
          "https://pubmed.ncbi.nlm.nih.gov/16379686/"
        ]
      }
    },
    {
      "condition": {
        "id": "cond-003",
        "name": "Mild Anxiety",
        "synonyms": ["Nervousness", "Situational anxiety"],
        "overview": "Excessive worry or nervousness affecting daily activities; mild forms may be managed adjunctively with lifestyle and botanical approaches.",
        "symptoms": ["worry", "restlessness", "muscle tension", "sleep disturbance"],
        "red_flags": "Severe anxiety, panic attacks, suicidal ideation or functional impairment — seek professional help.",
        "recommended_plants": ["plant-003"],
        "evidence_level": "human_trial",
        "references": []
      },
      "plant": {
        "id": "plant-003",
        "scientific_name": "Piper methysticum",
        "common_names": ["Kava"],
        "family": "Piperaceae",
        "description": "Root traditionally used in Pacific islands for anxiety and relaxation.",
        "phytochemicals": [
          {
            "name": "Kavalactones",
            "synonyms": [],
            "cas_number": null,
            "pubchem_cid": null,
            "known_actions": "CNS depressant, GABAergic modulation proposed.",
            "notes": "Known hepatotoxicity risk in some preparations; quality & solvent matter."
          }
        ],
        "preparations": [
          {
            "method": "Traditional aqueous preparation",
            "ingredients": "Ground root mixed in water",
            "dosage": "Traditional dosing varies; modern extracts differ—follow clinical guidance",
            "duration": "Short-term use; avoid chronic high-dose use.",
            "notes": "Potential for liver risk; contraindicated with alcohol and some medications."
          }
        ],
        "harvesting": "Roots harvested from mature plants; sustainable cultivation recommended.",
        "sustainability": "Cultivated sources help preserve wild populations.",
        "contraindications": "Avoid with liver disease, alcohol, CNS depressants; review drug interactions.",
        "pregnancy_lactation_warning": "Not recommended.",
        "evidence_level": "human_trial",
        "images": [
          {
            "url": "https://example.com/images/kava_root.jpg",
            "alt_text": "Kava root and prepared kava drink",
            "type": "processed"
          }
        ],
        "references": [
          "https://pubmed.ncbi.nlm.nih.gov/19535419/"
        ]
      }
    }
  ]
}
EOF

# conditions-101.csv
cat > conditions-101.csv <<'EOF'
id,name
cond-001,Common cold
cond-002,Influenza (flu)
cond-003,Sinusitis
cond-004,Allergic rhinitis (hay fever)
cond-005,Acute bronchitis
cond-006,Asthma (mild episodic)
cond-007,Cough (non-specific)
cond-008,Sore throat (pharyngitis)
cond-009,Strep throat
cond-010,Otitis media (ear infection)
cond-011,Conjunctivitis (pink eye)
cond-012,Tension headache
cond-013,Migraine (acute)
cond-014,Insomnia
cond-015,Anxiety (generalized)
cond-016,Depression (mild-to-moderate)
cond-017,Stress-related fatigue
cond-018,Irritable bowel syndrome (IBS)
cond-019,Indigestion / dyspepsia
cond-020,Acid reflux / GERD (mild)
cond-021,Nausea / motion sickness
cond-022,Acute diarrhea
cond-023,Constipation
cond-024,Bloating and gas
cond-025,Hemorrhoids
cond-026,Urinary tract infection (UTI)
cond-027,Vaginal yeast infection (candidiasis)
cond-028,Bacterial vaginosis
cond-029,Menstrual cramps (dysmenorrhea)
cond-030,Premenstrual syndrome (PMS)
cond-031,Menopausal symptoms (hot flashes, night sweats)
cond-032,Acne (mild-to-moderate)
cond-033,Eczema (atopic dermatitis)
cond-034,Psoriasis (mild)
cond-035,Rosacea
cond-036,Fungal skin infections (tinea / athlete's foot)
cond-037,Fungal nail infections (onychomycosis)
cond-038,Warts (common)
cond-039,Cold sores (herpes labialis)
cond-040,Minor wound care (cuts & abrasions)
cond-041,Minor burns / sunburn
cond-042,Insect bites & stings
cond-043,Allergic contact dermatitis
cond-044,Muscle strain & sprain
cond-045,Low back pain (mechanical)
cond-046,Osteoarthritis (mild-to-moderate)
cond-047,Rheumatoid arthritis (symptom adjunct)
cond-048,Gout (acute)
cond-049,Tendinitis
cond-050,Sinus headache
cond-051,Toothache (temporary symptomatic relief)
cond-052,Halitosis (bad breath)
cond-053,Dry mouth (xerostomia)
cond-054,Eye strain / dry eyes
cond-055,Dandruff / seborrheic dermatitis
cond-056,Hair loss (support)
cond-057,Bruises & contusions
cond-058,Cold & flu prevention (immune support)
cond-059,High blood pressure (mild, lifestyle adjunct)
cond-060,High cholesterol (adjunct lifestyle)
cond-061,Type 2 diabetes (adjunct support)
cond-062,Metabolic syndrome (adjunct)
cond-063,Weight management support
cond-064,Circulation issues / poor peripheral circulation
cond-065,Varicose veins (supportive)
cond-066,Peripheral neuropathy symptom support (mild)
cond-067,Migraine prevention
cond-068,Restless leg syndrome (RLS)
cond-069,Fibromyalgia symptom support
cond-070,Memory & cognitive support (mild)
cond-071,Focus & concentration support
cond-072,Seasonal affective disorder (SAD)
cond-073,Jet lag
cond-074,Hangover relief (symptomatic)
cond-075,Smoking cessation support (adjunct)
cond-076,Canker sores (aphthous ulcers)
cond-077,Tonsillitis
cond-078,Laryngitis
cond-079,Voice strain
cond-080,Earwax (cerumen) management
cond-081,Head lice
cond-082,Impetigo (minor skin bacterial infection)
cond-083,Shingles (herpes zoster) symptom relief
cond-084,Cold-induced chilblains
cond-085,Nail brittleness / brittle nails
cond-086,Oral thrush (oral candidiasis)
cond-087,Yeast diaper rash (infants)
cond-088,Infant colic
cond-089,Lactation / milk flow support
cond-090,Erectile dysfunction (adjunct)
cond-091,Sexual health / libido support (adjunct)
cond-092,Menstrual irregularities (adjunct)
cond-093,Fertility support (adjunct)
cond-094,Detoxification support (adjunct)
cond-095,Immune boosting for recurrent infections
cond-096,Atopic flare support (general)
cond-097,Postpartum recovery support
cond-098,Burnout & adrenal support
cond-099,General adaptogen / resilience support
cond-100,Wellness / daily tonic (general health support)
cond-101,Preventive herbal strategies (seasonal planning)
EOF

# disclaimer.md
cat > disclaimer.md <<'EOF'
NaturoPath: 101 — Important Legal & Medical Disclaimer

NaturoPath: 101 is an educational informational resource about herbal and plant-based remedies and their traditional and investigational uses. It is NOT a healthcare provider and does NOT provide medical diagnoses, medical advice, or treatment plans.

Before using any herbal remedy, especially if you:
- are pregnant or breastfeeding,
- have known allergies,
- have chronic medical conditions (e.g., autoimmune disease, heart disease, kidney disease, liver disease),
- are on prescription medication(s),
- or are considering replacing or weaning off prescription medication,

you MUST consult with a qualified healthcare professional (MD, DO, PharmD, or other licensed clinician). Herbal remedies can interact with prescription medications and may cause allergic reactions, adverse events, or interfere with ongoing treatments.

The information in this app is compiled from a variety of sources (traditional texts, scientific literature, pharmacopeias) and is intended for informational purposes only. Evidence levels are noted where available; some uses are traditional and lack rigorous clinical validation. The app's content should not be construed as endorsement of replacing prescription medications without medical supervision.

The Medicine Cabinet premium feature is an informational interaction-checking tool. It provides possible interactions based on known ingredient mappings and curated rules. It does NOT replace professional clinical judgment. Never stop or modify prescription medication without consulting your prescribing clinician.

If you experience any adverse reaction after using any remedy described in this app, stop use immediately and seek medical attention.

By using this app you agree that the developers, contributors, advisors, and distributors are not liable for outcomes resulting from use of the information provided. Always consult a healthcare professional before making changes to your medication or treatment plan.
EOF

# privacy-security.md
cat > privacy-security.md <<'EOF'
Privacy & Security Recommendations — NaturoPath: 101

- Default medicine cabinet storage: local-only on device, encrypted at rest (platform secure storage).
- If cloud sync is implemented: obtain explicit opt-in consent, encrypt data in transit (TLS 1.2+) and at rest (AES-256).
- Avoid storing identifiable health data on analytics; use aggregated metrics only.
- Provide user data export and delete functions (GDPR/CCPA compliance).
- Authentication: email/password with optional 2FA; optional "local-only account" mode using device-backed secure storage.
- If handling cloud-stored health data, evaluate HIPAA applicability and sign BAAs where necessary; follow appropriate controls.
- Logging: do not log medication names or identifiers in plaintext in server logs.
- Vulnerability management: regular dependency scanning, security tests, annual penetration test.
EOF

# api-design.md
cat > api-design.md <<'EOF'
API Design — NaturoPath (high-level)

Suggested stack: Node.js + GraphQL (Apollo) or REST; PostgreSQL for relational content; Elasticsearch (or OpenSearch) for search & fuzzy matching.

Endpoints (examples)
- GET /api/v1/search?q=cold&type=condition,plant
- GET /api/v1/conditions/{id}
- GET /api/v1/plants/{id}
- GET /api/v1/plants/{id}/images
- POST /api/v1/users/{userId}/medicine-cabinet (if cloud storage allowed)
- GET /api/v1/users/{userId}/medicine-cabinet
- POST /api/v1/interactions/check
  - body: { medicationIds: [...], herbIds: [...], localPhytochemicals: [...] }
  - returns: [{ type: "drug-herb", severity: "avoid", explanation: "...", references: [...] }]

Interaction Engine
- Step 1: Map drug names to active ingredient(s) and RxNorm IDs (using RxNorm API).
- Step 2: Expand herb phytochemical list (PubChem/DrugBank IDs).
- Step 3: Run rule-based checks:
  - CYP450 inhibition/induction rules
  - Additive pharmacodynamic risks (e.g., anticoagulation, sedation, serotonergic)
  - Allergic cross-reactivity
  - Known contraindications (pregnancy, autoimmune)
- Step 4: Return severity-coded recommendations with citations and confidence score.

Notes
- All interaction logic must include references to source literature or databases.
- Start with curated rules, then expand with external APIs (DrugBank, PubChem, RxNorm, PubMed).
EOF

# ui-wireframes.md
cat > ui-wireframes.md <<'EOF'
UX / UI Notes & Wireframes (high level)

Home
- Search bar (prominent) with typeahead suggestions (conditions, plants).
- Quick categories: Top 10 conditions, New entries, Favorites.
- Subscription status & access button.

Search results
- Separate tabs: Conditions | Plants
- Result item: name, short excerpt, evidence badge, favorite icon.

Condition page
- Title + synonyms + quick "when to see doctor" banner.
- Symptoms at top, then recommended plant cards (tap to open).
- "Quick use" box for short remedy steps.
- References & evidence level section.

Plant page
- Hero image carousel
- Scientific + common names, taxonomy
- Quick safety ribbon (pregnancy, kids, meds)
- Tabs: Overview | Phytochemicals | Preparations | Harvesting | Interactions
- Interactive "Check interactions with my meds" CTA (Premium)

Medicine Cabinet (Premium)
- Add medication via search or barcode/Rx bottle photo OCR (opt-in).
- Cabinet view lists medications with active ingredient and date added.
- "Check interactions" button to run the engine and display badges:
  - Green (no known interactions)
  - Yellow (caution — monitor)
  - Red (avoid/seek clinician)
- Each alert shows short reason + source links.

Settings
- Download content for offline use
- Manage subscription & billing (app store vs web)
- Data management: export, delete
- Legal & about
EOF

# subscription-pricing.md
cat > subscription-pricing.md <<'EOF'
Subscription & Pricing Options (suggested)

Free (Trial / Basic)
- Browse limited sample content (e.g., 10 conditions)
- Typeahead search & reading basic plant pages (no phytochemical detail)
- In-app ads (optional)

Standard (One-time purchase or subscription)
- Full access to all 101 conditions and plant pages
- High-res images, offline downloads
- Evidence tags & references
- Price ideas: One-time $9.99–$19.99 OR $2.99/month or $19.99/year

Premium (Subscription)
- All Standard features plus:
  - Medicine Cabinet with interaction checks
  - Real-time interaction alerts and references
  - Priority content updates & premium downloads
- Mandatory IAP on mobile: use Apple/Google IAP
- Web: Stripe subscription
- Price ideas: $5.99–$9.99/month or $49.99/year

Notes
- Mobile stores require use of their IAP for in-app digital content; ensure pricing & billing flows conform to store policies.
- Consider discounted educational/practitioner licenses.
EOF

# content-template.md
cat > content-template.md <<'EOF'
NaturoPath Content Entry Template (use for each of 101 conditions)

Condition
- id: cond-###
- name:
- synonyms: []
- overview: (1–3 sentence summary)
- symptoms: []
- red_flags: (when to see a doctor)
- recommended_plants: [plant-###, plant-###]
- evidence_level: (traditional / in_vitro / animal / human_trial / strong_clinical)
- references: [url1, url2]

Plant
- id: plant-###
- scientific_name:
- common_names: []
- family:
- description: (1–3 sentences)
- phytochemicals:
  - name:
    synonyms: []
    cas_number:
    pubchem_cid:
    known_actions:
    notes:
- preparations:
  - method: (eg. tincture, infusion)
    ingredients:
    dosage:
    duration:
    notes:
- harvesting:
- sustainability:
- contraindications:
- pregnancy_lactation_warning:
- evidence_level:
- images: [{url, alt_text, type}]
- references: [url1, url2]

Editorial checklist (for each entry)
- [ ] Herbalist review completed (name + date)
- [ ] Clinical review completed (MD/PharmD name + date)
- [ ] Legal copy reviewed
- [ ] Sources & PubMed links attached
- [ ] Evidence level set
EOF

# Flutter starter directory and files
mkdir -p flutter-starter/lib/models
mkdir -p flutter-starter/lib/services
mkdir -p flutter-starter/lib/screens

# flutter-starter/pubspec.yaml
cat > flutter-starter/pubspec.yaml <<'EOF'
name: naturo_path_101
description: NaturoPath: 101 — plant-based remedies reference app (starter)
version: 0.1.0
environment:
  sdk: ">=2.18.0 <3.0.0"
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  flutter_riverpod: ^2.0.0
  http: ^0.13.0
  hive: ^2.0.0
  hive_flutter: ^1.1.0
  flutter_secure_storage: ^7.0.0
dev_dependencies:
  flutter_test:
    sdk: flutter
EOF

# flutter-starter/lib/main.dart
cat > flutter-starter/lib/main.dart <<'EOF'
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize local DBs, Hive, etc.
  runApp(const ProviderScope(child: NaturoPathApp()));
}

class NaturoPathApp extends StatelessWidget {
  const NaturoPathApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NaturoPath: 101',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomeScreen(),
    );
  }
}
EOF

# flutter-starter/lib/models/condition.dart
cat > flutter-starter/lib/models/condition.dart <<'EOF'
class Condition {
  final String id;
  final String name;
  final List<String> synonyms;
  final String overview;
  final List<String> symptoms;
  final String redFlags;
  final List<String> recommendedPlantIds;
  final String evidenceLevel;

  Condition({
    required this.id,
    required this.name,
    this.synonyms = const [],
    this.overview = '',
    this.symptoms = const [],
    this.redFlags = '',
    this.recommendedPlantIds = const [],
    this.evidenceLevel = 'traditional',
  });
}
EOF

# flutter-starter/lib/models/plant.dart
cat > flutter-starter/lib/models/plant.dart <<'EOF'
class Plant {
  final String id;
  final String scientificName;
  final List<String> commonNames;
  final String family;
  final String description;

  Plant({
    required this.id,
    required this.scientificName,
    this.commonNames = const [],
    this.family = '',
    this.description = '',
  });
}
EOF

# flutter-starter/lib/services/medicine_cabinet_service.dart
cat > flutter-starter/lib/services/medicine_cabinet_service.dart <<'EOF'
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MedicineCabinetService {
  // Local-only, encrypted storage for user's medications (default).
  final _storage = const FlutterSecureStorage();

  // Key for medication list (encrypted)
  static const _medKey = 'naturo_med_list_v1';

  Future<void> saveMedicationList(String jsonList) async {
    await _storage.write(key: _medKey, value: jsonList);
  }

  Future<String?> loadMedicationList() async {
    return await _storage.read(key: _medKey);
  }

  Future<void> clearMedicationList() async {
    await _storage.delete(key: _medKey);
  }

  // Interaction check stub: in the app this would call a local rule engine,
  // or (with explicit consent) a backend interaction API.
  Future<List<Map<String, dynamic>>> checkInteractions({
    required List<String> medicationActiveIngredients,
    required List<String> herbPhytochemicals,
  }) async {
    // TODO: implement rule-based checks (CYP interactions, additive PD, allergy signals)
    // For the starter, return an empty list (no interactions detected).
    return [];
  }
}
EOF

# flutter-starter/lib/screens/home_screen.dart
cat > flutter-starter/lib/screens/home_screen.dart <<'EOF'
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NaturoPath: 101'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('Search conditions'),
              onPressed: () {
                // TODO: navigate to search page
              },
            ),
            ElevatedButton(
              child: const Text('My Medicine Cabinet (Premium)'),
              onPressed: () {
                // TODO: show purchase / local-only cabinet
              },
            ),
          ],
        ),
      ),
    );
  }
}
EOF

# flutter-starter/README.md
cat > flutter-starter/README.md <<'EOF'
NaturoPath: 101 — Flutter starter

What this includes:
- Basic Flutter app shell (main.dart)
- Models: Condition, Plant
- MedicineCabinetService: local-only, encrypted storage using flutter_secure_storage
- Simple Home screen with placeholders

Next steps for developers:
- Wire up content ingestion: load JSON content into local DB (Hive or SQLite).
- Implement search with local inverted index (or integrate OpenSearch/Elasticsearch backend).
- Implement offline bundles (zip content + images + index).
- Build UI pages for Condition and Plant detail, image gallery, and evidence/references view.
- Implement in-app purchases using in_app_purchase for iOS/Android and Stripe for web.
- Implement interaction engine: local rule-set first (conservative), expand to server-side with citations if needed.
- Add advisory board content workflow & legal signoffs before publishing content publicly.

Notes on medicine cabinet:
- Default behavior: local-only, encrypted. Keep all medication names and lists off analytics.
- Provide export/delete functionality for user portability and right-to-be-forgotten compliance.
EOF

# Add files to git
git add product-requirements.md data-schema.json sample-entries.json conditions-101.csv disclaimer.md privacy-security.md api-design.md ui-wireframes.md subscription-pricing.md content-template.md flutter-starter

git commit -m "Initial project import: product docs, data schema, sample entries, CSV list, disclaimer, privacy, and Flutter starter."

# Push branch
git push -u $REMOTE "$branch"

# Open PR using gh if available
if command -v gh >/dev/null 2>&1; then
  pr_title="Initial project import: product docs, data schema, sample entries, conditions list, disclaimer, privacy, API/UI docs, and Flutter starter"
  pr_body="This pull request adds the initial project documentation, data schema, sample entries, the CSV list of 101 conditions, legal disclaimers, privacy/security guidance, API and UI notes, subscription/pricing, a content template, and a Flutter starter skeleton. All content must be reviewed and approved by the editorial/advisory board before publishing.\n\nBranch: $branch -> $BASE_BRANCH"
  gh pr create --title "$pr_title" --body "$pr_body" --base "$BASE_BRANCH" --head "$branch" || {
    echo "PR creation failed with gh. Branch pushed: $branch. Open a PR manually."
    exit 0
  }
  echo "Pull request created successfully."
else
  echo "gh CLI not installed or not available. Branch pushed: $branch"
  echo "Install GitHub CLI and run: gh pr create --title \"Initial project import...\" --body \"...\" --base $BASE_BRANCH --head $branch"
fi

echo "Done."
EOF