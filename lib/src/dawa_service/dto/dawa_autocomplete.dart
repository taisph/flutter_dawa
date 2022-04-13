/// A DAWA autocomplete response.
///
/// See https://dawadocs.dataforsyningen.dk/dok/api/autocomplete#autocomplete-svar
class DawaAutocomplete {
  /// Suggestion type. One of "vejnavn", "adgangsadresse", "adresse"
  final String type;

  /// Address text. Used for filling in the text field.
  final String text;

  /// The caret position to set in the text field, if the option is selected.
  final int caretPosition;

  /// The text suggested for this address for display purposes. May deviate from the address text.
  final String suggestion;

  /// Address data for the suggestion depending on the type.
  final dynamic data;

  const DawaAutocomplete({
    required this.type,
    required this.text,
    required this.caretPosition,
    required this.suggestion,
    required this.data,
  });

  factory DawaAutocomplete.fromJson(Map<String, dynamic> json) {
    return DawaAutocomplete(
      type: json['type'] as String,
      text: json['tekst'] as String,
      caretPosition: json['caretpos'] as int,
      suggestion: json['forslagstekst'] as String,
      data: json['data'],
    );
  }
}
