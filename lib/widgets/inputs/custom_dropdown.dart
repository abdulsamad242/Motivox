import 'package:flutter/material.dart';
import '../../theme/app_text_style.dart';

class CustomDropdownField extends StatefulWidget {
  final String hint;
  final List<String> items;
  final Function(String?) onChanged;
  final String? value;

  const CustomDropdownField({
    super.key,
    required this.hint,
    required this.items,
    required this.onChanged,
    this.value,
  });

  @override
  State<CustomDropdownField> createState() => _CustomDropdownFieldState();
}

class _CustomDropdownFieldState extends State<CustomDropdownField> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2D3A57).withOpacity(0.7),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withOpacity(0.25),
          width: 1,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          hint: Text(
            widget.hint,
            style: AppTextStyles.label.copyWith(
              color: Colors.white.withOpacity(0.40),
              fontSize: 14,
            ),
          ),
          isExpanded: true,
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white.withOpacity(0.60),
            size: 24,
          ),
          dropdownColor: const Color(0xFF2D3A57),
          style: AppTextStyles.body.copyWith(
            color: Colors.white.withOpacity(0.95),
            fontSize: 14.5,
            decoration: TextDecoration.none,
          ),
          borderRadius: BorderRadius.circular(12),
          menuMaxHeight: 300,
          items: widget.items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: AppTextStyles.body.copyWith(
                  color: Colors.white.withOpacity(0.95),
                  fontSize: 14.5,
                ),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue;
            });
            widget.onChanged(newValue);
          },
        ),
      ),
    );
  }
}