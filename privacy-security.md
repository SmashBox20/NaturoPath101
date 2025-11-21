# Privacy & Security Recommendations — NaturoPath: 101

## Overview

This document outlines privacy and security best practices for the NaturoPath: 101 application, with particular emphasis on the Medicine Cabinet feature, which handles potentially sensitive health information.

## Core Privacy Principles

### 1. Privacy by Design
- **Minimize data collection**: Only collect data necessary for app functionality
- **Local-first architecture**: Store sensitive data on-device by default
- **User control**: Users decide what data to share and when
- **Transparency**: Clear communication about data handling practices

### 2. User Consent
- **Explicit opt-in** for any cloud sync or data sharing
- **Granular permissions** for different types of data
- **Easy to withdraw** consent at any time
- **Clear explanations** of why data is needed and how it will be used

### 3. Data Minimization
- Don't require user accounts for basic app functionality
- Don't collect personal information unless necessary
- Don't share data with third parties without explicit consent
- Regularly purge unnecessary data

## Medicine Cabinet Privacy & Security

The Medicine Cabinet feature stores information about users' medications and health conditions, which is **Protected Health Information (PHI)** or **Personal Health Information** in many jurisdictions.

### Local-Only Storage (Default)

**Default Behavior:**
- All Medicine Cabinet data stored **locally on device only**
- No transmission to servers
- No cloud backup by default
- Data accessible only on the device where it was entered

**Implementation Requirements:**
- Use platform-specific secure storage:
  - **iOS**: Keychain Services with `kSecAttrAccessibleWhenUnlocked`
  - **Android**: EncryptedSharedPreferences (Jetpack Security library)
  - **Desktop**: OS-specific credential managers or encrypted local database
- Encrypt data at rest using AES-256
- Implement secure deletion (overwrite data when deleted)
- No logging of PHI to crash reports or analytics
- Disable cloud backup for Medicine Cabinet data:
  - iOS: Exclude from iCloud backup using `NSURLIsExcludedFromBackupKey`
  - Android: Add `android:allowBackup="false"` for Medicine Cabinet files

### Optional Cloud Sync

**If users explicitly opt-in to cloud sync:**

#### Legal & Compliance Considerations

1. **HIPAA Compliance (US)**
   - If storing PHI in the cloud, evaluate HIPAA applicability
   - If HIPAA applies, you are a **Business Associate** and must:
     - Sign Business Associate Agreement (BAA) with cloud provider
     - Implement required administrative, physical, and technical safeguards
     - Conduct risk assessments
     - Maintain audit logs
     - Have breach notification procedures
   - Cloud providers offering HIPAA-compliant storage:
     - AWS (S3, RDS with BAA)
     - Google Cloud (Cloud Storage, Firestore with BAA)
     - Azure (various services with BAA)
     - **Note**: Firebase requires special configuration and BAA for HIPAA

2. **GDPR Compliance (EU)**
   - Health data is **special category data** under GDPR Article 9
   - Requires **explicit consent** and appropriate safeguards
   - Users have rights to:
     - Access their data
     - Rectify inaccurate data
     - Delete their data ("right to be forgotten")
     - Data portability
     - Restrict processing
   - Data Processing Agreement (DPA) required with cloud providers
   - Consider data residency requirements (store EU data in EU)

3. **Other Jurisdictions**
   - Research health data privacy laws in target markets
   - Canada: PIPEDA (Personal Information Protection and Electronic Documents Act)
   - Australia: Privacy Act 1988 and Australian Privacy Principles
   - Brazil: LGPD (Lei Geral de Proteção de Dados)
   - California: CCPA/CPRA includes health data protections

#### Technical Requirements for Cloud Sync

**Encryption:**
- **End-to-end encryption** for PHI in transit and at rest
- Encrypt data on-device **before** sending to cloud
- Use strong encryption (AES-256-GCM)
- User controls the encryption key (derived from password/PIN, not stored on server)
- Consider zero-knowledge architecture (server cannot decrypt data)

**Authentication & Access Control:**
- Strong authentication required (email/password with minimum 8 characters, or OAuth)
- Multi-factor authentication (MFA) strongly recommended
- Session management with secure tokens (JWT with short expiration)
- Implement rate limiting to prevent brute force attacks

**Data Transmission:**
- All communications over HTTPS/TLS 1.3+
- Certificate pinning for additional security
- Validate SSL certificates properly

