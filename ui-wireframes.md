# UI / UX Wireframes — NaturoPath: 101

## Design Philosophy

NaturoPath: 101 embraces a clean, nature-inspired design that prioritizes:
- **Clarity**: Easy-to-read information hierarchy
- **Trust**: Professional, evidence-based presentation
- **Accessibility**: WCAG 2.1 Level AA compliance
- **Nature**: Calming earth tones, organic shapes
- **Safety**: Prominent disclaimers and warnings

## Color Palette

### Primary Colors
- **Forest Green**: `#2D5F3F` - Primary actions, headers
- **Sage Green**: `#8FAF9B` - Secondary elements, accents
- **Earth Brown**: `#6B4E3D` - Grounding elements
- **Cream**: `#F5F1E8` - Background, cards

### Semantic Colors
- **Success Green**: `#4CAF50` - Confirmations, safe ratings
- **Warning Amber**: `#FF9800` - Cautions, moderate risks
- **Alert Red**: `#F44336` - Warnings, severe interactions
- **Info Blue**: `#2196F3` - Informational messages

### Neutral Colors
- **Text Dark**: `#2C2C2C` - Primary text
- **Text Medium**: `#666666` - Secondary text
- **Text Light**: `#999999` - Tertiary text, hints
- **Border**: `#E0E0E0` - Dividers, borders
- **White**: `#FFFFFF` - Cards, backgrounds

## Typography

### Font Family
- **Headings**: Poppins (clean, modern, friendly)
- **Body**: Inter (highly legible, professional)
- **Monospace**: JetBrains Mono (for scientific names, data)

### Type Scale
- **H1**: 32px / 40px line height - Page titles
- **H2**: 24px / 32px - Section headers
- **H3**: 20px / 28px - Subsections
- **H4**: 18px / 26px - Card titles
- **Body**: 16px / 24px - Regular text
- **Small**: 14px / 20px - Captions, metadata
- **Tiny**: 12px / 18px - Legal, footnotes

## Navigation Structure

### Bottom Navigation (Mobile)
```
┌─────────────────────────────────────┐
│                                     │
│         [Main Content]              │
│                                     │
├─────┬─────┬─────┬─────┬─────────┤
│ 🏠   │ 🔍  │ 🌿   │ 💊  │  👤     │
│Home │Explr│Plantc│Med  │Profile │
└─────┴─────┴─────┴─────┴─────────┘
```

### Top Navigation (Web)
```
┌────────────────────────────────────────────┐
│ [Logo] NaturoPath:101  [Search...]        │
│ Home Conditions Plants Resources [Profile]│
└────────────────────────────────────────────┘
```

## Screen Wireframes

### 1. Home Screen / Dashboard

```
┌──────────────────────────────────┐
│ ☰  NaturoPath:101          🔔 👤 │
├──────────────────────────────────┤
│ Good morning, Sarah! 🌅          │
│                                  │
│ ┌──────────────────────────────┐│
│ │ 🔍 Search conditions, plants ││
│ └──────────────────────────────┘│
│                                  │
│ QUICK ACCESS                     │
│ ┌─────────┐ ┌─────────┐         │
│ │  💊     │ │  📋     │         │
│ │Medicine │ │Symptoms │         │
│ │Cabinet  │ │Checker  │         │
│ └─────────┘ └─────────┘         │
│                                  │
│ RECENTLY VIEWED                  │
│ ┌──────────────────────────────┐│
│ │ 🌿 Echinacea                 ││
│ │ Immune support • Generally   ││
│ │ Safe                   →     ││
│ └──────────────────────────────┘│
│ ┌──────────────────────────────┐│
│ │ 🤧 Common Cold               ││
│ │ Respiratory • Mild     →     ││
│ └──────────────────────────────┘│
│                                  │
│ FEATURED TODAY                   │
│ ┌──────────────────────────────┐│
│ │ [Image: Chamomile flowers]   ││
│ │ Chamomile for Better Sleep   ││
│ │ Learn about this calming...  ││
│ └──────────────────────────────┘│
└──────────────────────────────────┘
```

### 2. Condition Detail Screen

