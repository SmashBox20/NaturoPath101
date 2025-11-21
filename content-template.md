# Content Template — NaturoPath: 101

## Overview

This template provides the structure for creating consistent, high-quality entries for conditions and plants in the NaturoPath: 101 database. All entries must be reviewed and approved by the advisory board before publishing.

---

## CONDITION ENTRY TEMPLATE

### Required Fields

#### 1. Basic Information
- **Condition ID**: `cond_XXX_condition_name` (e.g., `cond_001_common_cold`)
- **Condition Name**: Official name (e.g., "Common Cold")
- **Synonyms**: Array of alternative names, common terms, medical terms
  - Example: ["Upper Respiratory Infection", "URI", "Head Cold"]
- **ICD Codes**: ICD-10 codes for medical categorization
  - Example: ["J00"]

#### 2. Description
- **Overview** (150-300 words):
  - What is this condition?
  - How common is it?
  - What causes it?
  - Typical duration
  - General prognosis
  - Write in accessible, plain language
  - Avoid medical jargon where possible; define terms when necessary

**Example**:
```
The common cold is a viral infection of the upper respiratory tract, 
primarily affecting the nose and throat. It is one of the most frequent 
illnesses, with adults experiencing 2-3 colds per year on average. While 
uncomfortable, colds are generally self-limiting and resolve within 7-10 days.
```

#### 3. Symptoms
- **Symptoms**: Array of common symptoms (6-10 items)
  - List from most common to least common
  - Use clear, patient-friendly language
  - Be specific (not just "pain" but "throbbing headache")

**Example**:
```
- Runny or stuffy nose
- Sore throat
- Cough
- Sneezing
- Mild headache
- Low-grade fever (rare in adults)
- Fatigue
```

#### 4. Red Flags (CRITICAL)
- **Red Flags**: Array of warning signs requiring immediate medical care
  - Be specific about thresholds (e.g., "fever above 101.3°F")
  - Include duration qualifiers (e.g., "lasting more than 3 days")
  - Highlight serious complications
  - Mention vulnerable populations (infants, elderly, immunocompromised)

**Example**:
```
- Fever above 101.3°F (38.5°C) lasting more than 3 days
- Symptoms persisting beyond 10 days without improvement
- Severe headache or facial pain (possible sinusitis)
- Difficulty breathing or shortness of breath
- Chest pain
- Symptoms in infants under 3 months
```

#### 5. Recommended Plants
- **Recommended Plants**: Array of plant recommendations (1-5 plants)

For each plant:
- **Plant ID**: Reference to plant entry
- **Usage**: How the plant is used for this condition (1-2 sentences)
- **Evidence Level**: Level of evidence for this specific use

**Example**:
```json
{
  "plantId": "plant_001_echinacea",
  "usage": "Take at the first sign of cold symptoms. May reduce duration and severity when taken early.",
  "evidenceLevel": "human_trial"
}
```

#### 6. Evidence & Review
- **Evidence Level**: Overall evidence level for herbal treatment of this condition
  - Options: traditional, in_vitro, animal, human_trial, strong_clinical
- **References**: Array of scientific references (minimum 2-5)
  - Include systematic reviews and meta-analyses when available
  - PubMed links preferred
  - Include traditional sources where relevant
- **Last Reviewed Date**: Date of last advisory board review (YYYY-MM-DD)
- **Reviewed By**: Array of advisory board member IDs who approved this entry

### Optional Fields
- **Related Conditions**: Links to related conditions
- **Prevention Tips**: Evidence-based prevention strategies
- **Lifestyle Modifications**: Diet, exercise, stress management recommendations

### Content Guidelines for Conditions

1. **Tone**: Professional, compassionate, empowering
2. **Reading Level**: Target 8th-grade reading level (use Hemingway Editor or similar)
3. **Length**: Overview 150-300 words; symptoms 6-10 items; red flags 4-8 items
4. **Citations**: Every factual claim should be supported by references or marked as "traditional use"
5. **Disclaimers**: Never promise cure or treatment; position as complementary/informational
6. **Updates**: Review annually or when new significant research published

---

## PLANT ENTRY TEMPLATE

### Required Fields

