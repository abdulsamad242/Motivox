import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  void _showMonthPicker() async {
    final now = DateTime.now();
    final months = List.generate(13, (i) {
      final d = DateTime(now.year, now.month - 6 + i, 1);
      return d;
    });

    showModalBottomSheet(
      context: context,
      builder: (ctx) => Container(
        color: const Color(0xff17203a),
        child: ListView(
          shrinkWrap: true,
          children: months.map((m) {
            return ListTile(
              title: Center(
                child: Text(
                  DateFormat('MMMM yyyy').format(m),
                  style: TextStyle(
                    color: m.month == selectedMonth.month && m.year == selectedMonth.year
                        ? Colors.orange
                        : Colors.white,
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

  void _showAddTaskDialog() {
    String newTask = '';
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => Dialog(
        backgroundColor: const Color(0xFF29345B),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Add New Task",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),
              const SizedBox(height: 14),
              TextField(
                autofocus: true,
                maxLength: 60,
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Enter your task...",
                  counterText: "",
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.47)),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.white38),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 13, vertical: 11),
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
                      child: const Text("Cancel", style: TextStyle(fontSize: 15.5)),
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
                      child: const Text("Add", style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.bold)),
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

  void _showDeleteDialog(int index) {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: const Color(0xFF29345B),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Delete Record",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.5,
                ),
              ),
              const SizedBox(height: 11),
              const Text(
                'You\'re going to delete your "Record"',
                style: TextStyle(color: Colors.white70, fontSize: 15.2),
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
                      child: const Text("No", style: TextStyle(fontSize: 15.5)),
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
                      child: const Text("Yes", style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.bold)),
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

  List<DateTime> get daysInMonth {
    final firstDay = DateTime(selectedMonth.year, selectedMonth.month, 1);
    return List<DateTime>.generate(
      DateUtils.getDaysInMonth(selectedMonth.year, selectedMonth.month),
      (i) => firstDay.add(Duration(days: i)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final days = daysInMonth;
    return Scaffold(
      backgroundColor: const Color(0xFF0B1732),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          children: [
            const SizedBox(height: 8),
            Container(
              height: 90,
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 14),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF374E8C), Color(0xFF223365)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Image.asset(
                  "assets/images/logo.png",
                  height: 60,
                ),
              ),
            ),
            // The ADD + title row with matching gradient
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF3A4276), Color(0xFF29345B)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Today To Do Task List",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15.7,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 38,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.add, size: 20, color: Colors.white),
                      label: const Text(
                        "Add More",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.3,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: _showAddTaskDialog,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3A67F2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Reminders Card
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF3A4276), Color(0xFF29345B)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title & Month Picker
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Your Today's Reminders",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.5,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: _showMonthPicker,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                          decoration: BoxDecoration(
                            color: const Color(0xFF3A67F2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Text(
                                DateFormat('MMMM').format(selectedMonth),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 6),
                              const Icon(Icons.calendar_today_outlined, color: Colors.white, size: 15),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Text(
                    DateFormat('MMM d, yyyy').format(
                      DateTime(selectedMonth.year, selectedMonth.month, selectedDay),
                    ),
                    style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.w500, fontSize: 13.7),
                  ),
                  const SizedBox(height: 7),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 0),
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
                              color: isSelected ? const Color(0xFF3A67F2) : Colors.transparent,
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${d.day}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                                Text(
                                  DateFormat('E').format(d),
                                  style: TextStyle(
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
                  const SizedBox(height: 12),
                  // Timeline + Tasks
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
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

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
    // Appearance constants
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
              // Timeline and Checkbox
              SizedBox(
                width: 38,
                child: Stack(
                  children: [
                    // Top line (not for first)
                    if (i != 0)
                      Positioned(
                        left: timelineLeft + boxSize / 2 - lineThickness / 2,
                        top: 0,
                        child: Container(
                          width: lineThickness,
                          height: verticalGap / 2 + 1,
                          color: Colors.orange,
                        ),
                      ),
                    // Checkbox
                    Positioned(
                      left: timelineLeft,
                      top: verticalGap / 2,
                      child: GestureDetector(
                        onTap: () => onToggle(i, !isChecked),
                        child: Container(
                          width: boxSize,
                          height: boxSize,
                          decoration: BoxDecoration(
                            color: isChecked ? Colors.orange : Colors.transparent,
                            border: isChecked
                                ? null
                                : Border.all(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: isChecked
                              ? Icon(Icons.check, color: Colors.white, size: 17)
                              : null,
                        ),
                      ),
                    ),
                    // Bottom line (not for last)
                    if (i != tasks.length - 1)
                      Positioned(
                        left: timelineLeft + boxSize / 2 - lineThickness / 2,
                        top: verticalGap / 2 + boxSize,
                        child: Container(
                          width: lineThickness,
                          height: verticalGap / 2 + 1,
                          color: Colors.orange,
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
        color: const Color(0xFF26345B).withOpacity(0.82),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              _getTruncatedText(text),
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.030,
                fontWeight: FontWeight.w500,
                decoration: completed ? TextDecoration.lineThrough : null,
                decorationColor: Colors.orange,
                decorationThickness: 2,
              ),
              maxLines: 2,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white70, size: 21),
            onPressed: onEdit,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.white54, size: 21),
            onPressed: onDelete,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}
