# UI Payload

Semantic UI content representation for Flutter and Dart applications.

Separate content from presentation by representing text and severity as data structures rather than styled widgets. Build i18n-ready, framework-agnostic payloads that can be rendered by any UI layer.

## Features

- **UIText**: Multiple text representations (simple, localized, i18n keys)
- **Severity**: Semantic indicators (Success, Failure, Warning, Info)
- **Composable**: Combine payloads using built-in composition strategies

## Installation
```yaml
dependencies:
  ui_payload: ^0.1.0
```

## Usage
### Basic Text
```dart
// Simple static text
const label = SimpleText('Email Address');

// Localized text
const greeting = LocaleText({
  'en': 'Hello',
  'he': 'שלום',
  'es': 'Hola',
});

final text = greeting.get('he'); // Returns 'שלום'

// i18n key reference
const error = I18nKeyText('validation.required_field');
```
### Severity
```dart
// Wrap content with semantic severity
const success = Success(SimpleText('Saved successfully'));
const error = Failure(SimpleText('Invalid email format'));
const warning = Warning(SimpleText('Password strength: weak'));
const info = Info(SimpleText('Processing may take a few minutes'));

// Use in your UI layer
final color = switch (result) {
  Failure() => Colors.red,
  Success() => Colors.green,
  Warning() => Colors.orange,
  _ => Colors.blue,
};
```
### Options
```dart
enum Priority with Option<UIText> {
  low, medium, high;
  
  @override
  UIText get title => switch (this) {
    Priority.low => SimpleText('Low'),
    Priority.medium => SimpleText('Medium'),
    Priority.high => SimpleText('High'),
  };
}
```
### Architecture
```
Business Logic → UIPayload → UI Layer
   (what)      (content)    (how to render)
```
