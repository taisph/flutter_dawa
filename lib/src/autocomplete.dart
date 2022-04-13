import 'package:flutter/material.dart';

class DawaAutocompleteWidget extends StatelessWidget {
  const DawaAutocompleteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue value) {
        if (value.text == '') {
          return const Iterable<String>.empty();
        }

        return const Iterable<String>.empty();
      },
      onSelected: (String selection) {
        debugPrint('Selected $selection');
      },
    );
  }
}
