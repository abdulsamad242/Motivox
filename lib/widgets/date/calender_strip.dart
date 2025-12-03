import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class CalendarStrip extends StatelessWidget {
  final DateTime selected;
  final Function(DateTime) onSelect;

  const CalendarStrip({
    super.key,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final days = List.generate(7, (i) => now.subtract(Duration(days: 6 - i)));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: days.map((day) {
        final isToday = selected.day == day.day;

        return GestureDetector(
          onTap: () => onSelect(day),
          child: Column(
            children: [
              Text(
                ["S", "M", "T", "W", "T", "F", "S"][day.weekday % 7],
                style: TextStyle(
                  color: isToday ? AppColors.primary : AppColors.textGrey,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isToday ? AppColors.primary : AppColors.cardDark,
                ),
                child: Text(
                  "${day.day}",
                  style: const TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
