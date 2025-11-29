import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../widgets/app_header.dart';
import '../../widgets/app_background.dart';
import '../../theme/app_typography.dart';

const Color _accentOrange = Color(0xFFFF9001);

class TaskReminderPage extends StatefulWidget {
  const TaskReminderPage({super.key});
  @override
  State<TaskReminderPage> createState() => _TaskReminderPageState();
}

class _TaskReminderPageState extends State<TaskReminderPage> {
  List<String> tasks = [
    "Meeting with client",
    "Closing call with client",
    "Pick printer from service center",
    "Fruits and vegetables from market",
    "Car fuel",
  ];
  List<bool> completed = [true, true, false, false, false];

  DateTime selectedMonth = DateTime.now();
  int selectedDay = DateTime.now().day;

  // ─────────────────────────────────────────────
  // MONTH PICKER
  // ─────────────────────────────────────────────
  void _showMonthPicker() async {
    final now = DateTime.now();
    final months = List.generate(13, (i) {
      final d = DateTime(now.year, now.month - 6 + i, 1);
      return d;
    });

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        decoration: BoxDecoration(
          color: const Color(0xFF0B1732).withOpacity(0.95),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
        ),
        child: ListView(
          shrinkWrap: true,
          children: months.map((m) {
            final isSelected =
                m.month == selectedMonth.month && m.year == selectedMonth.year;
            return ListTile(
              title: Center(
                child: Text(
                  DateFormat('MMMM yyyy').format(m),
                  style: AppTypography.sectionTitle.copyWith(
                    fontSize: 16,
                    color: isSelected ? _accentOrange : Colors.white,
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  selectedMonth = m;
                  selectedDay = 1;
                });
                Navigator.pop(ctx);
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────
  // ADD TASK DIALOG
  // ─────────────────────────────────────────────
  void _showAddTaskDialog() {
    String newTask = '';
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => Dialog(
        backgroundColor: Colors.white.withOpacity(0.08),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Add New Task",
                style: AppTypography.sectionTitle.copyWith(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 14),
              TextField(
                autofocus: true,
                maxLength: 60,
                cursorColor: Colors.white,
                style: AppTypography.bodySmall.copyWith(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Enter your task...",
                  counterText: "",
                  hintStyle:
                      AppTypography.hint.copyWith(color: Colors.white54),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        BorderSide(color: Colors.white.withOpacity(0.25)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(color: Colors.white38, width: 1.4),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 13, vertical: 11),
                ),
                onChanged: (v) => newTask = v,
                onSubmitted: (v) {
                  if (v.trim().isNotEmpty) {
                    setState(() {
                      tasks.add(v.trim());
                      completed.add(false);
                    });
                    Navigator.of(ctx).pop();
                  }
                },
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.white.withOpacity(0.07),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () => Navigator.of(ctx).pop(),
                      child: Text(
                        "Cancel",
                        style: AppTypography.bodySmall
                            .copyWith(fontSize: 15.5, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xFF3A67F2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {
                        if (newTask.trim().isNotEmpty) {
                          setState(() {
                            tasks.add(newTask.trim());
                            completed.add(false);
                          });
                          Navigator.of(ctx).pop();
                        }
                      },
                      child: Text(
                        "Add",
                        style: AppTypography.sectionTitle.copyWith(
                          fontSize: 15.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────
  // DELETE DIALOG
  // ─────────────────────────────────────────────
  void _showDeleteDialog(int index) {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: Color.fromRGBO(31, 35, 62, 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Delete Record",
                style: AppTypography.sectionTitle.copyWith(
                  fontSize: 18.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 11),
              Text(
                'You\'re going to delete your "Record"',
                style: AppTypography.bodySmall.copyWith(
                  color: Colors.white70,
                  fontSize: 15.2,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 22),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.white.withOpacity(0.10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () => Navigator.of(ctx).pop(),
                      child: Text(
                        "No",
                        style: AppTypography.bodySmall
                            .copyWith(fontSize: 15.5, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xFFFF8C42),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {
                        setState(() {
                          tasks.removeAt(index);
                          completed.removeAt(index);
                        });
                        Navigator.of(ctx).pop();
                      },
                      child: Text(
                        "Yes",
                        style: AppTypography.sectionTitle.copyWith(
                          fontSize: 15.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────
  // DAYS IN MONTH
  // ─────────────────────────────────────────────
  List<DateTime> get daysInMonth {
    final firstDay = DateTime(selectedMonth.year, selectedMonth.month, 1);
    return List<DateTime>.generate(
      DateUtils.getDaysInMonth(selectedMonth.year, selectedMonth.month),
      (i) => firstDay.add(Duration(days: i)),
    );
  }

  // ─────────────────────────────────────────────
  // BUILD
  // ─────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    final days = daysInMonth;

    return Scaffold(
      body: AppBackground(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          children: [
            const AppHeader(),
            const SizedBox(height: 16),

            // HEADER: Today To Do List
            GlassCard(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              borderRadius: 16,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Today To Do Task List",
                      style: AppTypography.sectionTitle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 38,
                    child: ElevatedButton.icon(
                      onPressed: () => context.go('/todoAdd'),
                      icon: const Icon(Icons.add, size: 20, color: Colors.white),
                      label: Text(
                        "Add More",
                        style: AppTypography.bodySmall.copyWith(
                          color: Colors.white,
                          fontSize: 14.3,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3A67F2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                        elevation: 0,
                        padding:
                            const EdgeInsets.symmetric(horizontal: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // REMINDERS CARD (GLASS)
            GlassCard(
              padding: const EdgeInsets.all(15),
              borderRadius: 22,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title & Month Picker
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Your Today's Reminders",
                          style: AppTypography.sectionTitle.copyWith(
                            fontSize: 16.5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      
                      GestureDetector(
                        onTap: _showMonthPicker,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 10),
                          decoration: BoxDecoration(
                            color: const Color(0xFF3A67F2),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Row(
                            children: [
                              Text(
                                DateFormat('MMMM').format(selectedMonth),
                                style: AppTypography.bodySmall.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 6),
                               Image.asset(
              'assets/icons/calendar-2.png',
              width: 15,
              height: 15,
              color: Colors.white,
            ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Text(
                    DateFormat('MMM d, yyyy').format(
                      DateTime(
                        selectedMonth.year,
                        selectedMonth.month,
                        selectedDay,
                      ),
                    ),
                    style: AppTypography.bodySmall.copyWith(
                      color: Colors.white70,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.7,
                    ),
                  ),
                  const SizedBox(height: 2),

                  // DAYS SCROLLER
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.07),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: 80,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: days.length,
                      separatorBuilder: (c, i) => const SizedBox(width: 5),
                      itemBuilder: (context, i) {
                        final d = days[i];
                        final isSelected = selectedDay == d.day;
                        return GestureDetector(
                          onTap: () => setState(() => selectedDay = d.day),
                          child: Container(
                            width: 47,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFF3A67F2)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${d.day}",
                                  style: AppTypography.sectionTitle.copyWith(
                                    fontSize: 17,
                                  ),
                                ),
                                Text(
                                  DateFormat('E').format(d),
                                  style: AppTypography.bodySmall.copyWith(
                                    color: Colors.white.withOpacity(0.78),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // TIMELINE + TASKS
                  TaskTimeline(
                    completedList: completed,
                    tasks: tasks,
                    onEdit: (i) {},
                    onDelete: (i) => _showDeleteDialog(i),
                    onToggle: (i, value) {
                      setState(() {
                        completed[i] = value;
                      });
                    },
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// TIMELINE
// ─────────────────────────────────────────────
class TaskTimeline extends StatelessWidget {
  final List<bool> completedList;
  final List<String> tasks;
  final Function(int) onEdit;
  final Function(int) onDelete;
  final Function(int, bool) onToggle;

  const TaskTimeline({
    super.key,
    required this.completedList,
    required this.tasks,
    required this.onEdit,
    required this.onDelete,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    const double boxSize = 24;
    const double verticalGap = 26;
    const double lineThickness = 2.0;
    const double timelineLeft = 8.0;

    return ListView.builder(
      itemCount: tasks.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, i) {
        final isChecked = completedList[i];

        return SizedBox(
          height: boxSize + verticalGap,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Timeline + Checkbox
              SizedBox(
                width: 38,
                child: Stack(
                  children: [
                    if (i != 0)
                      Positioned(
                        left:
                            timelineLeft + boxSize / 2 - lineThickness / 2,
                        top: 0,
                        child: Container(
                          width: lineThickness,
                          height: verticalGap / 2 + 1,
                          color: _accentOrange,
                        ),
                      ),
                    Positioned(
                      left: timelineLeft,
                      top: verticalGap / 2,
                      child: GestureDetector(
                        onTap: () => onToggle(i, !isChecked),
                        child: Container(
                          width: boxSize,
                          height: boxSize,
                          decoration: BoxDecoration(
                            color:
                                isChecked ? _accentOrange : Colors.transparent,
                            border: isChecked
                                ? null
                                : Border.all(
                                    color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: isChecked
                              ? const Icon(Icons.check,
                                  color: Colors.black, size: 17)
                              : null,
                        ),
                      ),
                    ),
                    if (i != tasks.length - 1)
                      Positioned(
                        left:
                            timelineLeft + boxSize / 2 - lineThickness / 2,
                        top: verticalGap / 2 + boxSize,
                        child: Container(
                          width: lineThickness,
                          height: verticalGap / 2 + 1,
                          color: _accentOrange,
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 10),

              // Task card
              Expanded(
                child: TaskCard(
                  text: tasks[i],
                  completed: completedList[i],
                  onEdit: () => onEdit(i),
                  onDelete: () => onDelete(i),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ─────────────────────────────────────────────
// TASK CARD (glass style)
// ─────────────────────────────────────────────
class TaskCard extends StatelessWidget {
  final String text;
  final bool completed;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const TaskCard({
    super.key,
    required this.text,
    required this.completed,
    required this.onEdit,
    required this.onDelete,
  });

  String _getTruncatedText(String text, [int maxLen = 28]) {
    if (text.length <= maxLen) return text;
    return '${text.substring(0, maxLen).replaceAll(RegExp(r'\s+$'), '')}...';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.10),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              _getTruncatedText(text),
              maxLines: 2,
              style: AppTypography.bodySmall.copyWith(
                color: Colors.white,
                fontSize:
                    MediaQuery.of(context).size.width * 0.030,
                fontWeight: FontWeight.w500,
                decoration:
                    completed ? TextDecoration.lineThrough : null,
                decorationColor: _accentOrange,
                decorationThickness: 2,
              ),
            ),
          ),
          GestureDetector(
  onTap: onEdit,
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 6),
    child: Image.asset(
      "assets/icons/wr.png",
      width: 20,
      height: 20,
      color: Colors.white.withOpacity(0.85), // optional tint
    ),
  ),
),

GestureDetector(
  onTap: onDelete,
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 6),
    child: Image.asset(
      "assets/icons/de.png",
      width: 20,
      height: 20,
      color: Colors.white.withOpacity(0.75), // optional tint
    ),
  ),
),

        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// GLASS CARD
// ─────────────────────────────────────────────
class GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final double opacity;

  const GlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.borderRadius = 20,
    this.opacity = 0.15, // 👈 as you requested
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(opacity),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
