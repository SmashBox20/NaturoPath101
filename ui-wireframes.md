# UI / UX Notes & Wireframes — NaturoPath: 101

## Design Principles

### 1. Safety First
- Prominent disclaimers
- Clear red flag warnings
- Evidence levels visible
- Easy access to "when to see a doctor" information

### 2. Clarity & Readability
- Clean, uncluttered interface
- High contrast for readability
- Clear typography hierarchy
- Accessible design (WCAG 2.1 AA minimum)

### 3. Trust & Authority
- Professional, scientific aesthetic
- Display advisory board credentials
- Show references and evidence levels
- Transparent about limitations

### 4. User-Friendly
- Intuitive navigation
- Fast search with instant results
- Offline capability clearly indicated
- Consistent interaction patterns

## Color Palette

### Primary Colors
- **Primary Green**: #2D7A3E (trust, natural, healing)
  - Light: #4A9D5F
  - Dark: #1F5A2D
- **Secondary Sage**: #8B9D83 (calm, natural)
- **Accent Gold**: #D4A855 (premium, quality)

### Semantic Colors
- **Success**: #2D7A3E
- **Warning**: #E67E22 (moderate severity)
- **Danger**: #C0392B (severe contraindications)
- **Info**: #3498DB

### Neutrals
- **Background**: #FAFAF8 (warm white)
- **Surface**: #FFFFFF
- **Text Primary**: #2C3E50
- **Text Secondary**: #7F8C8D
- **Divider**: #E0E0E0

## Typography

### Font Families
- **Headings**: Merriweather or Lora (serif for authority)
- **Body**: Inter or Open Sans (sans-serif for readability)
- **Scientific Names**: Georgia (italic serif)

### Type Scale
- **H1**: 32px / 2rem (page titles)
- **H2**: 24px / 1.5rem (section headers)
- **H3**: 20px / 1.25rem (subsections)
- **Body**: 16px / 1rem (main content)
- **Small**: 14px / 0.875rem (metadata, captions)
- **Tiny**: 12px / 0.75rem (disclaimers, fine print)

## Iconography

- **Style**: Outline/line icons (Material Icons or custom)
- **Size**: 24px default, 16px small, 32px large
- **Color**: Inherit from text or use semantic colors

## Layout & Navigation

### Mobile (Primary Target)

#### Bottom Navigation (5 tabs max)
1. **Home/Search** (magnifying glass icon)
2. **Browse** (book/list icon)
3. **Saved** (bookmark icon) - saved plants/conditions
4. **Medicine Cabinet** (medical cross icon) - Premium feature, locked for free users
5. **More** (three dots icon) - settings, about, subscription

#### Top App Bar
- Back button (when applicable)
- Page title
- Actions (search, filter, share)
- Overflow menu (three dots)

### Tablet/Desktop

#### Sidebar Navigation
- Persistent sidebar on left (200-250px)
- Search bar at top
- Navigation categories
- Bottom: User profile/settings

#### Main Content Area
- Responsive grid (1-3 columns depending on screen width)
- Floating action button for quick actions (mobile)
- Breadcrumbs for navigation hierarchy

## Screen Wireframes

### 1. Home / Search Screen

```
┌────────────────────────────────────┐
│  NaturoPath: 101           [≡]     │ ← Header
├────────────────────────────────────┤
│                                    │
│  ┌──────────────────────────────┐ │
│  │ 🔍 Search conditions, plants │ │ ← Search bar
│  └──────────────────────────────┘ │
│                                    │
│  Quick Links:                      │
│  ┌────────┐ ┌────────┐ ┌────────┐│
│  │ Common │ │ Immune │ │  Pain  ││ ← Category chips
│  │  Cold  │ │ Support│ │ Relief ││
│  └────────┘ └────────┘ └────────┘│
│                                    │
│  Recently Viewed                   │
│  ┌──────────────────────────────┐ │
│  │ 🌿 Echinacea                 │ │
│  │ Immune support • Moderate... │ │
│  │ ⭐⭐⭐⭐ Human trial evidence │ │
│  └──────────────────────────────┘ │
│  ┌──────────────────────────────┐ │
│  │ 💊 Common Cold               │ │
│  │ Upper respiratory infection  │ │
│  └──────────────────────────────┘ │
│                                    │
│  Featured Content                  │
│  ┌──────────────────────────────┐ │
│  │ [Image: Valerian]            │ │
│  │ Sleep Better Naturally       │ │
│  │ Learn about Valerian root    │ │
│  └──────────────────────────────┘ │
│                                    │
└────────────────────────────────────┘
│ [🏠] [📚] [🔖] [💊] [⋯] │ ← Bottom nav
└────────────────────────────────────┘
```

