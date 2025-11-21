# Eco Tips

Eco Tips is a Flutter app providing curated sustainability tips with a focus on offline-first usage, privacy, and accessibility.

## Features

- Browse curated sustainability tips with categories
- Filter tips by category
- Mark tips as favorites locally
- View detailed tip information
- Offline-first with pre-bundled content
- Localization support for English and Amharic
- Opt-in crash reporting with no PII

## Architecture

- Flutter with Riverpod for state management
- Shared Preferences for local favorites storage
- intl package for localization
- Sentry for crash reporting (opt-in)

## Setup

1. Ensure Flutter SDK is installed and configured.
2. Run `flutter pub get` to install dependencies.
3. Run `flutter run` to start the app.

## Testing

- Unit tests for domain logic and favorites store.
- Widget tests for UI components and navigation.
- Integration tests for persistence and startup.

Run tests with:

```
flutter test
```

## Building

- Configure signing for Android release builds.
- Use `flutter build appbundle` or `flutter build apk` for Android.

## Privacy

- No PII collected.
- Offline-first design.
- Optional crash reporting.

## Release Checklist

- [ ] Lint passes with no warnings
- [ ] All tests pass
- [ ] Accessibility checks completed
- [ ] Performance profiling done
- [ ] Signed release build created
- [ ] Store assets prepared

## Incident Playbook

- Rollback to previous release if critical issues
- Monitor crash reports
- Hotfix process for urgent bugs

## Changelog

- v1.0.0 Initial release

---

For questions, contact support@ecotips.example