**Server-Side Security:**
- Follow OWASP security best practices
- Regular security audits and penetration testing
- Least-privilege access controls for server infrastructure
- Encrypt data at rest in database
- Implement database encryption (TDE - Transparent Data Encryption)
- Secure key management (use HSM or cloud KMS)
- Regular backup of cloud data with encryption
- Monitor for suspicious access patterns

**Audit Logging:**
- Log access to PHI (who, what, when, where)
- Secure storage of audit logs (encrypted, tamper-evident)
- Retain logs per regulatory requirements (typically 6-7 years for HIPAA)
- Regular review of logs for security incidents

## General App Privacy

### Analytics & Crash Reporting

**Best Practices:**
- Use privacy-respecting analytics (e.g., self-hosted PostHog, or Amplitude with strict filtering)
- **Never log PHI** to analytics or crash reports
- Anonymize or pseudonymize all collected data
- Provide clear opt-out mechanism
- Don't use analytics SDKs that share data with third parties without user consent

**Recommended Approach:**
- Collect aggregate, non-identifying usage data only
- Examples of acceptable data:
  - Which plant/condition pages are viewed (not which medications are stored)
  - Search terms (sanitized to remove potentially identifying info)
  - Feature usage statistics (e.g., "N users used search today")
- Sanitize all data before logging:
  - Strip user-entered text from Medicine Cabinet
  - Remove IP addresses or hash them
  - Don't log device identifiers with health data

**Prohibited:**
- Logging medication names or health conditions
- Linking health data to user identity
- Sharing crash reports containing PHI

### In-App Purchases & Payment Data

**Payment Processing:**
- Use platform-specific IAP (Apple, Google) for mobile
- For web/desktop, use PCI-DSS compliant payment processor (Stripe, etc.)
- **Never store credit card information** on your servers
- Payment processors handle PCI compliance

**User Data:**
- Store minimum necessary for subscription management:
  - Subscription tier
  - Expiration date
  - Platform receipt/token for validation
- Link purchases to anonymous user ID if possible
- Don't require personal information beyond what payment processor requires

### Third-Party Services

**Minimize Third-Party SDKs:**
- Audit all third-party libraries and SDKs
- Ensure third-party services comply with privacy regulations
- Review privacy policies of all third-party services
- Sign Data Processing Agreements (DPAs) where required

**Acceptable Third-Party Services:**
- App stores (Apple, Google, Microsoft)
- Payment processors (Stripe, Apple IAP, Google IAP)
- Cloud infrastructure with BAA/DPA (AWS, Google Cloud, Azure)
- Analytics with privacy controls (PostHog self-hosted, privacy-focused options)

**Prohibited/Restricted:**
- Advertising networks (typically incompatible with health data)
- Social media SDKs (unless user explicitly wants to share)
- Any service that shares data without explicit user consent

### User Rights & Data Management

**User Data Rights:**
- **Access**: Provide interface for users to view all stored data
- **Export**: Allow users to export their Medicine Cabinet data (JSON, CSV)
- **Delete**: Implement complete data deletion
  - Local: Secure deletion from device
  - Cloud: Delete from all servers and backups within reasonable timeframe
  - Provide confirmation of deletion
- **Rectification**: Users can edit/correct their data

**Account Deletion:**
- Allow users to delete accounts easily (not buried in settings)
- Clearly explain what data will be deleted
- Irreversibly delete all user data within 30 days (or per regulations)
- Send confirmation email

## Privacy Policy

### Required Content

Your privacy policy must clearly state:

1. **What data you collect**
   - Types of data (health data, usage data, etc.)
   - How data is collected (user input, automatic)

2. **How you use data**
   - Provide app functionality
   - Improve user experience
   - Comply with legal obligations

3. **Data storage**
   - Where data is stored (on-device, cloud)
   - How long data is retained
   - Security measures

4. **Data sharing**
   - With whom data is shared (service providers, etc.)
   - Legal requirements (subpoenas, etc.)
   - User-initiated sharing

5. **User rights**
   - Access, export, delete, correct data
   - How to exercise these rights

6. **Contact information**
   - How to contact for privacy questions
   - Data protection officer (if required)

7. **Policy changes**
   - How users will be notified
   - When policy was last updated

### Review & Updates

- Review privacy policy annually or when practices change
- Notify users of material changes
- Require re-consent if changes significantly affect user rights

## Security Best Practices

### Application Security

**Code Security:**
- Regular security audits and code reviews
- Static Application Security Testing (SAST)
- Dependency scanning for vulnerabilities
- Follow OWASP Mobile Security Project guidelines
- Implement certificate pinning
- Use secure coding practices (input validation, output encoding, etc.)

