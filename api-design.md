# API Design — NaturoPath: 101

## Overview

The NaturoPath: 101 API provides programmatic access to the platform's comprehensive database of natural remedies, medicinal plants, and health conditions. This RESTful API is designed to support the mobile and web applications, as well as potential third-party integrations.

## Base URL

```
Production: https://api.naturopath101.com/v1
Staging: https://staging-api.naturopath101.com/v1
Development: http://localhost:3000/v1
```

## Authentication

### API Key Authentication (Public Endpoints)
For read-only access to general content:

```http
GET /conditions
X-API-Key: your_api_key_here
```

### JWT Authentication (User-Specific Endpoints)
For authenticated user actions:

```http
POST /medicine-cabinet/items
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

### OAuth 2.0 (Third-Party Applications)
For third-party integrations:

```http
Authorization: Bearer oauth_access_token
```

## API Endpoints

### Conditions

#### List Conditions
```http
GET /conditions
```

Query Parameters:
- `category` (string): Filter by category (Digestive, Respiratory, etc.)
- `severity` (string): Filter by severity (Mild, Moderate, Severe)
- `search` (string): Search by name or symptoms
- `page` (integer): Page number (default: 1)
- `limit` (integer): Results per page (default: 20, max: 100)
- `sort` (string): Sort field (name, category, severity)
- `order` (string): Sort order (asc, desc)

Response:
```json
{
  "data": [
    {
      "id": "cond-001",
      "name": "Common Cold",
      "category": "Respiratory",
      "severity": "Mild",
      "description": "A viral infection of the upper respiratory tract...",
      "symptoms": ["Runny nose", "Sore throat", "Cough"],
      "prevalence": "Very High"
    }
  ],
  "meta": {
    "page": 1,
    "limit": 20,
    "total": 101,
    "totalPages": 6
  }
}
```

#### Get Condition Details
```http
GET /conditions/{conditionId}
```

Response:
```json
{
  "data": {
    "id": "cond-001",
    "name": "Common Cold",
    "category": "Respiratory",
    "description": "A viral infection of the upper respiratory tract...",
    "symptoms": ["Runny or stuffy nose", "Sore throat", "Cough"],
    "severity": "Mild",
    "conventionalTreatments": ["Rest and hydration", "OTC pain relievers"],
    "naturalRemedies": [
      {
        "plantId": "plant-001",
        "plantName": "Echinacea",
        "efficacy": "Moderate Evidence",
        "notes": "May reduce duration and severity"
      }
    ],
    "lifestyleModifications": ["Adequate rest", "Increased fluids"],
    "warnings": ["Seek medical attention if fever exceeds 101.3°F"],
    "scientificReferences": [
      {
        "title": "Echinacea for preventing and treating the common cold",
        "authors": ["Karsch-Völk M", "Barrett B"],
        "year": 2014,
        "journal": "Cochrane Database Syst Rev",
        "doi": "10.1002/14651858.CD000530.pub3"
      }
    ],
    "relatedConditions": ["cond-022", "cond-029"],
    "prevalence": "Very common; adults average 2-3 colds per year",
    "tags": ["respiratory", "viral", "seasonal"]
  }
}
```

### Medicinal Plants

#### List Plants
```http
GET /plants
```

Query Parameters:
- `family` (string): Filter by plant family
- `safetyRating` (string): Filter by safety rating
- `conditionId` (string): Plants that may help with specific condition
- `search` (string): Search by common or scientific name
- `page` (integer): Page number
- `limit` (integer): Results per page
- `sort` (string): Sort field
- `order` (string): Sort order

Response:
```json
{
  "data": [
    {
      "id": "plant-001",
      "commonName": "Echinacea",
      "scientificName": "Echinacea purpurea",
      "family": "Asteraceae",
      "safetyRating": "Generally Safe",
      "partsUsed": ["Root", "Flower", "Leaf"],
      "conditionsAddressed": ["cond-001", "cond-022"]
    }
  ],
  "meta": {
    "page": 1,
    "limit": 20,
    "total": 200,
    "totalPages": 10
  }
}
```

#### Get Plant Details
```http
GET /plants/{plantId}
```

Response:
```json
{
  "data": {
    "id": "plant-001",
    "commonName": "Echinacea",
    "alternateNames": ["Purple Coneflower", "American Coneflower"],
    "scientificName": "Echinacea purpurea",
    "family": "Asteraceae",
    "nativeRegions": ["North America", "Central United States"],
    "description": "A flowering plant native to North America...",
    "partsUsed": ["Root", "Flower", "Leaf"],
    "activeCompounds": [
      {
        "name": "Alkamides",
        "description": "Compounds with immunomodulatory effects"
      }
    ],
    "traditionalUses": ["Wound healing", "Infections"],
    "modernUses": ["Common cold prevention", "Immune support"],
    "preparations": [
      {
        "method": "Tea/Infusion",
        "instructions": "Steep 1-2 teaspoons in hot water for 10-15 minutes",
        "duration": "3 times daily"
      }
    ],
    "dosage": {
      "standardDose": "300-500 mg dried extract, 3 times daily",
      "maximumDailyDose": "Up to 1500 mg daily",
      "notes": "Most effective at first sign of symptoms"
    },
    "safetyRating": "Generally Safe",
    "contraindications": ["Autoimmune disorders", "Asteraceae allergy"],
    "drugInteractions": [
      {
        "drug": "Immunosuppressants",
        "interaction": "May counteract effects",
        "severity": "Moderate"
      }
    ],
    "sideEffects": ["Mild GI upset", "Allergic reactions (rare)"],
    "pregnancy": "Use with Caution",
    "breastfeeding": "Use with Caution",
    "scientificEvidence": [...],
    "conditionsAddressed": ["cond-001"],
    "images": [
      {
        "url": "https://cdn.naturopath101.com/plants/echinacea-01.jpg",
        "caption": "Echinacea purpurea in bloom",
        "type": "Whole Plant"
      }
    ],
    "sustainability": {
      "status": "Cultivated",
      "notes": "Widely cultivated; prefer cultivated sources"
    }
  }
}
```

### Search

#### Global Search
```http
GET /search
```

Query Parameters:
- `q` (string, required): Search query
- `type` (string): Filter by type (condition, plant, all)
- `page` (integer): Page number
- `limit` (integer): Results per page

Response:
```json
{
  "data": {
    "conditions": [
      {
        "id": "cond-001",
        "name": "Common Cold",
        "category": "Respiratory",
        "relevance": 0.95
      }
    ],
    "plants": [
      {
        "id": "plant-001",
        "commonName": "Echinacea",
        "scientificName": "Echinacea purpurea",
        "relevance": 0.88
      }
    ]
  },
  "meta": {
    "query": "cold",
    "totalResults": 15
  }
}
```

#### Symptom Checker
```http
POST /search/symptoms
```

Request Body:
```json
{
  "symptoms": ["runny nose", "sore throat", "fatigue"],
  "limit": 5
}
```

Response:
```json
{
  "data": [
    {
      "conditionId": "cond-001",
      "name": "Common Cold",
      "matchScore": 0.92,
      "matchedSymptoms": ["runny nose", "sore throat", "fatigue"],
      "totalSymptoms": 7
    },
    {
      "conditionId": "cond-022",
      "name": "Sinusitis",
      "matchScore": 0.67,
      "matchedSymptoms": ["runny nose", "fatigue"],
      "totalSymptoms": 5
    }
  ]
}
```

### Medicine Cabinet (Authenticated)

#### Get User's Medicine Cabinet
```http
GET /medicine-cabinet
Authorization: Bearer {jwt_token}
```

Response:
```json
{
  "data": {
    "userId": "user-123",
    "items": [
      {
        "id": "item-001",
        "plantId": "plant-002",
        "plantName": "Valerian",
        "form": "Tincture",
        "brand": "Nature's Way",
        "dosage": "2ml",
        "frequency": "Before bedtime",
        "purpose": "Sleep support",
        "addedDate": "2025-10-15",
        "expirationDate": "2026-10-15",
        "notes": "Works well for me",
        "effectivenessRating": 4
      }
    ],
    "createdAt": "2025-10-01T10:00:00Z",
    "updatedAt": "2025-11-01T15:30:00Z"
  }
}
```

#### Add Item to Medicine Cabinet
```http
POST /medicine-cabinet/items
Authorization: Bearer {jwt_token}
Content-Type: application/json
```

Request Body:
```json
{
  "plantId": "plant-002",
  "form": "Tincture",
  "brand": "Nature's Way",
  "dosage": "2ml",
  "frequency": "Before bedtime",
  "purpose": "Sleep support",
  "expirationDate": "2026-10-15",
  "notes": "Starting tonight"
}
```

Response:
```json
{
  "data": {
    "id": "item-002",
    "plantId": "plant-002",
    "form": "Tincture",
    "brand": "Nature's Way",
    "dosage": "2ml",
    "frequency": "Before bedtime",
    "purpose": "Sleep support",
    "addedDate": "2025-11-21",
    "expirationDate": "2026-10-15",
    "notes": "Starting tonight"
  },
  "message": "Item added successfully"
}
```

#### Update Medicine Cabinet Item
```http
PATCH /medicine-cabinet/items/{itemId}
Authorization: Bearer {jwt_token}
```

Request Body:
```json
{
  "effectivenessRating": 4,
  "notes": "Works well, helps me fall asleep faster"
}
```

#### Delete Medicine Cabinet Item
```http
DELETE /medicine-cabinet/items/{itemId}
Authorization: Bearer {jwt_token}
```

#### Check Interactions
```http
POST /medicine-cabinet/check-interactions
Authorization: Bearer {jwt_token}
```

Request Body:
```json
{
  "plantIds": ["plant-001", "plant-002", "plant-004"],
  "medications": ["warfarin", "sertraline"]
}
```

Response:
```json
{
  "data": {
    "interactions": [
      {
        "type": "herb-drug",
        "plant": "Ginger",
        "drug": "warfarin",
        "interaction": "May increase bleeding risk",
        "severity": "Moderate",
        "recommendation": "Consult healthcare provider"
      }
    ],
    "plantInteractions": [],
    "overallRisk": "Moderate"
  }
}
```

### User Management

#### Register User
```http
POST /auth/register
```

Request Body:
```json
{
  "email": "user@example.com",
  "password": "SecurePass123!",
  "displayName": "John Doe"
}
```

Response:
```json
{
  "data": {
    "userId": "user-123",
    "email": "user@example.com",
    "displayName": "John Doe",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
  },
  "message": "Registration successful"
}
```

#### Login
```http
POST /auth/login
```

Request Body:
```json
{
  "email": "user@example.com",
  "password": "SecurePass123!"
}
```

Response:
```json
{
  "data": {
    "userId": "user-123",
    "email": "user@example.com",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "refreshToken": "refresh_token_here",
    "expiresIn": 3600
  }
}
```

#### Get User Profile
```http
GET /users/profile
Authorization: Bearer {jwt_token}
```

#### Update User Profile
```http
PATCH /users/profile
Authorization: Bearer {jwt_token}
```

Request Body:
```json
{
  "displayName": "Jane Doe",
  "preferences": {
    "notifications": true,
    "newsletter": false
  }
}
```

#### Delete User Account
```http
DELETE /users/account
Authorization: Bearer {jwt_token}
```

### Subscription Management

#### Get Subscription Status
```http
GET /subscription
Authorization: Bearer {jwt_token}
```

Response:
```json
{
  "data": {
    "tier": "Premium",
    "status": "Active",
    "startDate": "2025-10-01T00:00:00Z",
    "endDate": "2026-10-01T00:00:00Z",
    "autoRenew": true,
    "features": ["ad-free", "expert-consultations", "advanced-search"]
  }
}
```

#### Create Subscription
```http
POST /subscription
Authorization: Bearer {jwt_token}
```

Request Body:
```json
{
  "tier": "Premium",
  "billingCycle": "annual",
  "paymentMethodId": "pm_1234567890"
}
```

## Error Responses

### Standard Error Format
```json
{
  "error": {
    "code": "RESOURCE_NOT_FOUND",
    "message": "The requested condition was not found",
    "details": {
      "conditionId": "cond-999"
    },
    "timestamp": "2025-11-21T13:28:46Z",
    "requestId": "req-abc123"
  }
}
```

### Error Codes

| HTTP Status | Error Code | Description |
|-------------|------------|-------------|
| 400 | BAD_REQUEST | Invalid request parameters |
| 401 | UNAUTHORIZED | Missing or invalid authentication |
| 403 | FORBIDDEN | Insufficient permissions |
| 404 | RESOURCE_NOT_FOUND | Resource does not exist |
| 409 | CONFLICT | Resource conflict (e.g., duplicate) |
| 422 | VALIDATION_ERROR | Request validation failed |
| 429 | RATE_LIMIT_EXCEEDED | Too many requests |
| 500 | INTERNAL_ERROR | Server error |
| 503 | SERVICE_UNAVAILABLE | Service temporarily unavailable |

## Rate Limiting

### Rate Limits by Tier

| Tier | Requests/Hour | Requests/Day |
|------|---------------|--------------|
| Free | 100 | 1,000 |
| Premium | 1,000 | 10,000 |
| Professional | 5,000 | 50,000 |
| API Partner | Custom | Custom |

### Rate Limit Headers
```http
X-RateLimit-Limit: 100
X-RateLimit-Remaining: 95
X-RateLimit-Reset: 1637509200
```

## Pagination

All list endpoints support cursor-based pagination:

```http
GET /conditions?page=2&limit=20
```

Response includes pagination metadata:
```json
{
  "data": [...],
  "meta": {
    "page": 2,
    "limit": 20,
    "total": 101,
    "totalPages": 6,
    "hasNext": true,
    "hasPrevious": true
  },
  "links": {
    "first": "/conditions?page=1&limit=20",
    "prev": "/conditions?page=1&limit=20",
    "next": "/conditions?page=3&limit=20",
    "last": "/conditions?page=6&limit=20"
  }
}
```

## Filtering & Sorting

### Multiple Filters
```http
GET /plants?family=Asteraceae&safetyRating=Generally+Safe&sort=commonName&order=asc
```

### Operator Support
```http
GET /conditions?severity=Moderate,Severe
GET /plants?partsUsed[contains]=Root
```

## Versioning

API version is included in the URL:
```
https://api.naturopath101.com/v1/conditions
```

Breaking changes will result in a new version (v2, v3, etc.). Non-breaking changes are introduced within the same version.

## Webhooks (Premium/Professional)

Subscribe to events:

```http
POST /webhooks
Authorization: Bearer {jwt_token}
```

Request Body:
```json
{
  "url": "https://your-app.com/webhooks",
  "events": ["medicine-cabinet.updated", "subscription.renewed"],
  "secret": "webhook_secret_for_verification"
}
```

Supported Events:
- `medicine-cabinet.updated`
- `medicine-cabinet.interaction-detected`
- `subscription.created`
- `subscription.renewed`
- `subscription.cancelled`

## GraphQL API (Coming Soon)

Alternative GraphQL endpoint for complex queries:
```
https://api.naturopath101.com/graphql
```

Example Query:
```graphql
query {
  condition(id: "cond-001") {
    name
    symptoms
    naturalRemedies {
      plant {
        commonName
        scientificName
        dosage {
          standardDose
        }
      }
      efficacy
    }
  }
}
```

## SDK & Libraries

Official SDKs available:
- JavaScript/TypeScript (npm: `naturopath101-sdk`)
- Python (pip: `naturopath101`)
- Swift (CocoaPods/SPM: `NaturoPath101`)
- Kotlin (Maven: `com.naturopath101:android-sdk`)

## Support & Documentation

- API Documentation: https://developers.naturopath101.com
- API Status: https://status.naturopath101.com
- Support: api-support@naturopath101.com
- Community Forum: https://community.naturopath101.com

---

**Version**: 1.0  
**Last Updated**: November 2025  
**Owner**: Engineering Team  
**Status**: Design Document
