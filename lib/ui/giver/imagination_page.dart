import 'package:flutter/material.dart';

class ImaginationScreen extends StatefulWidget {
  const ImaginationScreen({super.key});

  @override
  State<ImaginationScreen> createState() => _ImaginationScreenState();
}

class _ImaginationScreenState extends State<ImaginationScreen> {
  final List<String> days = [
    "17 Sa",
    "18 Su",
    "19 Mon",
    "20 Tu",
    "21 Wed",
    "22 Th",
    "23 Fri",
  ];
  int selectedDayIndex = 3;

  final TextEditingController imaginationNoteController =
      TextEditingController();

  // This will be your uploaded image path for the sparkling background
  final String sparkleBg = 'assets/images/sparkling.png';
  // And your icon at the top
  final String imaginationIcon = 'assets/icons/giver_imagination.png';

  @override
  Widget build(BuildContext context) {
    const mainBg = Color(0xFF0B1732);
    const cardColor = Color(0xFF212A49);

    return Scaffold(
      backgroundColor: mainBg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              // HEADER with logo
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
                    "assets/images/logo.png", // Your logo asset
                    height: 60,
                  ),
                ),
              ),
              // Top Imagination Info Row
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
                        imaginationIcon,
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
                          "Imagination",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Everything starts with a thought – imagine boldly.",
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

              // Sparkling background quote card
              Container(
                width: double.infinity,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white.withOpacity(0.5)),
                  image: DecorationImage(
                    image: AssetImage(sparkleBg),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  '"THE MORE YOU IMAGINE, THE MORE ALIVE YOUR WORLD BECOMES."',
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

              // Imagination Card List (style as in screenshot)
              _ImaginationCard(
                text:
                    "Do you know what every successful person has in common? The power of imagination. They dare to dream big, visualize how those dreams can become reality, and then work tirelessly—day and night—until they achieve success. If you can’t dream it and imagine it, you’ll never be able to make it happen, right?",
              ),
              const SizedBox(height: 12),
              _ImaginationCard(
                text:
                    "That's why it's so important to dream boldly and imagine wildly. Think about what you truly want to achieve in life, use your imagination to see yourself living that reality, and believe it's possible.",
              ),
              const SizedBox(height: 12),
              _ImaginationCard(
                text:
                    "Now, take a moment to write down your imagination—in at least 1000 characters. Remember: your imagination determines how far you can grow, stay, shine every day. It can grow, shift perspective and fresh experience.",
              ),

              const SizedBox(height: 15),
              // Date & Day Selector (Updated here)
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF192042),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.15),
                    width: 1.1,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 13,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Date Row (just for the UI, could be dynamic)
                    Row(
                      children: [
                        Text(
                          "Aug 20, 2025",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 15.3,
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          borderRadius: BorderRadius.circular(14),
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF2C51FC),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 8,
                            ),
                            child: Row(
                              children: const [
                                Text(
                                  "August",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.5,
                                  ),
                                ),
                                SizedBox(width: 7),
                                Icon(
                                  Icons.calendar_today_outlined,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 13),
                    // Days Row (below date, on a new line)
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(days.length, (i) {
                          bool isSelected = selectedDayIndex == i;
                          return GestureDetector(
                            onTap: () => setState(() => selectedDayIndex = i),
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? const Color(0xFF2C51FC)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(11),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical: 9,
                              ),
                              child: Text(
                                days[i],
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.white.withOpacity(0.92),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 19),

              // Text area - No background color, just the placeholder
              TextField(
                controller: imaginationNoteController,
                minLines: 5,
                maxLines: 8,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  hintText: "800-1000 Characters only",
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  filled: false,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 19,
                    horizontal: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(19),
                    borderSide: BorderSide(
                      color: Colors.white.withOpacity(0.22),
                      width: 1.1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(19),
                    borderSide: BorderSide(
                      color: Colors.white.withOpacity(0.22),
                      width: 1.1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(19),
                    borderSide: BorderSide(
                      color: Colors.white.withOpacity(0.33),
                      width: 1.2,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 18),
              // Save button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
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
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

// Card style with edit/delete as in screenshot
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
          // Main text
          Padding(
            padding: const EdgeInsets.only(right: 65),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 14.6,
                height: 1.42,
              ),
            ),
          ),
          // Edit and Delete buttons
          Positioned(
            top: 0,
            right: 0,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white.withOpacity(0.78),
                    size: 22,
                  ),
                  splashRadius: 19,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                SizedBox(width: 2),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete,
                    color: Colors.white.withOpacity(0.78),
                    size: 22,
                  ),
                  splashRadius: 19,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}