#### 1. Basic Information
- **Plant ID**: `plant_XXX_common_name` (e.g., `plant_001_echinacea`)
- **Scientific Name**: Full Latin binomial (e.g., "Echinacea purpurea")
- **Common Names**: Array of common names in English (at least 2)
  - Example: ["Purple Coneflower", "Echinacea"]
- **Family**: Taxonomic family (e.g., "Asteraceae")
- **Genus**: Genus name (e.g., "Echinacea")
- **Species**: Species name (e.g., "purpurea")

#### 2. Description
- **Description** (200-400 words):
  - Physical description of plant
  - Native habitat and distribution
  - Historical/traditional uses
  - Current medicinal uses
  - Cultural significance (if relevant)
  - Write engagingly but scientifically

**Example**:
```
Echinacea purpurea is a flowering plant native to North America, widely 
recognized for its immune-supporting properties. The plant features distinctive 
purple-pink petals surrounding a spiky central cone. Traditionally used by 
Native American tribes for various ailments, echinacea is now one of the most 
popular herbal supplements for immune health.
```

#### 3. Images
- **Images**: Array of high-quality images (minimum 3-5)

For each image:
- **URL**: Full URL to image (hosted on CDN)
- **Alt Text**: Descriptive alt text for accessibility
- **Caption**: Brief caption
- **Image Type**: whole_plant, leaf, flower, root, bark, seed, fruit, or habitat
- **Thumbnail URL**: URL to thumbnail version
- **Attribution**: Photographer/source credit
- **License**: License type (e.g., "CC BY-SA 4.0")

**Required Image Types**:
- At least one whole_plant or habitat image
- At least one image of the medicinal part (root, flower, etc.)
- Close-up images showing identification features

#### 4. Phytochemicals
- **Phytochemicals**: Array of key active compounds (3-10 compounds)

For each compound:
- **Name**: Chemical name
- **Chemical Class**: e.g., alkaloid, flavonoid, terpene, phenolic
- **PubChem ID**: PubChem database ID (if available)
- **CAS Number**: CAS registry number (if available)
- **Proposed Mechanism**: How the compound is thought to work (1-2 sentences)
- **Concentration**: Typical concentration in plant material

**Focus on**:
- Compounds with known or proposed medicinal activity
- Well-studied constituents
- Compounds used for standardization

#### 5. Preparation Methods
- **Preparation Methods**: Array of preparation methods (2-5 methods)

For each method:
- **Method**: tea, infusion, decoction, tincture, extract, poultice, topical, essential_oil, capsule, powder
- **Instructions**: Step-by-step preparation instructions
- **Dosage**: Typical dose range
- **Frequency**: How often to take
- **Duration**: How long to use (include maximum duration if applicable)
- **Notes**: Important tips, best practices, storage

**Example**:
```json
{
  "method": "tincture",
  "instructions": "Use 1:5 ratio of dried root to 40% alcohol. Macerate for 2-4 weeks, shaking daily.",
  "dosage": "2-4 ml (40-80 drops)",
  "frequency": "3 times daily",
  "duration": "At first sign of cold, continue for 7-10 days maximum",
  "notes": "Most commonly used preparation. Take at onset of symptoms for best results."
}
```

**Include**:
- Most effective/traditional preparation first
- At least one simple home preparation (tea, infusion)
- Standardized extract dosing when available

#### 6. Contraindications (CRITICAL)
- **Contraindications**: Array of contraindications (minimum 3-5)

For each contraindication:
- **Category**: pregnancy, lactation, children, autoimmune, anticoagulants, cyp_interaction, kidney_disease, liver_disease, surgery, other
- **Severity**: mild, moderate, severe, contraindicated
- **Description**: Clear explanation of the contraindication and risk
- **References**: Supporting research

**Example**:
```json
{
  "category": "autoimmune",
  "severity": "moderate",
  "description": "May stimulate immune system and potentially worsen autoimmune conditions such as multiple sclerosis, lupus, rheumatoid arthritis, or others.",
  "references": [...]
}
```

**Required Categories to Address**:
- Pregnancy (even if no known contraindication, state "limited data")
- Lactation
- Children (specify age groups)
- Drug interactions (especially blood thinners, immunosuppressants)
- CYP enzyme interactions (if known)