```
┌──────────────────────────────────┐
│ ← Common Cold             ⭐ 📤   │
├──────────────────────────────────┤
│ [Tabs: Overview | Remedies |     │
│        Lifestyle | Research]     │
├──────────────────────────────────┤
│ OVERVIEW                         │
│                                  │
│ Category: Respiratory            │
│ Severity: Mild                   │
│ Prevalence: Very Common          │
│                                  │
│ A viral infection of the upper   │
│ respiratory tract, primarily...  │
│                                  │
│ SYMPTOMS                         │
│ • Runny or stuffy nose          │
│ • Sore throat                   │
│ • Cough                         │
│ • Sneezing                      │
│ • Low-grade fever               │
│                                  │
│ ⚠️ WHEN TO SEE A DOCTOR          │
│ Fever >101.3°F for 3+ days      │
│ Difficulty breathing             │
│ Severe chest pain                │
│                                  │
│ NATURAL REMEDIES (3)       →     │
│ ┌──────────────────────────────┐│
│ │ 🌿 Echinacea                 ││
│ │ ⭐⭐⭐ Moderate Evidence       ││
│ │ May reduce duration...   →   ││
│ └──────────────────────────────┘│
│                                  │
│ [See All Remedies]               │
│                                  │
│ ⚠️ MEDICAL DISCLAIMER            │
│ This information is educational  │
│ only... [Read Full]              │
└──────────────────────────────────┘
```

### 3. Plant Detail Screen

```
┌──────────────────────────────────┐
│ ← Echinacea           ⭐ 📤 💊+ │
├──────────────────────────────────┤
│ ┌──────────────────────────────┐│
│ │ [Image: Purple coneflower]   ││
│ └──────────────────────────────┘│
│                                  │
│ Echinacea purpurea               │
│ Purple Coneflower                │
│                                  │
│ ✅ Generally Safe                │
│ Family: Asteraceae               │
│                                  │
│ [Tabs: Overview | Uses | Safety  │
│        | Preparation]            │
├──────────────────────────────────┤
│ OVERVIEW                         │
│                                  │
│ A flowering plant native to      │
│ North America, recognized by...  │
│                                  │
│ TRADITIONAL USES                 │
│ • Wound healing                 │
│ • Infections                    │
│ • Snake bites                   │
│                                  │
│ MODERN USES                      │
│ • Common cold prevention        │
│ • Upper respiratory infections  │
│ • Immune system support         │
│                                  │
│ MAY HELP WITH                    │
│ ┌──────────────────────────────┐│
│ │ Common Cold                  ││
│ │ ⭐⭐⭐ Moderate Evidence  →    ││
│ └──────────────────────────────┘│
│                                  │
│ SAFETY INFORMATION               │
│ ⚠️ Contraindications             │
│ • Autoimmune disorders          │
│ • Asteraceae family allergies   │
│                                  │
│ [View Full Safety Profile]       │
│                                  │
│ DOSAGE & PREPARATION             │
│ Standard Dose: 300-500mg 3x/day │
│ [See Preparation Methods]        │
└──────────────────────────────────┘
```

### 4. Medicine Cabinet Screen

```
┌──────────────────────────────────┐
│ ← Medicine Cabinet          + ➕ │
├──────────────────────────────────┤
│ 💊 My Remedies (5)               │
│                                  │
│ ┌──────────────────────────────┐│
│ │ 🌿 Valerian Root             ││
│ │ Tincture • Nature's Way      ││
│ │ For: Sleep support           ││
│ │ Dose: 2ml before bed         ││
│ │ ⭐⭐⭐⭐ Effectiveness         ││
│ │ Expires: Oct 15, 2026        ││
│ │ [Edit] [Log Use] [Remove]    ││
│ └──────────────────────────────┘│
│                                  │
│ ┌──────────────────────────────┐│
│ │ 🌿 Ginger                    ││
│ │ Tea • Traditional Medicinals ││
│ │ For: Digestion               ││
│ │ Dose: 1 cup as needed        ││
│ │ ⭐⭐⭐⭐⭐ Effectiveness        ││
│ │ [Edit] [Log Use] [Remove]    ││
│ └──────────────────────────────┘│
│                                  │
│ ┌──────────────────────────────┐│
│ │ ⚠️ CHECK INTERACTIONS         ││
│ │ Review your remedies for     ││
│ │ potential interactions       ││
│ │ [Check Now]                  ││
│ └──────────────────────────────┘│
│                                  │
│ USAGE LOG                   →    │
│ Today: 2 doses logged            │
│ This week: 14 doses              │
└──────────────────────────────────┘
```

