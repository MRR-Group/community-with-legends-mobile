import 'package:community_with_legends_mobile/src/shared/presentation/widgets/select_button.dart';
import 'package:flutter/cupertino.dart';

class ToggleButtonFormField extends FormField<String> {
  ToggleButtonFormField({
    super.key,
    super.initialValue,
    super.onSaved,
    super.validator,
    required Map<String, VoidCallback> buttons,
    AutovalidateMode autoValidateMode = AutovalidateMode.disabled,
    ValueChanged<String>? onChanged,
  }) : super(
          autovalidateMode: autoValidateMode,
          builder: (FormFieldState<String> state) {
            return Row(
              children: buttons.entries.map((entry) {
                final isSelected = state.value == entry.key;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: SelectButton(
                    text: entry.key,
                    isSelected: isSelected,
                    onPressed: () {
                      state.didChange(entry.key);
                      onChanged?.call(entry.key);
                      entry.value();
                    },
                  ),
                );
              }).toList(),
            );
          },
        );
}