### 2. Search Results Screen

```
┌────────────────────────────────────┐
│  ← Search Results         [Filter] │
├────────────────────────────────────┤
│  ┌──────────────────────────────┐ │
│  │ 🔍 sleep                 [x] │ │
│  └──────────────────────────────┘ │
│                                    │
│  [Conditions] [Plants] [All]       │ ← Tabs
│  ────────────                      │
│                                    │
│  3 conditions, 5 plants found      │
│                                    │
│  CONDITIONS                        │
│  ┌──────────────────────────────┐ │
│  │ Insomnia                     │ │
│  │ Sleep disorder • 3 remedies  │ │
│  │ ⭐⭐⭐⭐ Human trial evidence │ │
│  └──────────────────────────────┘ │
│  ┌──────────────────────────────┐ │
│  │ Jet Lag                      │ │
│  │ Time zone disorder • 2 rem...│ │
│  └──────────────────────────────┘ │
│                                    │
│  PLANTS                            │
│  ┌──────────────────────────────┐ │
│  │ 🌿 Valerian                  │ │
│  │ Valeriana officinalis        │ │
│  │ Sleep aid • Sedative         │ │
│  │ ⚠️ Liver caution              │ │
│  └──────────────────────────────┘ │
│  ┌──────────────────────────────┐ │
│  │ 🌿 Passionflower             │ │
│  │ Passiflora incarnata         │ │
└────────────────────────────────────┘
```

### 3. Condition Detail Screen

```
┌────────────────────────────────────┐
│  ←  Common Cold          [🔖] [⋯]  │
├────────────────────────────────────┤
│                                    │
│  ⚠️ NOT MEDICAL ADVICE             │
│  See a doctor if symptoms worsen   │
│                                    │
│  OVERVIEW                          │
│  The common cold is a viral        │
│  infection of the upper respiratory│
│  tract...                          │
│                                    │
│  SYMPTOMS                          │
│  • Runny or stuffy nose            │
│  • Sore throat                     │
│  • Cough                           │
│  • Sneezing                        │
│  • Mild headache                   │
│                                    │
│  🚨 WHEN TO SEE A DOCTOR           │
│  ┌──────────────────────────────┐ │
│  │ • Fever > 101.3°F (38.5°C)   │ │
│  │   lasting > 3 days            │ │
│  │ • Symptoms > 10 days          │ │
│  │ • Severe headache/facial pain │ │
│  │ • Difficulty breathing        │ │
│  └──────────────────────────────┘ │
│                                    │
│  HERBAL REMEDIES                   │
│  ┌──────────────────────────────┐ │
│  │ 🌿 Echinacea purpurea        │ │
│  │                              │ │
│  │ Take at first sign of cold.  │ │
│  │ May reduce duration and      │ │
│  │ severity when taken early.   │ │
│  │                              │ │
│  │ ⭐⭐⭐⭐ Human trial evidence │ │
│  │                              │ │
│  │ [View Plant Details →]       │ │
│  └──────────────────────────────┘ │
│                                    │
│  REFERENCES                        │
│  📄 Karsch-Völk et al. (2014)     │
│     Cochrane Database Syst Rev    │
│     [View →]                       │
│                                    │
│  Evidence Level: ⭐⭐⭐⭐           │
│  Last Reviewed: Jan 15, 2024      │
│                                    │
└────────────────────────────────────┘
```

### 4. Plant Detail Screen

