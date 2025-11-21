# NaturoPath: 101 - Flutter Starter

This is the Flutter starter project for NaturoPath: 101, a cross-platform application providing evidence-based information about herbal remedies and natural health.

## Overview

NaturoPath: 101 is built with Flutter to provide a consistent experience across:
- iOS (iPhone, iPad)
- Android (phones, tablets)
- Web (Progressive Web App)
- Desktop (macOS, Windows, Linux)

## Project Structure

```
flutter-starter/
├── lib/
│   ├── main.dart                 # App entry point
│   ├── models/                   # Data models
│   │   ├── condition.dart        # Condition model
│   │   └── plant.dart            # Plant model
│   ├── services/                 # Business logic services
│   │   └── medicine_cabinet_service.dart
│   └── screens/                  # UI screens
│       └── home_screen.dart      # Home screen
├── pubspec.yaml                  # Dependencies
└── README.md                     # This file
```

## Getting Started

### Prerequisites

1. **Flutter SDK** (3.0.0 or higher)
   - Install from: https://flutter.dev/docs/get-started/install
   - Verify installation: `flutter doctor`

2. **IDE** (choose one):
   - Visual Studio Code with Flutter extension
   - Android Studio with Flutter plugin
   - IntelliJ IDEA with Flutter plugin

3. **Platform-specific requirements**:
   - **iOS**: Xcode 14+ (macOS only)
   - **Android**: Android Studio, Android SDK
   - **Web**: Chrome browser
   - **Desktop**: Platform-specific toolchains (see Flutter docs)

### Installation

1. **Clone the repository** (if not already done):
   ```bash
   git clone https://github.com/SmashBox20/NaturoPath101.git
   cd NaturoPath101/flutter-starter
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Generate model files** (for JSON serialization):
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**:
   ```bash
   # Run on connected device/emulator
   flutter run
   
   # Or specify platform
   flutter run -d chrome        # Web
   flutter run -d macos         # macOS
   flutter run -d windows       # Windows
   ```

## Key Features Implemented

### ✅ Current Features

1. **Basic App Structure**
   - Material Design 3 theme with custom color palette
   - Bottom navigation bar
   - Home screen with search

2. **Data Models**
   - `Condition`: Health condition with symptoms, red flags, recommended plants
   - `Plant`: Medicinal plant with phytochemicals, preparation methods, contraindications
   - JSON serialization ready (requires code generation)

3. **Medicine Cabinet Service** (Premium)
   - Encrypted local storage using `flutter_secure_storage`
   - Medication management (add, update, delete)
   - Interaction checking (stub - needs API implementation)
   - Export/import functionality
   - Cloud sync consent management

4. **UI Components**
   - Search bar with debouncing
   - Disclaimer banner
   - Quick link categories
   - Featured content cards
   - Premium feature gate

### 🚧 To Be Implemented

1. **Content Management**
   - Local SQLite database for offline content
   - Content service for loading conditions and plants
   - Search functionality (fuzzy search, synonyms)
   - Content filtering by evidence level, contraindications

2. **Additional Screens**
   - Browse/Categories screen
   - Condition detail screen
   - Plant detail screen
   - Search results screen
   - Medicine Cabinet screen
   - Settings/Profile screen
   - Subscription/Paywall screen

3. **Backend Integration**
   - API service for content updates
   - Authentication (email/password, OAuth)
   - Subscription validation (Apple IAP, Google Play Billing)
   - Interaction checking API

4. **Offline Support**
   - Content bundle downloads
   - Offline-first architecture
   - Background sync

5. **Additional Features**
   - Bookmarks/Favorites
   - Recently viewed history
   - Share functionality
   - Image caching and optimization
   - Push notifications for content updates

## Dependencies

### Core Dependencies

- **flutter**: Framework
- **provider**: State management
- **shared_preferences**: Simple key-value storage
- **sqflite**: Local SQLite database
- **path_provider**: File system paths
- **flutter_secure_storage**: Encrypted storage for sensitive data
- **encrypt**: Encryption utilities
- **http** / **dio**: HTTP clients for API calls
- **json_annotation** / **json_serializable**: JSON serialization
- **cached_network_image**: Image caching
- **url_launcher**: Open URLs in browser
- **intl**: Internationalization

See `pubspec.yaml` for complete list with versions.

## Architecture

### State Management

Currently uses **Provider** for state management. Can be replaced with:
- Riverpod (recommended for large apps)
- BLoC
- GetX

### Data Flow

```
UI (Widgets)
    ↓
Providers/Controllers
    ↓
Services (API, Database)
    ↓
