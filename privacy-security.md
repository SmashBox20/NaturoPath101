Privacy & Security Recommendations — NaturoPath: 101

- Default medicine cabinet storage: local-only on device, encrypted at rest (platform secure storage).
- If cloud sync is implemented: obtain explicit opt-in consent, encrypt data in transit (TLS 1.2+) and at rest (AES-256).
- Avoid storing identifiable health data on analytics; use aggregated metrics only.
- Provide user data export and delete functions (GDPR/CCPA compliance).
- Authentication: email/password with optional 2FA; optional "local-only account" mode using device-backed secure storage.
- If handling cloud-stored health data, evaluate HIPAA applicability and sign BAAs where necessary; follow appropriate controls.
- Logging: do not log medication names or identifiers in plaintext in server logs.
- Vulnerability management: regular dependency scanning, security tests, annual penetration test.
