# mtp_flutter

MTP Flutter Project

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Development
1. Install Melos (https://pub.dev/packages/melos):
`dart pub global activate melos`
2. Bootstrap dependencies:
`melos bootstrap`
3. Run the app:
`flutter run -t ./lib/main.dart --flavor dev`

## Build
`flutter build apk -t ./lib/main.dart --flavor qa`

## Technologies
- [flutter_gen](https://pub.dev/packages/flutter_gen) - Flutter code generator for assets, fonts, colors
- [melos](https://pub.dev/packages/melos) - A tool for managing Dart projects with multiple packages
- 