### 5. Add to Medicine Cabinet Modal

```
┌──────────────────────────────────┐
│ Add to Medicine Cabinet      ✕   │
├──────────────────────────────────┤
│ Plant: Echinacea ✓               │
│                                  │
│ Form *                           │
│ [Dropdown: Tincture        ▼]    │
│                                  │
│ Brand                            │
│ [Input: Nature's Way]            │
│                                  │
│ Dosage *                         │
│ [Input: 2-3 ml]                  │
│                                  │
│ Frequency *                      │
│ [Input: 3 times daily]           │
│                                  │
│ Purpose                          │
│ [Input: At first sign of cold]   │
│                                  │
│ Expiration Date                  │
│ [Date Picker: 12/31/2026]        │
│                                  │
│ Notes                            │
│ [Textarea: Take at first...]     │
│                                  │
│ ┌──────────────────────────────┐│
│ │ [Cancel]      [Add to Cabinet]││
│ └──────────────────────────────┘│
└──────────────────────────────────┘
```

### 6. Search Results Screen

```
┌──────────────────────────────────┐
│ ← 🔍 [Search: sleep     ]    ⚙️  │
├──────────────────────────────────┤
│ Results for "sleep" (47)         │
│                                  │
│ [Filters: All | Conditions |     │
│           Plants | Articles]     │
├──────────────────────────────────┤
│ CONDITIONS (12)                  │
│ ┌──────────────────────────────┐│
│ │ 😴 Insomnia                  ││
│ │ Nervous System • Variable    ││
│ │ Difficulty falling or stay...││
│ │                          →   ││
│ └──────────────────────────────┘│
│                                  │
│ PLANTS (8)                       │
│ ┌──────────────────────────────┐│
│ │ 🌿 Valerian                  ││
│ │ ✅ Generally Safe            ││
│ │ Helps with insomnia and...   ││
│ │                          →   ││
│ └──────────────────────────────┘│
│ ┌──────────────────────────────┐│
│ │ 🌿 Chamomile                 ││
│ │ ✅ Generally Safe            ││
│ │ Mild sedative, calming...    ││
│ │                          →   ││
│ └──────────────────────────────┘│
│                                  │
│ ARTICLES (27)              →     │
│ • Natural Sleep Aids That Work   │
│ • Creating a Sleep Routine       │
└──────────────────────────────────┘
```

### 7. Symptom Checker Flow

```
Step 1: Select Symptoms
┌──────────────────────────────────┐
│ ← Symptom Checker           ✕    │
├──────────────────────────────────┤
│ What symptoms are you            │
│ experiencing?                    │
│                                  │
│ 🔍 [Search symptoms...]          │
│                                  │
│ COMMON SYMPTOMS                  │
│ ☑ Runny nose                    │
│ ☑ Sore throat                   │
│ ☑ Cough                         │
│ ☐ Fever                         │
│ ☐ Headache                      │
│ ☐ Fatigue                       │
│ ☐ Nausea                        │
│ ☐ Body aches                    │
│                                  │
│ [View All Symptoms]              │
│                                  │
│ Selected: 3 symptoms             │
│ [Continue]                       │
└──────────────────────────────────┘

Step 2: Results
┌──────────────────────────────────┐
│ ← Possible Conditions       ✕    │
├──────────────────────────────────┤
│ Based on your symptoms, you      │
│ might be experiencing:           │
│                                  │
│ ⚠️ This is not a diagnosis.      │
│ Consult a healthcare provider.   │
│                                  │
│ 1. Common Cold                   │
│    Match: 92%                    │
│    ┌────────────────────────────┐│
│    │ Respiratory • Mild         ││
│    │ Your symptoms match 3 of   ││
│    │ 7 common symptoms          ││
│    │ [View Details]             ││
│    │ [See Natural Remedies]     ││
│    └────────────────────────────┘│
│                                  │
│ 2. Sinusitis                     │
│    Match: 67%                    │
│    ┌────────────────────────────┐│
│    │ Respiratory • Moderate     ││
│    │ [View Details]             ││
│    └────────────────────────────┘│
│                                  │
│ [Start New Check]                │
└──────────────────────────────────┘
```

