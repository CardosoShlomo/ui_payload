import 'package:ui_payload/ui_payload.dart';

/// Convenience typedef for options with text titles.
typedef TextOption = Option<UIText>;

/// Convenience typedef for options with severity-wrapped text titles.
typedef SeverityOption = Option<Severity<UIText>>;

/// Interface for selectable options in dropdowns, radio buttons, etc.
///
/// Implement this on your enum or class to make it usable in option-based
/// form inputs. The [title] provides the display text for the UI.
///
/// Example with enum:
/// ```dart
/// enum Priority with Option<UIText> {
///   low, medium, high;
///
///   @override
///   UIText get title => switch (this) {
///     Priority.low => SimpleText('Low'),
///     Priority.medium => SimpleText('Medium'),
///     Priority.high => SimpleText('High'),
///   };
/// }
/// ```
///
/// Example with class:
/// ```dart
/// class Country with Option<UIText> {
///   final String code;
///   final String name;
///
///   @override
///   UIText get title => SimpleText(name);
/// }
/// ```
abstract mixin class Option<T extends UIPayload> {
  const Option();

  /// The display text for this option in the UI.
  T get title;
}