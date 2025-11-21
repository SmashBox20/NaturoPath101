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