```
┌────────────────────────────────────┐
│  ←  Echinacea            [🔖] [⋯]  │
├────────────────────────────────────┤
│                                    │
│  ┌──────────────────────────────┐ │
│  │  [Purple coneflower image]   │ │ ← Image carousel
│  │        ●  ○  ○  ○            │ │   (swipe)
│  └──────────────────────────────┘ │
│                                    │
│  Echinacea purpurea                │ ← Scientific name
│  Purple Coneflower • Echinacea     │ ← Common names
│                                    │
│  ⭐⭐⭐⭐ Human trial evidence      │
│                                    │
│  ⚠️ CONTRAINDICATIONS              │
│  ┌──────────────────────────────┐ │
│  │ 🔴 Autoimmune conditions     │ │
│  │    May worsen symptoms       │ │
│  │                              │ │
│  │ 🟡 Pregnancy - consult doctor│ │
│  │                              │ │
│  │ ⚠️ Asteraceae allergies      │ │
│  └──────────────────────────────┘ │
│                                    │
│  DESCRIPTION                       │
│  Native to North America, widely   │
│  recognized for immune-supporting  │
│  properties...                     │
│                                    │
│  USED FOR                          │
│  • Common Cold                     │
│  • Upper Respiratory Infections    │
│  • Immune Support                  │
│                                    │
│  [View All Preparation Methods →]  │
│                                    │
│  QUICK PREPARATION                 │
│  ┌──────────────────────────────┐ │
│  │ 🍵 Tincture (Recommended)    │ │
│  │                              │ │
│  │ Dosage: 2-4 ml (40-80 drops) │ │
│  │ Frequency: 3x daily          │ │
│  │ Duration: 7-10 days max      │ │
│  │                              │ │
│  │ Take at first sign of cold   │ │
│  │ for best results.            │ │
│  │                              │ │
│  │ [See Full Instructions →]    │ │
│  └──────────────────────────────┘ │
│                                    │
│  ▼ PHYTOCHEMICALS                  │ ← Expandable
│  ▼ HARVESTING & CULTIVATION        │   sections
│  ▼ RESEARCH & REFERENCES           │
│                                    │
└────────────────────────────────────┘
```

### 5. Medicine Cabinet Screen (Premium)

```
┌────────────────────────────────────┐
│  ←  Medicine Cabinet       [+] [⋯] │
├────────────────────────────────────┤
│  🔒 Your data is encrypted and     │
│  stored locally only               │
│                                    │
│  MY MEDICATIONS                    │
│  ┌──────────────────────────────┐ │
│  │ Lisinopril                   │ │
│  │ 10mg • 1x daily              │ │
│  │ For: High blood pressure     │ │
│  │ ⚠️ 1 interaction found       │ │
│  └──────────────────────────────┘ │
│  ┌──────────────────────────────┐ │
│  │ Aspirin                      │ │
│  │ 81mg • 1x daily              │ │
│  │ For: Heart health            │ │
│  │ ⚠️ 2 interactions found      │ │
│  └──────────────────────────────┘ │
│                                    │
│  ┌────────────────────────────────┐│
│  │ [+ Add Medication]             ││
│  └────────────────────────────────┘│
│                                    │
│  HERBS I'M CONSIDERING             │
│  ┌──────────────────────────────┐ │
│  │ 🌿 Ginkgo biloba             │ │
│  │ For: Memory support          │ │
│  │ ⚠️ MODERATE interaction      │ │
│  │    with Aspirin              │ │
│  │                              │ │
│  │ [Check Interactions →]       │ │
│  └──────────────────────────────┘ │
│                                    │
│  ┌────────────────────────────────┐│
│  │ [+ Add Herb to Check]          ││
│  └────────────────────────────────┘│
│                                    │
└────────────────────────────────────┘
```

### 6. Interaction Check Results

```
┌────────────────────────────────────┐
│  ←  Interaction Check              │
├────────────────────────────────────┤
│                                    │
│  🔴 1 MAJOR INTERACTION FOUND      │
│  🟡 1 MODERATE INTERACTION         │
│                                    │
│  ┌──────────────────────────────┐ │
│  │ 🔴 MAJOR                     │ │
│  │                              │ │
│  │ Ginkgo biloba × Aspirin      │ │
│  │                              │ │
│  │ ⚠️ INCREASED BLEEDING RISK   │ │
│  │                              │ │
│  │ Mechanism:                   │ │
│  │ Both substances have         │ │
│  │ antiplatelet effects. Ginkgo │ │
│  │ may potentiate the effect of │ │
│  │ aspirin, increasing bleeding │ │
│  │ risk.                        │ │
│  │                              │ │
│  │ Recommendation:              │ │
│  │ • Consult your doctor before │ │
│  │   combining these substances │ │
│  │ • Monitor for unusual        │ │
│  │   bruising or bleeding       │ │
│  │ • Discontinue ginkgo 2 weeks │ │
│  │   before surgery             │ │
│  │                              │ │
│  │ References:                  │ │
│  │ 📄 Bent et al. (2005)        │ │
│  │    [View →]                  │ │
│  └──────────────────────────────┘ │
│                                    │
│  ┌──────────────────────────────┐ │
│  │ 🟡 MODERATE                  │ │
│  │                              │ │
│  │ Ginkgo biloba × Lisinopril   │ │
│  │                              │ │
│  │ Potential blood pressure     │ │
│  │ effects...                   │ │
│  │                              │ │
│  │ [View Details →]             │ │
│  └──────────────────────────────┘ │
│                                    │
│  ⚠️ IMPORTANT DISCLAIMER           │
│  This is informational only. Always│
│  consult your healthcare provider  │
│  before combining medications.     │
│                                    │
│  [Share with Doctor] [Save Report] │
│                                    │
└────────────────────────────────────┘
```

