library;

export 'extensions/ui_payload_checks_extension.dart';
export 'helpers/composite_strategy.dart';
export 'helpers/option.dart';

part 'ui_text.dart';
part 'severity.dart';

/// Base class for all UI-related data payloads.
///
/// UIPayload represents content and semantic information that can be passed
/// between your business logic and UI layer without coupling to specific
/// widget implementations.
///
/// Common use cases:
/// - Text content (labels, messages, errors)
/// - Severity indicators (success, failure, warning)
/// - Validation results
/// - User feedback
///
/// Example:
/// ```dart
/// UIPayload message = Failure(SimpleText('Invalid email'));
/// UIPayload label = SimpleText('Email Address');
/// UIPayload result = Success(SimpleText('Saved successfully'));
/// ```
sealed class UIPayload {
  const UIPayload();
}

/// Container for multiple UI payloads.
///
/// Use this when you need to group multiple payloads together,
/// such as combining validation messages or multiple pieces of feedback.
///
/// Example:
/// ```dart
/// final errors = UIPayloads([
///   Failure(SimpleText('Email is required')),
///   Failure(SimpleText('Password is too short')),
/// ]);
/// ```
class UIPayloads<T extends UIPayload> extends UIPayload {
  const UIPayloads(this.list);

  /// List of payloads grouped together.
  final List<T> list;
}