import 'dart:async';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../theme/app_typography.dart';
import '../../widgets/app_background.dart';
import '../../widgets/app_header.dart';

class ReadingScreen extends StatefulWidget {
  const ReadingScreen({super.key});

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  final TextEditingController exerciseDescriptionController =
      TextEditingController();

  // --- TIMER VARIABLES ---
  Timer? _timer;
  int _totalSeconds = 0;
  int _secondsRemaining = 0;
  bool _isRunning = false;

  // Dropdown values
  String _selectedMinutes = '0 Min';
  String _selectedSeconds = '0 Sec';
  String _selectedHours = '0 Hr';

  // Colors (matched to ExerciseScreen)
  static const cardColor = Color(0xFF212A49);
  static const blueButtonColor = Color(0xFF2C51FC);
  static const orangeButtonColor = Color(0xFFFF9001);

  @override
  void initState() {
    super.initState();
    _updateTotalSeconds();
  }

  @override
  void dispose() {
    _timer?.cancel();
    exerciseDescriptionController.dispose();
    super.dispose();
  }

  // ---------------- TIMER LOGIC ----------------
  String get _timeDisplay {
    final displaySeconds = _secondsRemaining.clamp(0, _totalSeconds);
    final minutes = displaySeconds ~/ 60;
    final seconds = displaySeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void _updateTotalSeconds() {
    final minutes = int.tryParse(_selectedMinutes.split(' ')[0]) ?? 0;
    final seconds = int.tryParse(_selectedSeconds.split(' ')[0]) ?? 0;
    final hours = int.tryParse(_selectedHours.split(' ')[0]) ?? 0;

    final newTotalSeconds = (hours * 3600) + (minutes * 60) + seconds;

    setState(() {
      _totalSeconds = newTotalSeconds;
      if (!_isRunning) {
        _secondsRemaining = newTotalSeconds;
      }
    });
  }

  void _startTimer() {
    if (_totalSeconds <= 0) return;

    if (_secondsRemaining <= 0) {
      _stopAndResetTimer();
    }

    if (_isRunning) {
      _pauseTimer();
      return;
    }

    setState(() {
      _isRunning = true;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        _timer?.cancel();
        setState(() {
          _isRunning = false;
        });
      }
    });
  }

  void _pauseTimer() {
    if (!_isRunning) return;
    _timer?.cancel();
    setState(() => _isRunning = false);
  }