### 7. Browse/Categories Screen

```
┌────────────────────────────────────┐
│  Browse                    [Search]│
├────────────────────────────────────┤
│                                    │
│  [All] [Conditions] [Plants]       │ ← Tabs
│       ───────────                  │
│                                    │
│  BY BODY SYSTEM                    │
│  ┌────────────┐  ┌────────────┐   │
│  │ 🫁         │  │ 💓         │   │
│  │ Respiratory│  │ Cardio-    │   │
│  │ 8 items    │  │ vascular   │   │
│  └────────────┘  │ 6 items    │   │
│  ┌────────────┐  └────────────┘   │
│  │ 🧠         │  ┌────────────┐   │
│  │ Nervous    │  │ 🦴         │   │
│  │ System     │  │ Musculo-   │   │
│  │ 12 items   │  │ skeletal   │   │
│  └────────────┘  │ 10 items   │   │
│                  └────────────┘   │
│                                    │
│  BY EVIDENCE LEVEL                 │
│  ⭐⭐⭐⭐⭐ Strong Clinical (12)     │
│  ⭐⭐⭐⭐ Human Trials (34)         │
│  ⭐⭐⭐ Animal Studies (28)         │
│  ⭐⭐ In Vitro (15)                │
│  ⭐ Traditional Use (12)           │
│                                    │
│  POPULAR CONDITIONS                │
│  • Common Cold                     │
│  • Insomnia                        │
│  • Mild Anxiety                    │
│  • Headache                        │
│  • Indigestion                     │
│  [View All 101 →]                  │
│                                    │
└────────────────────────────────────┘
```

### 8. Settings/Account Screen

```
┌────────────────────────────────────┐
│  ←  Settings                       │
├────────────────────────────────────┤
│                                    │
│  ACCOUNT                           │
│  user@example.com                  │
│  Premium • Expires Dec 31, 2024    │
│  [Manage Subscription →]           │
│                                    │
│  ─────────────────────────────────│
│                                    │
│  CONTENT                           │
│  Downloaded: 50/101 conditions     │
│  Last update: Jan 15, 2024         │
│  [Download Updates →]              │
│  [Manage Offline Content →]        │
│                                    │
│  ─────────────────────────────────│
│                                    │
│  PREFERENCES                       │
│  🔔 Notifications           [On ↻] │
│  📱 Download over Wi-Fi only [On ↻]│
│  🌓 Dark mode               [Off ↻]│
│  📏 Text size               [M ↻]  │
│                                    │
│  ─────────────────────────────────│
│                                    │
│  ABOUT                             │
│  Version 1.0.0                     │
│  [Privacy Policy →]                │
│  [Terms of Service →]              │
│  [Disclaimer →]                    │
│  [Advisory Board →]                │
│  [Licenses & Attributions →]       │
│                                    │
│  ─────────────────────────────────│
│                                    │
│  [Sign Out]                        │
│                                    │
└────────────────────────────────────┘
```

### 9. Subscription/Paywall Screen