### 8. Profile / Settings Screen

```
┌──────────────────────────────────┐
│ ← Profile                    ⚙️   │
├──────────────────────────────────┤
│ ┌────┐                           │
│ │ SD │ Sarah Doe                 │
│ └────┘ sarah@example.com         │
│                                  │
│ ┌──────────────────────────────┐│
│ │ 👑 Premium Member             ││
│ │ Valid until: Oct 1, 2026     ││
│ │ [Manage Subscription]         ││
│ └──────────────────────────────┘│
│                                  │
│ ACCOUNT                          │
│ • Personal Information       →   │
│ • Password & Security        →   │
│ • Subscription & Billing     →   │
│                                  │
│ PREFERENCES                      │
│ • Notifications              →   │
│ • Privacy Settings           →   │
│ • Data & Storage             →   │
│                                  │
│ CONTENT                          │
│ • Saved Items (24)           →   │
│ • Recently Viewed            →   │
│ • Reading History            →   │
│                                  │
│ SUPPORT                          │
│ • Help Center                →   │
│ • Contact Us                 →   │
│ • Terms & Privacy            →   │
│ • About NaturoPath:101       →   │
│                                  │
│ [Log Out]                        │
└──────────────────────────────────┘
```

### 9. Interaction Checker Results

```
┌──────────────────────────────────┐
│ ← Interaction Check         ✕    │
├──────────────────────────────────┤
│ Checking interactions for:       │
│ • Echinacea (Tincture)          │
│ • Valerian (Capsule)            │
│ • Ginger (Tea)                  │
│                                  │
│ Medications:                     │
│ • Warfarin                      │
│                                  │
├──────────────────────────────────┤
│ ⚠️ MODERATE RISK (1)             │
│                                  │
│ ┌──────────────────────────────┐│
│ │ Ginger + Warfarin            ││
│ │ ⚠️ Moderate Risk              ││
│ │                              ││
│ │ Interaction:                 ││
│ │ May increase bleeding risk   ││
│ │                              ││
│ │ Recommendation:              ││
│ │ Consult your healthcare      ││
│ │ provider before combining    ││
│ │                              ││
│ │ [View Details]               ││
│ └──────────────────────────────┘│
│                                  │
│ ✅ NO INTERACTIONS (2)           │
│ • Echinacea + Valerian          │
│ • Valerian + Ginger             │
│                                  │
│ ⚠️ DISCLAIMER                    │
│ This checker provides general    │
│ information. Always consult...   │
│                                  │
│ [Done]    [Save Report]          │
└──────────────────────────────────┘
```

### 10. Onboarding Flow

```
Screen 1: Welcome
┌──────────────────────────────────┐
│                                  │
│        🌿                        │
│   NaturoPath:101                 │
│                                  │
│   Your guide to natural          │
│   wellness and herbal            │
│   remedies                       │
│                                  │
│   • 101 Common Conditions        │
│   • 200+ Medicinal Plants        │
│   • Evidence-Based Info          │
│   • Personal Medicine Cabinet    │
│                                  │
│                                  │
│                                  │
│   [Get Started]                  │
│   Already have account? [Log In] │
└──────────────────────────────────┘

Screen 2: Disclaimer
┌──────────────────────────────────┐
│ Important Information       ✕    │
├──────────────────────────────────┤
│                                  │
│ ⚠️ Medical Disclaimer             │
│                                  │
│ NaturoPath:101 provides          │
│ educational information only.    │
│                                  │
│ This app does NOT:               │
│ • Provide medical advice         │
│ • Diagnose conditions            │
│ • Replace healthcare providers   │
│                                  │
│ Always consult qualified         │
│ healthcare professionals before  │
│ starting any new treatment.      │
│                                  │
│ [Read Full Disclaimer]           │
│                                  │
│ ☑ I understand and agree         │
│                                  │
│ [Continue]                       │
└──────────────────────────────────┘

Screen 3: Personalization
┌──────────────────────────────────┐
│ Personalize Your Experience ✕    │
├──────────────────────────────────┤
│ What are you interested in?      │
│ (Select all that apply)          │
│                                  │
│ ☑ General Wellness              │
│ ☐ Immune Support                │
│ ☑ Sleep & Relaxation            │
│ ☐ Digestive Health              │
│ ☐ Pain Management               │
│ ☐ Mental Health                 │
│ ☐ Skin Care                     │
│ ☐ Energy & Vitality             │
│                                  │
│ This helps us show you           │
│ relevant content.                │
│                                  │
│ [Skip]              [Continue]   │
└──────────────────────────────────┘
```

