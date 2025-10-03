part of 'ui_payload.dart';

/// Base class for all text representations in the UI layer.
///
/// UIText separates content from presentation, allowing you to:
/// - Change text without modifying UI code
/// - Support multiple locales
/// - Integrate with i18n systems
///
/// Use this for labels, messages, hints, and any user-facing text.
sealed class UIText extends UIPayload {
  const UIText();
}

/// Represents absence of text.
///
/// Use this when a text field is optional and currently has no value.
///
/// Example:
/// ```dart
/// final label = shouldShowLabel ? SimpleText('Name') : EmptyText();
/// ```
class EmptyText extends UIText {
  const EmptyText();
}

/// Static text with a single string value.
///
/// Use this for:
/// - Hard-coded text that won't change
/// - Non-localized content
/// - Prototypes and quick development
///
/// Example:
/// ```dart
/// const label = SimpleText('Email Address');
/// const error = SimpleText('Invalid email format');
/// ```
class SimpleText extends UIText {
  const SimpleText(this.value);

  final String value;
}

/// Text with explicit locale-to-string mappings.
///
/// Use this when you have a small number of locales and want to define
/// translations inline without a full i18n system.
///
/// Example:
/// ```dart
/// const label = LocaleText({
///   'en': 'Hello',
///   'he': 'שלום',
///   'fr': 'Bonjour',
/// });
///
/// final text = label.get('he'); // Returns 'שלום'
/// final fallback = label.get('es'); // Returns first value ('Hello')
/// ```
class LocaleText extends UIText {
  const LocaleText(this.translations);

  /// Map of locale codes to translated strings.
  /// Example: `{'en': 'Hello', 'es': 'Hola'}`
  final Map<String, String> translations;

  /// Gets the text for the specified locale.
  ///
  /// Returns the translation for [locale] if it exists,
  /// otherwise returns the first available translation as fallback.
  String get(String locale) =>
      translations[locale] ?? translations.values.first;
}

/// Reference to a text key in an i18n system.
///
/// Use this when you have a proper i18n setup (like flutter_localizations,
/// intl, or easy_localization) and want to reference translation keys.
///
/// Example:
/// ```dart
/// const label = I18nKeyText('login.email_label');
/// const error = I18nKeyText('validation.required_field');
///
/// // In your widget:
/// Text(AppLocalizations.of(context).translate(label.key))
/// ```
class I18nKeyText extends UIText {
  const I18nKeyText(this.key);

  /// The i18n key used to lookup the translated text.
  /// Example: `'login.email_label'` or `'errors.invalid_email'`
  final String key;
}