#### 7. Harvesting Guidance
- **Harvesting Guidance**: Object with cultivation information

Fields:
- **Part Used**: Array of plant parts used (e.g., ["root", "aerial parts"])
- **Harvest Season**: When to harvest for optimal potency
- **Sustainability Notes**: Wild harvesting concerns, cultivation recommendations
- **Cultivation Difficulty**: easy, moderate, or difficult

**Example**:
```json
{
  "partUsed": ["root", "aerial parts", "flowers"],
  "harvestSeason": "Roots: fall after 3-4 years growth. Aerial parts: during flowering (summer).",
  "sustainabilityNotes": "Cultivate rather than wild-harvest. Plant is easy to grow and readily available. Wild populations should not be harvested.",
  "cultivationDifficulty": "easy"
}
```

#### 8. Evidence & Review
- **Evidence Level**: Overall evidence level for medicinal use
- **References**: Array of scientific references (minimum 3-10)
  - Prioritize: systematic reviews, meta-analyses, RCTs, pharmacopeia entries
  - Include traditional use references when relevant
- **Last Reviewed Date**: Date of last advisory board review
- **Reviewed By**: Advisory board member IDs

### Optional Fields
- **Synonyms**: Other scientific names or subspecies
- **Traditional Uses**: Historical uses not covered in modern research
- **Dosage Warnings**: Special precautions
- **Storage Instructions**: How to store prepared remedies
- **Quality Considerations**: How to identify quality products

### Content Guidelines for Plants

1. **Accuracy**: Verify all botanical information (scientific name, family, etc.)
2. **Safety First**: Contraindications and warnings must be comprehensive
3. **Evidence-Based**: Clearly distinguish between traditional use and scientific evidence
4. **Practical**: Provide actionable preparation instructions
5. **Sustainable**: Always address sustainability and ethical harvesting
6. **Images**: High-quality, properly identified images with clear labels
7. **Accessibility**: Write for general audience, define technical terms

---

## INTERACTION ENTRY TEMPLATE

(For Premium Medicine Cabinet Feature)

### Required Fields

#### 1. Basic Information
- **Interaction ID**: `int_XXX_plant_drug` (e.g., `int_001_ginkgo_aspirin`)
- **Plant ID**: Reference to plant entry
- **Drug Name**: Common name of medication
- **Active Ingredient**: Primary active pharmaceutical ingredient
- **RxNorm Code**: RxNorm concept code (if available)

#### 2. Interaction Details
- **Interaction Type**: additive, antagonistic, potentiation, cyp_inhibition, cyp_induction, absorption_interference, unknown
- **Severity**: minor, moderate, major, contraindicated
- **Mechanism**: How the interaction occurs (pharmacokinetic, pharmacodynamic)
- **Clinical Significance**: Real-world importance of the interaction
- **Recommendation**: Clear guidance on what to do

**Example**:
```json
{
  "id": "int_001_ginkgo_aspirin",
  "plantId": "plant_004_ginkgo",
  "drugName": "Aspirin",
  "activeIngredient": "Acetylsalicylic acid",
  "rxNormCode": "1191",
  "interactionType": "additive",
  "severity": "major",
  "mechanism": "Both ginkgo and aspirin have antiplatelet effects. Combined use may increase bleeding risk.",
  "clinicalSignificance": "Case reports of bleeding events when ginkgo combined with antiplatelet drugs.",
  "recommendation": "Consult healthcare provider before combining. Monitor for unusual bleeding or bruising. Discontinue ginkgo 2 weeks before surgery."
}
```

#### 3. References
- **References**: Clinical evidence for the interaction (minimum 2-3)
  - Case reports
  - Clinical studies
  - Pharmacology references

---

## EDITORIAL WORKFLOW

### Content Creation Process

1. **Research Phase**:
   - Literature review (PubMed, Cochrane, pharmacopeia)
   - Traditional use research (ethnobotany sources)
   - Safety data compilation (contraindications, interactions)

2. **Writing Phase**:
   - Use this template
   - Write for target audience (educated general public)
   - Include all required fields
   - Cite all sources

3. **Internal Review**:
   - Fact-checking
   - Verify scientific names
   - Check image attributions and licenses
   - Ensure disclaimers present
   - Readability check

