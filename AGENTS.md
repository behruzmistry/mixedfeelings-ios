# AGENTS.md

## Cursor Cloud specific instructions

### Project overview

Mixed Feelings is a FlutterFlow-generated Flutter app for event management with Firebase backend (Auth, Firestore, Storage). The codebase is auto-generated Dart with three local path dependencies under `dependencies/` (`ff_commons`, `ff_theme`, `build_ship_1r9r3f`).

### Flutter SDK version

This project requires **Flutter 3.27.4** (Dart 3.6.2). The dependency pins (`collection: 1.19.0`, `intl: 0.19.0`) are incompatible with both older (3.24.x) and newer (3.41.x) Flutter versions. Flutter is installed at `/opt/flutter` and added to PATH via `~/.bashrc`.

### Running the app

- **Install deps**: `flutter pub get` (from workspace root)
- **Lint**: `dart analyze` — expect ~210 warnings/infos from FlutterFlow codegen; no errors
- **Build web**: `flutter build web`
- **Run web dev server**: `flutter run -d web-server --web-port=8080 --web-hostname=0.0.0.0`
- **Tests**: `flutter test` — the default `widget_test.dart` fails because it doesn't initialize Firebase; this is expected for FlutterFlow projects

### Key gotchas

- The app connects to a live Firebase project (`mixedfeelings-ios`). API keys are hardcoded in `lib/flutter_flow/firebase_config.dart` and platform config files. No additional secrets are needed for the web build to compile and serve.
- Auth features (sign-in, sign-up) require a real Firebase account to fully exercise. The login page and navigation work without credentials.
- Cloud Functions (under `firebase/functions/`) use Node.js 20; install with `cd firebase/functions && npm install`. These are optional for local web development.
- There is no `pubspec.lock` committed; `flutter pub get` resolves fresh each time.
