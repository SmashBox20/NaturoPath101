# Flutter Starter - NaturoPath:101

## Overview

This is a Flutter starter application for NaturoPath:101, providing a foundation for the mobile app that connects users with evidence-based natural remedies and herbal medicine information.

## Features

This starter includes:

- ✅ **Material Design 3** UI with custom NaturoPath color scheme
- ✅ **Bottom Navigation** with Home, Explore, Plants, and Medicine Cabinet sections
- ✅ **Medicine Cabinet** functionality with sample data
- ✅ **State Management** using Provider
- ✅ **Data Models** for Conditions and Medicinal Plants
- ✅ **Responsive Design** following Material Design guidelines
- ✅ **Dark mode** support (theme ready)

## Getting Started

### Prerequisites

- Flutter SDK 3.0.0 or higher
- Dart 3.0.0 or higher
- Android Studio / VS Code with Flutter extensions
- Android SDK / Xcode (for iOS development)

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/SmashBox20/NaturoPath101.git
   cd NaturoPath101/flutter-starter
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the app**:
   ```bash
   flutter run
   ```

### Project Structure

```
flutter-starter/
├── lib/
│   ├── main.dart                    # App entry point with theme configuration
│   ├── models/
│   │   ├── condition.dart           # Condition data model
│   │   └── plant.dart               # Medicinal plant data model
│   ├── services/
│   │   └── medicine_cabinet_service.dart  # Medicine cabinet state management
│   └── screens/
│       └── home_screen.dart         # Main home screen with navigation
├── pubspec.yaml                     # Dependencies and project configuration
└── README.md                        # This file
```

## Key Components

### Data Models

#### Condition Model
Represents health conditions with:
- Basic information (ID, name, category, severity)
- Symptoms and descriptions
- Conventional treatments
- Lifestyle modifications
- Safety warnings
- Related tags

#### Medicinal Plant Model
Represents medicinal plants with:
- Botanical information (common name, scientific name, family)
- Usage information (parts used, traditional/modern uses)
- Safety profile (contraindications, side effects)
- Pregnancy/breastfeeding safety ratings
- Conditions addressed

### Services

#### MedicineCabinetService
Provider-based service for managing user's medicine cabinet:
- Add/remove items
- Track effectiveness ratings
- Monitor expiration dates
- Check for items expiring soon
- Load sample data for demonstration

### Screens

#### HomeScreen
Main navigation screen with:
- Bottom navigation bar (Home, Explore, Plants, Cabinet)
- Search functionality (placeholder)
- Quick access cards
- Featured content
- Medicine cabinet view
- Safety disclaimers

## Color Scheme

The app uses a nature-inspired color palette:

- **Primary (Forest Green)**: `#2D5F3F` - Main actions, headers
- **Secondary (Sage Green)**: `#8FAF9B` - Secondary elements
- **Accent (Earth Brown)**: `#6B4E3D` - Grounding elements
- **Background (Cream)**: `#F5F1E8` - Main background
- **Surface (White)**: `#FFFFFF` - Cards, elevated surfaces

## Dependencies

### Core Dependencies
- `flutter` - Flutter SDK
- `provider` (^6.1.1) - State management
- `cupertino_icons` (^1.0.6) - iOS-style icons

### HTTP & API (for future backend integration)
- `http` (^1.1.0) - HTTP client

### Storage (for future offline support)
- `shared_preferences` (^2.2.2) - Simple key-value storage
- `sqflite` (^2.3.0) - SQLite database
- `path_provider` (^2.1.1) - File system paths

### Utilities
- `intl` (^0.18.1) - Internationalization and date formatting

### Development
- `flutter_lints` (^3.0.0) - Linting rules

## Next Steps

To continue development:

1. **Backend Integration**
   - Implement API service to connect to NaturoPath:101 backend
   - Add authentication (Firebase Auth or custom)
   - Implement data synchronization

2. **Feature Implementation**
   - Complete Explore section (conditions and plants browsing)
   - Build Symptom Checker
   - Add search functionality
   - Implement user profiles
   - Add favorites/bookmarks

3. **Medicine Cabinet Enhancements**
   - Add ability to create new items
   - Implement interaction checker
   - Add usage logging
   - Enable notifications for expiring items

4. **UI/UX Improvements**
   - Add plant and condition detail screens
   - Implement image galleries
   - Add animations and transitions
   - Improve accessibility

5. **Testing**
   - Unit tests for models and services
   - Widget tests for UI components
   - Integration tests for user flows

6. **Deployment**
   - Configure app icons and splash screens
   - Set up continuous integration
   - Prepare for App Store / Play Store submission

## Design Guidelines

Follow Material Design 3 principles:
- Use semantic colors for different contexts
- Maintain consistent spacing (4dp grid)
- Use elevation sparingly
- Ensure touch targets are at least 48x48dp
- Support both light and dark themes

## Safety & Compliance

**Important**: This app provides educational information only. Ensure:
- Prominent medical disclaimers on all health-related screens
- Clear warnings about consulting healthcare providers
- No medical advice or diagnosis features
- Compliance with app store medical app guidelines
- Privacy policy for any data collection

## Contributing

When contributing:
1. Follow Flutter style guide
2. Write clear commit messages
3. Add tests for new features
4. Update documentation
5. Ensure accessibility compliance

## Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Material Design 3](https://m3.material.io/)
- [Provider Package](https://pub.dev/packages/provider)
- [NaturoPath:101 API Docs](../api-design.md)
- [Design Wireframes](../ui-wireframes.md)

## License

See repository LICENSE file for details.

## Support

For issues or questions:
- Open an issue on GitHub
- Check existing documentation
- Review API design and wireframes

---

**Version**: 1.0.0  
**Flutter SDK**: >=3.0.0 <4.0.0  
**Status**: Starter Template