## Component Library

### Cards
```
Standard Card:
┌────────────────────────┐
│ Title                  │
│ Subtitle               │
│ Description text...    │
│ [Action Button]        │
└────────────────────────┘

Icon Card:
┌────────────────────────┐
│      🌿               │
│   Card Title           │
│   Short description    │
└────────────────────────┘
```

### Buttons
- **Primary**: Solid forest green, white text
- **Secondary**: Outlined sage green, green text
- **Tertiary**: Text only, green text
- **Danger**: Solid red, white text

### Input Fields
```
┌────────────────────────┐
│ Label *                │
│ [Input text here]      │
│ Helper text            │
└────────────────────────┘
```

### Alerts & Warnings
```
⚠️ Warning
┌────────────────────────┐
│ ⚠️ Warning message     │
│ Additional details...  │
└────────────────────────┘

✅ Success
┌────────────────────────┐
│ ✅ Success message     │
└────────────────────────┘

ℹ️ Info
┌────────────────────────┐
│ ℹ️ Informational msg   │
└────────────────────────┘
```

### Tags / Badges
```
[Generally Safe] [Moderate Evidence]
[⚠️ Use with Caution] [Premium]
```

## Responsive Breakpoints

- **Mobile**: < 640px
- **Tablet**: 640px - 1024px
- **Desktop**: > 1024px
- **Large Desktop**: > 1440px

## Accessibility Features

### Screen Reader Support
- All images have descriptive alt text
- Form inputs have associated labels
- ARIA landmarks for navigation
- Semantic HTML structure

### Keyboard Navigation
- All interactive elements keyboard accessible
- Visible focus indicators
- Logical tab order
- Skip links for main content

### Visual Accessibility
- Minimum 4.5:1 contrast ratio for text
- Resizable text up to 200%
- No information conveyed by color alone
- Focus indicators for all interactive elements

### Other Considerations
- Captions for video content
- Transcripts for audio
- Clear, simple language (8th-grade reading level)
- Consistent navigation and layout

## Animations & Micro-interactions

### Page Transitions
- Fade in/out: 200ms
- Slide in from right (modal): 300ms ease-out
- Slide up (bottom sheet): 250ms ease-out

### Loading States
- Skeleton screens for content loading
- Spinner for quick actions (<2s expected)
- Progress bar for longer operations

### Feedback
- Button press: Scale 0.95, 100ms
- Success: Green checkmark animation
- Error: Shake animation, 400ms
- Add to favorites: Heart fill animation

## Design Tokens

```json
{
  "colors": {
    "primary": "#2D5F3F",
    "secondary": "#8FAF9B",
    "accent": "#6B4E3D",
    "background": "#F5F1E8",
    "surface": "#FFFFFF",
    "error": "#F44336",
    "warning": "#FF9800",
    "success": "#4CAF50",
    "info": "#2196F3"
  },
  "spacing": {
    "xs": "4px",
    "sm": "8px",
    "md": "16px",
    "lg": "24px",
    "xl": "32px",
    "xxl": "48px"
  },
  "borderRadius": {
    "sm": "4px",
    "md": "8px",
    "lg": "12px",
    "full": "9999px"
  },
  "shadows": {
    "sm": "0 1px 2px rgba(0,0,0,0.05)",
    "md": "0 4px 6px rgba(0,0,0,0.1)",
    "lg": "0 10px 15px rgba(0,0,0,0.1)"
  }
}
```

---

**Version**: 1.0  
**Last Updated**: November 2025  
**Owner**: Design Team  
**Status**: Wireframe Specifications
