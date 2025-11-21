# API Design — NaturoPath: 101

## Overview

This document outlines the API design for NaturoPath: 101. The API supports content delivery, search, user management, and premium features including the Medicine Cabinet interaction checker.

## Architecture Options

### Option 1: GraphQL (Recommended)
**Advantages:**
- Single endpoint for all queries
- Client specifies exactly what data it needs (reduces over-fetching)
- Strong typing with schema
- Excellent for complex, nested data (plants, conditions, phytochemicals, references)
- Built-in introspection and documentation
- Good tooling (Apollo Client/Server, GraphQL Playground)

**Recommended Stack:**
- **Server**: Node.js + Apollo Server
- **Database**: PostgreSQL for structured data
- **Search**: Elasticsearch or OpenSearch
- **Client**: Apollo Client (Flutter has graphql_flutter package)

### Option 2: REST
**Advantages:**
- More familiar to many developers
- Easier caching with HTTP
- Simpler for basic CRUD operations

**Recommended Stack:**
- **Server**: Node.js + Express or Fastify
- **Database**: PostgreSQL
- **Search**: Elasticsearch or OpenSearch
- **Client**: Dio or http package (Flutter)

### Option 3: Firebase (Quickest to MVP)
**Advantages:**
- Fastest to implement
- Authentication built-in
- Real-time sync
- Generous free tier
- Good Flutter support (FlutterFire)

**Limitations:**
- Less flexible querying
- More expensive at scale
- Vendor lock-in

**Recommended for:**
- Prototyping
- Small-scale deployment
- When team has limited backend experience

## API Specification (GraphQL)

### Schema

#### Types

```graphql
scalar DateTime
scalar JSON

enum EvidenceLevel {
  TRADITIONAL
  IN_VITRO
  ANIMAL
  HUMAN_TRIAL
  STRONG_CLINICAL
}

enum Severity {
  MILD
  MODERATE
  SEVERE
  CONTRAINDICATED
}

enum InteractionSeverity {
  MINOR
  MODERATE
  MAJOR
  CONTRAINDICATED
}

type Reference {
  type: String!
  id: String
  title: String!
  authors: String
  year: Int
  url: String
}

type Phytochemical {
  name: String!
  chemicalClass: String
  pubchemId: String
  casNumber: String
  proposedMechanism: String
  concentration: String
}

type PreparationMethod {
  method: String!
  instructions: String!
  dosage: String
  frequency: String
  duration: String
  notes: String
}

type Contraindication {
  category: String!
  severity: Severity!
  description: String!
  references: [Reference!]
}

type Image {
  url: String!
  altText: String!
  caption: String
  imageType: String!
  thumbnailUrl: String
  attribution: String
  license: String
}

type HarvestingGuidance {
  partUsed: [String!]
  harvestSeason: String
  sustainabilityNotes: String
  cultivationDifficulty: String
}

type Plant {
  id: ID!
  scientificName: String!
  commonNames: [String!]!
  family: String
  genus: String
  species: String
  description: String!
  images: [Image!]
  phytochemicals: [Phytochemical!]
  preparationMethods: [PreparationMethod!]
  contraindications: [Contraindication!]
  harvestingGuidance: HarvestingGuidance
  evidenceLevel: EvidenceLevel!
  references: [Reference!]
  lastReviewedDate: DateTime
  reviewedBy: [String!]
  
  # Relations
  conditions: [Condition!]
}

type RecommendedPlant {
  plant: Plant!
  usage: String!
  evidenceLevel: EvidenceLevel
}

type Condition {
  id: ID!
  name: String!
  synonyms: [String!]
  icdCodes: [String!]
  overview: String!
  symptoms: [String!]!
  redFlags: [String!]!
  recommendedPlants: [RecommendedPlant!]!
  evidenceLevel: EvidenceLevel!
  references: [Reference!]
  lastReviewedDate: DateTime
  reviewedBy: [String!]
}

type Interaction {
  id: ID!
  plant: Plant!
  drugName: String!
  activeIngredient: String
  rxNormCode: String
  interactionType: String
  severity: InteractionSeverity!
  mechanism: String
  clinicalSignificance: String
  recommendation: String!
  references: [Reference!]
}

type SearchResult {
  conditions: [Condition!]
  plants: [Plant!]
  totalCount: Int!
}

type User {
  id: ID!
  email: String!
  subscriptionTier: SubscriptionTier!
  subscriptionExpiry: DateTime
  createdAt: DateTime!
}

enum SubscriptionTier {
  FREE
  STANDARD
  PREMIUM
}

type Subscription {
  id: ID!
  userId: ID!
  tier: SubscriptionTier!
  status: String!
  expiresAt: DateTime
  platformReceiptData: String
}

input MedicationInput {
  name: String!
  activeIngredients: [String!]
  rxNormCode: String
}

type InteractionCheck {
  medication: String!
  interactions: [Interaction!]!
  summary: String!
  maxSeverity: InteractionSeverity!
}
```

