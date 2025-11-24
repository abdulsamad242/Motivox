import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'dart:async'; 

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({super.key});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  final TextEditingController exerciseDescriptionController = TextEditingController();

  // --- Timer State Variables ---
  Timer? _timer;
  int _totalSeconds = 00; // Initial duration (16 minutes)
  int _secondsRemaining = 00; // Starts at total, counts down
  bool _isRunning = false;
  
  // Placeholder values for dropdowns
  String _selectedMinutes = '0 Min';
  String _selectedSeconds = '0 Sec';
  String _selectedHours = '0 Hr';

  // --- Color Constants ---
  static const mainBg = Color(0xFF0B1732);
  static const cardColor = Color(0xFF212A49);
  static const blueButtonColor = Color(0xFF2C51FC);
  static const orangeButtonColor = Color(0xFFFF9001);

  @override
  void initState() {
    super.initState();
    _updateTotalSeconds(); // Set initial total time
  }

  @override
  void dispose() {
    _timer?.cancel();
    exerciseDescriptionController.dispose();
    super.dispose();
  }

  // --- Timer Methods ---

  // Utility to convert remaining seconds to 'MM:SS' format
  String get _timeDisplay {
    // Ensure we don't display negative time
    int displaySeconds = _secondsRemaining.clamp(0, _totalSeconds); 
    int minutes = displaySeconds ~/ 60;
    int seconds = displaySeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  // Calculate the total time based on the selected dropdown values
  void _updateTotalSeconds() {
    int minutes = int.tryParse(_selectedMinutes.split(' ')[0]) ?? 0;
    int seconds = int.tryParse(_selectedSeconds.split(' ')[0]) ?? 0;
    int hours = int.tryParse(_selectedHours.split(' ')[0]) ?? 0;

    int newTotalSeconds = (hours * 3600) + (minutes * 60) + seconds;

    // Update both total time and reset remaining time
    setState(() {
      _totalSeconds = newTotalSeconds;
      // Only reset remaining time if the timer is not running
      if (!_isRunning) {
        _secondsRemaining = newTotalSeconds; 
      }
    });
  }


  void _startTimer() {
    // If the total duration is 0, or timer is already finished, reset first
    if (_totalSeconds <= 0) return;
    if (_secondsRemaining <= 0) {
      _stopAndResetTimer();
      // Continue starting after reset
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
          _secondsRemaining--; // COUNT DOWN
        });
      } else {
        // Timer completed (reached 0)
        _timer?.cancel();
        setState(() {
          _isRunning = false;
        });
        // Optional: Show completion alert/notification
      }
    });
  }

  void _pauseTimer() {
    if (!_isRunning) return;

    _timer?.cancel();
    setState(() {
      _isRunning = false;
    });
  }

  void _stopAndResetTimer() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
      _secondsRemaining = _totalSeconds; // Reset to the configured duration
    });
  }

  // --- Build Method ---

  @override
  Widget build(BuildContext context) {
    // Calculate progress: 1.0 (full) when time starts, down to 0.0 (empty)
    double progress = _totalSeconds > 0 ? _secondsRemaining / _totalSeconds : 1.0;
    
    // The icon should show PLAY when paused/stopped, and PAUSE when running.
    IconData timerIcon = _isRunning ? Icons.pause : Icons.play_arrow;

    // If time is up, show a checkmark (or a play icon to suggest restarting)
    if (_secondsRemaining <= 0 && !_isRunning) {
      timerIcon = Icons.check; 
    }

    return Scaffold(
      backgroundColor: mainBg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              // ... (HEADER, Exercise Info, Motivational Quote, Exercise Description, Uploads Button sections remain the same)
              Container(
                height: 90,
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
              Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/icons/giver_exercise.png',
                        width: 25,
                        height: 25,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Exercise",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "A few minutes of movement each day keeps your energy flowing.",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 13.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              Container(
                width: double.infinity,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white.withOpacity(0.5)),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/sparkling.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  '"ONE SMALL WORKOUT TODAY, A STRONGER YOU TOMORROW."',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.5,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
              const SizedBox(height: 12),


              const _ImaginationCard(
                text:
                    "‎Exercise is one of the most important pillars of the GIVER formula. Success isn’t just about financial freedom — true success also means being healthy and fit. Think about it: if your body isn’t strong, how can you chase your dreams with full energy? Before preparing yourself to achieve big goals, you must first take care of your health. Without fitness, even imagination, visualization, and execution lose their power. Look at any successful person — you'll notice they are not only sharp-minded but also fit and energetic. That’s because a healthy mind resides in a healthy body, and this saying couldn't be more true.",
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                height: 150,
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: cardColor.withOpacity(0.93),
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      // Handle image upload
                    },
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(10),
                      padding: const EdgeInsets.all(0),
                      dashPattern: const [8, 4],
                      color: Colors.white.withOpacity(0.5),
                      strokeWidth: 1.5,
                      
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera_alt_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Upload his/her Image",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
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

              const SizedBox(height: 15),

              // --- FUNCTIONAL COUNTDOWN TIMER CARD ---
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: cardColor.withOpacity(0.93),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 1. Timer Label & Circular Indicator (First Row)
                    Row(
                      children: [
                        const Text(
                          "Timer",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        const Spacer(),

                        // Functional Circular Indicator & Play/Pause/Check Icon
                        GestureDetector(
                          onTap: _startTimer, // Single action to start/pause
                          child: SizedBox(
                            width: 60,
                            height: 60,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                // Circular Progress Indicator (Orange/Transparent Ring)
                                CircularProgressIndicator(
                                  // Progress now reflects remaining time / total duration (countdown)
                                  value: progress, 
                                  strokeWidth: 5,
                                  valueColor: const AlwaysStoppedAnimation<Color>(orangeButtonColor),
                                  backgroundColor: blueButtonColor.withOpacity(0.2),
                                ),
                                // Inner Blue Circle (The button)
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: blueButtonColor,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      timerIcon, // Dynamic icon: play/pause/check
                                      color: Colors.white,
                                      size: 28,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 5),

                    // 2. Large Time Display (Dynamic - Shows remaining time)
                    Text(
                      _timeDisplay,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // 3. Stop Button (Resets timer)
                    ElevatedButton(
                      onPressed: _stopAndResetTimer, // Linked to reset function
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.15),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text(
                        "Stop",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // 4. Timer Options (Dropdowns and Save Button in one Row)
                    Row(
                      children: [
                        
                        // Dropdown 1: Minutes
           SizedBox(height: 48.0,             // Dropdown 1: Minutes
child: _TimerDropdown(
  currentValue: _selectedMinutes,
  // ADD '0 Min' to the options list
  options: const ['0 Min', '5 Min', '10 Min', '15 Min', '30 Min', '60 Min'], // <-- FIXED
  onChanged: (newValue) {
    setState(() {
      _selectedMinutes = newValue;
      _updateTotalSeconds();
    });
  },
),
           ),
                        const SizedBox(width: 10),

                        // Dropdown 2: Seconds
                        SizedBox(height: 48.0,
                        child: _TimerDropdown(
                          
                          currentValue: _selectedSeconds,
                          options: const ['0 Sec', '10 Sec', '20 Sec', '30 Sec', '50 Sec'],
                          onChanged: (newValue) {
                            setState(() {
                              _selectedSeconds = newValue;
                              _updateTotalSeconds();
                            });
                          },
                        ),
                        ),
                        const SizedBox(width: 10),

                        // Dropdown 3: Hours
                        SizedBox(height: 48.0,
                        child: _TimerDropdown(
                          currentValue: _selectedHours,
                          options: const ['0 Hr', '1 Hr', '5 Hr', '16 Hr'],
                          onChanged: (newValue) {
                            setState(() {
                              _selectedHours = newValue;
                              _updateTotalSeconds();
                            });
                          },
                        ),
                        ),
                        const Spacer(),

                        // 5. Save Button
                        ElevatedButton(
                          onPressed: () {
                            // Implement save logic (e.g., save exercise duration to database)
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: orangeButtonColor,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                      ],
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
}

// --- Helper Widgets ---

class _ImaginationCard extends StatelessWidget {
    final String text;
    const _ImaginationCard({required this.text});

    @override
    Widget build(BuildContext context) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 13),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.09),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.15), width: 1.1),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.6,
                    height: 1.42,
                  ),
                  overflow: TextOverflow.clip,
                ),
              ),
            ),
          ],
        ),
      );
    }
}

// Functional Timer Dropdown Widget
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
      width: 80,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: currentValue,
          isExpanded: true,
          isDense: true,
          icon: const Icon(Icons.arrow_drop_down, color: Colors.white, size: 20),
          dropdownColor: _ExerciseScreenState.cardColor,
          style: const TextStyle(color: Colors.white, fontSize: 14),
          items: options.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (String? newValue) {
            if (newValue != null) {
              onChanged(newValue);
            }
          },
        ),
      ),
    );
  }
}