Models (Data classes)
```

### Security

#### Medicine Cabinet Data
- Stored using `flutter_secure_storage`
- Encrypted at rest (AES-256)
- Local-only by default
- Cloud sync requires explicit user consent

#### Best Practices
- Never log sensitive health data
- Use HTTPS for all API calls
- Validate all user input
- Follow platform security guidelines

## Code Generation

This project uses code generation for JSON serialization. After modifying model files:

```bash
# One-time build
flutter pub run build_runner build --delete-conflicting-outputs

# Watch mode (rebuilds automatically)
flutter pub run build_runner watch
```

Generated files (`*.g.dart`) are git-ignored and must be regenerated after pulling changes.

## Testing

### Run Tests

```bash
# All tests
flutter test

# Specific test file
flutter test test/models/condition_test.dart

# With coverage
flutter test --coverage
```

### Test Structure

```
test/
├── models/
├── services/
├── screens/
└── widgets/
```

(Tests to be added)

## Building for Production

### iOS

```bash
flutter build ios --release
# Then open ios/Runner.xcworkspace in Xcode and archive
```

Requirements:
- Apple Developer account ($99/year)
- Provisioning profiles and certificates
- App Store listing prepared

### Android

```bash
flutter build appbundle --release
# Or for APK:
flutter build apk --release
```

Requirements:
- Google Play Developer account ($25 one-time)
- Signing key configured
- Google Play listing prepared

### Web

```bash
flutter build web --release
```

Deploy to:
- Firebase Hosting
- Netlify
- Vercel
- Any static hosting service

### Desktop

```bash
# macOS
flutter build macos --release

# Windows
flutter build windows --release

# Linux
flutter build linux --release
```

## Configuration

### Environment Variables

Create `.env` files for different environments:

```
# .env.development
API_URL=http://localhost:3000
API_KEY=dev_key_12345

# .env.production
API_URL=https://api.naturopath101.com
API_KEY=prod_key_xxxxx
```

Use `flutter_dotenv` package to load these.

### App Configuration

Edit `pubspec.yaml` to customize:
- App name
- App version
- Dependencies
- Assets (images, fonts, data files)

## Styling & Theming

### Color Palette

Defined in `main.dart`:
- **Primary**: #2D7A3E (green)
- **Secondary**: #D4A855 (gold)
- **Background**: #FAFAF8 (warm white)
- **Text**: #2C3E50 (dark gray)

### Typography

- **Headings**: Merriweather (serif) - to be added
- **Body**: Inter or Open Sans (sans-serif) - to be added

To add custom fonts:
1. Add font files to `fonts/` directory
2. Update `pubspec.yaml` fonts section
3. Rebuild app

## Accessibility

Ensure accessibility compliance:
- Semantic labels for screen readers
- Sufficient color contrast (WCAG AA)
- Tap targets minimum 44x44 points
- Keyboard navigation support (web/desktop)
- Text scaling support

Use Flutter's accessibility tools:
```bash
flutter run --debug-accessibility
```

## Performance Optimization

### Best Practices
- Use `const` constructors where possible
- Implement lazy loading for lists
- Cache images with `cached_network_image`
- Minimize widget rebuilds with `Provider.of(listen: false)`
- Use `ListView.builder` for long lists
- Profile with DevTools before release

### Image Optimization
- Use WebP format for smaller file sizes
- Provide multiple resolutions for different screen densities
- Lazy load images outside viewport

## Troubleshooting

### Common Issues

**1. Build runner fails:**
```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

**2. iOS build fails:**
- Check Xcode version (14+ required)
- Run `pod install` in `ios/` directory
- Clean build: `flutter clean && cd ios && pod deintegrate && pod install`

**3. Android build fails:**
- Check Android SDK is installed
- Update Gradle: modify `android/build.gradle`
- Increase heap size in `android/gradle.properties`

**4. Secure storage issues on Android:**
- Ensure min SDK version is 18+
- Check AndroidManifest.xml permissions

## Resources

### Flutter Documentation
- Flutter docs: https://flutter.dev/docs
- Dart docs: https://dart.dev/guides
- Cookbook: https://flutter.dev/docs/cookbook

### Packages
- pub.dev: https://pub.dev
- Provider: https://pub.dev/packages/provider
- Flutter Secure Storage: https://pub.dev/packages/flutter_secure_storage

### Learning
- Flutter YouTube channel
- Flutter Community (Medium)
- r/FlutterDev (Reddit)

## Contributing

1. Create a feature branch: `git checkout -b feature/my-feature`
2. Make changes and test thoroughly
3. Run linter: `flutter analyze`
4. Format code: `flutter format .`
5. Commit with clear message
6. Push and create pull request

## License

[To be determined]

## Contact

For questions or issues:
- GitHub Issues: [Create an issue](https://github.com/SmashBox20/NaturoPath101/issues)
- Email: [To be added]

---

**Note**: This is a starter template. Many features are stubs and require implementation. Refer to `product-requirements.md` for complete feature specifications.