#### Queries

```graphql
type Query {
  # Content retrieval
  condition(id: ID!): Condition
  conditions(
    offset: Int
    limit: Int
    evidenceLevel: EvidenceLevel
  ): [Condition!]!
  
  plant(id: ID!): Plant
  plants(
    offset: Int
    limit: Int
    evidenceLevel: EvidenceLevel
  ): [Plant!]!
  
  # Search
  search(
    query: String!
    filters: SearchFilters
    offset: Int
    limit: Int
  ): SearchResult!
  
  # Medicine Cabinet (Premium)
  checkInteractions(
    medications: [MedicationInput!]!
    plants: [ID!]!
  ): [InteractionCheck!]!
  
  # User
  me: User
  mySubscription: Subscription
}

input SearchFilters {
  evidenceLevel: [EvidenceLevel!]
  contraindication: [String!]
  preparationMethod: [String!]
}
```

#### Mutations

```graphql
type Mutation {
  # Authentication
  register(email: String!, password: String!): AuthPayload!
  login(email: String!, password: String!): AuthPayload!
  refreshToken(refreshToken: String!): AuthPayload!
  
  # Subscription management
  createSubscription(
    tier: SubscriptionTier!
    platform: String!
    receiptData: String!
  ): Subscription!
  
  validateSubscription(receiptData: String!): Subscription!
  
  # User management
  updateProfile(email: String): User!
  deleteAccount: Boolean!
}

type AuthPayload {
  token: String!
  refreshToken: String!
  user: User!
}
```

#### Subscriptions (Real-time)

```graphql
type Subscription {
  # Content updates (for offline sync)
  contentUpdated: ContentUpdate!
}

type ContentUpdate {
  type: String!
  id: ID!
  timestamp: DateTime!
}
```

## REST API Endpoints (Alternative)

### Content Endpoints

```
GET /api/v1/conditions
  Query params: 
    - offset (default: 0)
    - limit (default: 20, max: 100)
    - evidence_level (optional filter)
  Response: { conditions: [...], total: N }

GET /api/v1/conditions/:id
  Response: { condition: {...} }

GET /api/v1/plants
  Query params: offset, limit, evidence_level
  Response: { plants: [...], total: N }

GET /api/v1/plants/:id
  Response: { plant: {...} }

GET /api/v1/search
  Query params:
    - q (query string)
    - type (condition|plant|both)
    - evidence_level (filter)
    - offset, limit
  Response: { conditions: [...], plants: [...], total: N }
```

### Medicine Cabinet Endpoints (Premium)

```
POST /api/v1/interactions/check
  Headers: Authorization: Bearer <token>
  Body: {
    medications: [
      { name, activeIngredients, rxNormCode }
    ],
    plantIds: [...]
  }
  Response: {
    checks: [
      {
        medication,
        interactions: [...],
        maxSeverity,
        summary
      }
    ]
  }
```

### Authentication Endpoints

