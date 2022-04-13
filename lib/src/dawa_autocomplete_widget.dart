import 'package:dawa/src/dawa_service/dawa_service.dart';
import 'package:dawa/src/dawa_service/dto/dawa_autocomplete.dart';
import 'package:flutter/material.dart';

class DawaAutocompleteWidget extends StatelessWidget {
  final DawaService _dawaService = DawaService();
  final void Function(DawaAutocomplete)? onSelected;

  DawaAutocompleteWidget({Key? key, this.onSelected}) : super(key: key);

  static String _displayStringForOption(DawaAutocomplete option) => option.text;

  @override
  Widget build(BuildContext context) {
    return Autocomplete<DawaAutocomplete>(
      displayStringForOption: _displayStringForOption,
      optionsBuilder: (TextEditingValue value) {
        if (value.text == '') {
          return const Iterable<DawaAutocomplete>.empty();
        }

        return _dawaService
            .autocomplete(value.text,
                caretPosition:
                    (value.selection.start > 0) ? value.selection.start : null)
            .onError((error, stackTrace) => List<DawaAutocomplete>.empty());
      },
      fieldViewBuilder: (BuildContext context,
          TextEditingController fieldTextEditingController,
          FocusNode fieldFocusNode,
          VoidCallback onFieldSubmitted) {
        return TextFormField(
          controller: fieldTextEditingController,
          focusNode: fieldFocusNode,
          onFieldSubmitted: (String value) {
            onFieldSubmitted();
          },
          decoration: const InputDecoration(labelText: 'Address'),
        );
      },
      onSelected: (DawaAutocomplete option) {
        onSelected?.call(option);
      },
    );
  }
}
