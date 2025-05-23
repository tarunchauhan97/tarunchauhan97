import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tarundevindia/ui/home/widgets/contact_me/form_validator.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.title,
    required this.hint,
    this.validator,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.expanded = false,
    this.controller,
  });

  final String title;
  final String hint;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final bool expanded;
  final String? Function(String? text)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localization = AppLocalizations.of(context)!;

    String? requiredFieldsValidator(String? text) {
      if (FormValidator.isEmpty(text)) {
        return localization.contactEmptyFormError(title);
      }
      return null;
    }

    Widget textFormFiled = TextFormField(
      controller: controller,
      cursorColor: Colors.white,
      expands: expanded,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      style: TextStyle(
        color: Colors.white,
      ),
      textAlignVertical: TextAlignVertical.top,
      validator: (text) {
        final result = requiredFieldsValidator(text);
        if (result is String) return result;
        return validator?.call(text);
      },
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
          ))),
    );

    if (expanded) {
      textFormFiled = Expanded(child: textFormFiled);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleLarge!.copyWith(
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        textFormFiled,
      ],
    );
  }
}