```
POST /api/v1/auth/register
  Body: { email, password }
  Response: { token, refreshToken, user }

POST /api/v1/auth/login
  Body: { email, password }
  Response: { token, refreshToken, user }

POST /api/v1/auth/refresh
  Body: { refreshToken }
  Response: { token, refreshToken }

POST /api/v1/auth/logout
  Headers: Authorization: Bearer <token>
  Response: { success: true }
```

### User Endpoints

```
GET /api/v1/users/me
  Headers: Authorization: Bearer <token>
  Response: { user: {...} }

PUT /api/v1/users/me
  Headers: Authorization: Bearer <token>
  Body: { email }
  Response: { user: {...} }

DELETE /api/v1/users/me
  Headers: Authorization: Bearer <token>
  Response: { success: true }
```

### Subscription Endpoints

```
POST /api/v1/subscriptions
  Headers: Authorization: Bearer <token>
  Body: {
    tier,
    platform, // 'apple' | 'google' | 'stripe'
    receiptData // platform-specific receipt/token
  }
  Response: { subscription: {...} }

GET /api/v1/subscriptions/me
  Headers: Authorization: Bearer <token>
  Response: { subscription: {...} }

POST /api/v1/subscriptions/validate
  Headers: Authorization: Bearer <token>
  Body: { receiptData }
  Response: { subscription: {...}, valid: true/false }
```

## Search Implementation

### Elasticsearch/OpenSearch

**Index Structure:**

```json
{
  "conditions": {
    "mappings": {
      "properties": {
        "id": { "type": "keyword" },
        "name": { 
          "type": "text",
          "fields": {
            "keyword": { "type": "keyword" }
          }
        },
        "synonyms": { "type": "text" },
        "overview": { "type": "text" },
        "symptoms": { "type": "text" },
        "icdCodes": { "type": "keyword" },
        "evidence_level": { "type": "keyword" },
        "plant_ids": { "type": "keyword" }
      }
    }
  },
  "plants": {
    "mappings": {
      "properties": {
        "id": { "type": "keyword" },
        "scientific_name": {
          "type": "text",
          "fields": {
            "keyword": { "type": "keyword" }
          }
        },
        "common_names": { "type": "text" },
        "description": { "type": "text" },
        "family": { "type": "keyword" },
        "evidence_level": { "type": "keyword" },
        "contraindications": { "type": "keyword" }
      }
    }
  }
}
```

**Search Query Example:**

```json
{
  "query": {
    "multi_match": {
      "query": "sleep",
      "fields": [
        "name^3",
        "synonyms^2",
        "overview",
        "symptoms"
      ],
      "fuzziness": "AUTO"
    }
  },
  "suggest": {
    "condition_suggestion": {
      "prefix": "sle",
      "completion": {
        "field": "name.suggest"
      }
    }
  }
}
```

### Typeahead/Autocomplete

**Implementation:**
- Use Elasticsearch completion suggester
- Pre-index common search terms
- Return results after 2-3 characters typed
- Debounce client-side (300ms)
- Cache common searches

**Example Response:**
```json
{
  "suggestions": [
    { "type": "condition", "id": "cond_002", "name": "Insomnia" },
    { "type": "plant", "id": "plant_002", "name": "Valerian" }
  ]
}
```

## Database Schema (PostgreSQL)

### Core Tables