```
┌────────────────────────────────────┐
│  ←                         [Skip]  │
├────────────────────────────────────┤
│                                    │
│         🌿 NaturoPath: 101         │
│                                    │
│    Unlock Your Natural Health      │
│           Journey                  │
│                                    │
│  ┌──────────────────────────────┐ │
│  │ ✓ Access all 101 conditions  │ │
│  │ ✓ Detailed plant profiles    │ │
│  │ ✓ Offline access              │ │
│  │ ✓ Evidence-based information │ │
│  └──────────────────────────────┘ │
│                                    │
│  ┌──────────────────────────────┐ │
│  │ STANDARD      [●] Selected   │ │
│  │                              │ │
│  │ $19.99/year                  │ │
│  │ or $2.99/month               │ │
│  │                              │ │
│  │ • Full catalog access        │ │
│  │ • Offline content bundles    │ │
│  │ • Regular updates            │ │
│  └──────────────────────────────┘ │
│                                    │
│  ┌──────────────────────────────┐ │
│  │ PREMIUM       [ ] Select     │ │
│  │                              │ │
│  │ $49.99/year                  │ │
│  │ or $5.99/month               │ │
│  │                              │ │
│  │ Everything in Standard, plus:│ │
│  │ • Medicine Cabinet           │ │
│  │ • Interaction checker        │ │
│  │ • Priority content updates   │ │
│  └──────────────────────────────┘ │
│                                    │
│  ┌────────────────────────────────┐│
│  │    [Start 7-Day Free Trial]    ││
│  └────────────────────────────────┘│
│                                    │
│  Billed annually. Cancel anytime.  │
│  [Restore Purchases]               │
│                                    │
└────────────────────────────────────┘
```

## Interaction Patterns

### Search
- **Debounced typeahead** (300ms delay)
- Show results after 2 characters typed
- Recent searches saved locally
- Clear button to clear search
- Filter chips for refinement

### Lists
- **Infinite scroll** or **Load More** button
- Pull-to-refresh on mobile
- Empty states with helpful messaging
- Loading skeletons for better UX

### Cards
- Tap to open details
- Long-press for quick actions (save, share)
- Swipe actions where appropriate (save, delete)

### Forms
- Inline validation
- Clear error messages
- Autocomplete for medication names
- Barcode scanner for medication entry (Premium)

## Accessibility

### WCAG 2.1 AA Compliance
- Minimum contrast ratio 4.5:1 for text
- Tap targets minimum 44x44px
- Screen reader support (semantic HTML/widgets)
- Keyboard navigation (desktop/web)
- Focus indicators visible
- Alternative text for all images
- Captions/transcripts for any video content

### Responsive Text
- Support for user-defined text sizes
- Reflow content without horizontal scroll
- Readable at 200% zoom

### Color Independence
- Don't rely solely on color to convey information
- Use icons + color for severity (e.g., red + ⚠️)

## Loading States

### Skeletons
Use content placeholders (gray rectangles) instead of spinners where possible for better perceived performance.

### Progressive Loading
- Load critical content first (text)
- Images load progressively (blur-up technique)
- Defer below-fold content

### Offline Indicators
- Clear badge when offline
- Indicate which content is available offline
- Explain limitations when offline

## Error States

### Friendly Error Messages
❌ Bad: "Error 404"
✅ Good: "We couldn't find that plant. Try searching for something else."

### Actionable Errors
Provide clear next steps:
- "No internet connection. [Retry]"
- "Subscription expired. [Renew Now]"

### Empty States
Make empty states helpful:
- "No saved plants yet. Start by searching or browsing conditions."
- Include illustration + action button

## Onboarding

### First-Time User Experience
1. **Welcome screen**: Brief intro, value proposition
2. **Feature highlights**: 3-4 screens showcasing key features
3. **Permission requests**: Explain why each permission is needed
4. **Optional account creation**: Allow skip, can create later
5. **Quick tutorial**: Interactive overlay on first search/navigation

### Tooltips
- Use sparingly
- Dismissible
- Don't show repeatedly

## Platform-Specific Considerations

### iOS
- Follow Human Interface Guidelines
- Use native components (SF Symbols)
- Haptic feedback for interactions
- Swipe gestures (back, actions)
- Share sheet integration

### Android
- Follow Material Design 3
- Use Material You theming (dynamic colors)
- Bottom sheets for actions
- Floating Action Button where appropriate
- Share intent integration

### Desktop/Web
- Responsive layout (1-3 columns)
- Keyboard shortcuts
- Hover states for interactive elements
- Context menus (right-click)
- Print-friendly styles for plant/condition pages

---

**These wireframes and guidelines provide a foundation for building an intuitive, trustworthy, and accessible user experience for NaturoPath: 101.**