4. **Advisory Board Review**:
   - Submit to at least 2 advisory board members (1 herbalist + 1 clinician minimum)
   - Board reviews for:
     - Accuracy
     - Safety
     - Appropriate disclaimers
     - Evidence level appropriateness
   - Board suggests revisions if needed

5. **Revision Phase**:
   - Incorporate board feedback
   - Verify changes
   - Resubmit if major changes

6. **Approval**:
   - Board members approve entry
   - Record approval date and reviewers
   - Entry ready for publication

7. **Publishing**:
   - Add to database
   - Generate search indices
   - Create content bundle
   - Deploy update

### Quality Checklist

Before submitting for board review, verify:

**Conditions:**
- [ ] All required fields complete
- [ ] Overview 150-300 words, readable
- [ ] Red flags comprehensive and specific
- [ ] At least 1 recommended plant with usage
- [ ] Evidence level appropriate
- [ ] Minimum 2 quality references
- [ ] No medical advice (informational only)
- [ ] Disclaimer language appropriate

**Plants:**
- [ ] Scientific name verified (USDA Plants Database or The Plant List)
- [ ] At least 3 high-quality images with proper attribution
- [ ] Minimum 3 phytochemicals with mechanisms
- [ ] At least 2 preparation methods with complete instructions
- [ ] Comprehensive contraindications (pregnancy, lactation, children, interactions)
- [ ] Sustainability addressed
- [ ] Evidence level appropriate
- [ ] Minimum 3 quality references
- [ ] No cure claims or medical advice

**Interactions:**
- [ ] Severity rating justified by evidence
- [ ] Mechanism clearly explained
- [ ] Practical recommendation provided
- [ ] Minimum 2 references

### Evidence Level Guidelines

**Strong Clinical**:
- Multiple high-quality RCTs with consistent results
- Systematic reviews/meta-analyses showing efficacy
- Included in medical guidelines or pharmacopeia

**Human Trial**:
- At least one well-designed RCT
- Clinical studies showing efficacy
- May have some conflicting evidence

**Animal**:
- Animal studies showing efficacy
- May have preliminary human data
- Mechanism supported by research

**In Vitro**:
- Test tube/cell culture studies only
- Mechanism proposed but not validated in vivo

**Traditional**:
- Historical use documented
- Minimal or no modern scientific validation
- Based on traditional knowledge systems

### Style Guide

**Tone**: Professional, empowering, compassionate, evidence-based

**Voice**: Second person ("you") when addressing user, third person for descriptions

**Formatting**:
- Use sentence case for headings
- Use bold for emphasis sparingly
- Use bullet points for lists
- Write short paragraphs (3-4 sentences max)

**Terminology**:
- Use "may" not "will" for effects (e.g., "may reduce symptoms")
- Use "herb" or "plant" not "medication" or "treatment"
- Use "evidence suggests" not "proven to"
- Always include qualifiers: "Some studies suggest...", "Traditionally used for..."

**Disclaimers to Include**:
- "This information is for educational purposes only"
- "Consult a healthcare provider before use"
- "Not intended to diagnose, treat, cure, or prevent any disease"

### Common Pitfalls to Avoid

1. ❌ Making cure or treatment claims
2. ❌ Recommending herbs for serious conditions without medical oversight
3. ❌ Incomplete contraindication information
4. ❌ Unsupported dosage recommendations
5. ❌ Using scientific names incorrectly
6. ❌ Inadequate source citations
7. ❌ Overstating evidence strength
8. ❌ Ignoring sustainability concerns
9. ❌ Missing red flag warnings
10. ❌ Inadequate drug interaction information

### Version Control

- **Version Number**: Increment for each update (e.g., 1.0, 1.1, 2.0)
- **Change Log**: Document all changes with dates
- **Re-review**: Major changes require full advisory board re-review
- **Annual Review**: All entries reviewed annually for updates

---

## Example Entry Files

See `sample-entries.json` for complete examples of:
- Common Cold (condition)
- Insomnia (condition)
- Mild Anxiety (condition)
- Echinacea purpurea (plant)
- Valeriana officinalis (plant)
- Piper methysticum / Kava (plant)

---

**Following this template ensures consistency, safety, and quality across all NaturoPath: 101 content.**
