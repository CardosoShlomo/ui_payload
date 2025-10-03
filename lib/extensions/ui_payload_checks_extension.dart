import 'package:ui_payload/ui_payload.dart';

extension UIPayloadChecks on UIPayload {
  bool containsFailure() {
    return switch (this) {
      Failure() => true,
      UIPayloads(:final list) => list.any((e) => e.containsFailure()),
      _ => false,
    };
  }
}
