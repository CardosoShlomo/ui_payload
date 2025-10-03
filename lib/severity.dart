part of 'ui_payload.dart';

/// Semantic severity wrapper for UI payloads.
///
/// Separates semantic meaning (success/failure/warning) from visual
/// presentation (colors, icons). Your UI layer decides how to render
/// each severity level.
///
/// Example:
/// ```dart
/// // Business logic returns semantic severity
/// UIPayload validation = emailValid
///   ? Success(SimpleText('Email verified'))
///   : Failure(SimpleText('Invalid email format'));
///
/// // UI layer renders based on severity
/// final color = switch (validation) {
///   Failure() => Colors.red,
///   Success() => Colors.green,
///   Warning() => Colors.orange,
///   _ => Colors.blue,
/// };
/// ```
sealed class Severity<T extends UIPayload> extends UIPayload {
  const Severity([this.payload]);

  /// Optional payload wrapped by this severity indicator.
  /// Typically contains explanatory text or additional context.
  final T? payload;
}

/// Indicates an error or validation failure.
///
/// Use for:
/// - Validation errors
/// - Failed operations
/// - Critical problems requiring user attention
///
/// Example:
/// ```dart
/// const Failure(SimpleText('Password must be at least 8 characters'))
/// const Failure(SimpleText('Network request failed'))
/// ```
class Failure<T extends UIPayload> extends Severity<T> {
  const Failure([super.payload]);
}

/// Indicates a potential issue or advisory message.
///
/// Use for:
/// - Non-critical validation issues
/// - Suggestions for improvement
/// - Deprecation notices
///
/// Example:
/// ```dart
/// const Warning(SimpleText('Password strength: weak'))
/// const Warning(SimpleText('This feature is deprecated'))
/// ```
class Warning<T extends UIPayload> extends Severity<T> {
  const Warning([super.payload]);
}

/// Indicates informational content without urgency.
///
/// Use for:
/// - Helpful hints
/// - Contextual information
/// - Status updates
///
/// Example:
/// ```dart
/// const Info(SimpleText('Password must contain a number'))
/// const Info(SimpleText('Processing may take a few minutes'))
/// ```
class Info<T extends UIPayload> extends Severity<T> {
  const Info([super.payload]);
}

/// Indicates successful completion or validation.
///
/// Use for:
/// - Validation success
/// - Successful operations
/// - Positive confirmation
///
/// Example:
/// ```dart
/// const Success(SimpleText('Email verified successfully'))
/// const Success(SimpleText('Changes saved'))
/// ```
class Success<T extends UIPayload> extends Severity<T> {
  const Success([super.payload]);
}