```sql
CREATE TABLE conditions (
  id VARCHAR(50) PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  synonyms TEXT[],
  icd_codes VARCHAR(20)[],
  overview TEXT NOT NULL,
  symptoms TEXT[] NOT NULL,
  red_flags TEXT[] NOT NULL,
  evidence_level VARCHAR(50) NOT NULL,
  last_reviewed_date DATE,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE plants (
  id VARCHAR(50) PRIMARY KEY,
  scientific_name VARCHAR(255) NOT NULL,
  common_names TEXT[] NOT NULL,
  family VARCHAR(100),
  genus VARCHAR(100),
  species VARCHAR(100),
  description TEXT NOT NULL,
  evidence_level VARCHAR(50) NOT NULL,
  last_reviewed_date DATE,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE condition_plants (
  id SERIAL PRIMARY KEY,
  condition_id VARCHAR(50) REFERENCES conditions(id) ON DELETE CASCADE,
  plant_id VARCHAR(50) REFERENCES plants(id) ON DELETE CASCADE,
  usage TEXT NOT NULL,
  evidence_level VARCHAR(50),
  sort_order INT DEFAULT 0,
  UNIQUE(condition_id, plant_id)
);

CREATE TABLE phytochemicals (
  id SERIAL PRIMARY KEY,
  plant_id VARCHAR(50) REFERENCES plants(id) ON DELETE CASCADE,
  name VARCHAR(255) NOT NULL,
  chemical_class VARCHAR(100),
  pubchem_id VARCHAR(50),
  cas_number VARCHAR(50),
  proposed_mechanism TEXT,
  concentration VARCHAR(100)
);

CREATE TABLE preparation_methods (
  id SERIAL PRIMARY KEY,
  plant_id VARCHAR(50) REFERENCES plants(id) ON DELETE CASCADE,
  method VARCHAR(50) NOT NULL,
  instructions TEXT NOT NULL,
  dosage VARCHAR(255),
  frequency VARCHAR(255),
  duration VARCHAR(255),
  notes TEXT
);

CREATE TABLE contraindications (
  id SERIAL PRIMARY KEY,
  plant_id VARCHAR(50) REFERENCES plants(id) ON DELETE CASCADE,
  category VARCHAR(50) NOT NULL,
  severity VARCHAR(50) NOT NULL,
  description TEXT NOT NULL
);

CREATE TABLE images (
  id SERIAL PRIMARY KEY,
  plant_id VARCHAR(50) REFERENCES plants(id) ON DELETE CASCADE,
  url TEXT NOT NULL,
  alt_text TEXT NOT NULL,
  caption TEXT,
  image_type VARCHAR(50) NOT NULL,
  thumbnail_url TEXT,
  attribution TEXT,
  license VARCHAR(100),
  sort_order INT DEFAULT 0
);

CREATE TABLE references (
  id SERIAL PRIMARY KEY,
  entity_type VARCHAR(50) NOT NULL, -- 'plant', 'condition', 'contraindication'
  entity_id VARCHAR(50) NOT NULL,
  ref_type VARCHAR(50) NOT NULL,
  ref_id VARCHAR(100),
  title TEXT NOT NULL,
  authors TEXT,
  year INT,
  url TEXT
);

CREATE TABLE interactions (
  id VARCHAR(50) PRIMARY KEY,
  plant_id VARCHAR(50) REFERENCES plants(id) ON DELETE CASCADE,
  drug_name VARCHAR(255) NOT NULL,
  active_ingredient VARCHAR(255),
  rxnorm_code VARCHAR(50),
  interaction_type VARCHAR(50),
  severity VARCHAR(50) NOT NULL,
  mechanism TEXT,
  clinical_significance TEXT,
  recommendation TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email VARCHAR(255) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  subscription_tier VARCHAR(20) DEFAULT 'FREE',
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE subscriptions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  tier VARCHAR(20) NOT NULL,
  status VARCHAR(50) NOT NULL, -- active, expired, canceled
  platform VARCHAR(50) NOT NULL, -- apple, google, stripe
  platform_subscription_id VARCHAR(255),
  receipt_data TEXT,
  expires_at TIMESTAMP,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_conditions_evidence ON conditions(evidence_level);
CREATE INDEX idx_plants_evidence ON plants(evidence_level);
CREATE INDEX idx_condition_plants_condition ON condition_plants(condition_id);
CREATE INDEX idx_condition_plants_plant ON condition_plants(plant_id);
CREATE INDEX idx_interactions_plant ON interactions(plant_id);
CREATE INDEX idx_interactions_drug ON interactions(drug_name);
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_subscriptions_user ON subscriptions(user_id);
```

## Authentication & Authorization

### JWT Token Structure

```json
{
  "sub": "user-uuid",
  "email": "user@example.com",
  "tier": "PREMIUM",
  "iat": 1234567890,
  "exp": 1234571490
}
```

