import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/alert.dart';
import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    super.key,
    required this.hint,
    this.text,
    this.obscureText = false,
    this.fillColor = backgroundLightColor,
    required this.controller,
  });

  final String hint;
  final String? text;
  final bool obscureText;
  final TextEditingController controller;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Column(
      children: [
        if (text != null)
          Row(
            children: [
              Text(
                text!,
                style: const TextStyle(fontSize: 18),
              ),
              const Spacer(),
            ],
          ),
        if (text != null) const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            constraints: const BoxConstraints(maxHeight: 40, minHeight: 40),
            errorStyle: const TextStyle(
              height: 0.01,
            ),
            contentPadding: const EdgeInsets.all(12),
            hintText: hint,
            fillColor: fillColor,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              Alert.of(context).show(text: localizations.fieldsNotFilled);
              return '';
            }
            return null;
          },
        ),
      ],
    );
  }
}
