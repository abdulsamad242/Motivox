import 'package:flutter/material.dart';

const Color _mainBg = Color(0xFF0B1732);
const Color _cardColor = Color(0xFF212A49);
const Color _orangePrimary = Color(0xFFFF9001);

class ActionDashboard extends StatelessWidget {
  const ActionDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1732),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
          children: [
            const SizedBox(height: 10),
            // Logo/Header
            Container(
              height: 90,
              margin: const EdgeInsets.only(bottom: 17),
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
            // Section Title
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Productivity and Action\nDashboard",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Today's view opened")),
                      );
                    },
                    icon: Icon(Icons.calendar_today, size: 16),
                    label: Text("Today"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF007AFF),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Daily Summary Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF212A49),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Daily Summary and Dashboard",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Boost your productivity and stay on track by creating your daily To Do list. A Clear list helps you :",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...[
                    "Stay focused on important tasks",
                    "Manage your time effectively",
                    "Achieve your daily goals step by step",
                  ].map((point) => _buildBulletPoint(point)).toList(),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Lifetime Goals Progress — centered group
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              height: 120,
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "lifetime goals",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: CircularProgressIndicator(
                            value: 50 / 100,
                            strokeWidth: 6,
                            backgroundColor: Colors.white.withOpacity(0.2),
                            valueColor: AlwaysStoppedAnimation(_orangePrimary),
                          ),
                        ),
                        Text(
                          "50%",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Daily Goals + To Do Cards
            Row(
              children: [
                Expanded(
                  child: _buildProgressCard(
                    title: "Daily Goals\nCompletion",
                    percentage: 50,
                    color: _orangePrimary,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildProgressCard(
                    title: "Daily To Do\nTasks",
                    percentage: 76,
                    color: _orangePrimary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // 🔹 Daily Productivity Section
            _buildProductivitySection(),
            const SizedBox(height: 24),
            // 🆕 GIVER SECTION
            _buildGiverSection(),
            const SizedBox(height: 24),
            // 📊 DAILY MOOD SUMMARY SECTION — FIXED
            _buildMoodSummarySection(),
            const SizedBox(height: 24),
            // 🛌 SLEEP NOTE SECTION — FINAL & CORRECTED
            _buildSleepNoteSection(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.7),
            ),
            margin: const EdgeInsets.only(top: 6),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressCard({
    required String title,
    required int percentage,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 80,
                height: 80,
                child: CircularProgressIndicator(
                  value: percentage / 100,
                  strokeWidth: 6,
                  backgroundColor: Colors.white.withOpacity(0.2),
                  valueColor: AlwaysStoppedAnimation(color),
                ),
              ),
              Text(
                "$percentage%",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 🔹 Daily Productivity Section
  Widget _buildProductivitySection() {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 320,
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Daily Productivity",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          ...[
            {"label": "Yearly Goals", "percent": 50},
            {"label": "Quarterly Goals", "percent": 35},
            {"label": "Monthly Goals", "percent": 65},
            {"label": "Weekly Goals", "percent": 47},
          ]
              .map((item) =>
                  _buildProductivityRow(item["label"] as String, item["percent"] as int))
              .toList(),
        ],
      ),
    );
  }

  Widget _buildProductivityRow(String label, int percent) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: percent / 100,
                      backgroundColor: Colors.white.withOpacity(0.1),
                      valueColor: AlwaysStoppedAnimation(_orangePrimary),
                      minHeight: 8,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Text(
              "$percent%",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 GIVER SECTION
  Widget _buildGiverSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "GIVER",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          ...[
            {"label": "Gratitude", "percent": 100},
            {"label": "Imagination", "percent": 100},
            {"label": "Visualization", "percent": 60},
            {"label": "Exercise", "percent": 100},
            {"label": "Reading", "percent": 100},
          ]
              .map((item) => _buildGiverRow(item["label"] as String, item["percent"] as int))
              .toList(),
        ],
      ),
    );
  }

  Widget _buildGiverRow(String label, int percent) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: percent / 100,
                      backgroundColor: Colors.white.withOpacity(0.1),
                      valueColor: AlwaysStoppedAnimation(_orangePrimary),
                      minHeight: 8,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Text(
              "$percent%",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 📊 DAILY MOOD SUMMARY SECTION — FULLY CORRECTED
  Widget _buildMoodSummarySection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Daily Mood Summary",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          // Chart Area with Y-axis labels on the LEFT and background
          SizedBox(
            height: 180,
            child: Row(
              children: [
                // Y-axis labels (0 to 100)
                SizedBox(
                  width: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(6, (i) {
                      return Text(
                        "${(5 - i) * 20}",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 12,
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(width: 8),
                // Chart with subtle background
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Stack(
                      children: [
                        // Grid lines
                        ...List.generate(5, (i) {
                          double y = (i + 1) * 36; // 36, 72, ..., 180
                          return Positioned(
                            left: 0,
                            right: 0,
                            top: y,
                            child: Container(
                              height: 1,
                              color: Colors.white.withOpacity(0.1),
                            ),
                          );
                        }),
                        // Bars
                        Positioned.fill(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildMoodBar("Happy", 80),
                              _buildMoodBar("Sad", 90),
                              _buildMoodBar("Angry", 10),
                              _buildMoodBar("Anxiety", 95),
                              _buildMoodBar("Grateful", 45),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Legend: "Emotion Type" on the LEFT
          Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: _orangePrimary,
                  shape: BoxShape.rectangle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "Emotion Type",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMoodBar(String label, int value) {
    double barHeight = (value / 100) * 160;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 30,
              height: barHeight,
              decoration: BoxDecoration(
                color: _orangePrimary,
                borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  // 🛌 SLEEP NOTE SECTION — FINAL & CORRECTED
  Widget _buildSleepNoteSection() {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: _cardColor,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Sleep Note",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: _orangePrimary,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
            minimumSize: const Size(double.infinity, 56), // 👈 Makes it full-width & taller
            alignment: Alignment.center, // Ensures content is centered
          ),
          child: Text(
            "Write a Sleep Note Now",
            style: TextStyle(
              color: Colors.white, // 📌 Orange button → black text for contrast
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center, // Explicit centering
          ),
        ),
      ],
    ),
  );
}
}