# Design Customization Guide - NaturoPath: 101

This guide helps you customize the design and appearance of the NaturoPath: 101 app.

## Quick Start for Design Changes

### Using Hot Reload
While developing, you can see changes instantly:
1. Run `flutter run` in the `flutter-starter/naturopath101` directory
2. Make changes to any UI file
3. Press `r` in the terminal to hot reload (or `R` for hot restart)
4. See changes instantly without restarting the app

### Main Design Files

#### 1. **Theme and Colors** (`lib/main.dart`)
Location: Lines 20-90 in `main.dart`

```dart
// Primary color - change this to customize main app color
primaryColor: const Color(0xFF2D7A3E),  // Current: Natural Green

// Background color
scaffoldBackgroundColor: const Color(0xFAFAF8),  // Current: Warm White

// Accent/Secondary color
secondary: const Color(0xFFD4A855),  // Current: Gold
```

**Quick Color Changes:**
- Replace hex codes (e.g., `0xFF2D7A3E`) with your preferred colors
- Use online tools like [Material Color Generator](https://m2.material.io/inline-tools/color/) to create color palettes
- Example: For blue theme, change to `0xFF1976D2`

#### 2. **Typography** (`lib/main.dart`)
Location: Lines 50-70 in `main.dart`

```dart
textTheme: const TextTheme(
  displayLarge: TextStyle(fontSize: 32, ...),   // Large headings
  displayMedium: TextStyle(fontSize: 24, ...),  // Section headers
  bodyLarge: TextStyle(fontSize: 16, ...),      // Main text
  bodyMedium: TextStyle(fontSize: 14, ...),     // Secondary text
)
```

**To customize:**
- Change `fontSize` values
- Modify `fontWeight` (e.g., `FontWeight.bold`, `FontWeight.w600`)
- Update `color` values
- Add custom fonts (see Fonts section below)

#### 3. **Home Screen Layout** (`lib/screens/home_screen.dart`)

Key sections to customize:
- **Search Bar** (lines 60-95): Change border radius, colors, hint text
- **Disclaimer Banner** (lines 97-135): Modify background color, border, text
- **Quick Links** (lines 137-195): Update category chips, icons, layout
- **Cards** (lines 197+): Customize card styling, elevation, border radius

Example customizations:
```dart
// Rounded search bar
borderRadius: BorderRadius.circular(30),  // Change from 12 to 30

// Different disclaimer color
color: Colors.blue.shade50,  // Change from orange to blue

// Larger category chips
width: 140,  // Change from 120
```

## Advanced Customizations

### Adding Custom Fonts

1. **Add font files:**
   ```
   flutter-starter/naturopath101/
   ├── fonts/
   │   ├── Merriweather-Regular.ttf
   │   └── Merriweather-Bold.ttf
   ```

2. **Update `pubspec.yaml`:**
   ```yaml
   flutter:
     fonts:
       - family: Merriweather
         fonts:
           - asset: fonts/Merriweather-Regular.ttf
           - asset: fonts/Merriweather-Bold.ttf
             weight: 700
   ```

3. **Use in theme:**
   ```dart
   textTheme: TextTheme(
     displayLarge: TextStyle(
       fontFamily: 'Merriweather',
       fontSize: 32,
     ),
   ),
   ```

### Custom Icons

Replace existing icons:
```dart
// In home_screen.dart, quick links section
Icon(Icons.sick)  // Change to different Material icon
// or
Icon(Icons.medical_services)
Icon(Icons.spa)
Icon(Icons.healing)
```

Browse all Material icons: [Material Icons](https://fonts.google.com/icons)

### Adding Images and Assets

1. **Create assets directory:**
   ```
   flutter-starter/naturopath101/
   ├── assets/
   │   ├── images/
   │   │   ├── logo.png
   │   │   └── banner.png
   ```

2. **Update `pubspec.yaml`:**
   ```yaml
   flutter:
     assets:
       - assets/images/
   ```

3. **Use in code:**
   ```dart
   Image.asset('assets/images/logo.png')
   ```

### Card Styles

Customize card appearance in `home_screen.dart`:
```dart
Card(
  elevation: 4,  // Shadow depth (0-24)
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),  // Corner roundness
  ),
  child: ...
)
```

### Button Styles

Change button appearance in `main.dart`:
```dart
elevatedButtonTheme: ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.green,  // Button color
    foregroundColor: Colors.white,  // Text color
    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),  // Rounded corners
    ),
  ),
),
```

## Layout Modifications

### Bottom Navigation Bar

Customize in `home_screen.dart` (lines 300+):
```dart
BottomNavigationBar(
  selectedItemColor: Colors.blue,  // Change selected color
  unselectedItemColor: Colors.grey,
  // Add/remove/reorder items
  items: [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    // ... more items
  ],
)
```

### Spacing and Padding

Adjust spacing between elements:
```dart
SizedBox(height: 24),  // Vertical spacing
Padding(
  padding: EdgeInsets.all(16),  // Space around element
  child: ...
)
```

## Design System Reference

### Current Color Palette
```dart
Primary Green:    #2D7A3E  (Nature, healing)
Secondary Gold:   #D4A855  (Premium, quality)
Background:       #FAFAF8  (Warm white)
Text Primary:     #2C3E50  (Dark gray)
Text Secondary:   #7F8C8D  (Medium gray)
Success:          #2D7A3E  (Same as primary)
Warning:          #E67E22  (Orange)
Danger:           #C0392B  (Red)
Info:             #3498DB  (Blue)
```

### Spacing Scale
```dart
xs:  4.0   // Tiny gaps
sm:  8.0   // Small spacing
md:  16.0  // Standard spacing
lg:  24.0  // Large sections
xl:  32.0  // Major sections
```

### Border Radius Scale
```dart
Small:    4.0   // Subtle rounding
Medium:   8.0   // Standard
Large:    12.0  // Prominent
XLarge:   16.0  // Very rounded
Pill:     999.0 // Fully rounded
```

## Testing Your Design

### View on Different Screens

```bash
# Run on different devices
flutter run -d chrome        # Web browser
flutter run -d windows       # Windows desktop
flutter run -d android       # Android emulator/device
flutter run -d ios          # iOS simulator (macOS only)
```

### Responsive Design Tips

Use MediaQuery for responsive layouts:
```dart
final screenWidth = MediaQuery.of(context).size.width;
final isMobile = screenWidth < 600;

// Adjust layout based on screen size
crossAxisCount: isMobile ? 2 : 4,  // Grid columns
fontSize: isMobile ? 14 : 16,       // Text size
```

## Design Tools

### Recommended Tools
1. **Flutter DevTools** - Built-in inspector for layout debugging
   - Run app, then visit link shown in terminal
   - Inspect widget tree and properties

2. **VS Code Flutter Extensions**
   - Flutter Widget Snippets
   - Awesome Flutter Snippets
   - Flutter Color

3. **Design Resources**
   - [Material Design 3](https://m3.material.io/) - Design guidelines
   - [Flutter Gallery](https://gallery.flutter.dev/) - Component examples
   - [Coolors.co](https://coolors.co/) - Color palette generator

### Code Snippets

VS Code shortcuts:
- Type `stless` → StatelessWidget
- Type `stful` → StatefulWidget
- Type `Container` → Container widget

## Wireframes Reference

See `/ui-wireframes.md` in the root directory for:
- Complete screen designs
- Component layouts
- Interaction patterns
- Accessibility guidelines

## Getting Help

If you need specific design changes:
1. Describe the desired appearance
2. Reference specific screens or components
3. Include color codes or examples if available

For complex design systems, consider:
- Using a design tool (Figma, Adobe XD) first
- Creating mockups before coding
- Implementing design tokens for consistency

## Next Steps

1. Start with theme colors in `main.dart`
2. Test with hot reload to see immediate changes
3. Customize one screen at a time
4. Use Flutter DevTools to debug layout issues
5. Reference wireframes for design guidance

Remember: Always run `flutter pub get` after modifying `pubspec.yaml`!