  void _stopAndResetTimer() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
      _secondsRemaining = _totalSeconds;
    });
  }

  @override
  Widget build(BuildContext context) {
    final progress = _totalSeconds > 0
        ? 1.0 - (_secondsRemaining / _totalSeconds)
        : 1.0;

    IconData timerIcon = _isRunning ? Icons.pause : Icons.play_arrow;

    if (_secondsRemaining <= 0 && !_isRunning && _totalSeconds > 0) {
      timerIcon = Icons.check;
    }

    return Scaffold(
      body: AppBackground(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            const AppHeader(),
            const SizedBox(height: 10),

            // ---------------- SCREEN TITLE ----------------
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/icons/giver_reading.png',
                      width: 30,
                      height: 30,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Reading",
                        style: AppTypography.sectionTitle.copyWith(
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Reading keeps your mind growing and your spirit inspired.",
                        style: AppTypography.caption.copyWith(
                          fontSize: 13,
                          height: 1.35,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // ---------------- TOP QUOTE CARD ----------------
            Container(
              width: double.infinity,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.white.withOpacity(0.45),
                  width: 1.2,
                ),
                image: const DecorationImage(
                  image: AssetImage('assets/images/sparkling.png'),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                '"FEED YOUR MIND THE WAY YOU FEED YOUR SOUL — WITH STORIES."',
                textAlign: TextAlign.center,
                style: AppTypography.sectionTitle.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.3,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 14),

            // ---------------- IMAGINATION TEXT CARD ----------------
            const _ImaginationCard(
              text:
                  "‎The last factor of the GIVER formula is READING – and this is truly a life-changer. Every successful person you admire invests time in reading daily because it expands your perspective, sharpens your mind, strengthens decision-making, and helps you grow mentally and emotionally.",
            ),

            const SizedBox(height: 16),

            // ---------------- UPLOAD IMAGE GLASS CARD ----------------
            Container(
              width: double.infinity,
              height: 150,
              padding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white.withOpacity(0.15),
                border: Border.all(
                  color: Colors.white.withOpacity(0.18),
                  width: 1.1,
                ),
              ),
              child: Center(
                child: GestureDetector(
                  onTap: () {},
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(12),
                    dashPattern: const [4, 2],
                    color: Colors.white.withOpacity(0.55),
                    strokeWidth: 1.4,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.11),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icons/cam.png",
                            width: 30,
                            height: 30,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Upload his/her Image",
                            textAlign: TextAlign.center,
                            style: AppTypography.bodyMedium.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ---------------- TIMER GLASS CARD ----------------
            _buildTimerCard(progress, timerIcon),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // FULL TIMER CARD
  Widget _buildTimerCard(double progress, IconData timerIcon) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.10),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withOpacity(0.16),
          width: 1.1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ---------------- LEFT SIDE ----------------
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Timer",
                  style: AppTypography.bodySmall.copyWith(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 8),

                Text(
                  _timeDisplay,
                  style: AppTypography.sectionTitle.copyWith(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 18),

                // STOP BUTTON
                SizedBox(
                  height: 42,
                  width: 120,
                  child: ElevatedButton(
                    onPressed: _stopAndResetTimer,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.16),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Stop",
                      style: AppTypography.button.copyWith(fontSize: 15),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                // ---------- DROPDOWNS + SAVE ----------
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ---------- THREE DROPDOWNS ----------
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 54,
                            child: _TimerDropdown(
                              currentValue: _selectedMinutes,
                              options: const [
                                "0 Min",
                                "5 Min",
                                "10 Min",
                                "15 Min",
                                "30 Min",
                                "60 Min"
                              ],
                              onChanged: (v) {
                                setState(() {
                                  _selectedMinutes = v;
                                  _updateTotalSeconds();
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),

                        Expanded(
                          child: SizedBox(
                            height: 54,
                            child: _TimerDropdown(
                              currentValue: _selectedSeconds,
                              options: const [
                                "0 Sec",
                                "10 Sec",
                                "20 Sec",
                                "30 Sec",
                                "50 Sec"
                              ],
                              onChanged: (v) {
                                setState(() {
                                  _selectedSeconds = v;
                                  _updateTotalSeconds();
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),

                        Expanded(
                          child: SizedBox(
                            height: 54,
                            child: _TimerDropdown(
                              currentValue: _selectedHours,
                              options: const ["0 Hr", "1 Hr", "5 Hr", "16 Hr"],
                              onChanged: (v) {
                                setState(() {
                                  _selectedHours = v;
                                  _updateTotalSeconds();
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // ---------- SAVE BUTTON ----------
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        onPressed: () => context.go('/giverMain'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: orangeButtonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding:
                              const EdgeInsets.symmetric(horizontal: 22),
                        ),
                        child: Text(
                          "Save",
                          style: AppTypography.button.copyWith(
                            color: Colors.white,
                            fontSize: 16.5,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 16),

          // ---------------- RIGHT SIDE TIMER BUTTON ----------------
          ExerciseTimerButton(
            progress: progress,
            isRunning: _isRunning,
            onTap: _startTimer,
            icon: timerIcon,
          ),
        ],
      ),
    );
  }
}

// ---------------- IMAGINATION CARD ----------------
class _ImaginationCard extends StatelessWidget {
  final String text;
  const _ImaginationCard({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 13),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withOpacity(0.15),
          width: 1.1,
        ),
      ),
      child: Text(
        text,
        style: AppTypography.bodyMedium.copyWith(
          fontSize: 14.6,
          height: 1.42,
        ),
      ),
    );
  }
}

// ---------------- TIMER DROPDOWN ----------------
class _TimerDropdown extends StatelessWidget {
  final String currentValue;
  final List<String> options;
  final ValueChanged<String> onChanged;

  const _TimerDropdown({
    required this.currentValue,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: currentValue,
          isExpanded: true,
          icon: const Icon(Icons.arrow_drop_down, color: Colors.white, size: 20),
          dropdownColor: _ReadingScreenState.cardColor,
          style: AppTypography.bodySmall.copyWith(
            color: Colors.white,
            fontSize: 15,
          ),
          items: options.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (newValue) {
            if (newValue != null) onChanged(newValue);
          },
        ),
      ),
    );
  }
}

// ---------------- BIG CIRCULAR TIMER BUTTON ----------------
class ExerciseTimerButton extends StatelessWidget {
  final double progress;
  final bool isRunning;
  final VoidCallback onTap;
  final IconData icon;

  const ExerciseTimerButton({
    super.key,
    required this.progress,
    required this.isRunning,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          color: const Color(0xFF0047BB),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: SizedBox(
            width: 95,
            height: 95,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 10,
                  valueColor:
                      const AlwaysStoppedAnimation(Color(0xFFFF8C42)),
                  backgroundColor: const Color(0xFF1A4EBE),
                ),
                Container(
                  width: 70,
                  height: 70,
                  decoration: const BoxDecoration(
                    color: Color(0xFF0D47A1),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
