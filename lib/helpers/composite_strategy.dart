import 'package:ui_payload/ui_payload.dart';

/// Strategy for combining two UIPayload instances into one.
///
/// Use this when you need to merge validation results, error messages,
/// or other payloads from multiple sources.
///
/// Example:
/// ```dart
/// final strategy = DefaultUIPayloadCompositeStrategy();
/// final result = strategy.compose(
///   Failure(SimpleText('Email required')),
///   Failure(SimpleText('Password required')),
/// );
/// // Returns: UIPayloads([...both failures...])
/// ```
abstract class UIPayloadCompositeStrategy<A extends UIPayload, B extends UIPayload> {
  const UIPayloadCompositeStrategy();

  /// Combines two payloads into a single payload.
  /// Returns null if both inputs are null.
  UIPayload? compose(A? a, B? b);
}

/// Default composition strategy that flattens and merges payloads.
///
/// Rules:
/// - If one payload is null, returns the other
/// - If both are null, returns null
/// - If either is UIPayloads, unwraps and merges the lists
/// - Otherwise, wraps both in UIPayloads
///
/// Example:
/// ```dart
/// const strategy = DefaultUIPayloadCompositeStrategy();
///
/// strategy.compose(null, Failure(...)); // Returns: Failure(...)
/// strategy.compose(Failure(...), Warning(...)); // Returns: UIPayloads([Failure, Warning])
/// ```
class DefaultUIPayloadCompositeStrategy extends UIPayloadCompositeStrategy<UIPayload, UIPayload> {
  const DefaultUIPayloadCompositeStrategy();

  @override
  UIPayload? compose(UIPayload? a, UIPayload? b) {
    if (a == null) return b;
    if (b == null) return a;

    final list = [
      if (a case UIPayloads(list: final list)) ...list else a,
      if (b case UIPayloads(list: final list)) ...list else b,
    ];
    if (list.length == 1) return list.first;
    return UIPayloads(list);
  }
}