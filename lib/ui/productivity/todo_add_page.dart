import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../theme/app_typography.dart';
import '../../widgets/app_background.dart';
import 'dart:ui';

class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({super.key});

  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  final TextEditingController taskController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController ringtoneController = TextEditingController(
    text: "Ringtone",
  );

  String selectedPriority = "Urgent";
  String selectedReminderRequired = "No";

  @override
  Widget build(BuildContext context) {
    final double statusBar = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: AppBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),

              // ======================
              //   MOTIVOX PERFECT HEADER
              // ======================
              _buildMotivoxHeader(statusBar),

              const SizedBox(height: 22),

              // ======================
              //   INTRO GLASSCARD
              // ======================
              _infoCard(),

              const SizedBox(height: 20),

              // ======================
              //   ADD TASK FORM
              // ======================
              _addTaskCard(),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // ======================================================
  //                     HEADER
  // ======================================================
  Widget _buildMotivoxHeader(double statusBar) {
    return Container(
      padding: EdgeInsets.only(
        top: (statusBar - 40).clamp(0, double.infinity),

        left: 10,
        right: 10,
        bottom: 12,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 37, 49, 71),
            Color.fromARGB(255, 45, 91, 176),
            Color.fromARGB(255, 37, 49, 71),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.all(Radius.circular(22)),
      ),
      child: Column(
        children: [
          // Frosted Row
          SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Image.asset("assets/images/logo.png", height: 50),

                    const Spacer(),

                    // Progress Circle
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 45,
                          height: 45,
                          child: CircularProgressIndicator(
                            value: 0.6,
                            strokeWidth: 5,
                            backgroundColor: Colors.white24,
                            valueColor: const AlwaysStoppedAnimation(
                              Color(0xFFFF9001),
                            ),
                          ),
                        ),
                        Text(
                          "60%",
                          style: AppTypography.sectionTitle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 12),

                    _circleIcon(Icons.notifications_none),
                    const SizedBox(width: 10),

                    _circleIcon(Icons.settings_outlined),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 14),

          // Title glasscard
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              "Daily Tasks / Reminders",
              style: AppTypography.title.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleIcon(IconData icon) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.15),
      ),
      child: Icon(icon, size: 24, color: Colors.white),
    );
  }

  // ======================================================
  //                 INTRODUCTION CARD
  // ======================================================
  Widget _infoCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "To Do Task Reminders",
            style: AppTypography.sectionTitle.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Boost your productivity and stay on track by creating your daily To Do List:\n",
            style: AppTypography.sectionTitle.copyWith(
              color: Colors.white.withOpacity(0.8),
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "• Stay focused on important tasks\n"
            "• Manage your time effectively\n"
            "• Achieve your daily goals step by step",
            style: AppTypography.sectionTitle.copyWith(
              color: Colors.white.withOpacity(0.8),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  // ======================================================
  //                 ADD TASK FORM
  // ======================================================
  Widget _addTaskCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Add a New Task",
            style: AppTypography.sectionTitle.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 16),

          _label("Title of the Task"),
          const SizedBox(height: 5),
          _roundedInput(
            controller: taskController,
            hint: "Eg Meeting with client",
            icon: Icons.edit_document,
          ),

          const SizedBox(height: 16),

          _label("Date & Time"),
          const SizedBox(height: 5),
          _roundedInput(
            controller: dateController,
            hint: "MM/DD/YY",
            icon: Icons.calendar_today_outlined,
            readOnly: true,
            onTap: () async {
              DateTime? picked = await showDatePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime(2100),
                initialDate: DateTime.now(),
              );
              if (picked != null) {
                dateController.text = DateFormat('MM/dd/yyyy').format(picked);
              }
            },
          ),

          const SizedBox(height: 16),

          _label("Priority"),
          const SizedBox(height: 5),
          _roundedDropdown(
            value: selectedPriority,
            items: const ["Urgent", "Medium", "Low"],
            onChanged: (v) {
              setState(() => selectedPriority = v!);
            },
          ),

          const SizedBox(height: 16),

          _label("Is Reminder Required?"),
          const SizedBox(height: 5),
          _roundedDropdown(
            value: selectedReminderRequired,
            items: const ["Yes", "No"],
            onChanged: (v) {
              setState(() => selectedReminderRequired = v!);
            },
          ),

          const SizedBox(height: 5),

          _roundedDropdown(
            value: ringtoneController.text,
            items: const ["Ringtone", "Chime", "Alert"],
            onChanged: (v) {
              setState(() => ringtoneController.text = v!);
            },
          ),
          const SizedBox(height: 14),

          Center(
            child: Text(
              "Small daily tasks lead to big achievement - stay consistent!",
              textAlign: TextAlign.center,
              style: AppTypography.sectionTitle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white.withOpacity(0.75),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // SAVE BUTTON
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => context.push('/todoList'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF9001),
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 0,
              ),
              child: Text(
                "Save",
                style: AppTypography.sectionTitle.copyWith(
                  color: Colors.white,
                  fontSize: 16.5,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _label(String text) {
    return Text(
      text,
      style: AppTypography.sectionTitle.copyWith(
        color: Colors.white.withOpacity(0.7),
        fontSize: 14,
      ),
    );
  }

  // ======================================================
  //              INPUT & DROPDOWN WIDGETS
  // ======================================================
  Widget _roundedInput({
    required TextEditingController controller,
    required String hint,
    IconData? icon,
    VoidCallback? onTap,
    bool readOnly = false,
  }) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      style: AppTypography.sectionTitle.copyWith(
        color: Colors.white,
        fontSize: 15,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.12), // ✨ brighter field

        prefixIcon: icon != null
            ? Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Icon(icon, color: Colors.white70, size: 20),
              )
            : null,

        prefixIconConstraints: const BoxConstraints(minWidth: 35),
        hintText: hint,
        hintStyle: AppTypography.sectionTitle.copyWith(
          color: Colors.white70,
          fontSize: 14,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.50)),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.50)),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.85),
            width: 1.3,
          ),
        ),

        contentPadding: const EdgeInsets.symmetric(
          vertical: 13,
          horizontal: 20,
        ),
      ),
    );
  }

  Widget _roundedDropdown({
    required String value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12), // ✨ added fill
        borderRadius: BorderRadius.circular(21),
        border: Border.all(
          color: Colors.white.withOpacity(0.45), // slight border
          width: 1.1,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: value,
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white.withOpacity(0.85),
          ),
          dropdownColor: const Color(0xFF212A49),
          items: items
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(
                    e,
                    style: AppTypography.sectionTitle.copyWith(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
              .toList(),
          onChanged: (v) => onChanged(v),
        ),
      ),
    );
  }
}
