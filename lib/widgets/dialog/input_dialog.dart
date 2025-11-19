import 'package:flutter/material.dart';
import 'package:motivix/widgets/inputs/simple_rounded_field.dart';
import '../inputs/custom_text_field.dart';
import '../buttons/primary_button.dart';

class InputDialog {
  static show({
    required BuildContext context,
    required String title,
    required String hint,
    required ValueChanged<String> onSubmit,
  }) {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF1B2647),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        content: SimpleRoundedField(
          hint: hint,
          controller: controller,
        ),
        actionsPadding: const EdgeInsets.only(bottom: 10, right: 10),
        actions: [
          SizedBox(
            width: 100,
            child: PrimaryButton(
              label: "Save",
              onTap: () {
                onSubmit(controller.text.trim());
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