**Token Expiration:**
- Access token: 15 minutes
- Refresh token: 30 days

**Security:**
- Use RS256 (asymmetric) for JWT signing
- Store refresh tokens in database (allows revocation)
- Rotate refresh tokens on use
- Implement token blacklist for logout

### Authorization Rules

- **Free tier**: Read access to sample content (first 10 conditions)
- **Standard tier**: Read access to all content
- **Premium tier**: All Standard + Medicine Cabinet interactions

## Rate Limiting

```
Unauthenticated:
  - Search: 10 requests/minute
  - Content: 30 requests/minute

Free tier:
  - Search: 30 requests/minute
  - Content: 60 requests/minute

Standard/Premium:
  - Search: 100 requests/minute
  - Content: 200 requests/minute
  - Interactions (Premium only): 50 requests/minute
```

## Caching Strategy

### CDN/Edge Caching
- Static content (images): 1 year
- Plant/condition data: 1 day
- API responses: 5 minutes (with ETag)

### Application Caching
- Redis for frequently accessed data
- Cache search results (5 minutes)
- Cache plant/condition data (1 hour)
- Invalidate cache on content updates

### Client Caching
- Aggressive caching with ETag/If-None-Match
- Service worker for web PWA
- Local SQLite database for mobile offline access

## Offline Support

### Content Bundles

**Approach:**
- Pre-generate downloadable content bundles
- Store as SQLite databases
- Sign bundles for integrity verification

**Bundle Structure:**
```
bundle_v1.0_20240115.db
  - Contains: conditions, plants, phytochemicals, etc.
  - Excludes: user data, interactions (server-side only)
  - Size: ~50-100MB compressed
```

**API Endpoints:**
```
GET /api/v1/bundles/latest
  Response: {
    version: "1.0",
    date: "2024-01-15",
    url: "https://cdn.../bundle_v1.0_20240115.db.gz",
    checksum: "sha256:...",
    size: 52428800
  }

GET /api/v1/bundles/check
  Query params: current_version
  Response: {
    updateAvailable: true/false,
    latest: {...}
  }
```

## Content Updates & Versioning

### Versioning Strategy
- Semantic versioning for content (major.minor.patch)
- Major: Structural changes, removed content
- Minor: New content, significant updates
- Patch: Corrections, minor updates

### Update Mechanism
- Poll for updates on app start (if online)
- Download incremental updates when possible
- Full bundle update as fallback
- User controls when to download (Wi-Fi only option)

## Error Handling

### Standard Error Response

```json
{
  "error": {
    "code": "RESOURCE_NOT_FOUND",
    "message": "Condition not found",
    "statusCode": 404,
    "details": {
      "requestedId": "cond_999"
    }
  }
}
```

### Error Codes

- `UNAUTHORIZED` (401)
- `FORBIDDEN` (403) - Valid auth but insufficient permissions
- `RESOURCE_NOT_FOUND` (404)
- `VALIDATION_ERROR` (400)
- `RATE_LIMIT_EXCEEDED` (429)
- `SERVER_ERROR` (500)
- `SERVICE_UNAVAILABLE` (503)

## Performance Targets

- Search response: < 200ms (p95)
- Content retrieval: < 100ms (p95)
- Interaction check: < 500ms (p95)
- Image load (CDN): < 300ms (p95)
- API availability: 99.9%

## Monitoring & Observability

### Metrics to Track
- Request rate and latency (per endpoint)
- Error rate (per endpoint and error type)
- Search query performance
- Cache hit rates
- Database query performance
- Subscription validation success rate

### Logging
- Structured JSON logs
- Include request ID for tracing
- **Never log**: PHI, passwords, tokens
- **Log**: Request metadata, errors, performance metrics

### Tools
- **APM**: New Relic, Datadog, or open-source (Prometheus + Grafana)
- **Error tracking**: Sentry
- **Logging**: CloudWatch, ELK stack, or Loki

---

**This API design balances flexibility, performance, and security while supporting both current features and future expansion.**