**Authentication:**
- Secure password storage (bcrypt, scrypt, or Argon2 with salt)
- Never store passwords in plain text
- Implement secure password reset flows
- Optional biometric authentication (Face ID, Touch ID, fingerprint)
- Session timeout for sensitive features

**Data Validation:**
- Validate all user input
- Sanitize data before storage or display
- Prevent injection attacks (SQL, XSS, etc.)

**App Permissions:**
- Request minimum necessary permissions
- Explain why each permission is needed
- Handle permission denial gracefully

### Infrastructure Security

**If Using Backend:**
- Keep all systems patched and up-to-date
- Use WAF (Web Application Firewall)
- DDoS protection
- Intrusion detection/prevention systems
- Regular vulnerability scanning
- Secure API design (authentication, rate limiting, input validation)
- Implement defense in depth

**Database Security:**
- Encrypt at rest and in transit
- Least-privilege database access
- Regular backups (encrypted)
- Secure backup storage
- Test restore procedures

**Secrets Management:**
- Never commit secrets to source control
- Use environment variables or secrets management services (AWS Secrets Manager, etc.)
- Rotate API keys and credentials regularly
- Separate credentials per environment (dev, staging, prod)

## Incident Response

### Security Breach Plan

1. **Detection**: Monitor for unauthorized access
2. **Containment**: Isolate affected systems
3. **Assessment**: Determine scope of breach
4. **Notification**:
   - Notify affected users per legal requirements
   - HIPAA: Notify within 60 days
   - GDPR: Notify within 72 hours
   - Include: what happened, what data, what you're doing
5. **Remediation**: Fix vulnerability, enhance security
6. **Documentation**: Maintain records of incident and response

### Breach Notification Requirements

- Determine if breach triggers notification requirements (varies by jurisdiction)
- Prepare communication templates in advance
- Designate responsible parties
- Work with legal counsel
- May need to notify:
  - Affected users
  - Regulators (HHS for HIPAA, DPAs for GDPR)
  - Media (if large breach under some laws)

## Development & Testing

**Development Best Practices:**
- Use fake/synthetic data in development and testing
- Never use production data in development environments
- Implement separate development, staging, and production environments
- No PHI in logs, screenshots, or screen recordings
- Clear separation of test and production databases

**Testing:**
- Penetration testing before launch
- Security testing as part of CI/CD
- Regular security reviews and updates
- Test privacy features (data export, deletion, etc.)

## Ongoing Compliance

**Regular Tasks:**
- Annual privacy policy review
- Security audits (quarterly or semi-annually)
- Dependency updates (weekly automated scans)
- Staff training on privacy and security
- Risk assessments
- Update data processing agreements as needed
- Monitor regulatory changes in target jurisdictions

**Documentation:**
- Maintain records of processing activities (GDPR requirement)
- Document security measures
- Keep audit logs
- Record user consent
- Track data retention and deletion

## Recommendations by Feature

### Free Tier
- No account required
- No data collection beyond anonymous usage analytics (opt-out available)
- All content stored locally

### Standard Tier
- Optional account for content sync across devices
- Minimal personal information (email only)
- Content preferences stored with encryption

### Premium Tier (Medicine Cabinet)
- **Strong recommendation**: Local-only storage by default
- If cloud sync offered:
  - Evaluate HIPAA/GDPR/local regulations
  - Implement end-to-end encryption
  - Obtain BAA/DPA from cloud provider
  - Conduct thorough security audit
  - Consider cyber insurance
  - Have breach response plan

## Resources

### Privacy Regulations
- HIPAA: https://www.hhs.gov/hipaa
- GDPR: https://gdpr.eu/
- CCPA/CPRA: https://oag.ca.gov/privacy/ccpa

### Security Guidelines
- OWASP Mobile Security: https://owasp.org/www-project-mobile-security/
- OWASP Top 10: https://owasp.org/www-project-top-ten/
- NIST Cybersecurity Framework: https://www.nist.gov/cyberframework

### Cloud Providers
- AWS HIPAA: https://aws.amazon.com/compliance/hipaa-compliance/
- Google Cloud HIPAA: https://cloud.google.com/security/compliance/hipaa
- Azure HIPAA: https://azure.microsoft.com/en-us/overview/trusted-cloud/compliance/

---

**This document is guidance only and does not constitute legal advice. Consult with legal counsel and privacy/security experts when implementing health data features.**
