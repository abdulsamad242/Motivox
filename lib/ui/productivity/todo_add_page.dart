import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({super.key});

  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  final TextEditingController taskController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController ringtoneController = TextEditingController(text: "Ringtone");
  String selectedPriority = "Urgent";
  
  
  // Functionality Change: Replaced the boolean state with a string state for the dropdown
  String selectedReminderRequired = "No"; // Default to "No"

  @override
  Widget build(BuildContext context) {
    const mainBg = Color(0xFF0B1732);
    const cardColor = Color(0xFF212A49);
    const bluePrimary = Color(0xFF2C51FC); 
    const orangePrimary = Color(0xFFFF9001); // or any orange you prefer

    return Scaffold(
      backgroundColor: mainBg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              // Header with Logo and Task Info
              // Header with Logo, Task Info, and DAILY TASKS/REMINDERS Banner
// Header with Logo, Separated Icon Containers, and Expanded Banner
Container(
  margin: const EdgeInsets.only(bottom: 8),
  padding: const EdgeInsets.all(16),
  decoration: BoxDecoration(
    gradient: const LinearGradient(
      colors: [Color(0xFF374E8C), Color(0xFF223365)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(20),
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Top Row: Logo + Icons (each in separate rounded containers)
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left: Logo + Text
          Row(
            children: [
              Image.asset(
                "assets/images/logo.png",
                height: 50,
              ),
              const SizedBox(width: 8),
              
            ],
          ),

          // Right: Three Separate Rounded Containers for Icons
          Row(
            children: [
              // Progress Circle Container
              // Progress Circle — No Container, Just ConstrainedBox + Align
Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 45,
                            height: 45,
                            child: CircularProgressIndicator(
                              value: 0.6,
                              strokeWidth: 4,
                              backgroundColor: Colors.white24,
                              valueColor: AlwaysStoppedAnimation(Color(0xFFFF9001)),
                            ),
                          ),
                          const Text(
                            "60%",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 15),

              // Bell Icon Container
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 8),

              // Settings Icon Container
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.settings_outlined,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ],
          ),
        ],
      ),

      const SizedBox(height: 16),

      // DAILY TASKS/REMINDERS Banner — Wider & Taller
      Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.13),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          "DAILY TASKS/REMINDERS",
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ],
  ),
),

// DAILY TASKS/REMINDERS Banner

const SizedBox(height: 10),
// --- END: UPDATED HEADER SECTION ---
              // Task Info Section
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "To Do Task Reminders",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Boost your productivity and stay on track by creating your daily To Do List. A clear list helps you:\n",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "\t\t• Stay focused on important tasks\n\t\t• Manage your time effectively\n\t\t• Achieve your daily goals step by step",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Add a New Task Section
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color:Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Add a New Task",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Task Title Input
                    const Text(
                      "Title of the Task",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    const SizedBox(height: 7),
                    _roundedInput(
                      controller: taskController,
                      icon: Icons.edit_document,
                      hint: "Eg Meeting with client",
                    ),
                    const SizedBox(height: 14),

                    // Date & Time Input
                    const Text(
                      "Date & Time",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    const SizedBox(height: 7),
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
                    const SizedBox(height: 14),

                    // Priority Dropdown
                    const Text(
                      "Priority",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    _roundedDropdown(
                      value: selectedPriority,
                      items: const ["Urgent", "Medium", "Low"],
                      onChanged: (value) {
                        setState(() {
                          selectedPriority = value!;
                        });
                      },
                    ),
                    const SizedBox(height: 14),

                    // Reminder Dropdown (UPDATED)
                    const Text(
                      "Is Reminder Required?",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    const SizedBox(height: 9),
                    _roundedDropdown(
                      value: selectedReminderRequired,
                      items: const ["Yes", "No"],
                      onChanged: (value) {
                        setState(() {
                          selectedReminderRequired = value!;
                        });
                      },
                    ),
                    const SizedBox(height: 13),

                    // Ringtone Dropdown
                    
                    const SizedBox(height: 7),
                    _roundedDropdown(
                      value: ringtoneController.text,
                      items: const ["Ringtone", "Chime", "Alert"],
                      onChanged: (value) {
                        setState(() {
                          ringtoneController.text = value!;
                        });
                      },
                    ),
                    const SizedBox(height: 16),

                    // Save Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Access the data:
                          // Task: taskController.text
                          // Date: dateController.text
                          // Priority: selectedPriority
                          // Reminder: selectedReminderRequired (String "Yes" or "No")
                          // Ringtone: ringtoneController.text
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF9001),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 17),
                          elevation: 0,
                        ),
                        child: const Text(
                          "Save",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // Rounded input with border and optional icon
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
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 15.3,
      ),
      decoration: InputDecoration(
        prefixIcon: icon != null
            ? Padding(
                padding: const EdgeInsets.only(left: 12, right: 5),
                child: Icon(icon, color: Colors.white54, size: 19),
              )
            : null,
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        contentPadding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
        filled: false,
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xB8FFFFFF), fontWeight: FontWeight.w400),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(21),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.65), width: 1.1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(21),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.93), width: 1.4),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(21),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.8)),
        ),
      ),
    );
  }

  // Rounded dropdown with border
  Widget _roundedDropdown({
  required String value,
  required List<String> items,
  required Function(String?) onChanged,
  String? label, // ← This is key
}) {
  const cardColor = Color(0xFF212A49);
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(21),
      border: Border.all(color: Colors.white.withOpacity(0.34), width: 1.1),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 14),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        isExpanded: true,
        value: value.isEmpty ? null : value,
        hint: Row(
          children: [
            if (label != null)
              Text(
                "$label: ",
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 15.3,
                  fontWeight: FontWeight.w500,
                ),
              ),
            Text(
              value.isEmpty ? "Select" : value,
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 15.3,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white54),
        dropdownColor: cardColor,
        items: items
            .map((e) => DropdownMenuItem(
                value: e,
                child: Text(
                  e,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ))
            .toList(),
        onChanged: (v) => onChanged(v),
      ),
    ),
  );
}
}