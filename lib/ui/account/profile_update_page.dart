import 'package:flutter/material.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  int genderIndex = 0;
  final genders = ['Male', 'Female', 'Other'];
  final _fields = {
    "Name": "",
    "Email": "",
    "Phone Number": "",
    "DOB": "",
    "City": "",
    "State": "",
    "Country": "",
    "Pincode": "",
    "Address": "",
  };

  @override
  Widget build(BuildContext context) {
    const outline = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 1.2),
      borderRadius: BorderRadius.all(Radius.circular(21)),
    );
    const labelStyle = TextStyle(
      color: Colors.white70,
      fontSize: 13.5,
    );
    const iconColor = Colors.white60;

    return Scaffold(
      backgroundColor: const Color(0xFF0B1732),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          children: [
            // Logo/Header
            Container(
              height: 90,
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 16),
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
                  "assets/images/logo.png", // Use your logo asset
                  height: 60,
                ),
              ),
            ),
            // Title Row
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.13),
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: const Icon(Icons.person, color: Colors.white, size: 22),
                ),
                const SizedBox(width: 9),
                const Text(
                  "Update Profile",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Profile Card
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.11),
                borderRadius: BorderRadius.circular(14),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
              child: Row(
                children: [
                  // Profile image
                  Container(
                    padding: const EdgeInsets.all(2.5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1),
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.grey[300],
                      backgroundImage: AssetImage("assets/images/profile.jpg"), // change to user image
                    ),
                  ),
                  const SizedBox(width: 13),
                  Expanded(
                    child: Text(
                      "Hi, Alex",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.5,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
                      backgroundColor: Colors.white.withOpacity(0.18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      "Upload new picture",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 13.1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Name
            _buildLabeledField(
              label: "Name",
              hint: "Enter Your Name",
              icon: Icons.person_outline,
              outline: outline,
              labelStyle: labelStyle,
              iconColor: iconColor,
            ),
            // Email
            _buildLabeledField(
              label: "Email",
              hint: "Enter Your Email",
              icon: Icons.email_outlined,
              outline: outline,
              labelStyle: labelStyle,
              iconColor: iconColor,
            ),
            // Phone
            _buildLabeledField(
              label: "Phone Number",
              hint: "Enter Your phone number",
              icon: Icons.phone_outlined,
              outline: outline,
              labelStyle: labelStyle,
              iconColor: iconColor,
            ),
            // Gender
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 2, left: 2),
              child: Text(
                "Gender",
                style: labelStyle.copyWith(fontWeight: FontWeight.w600, color: Colors.white),
              ),
            ),
            _GenderRadioSelector(
              genderIndex: genderIndex,
              genders: genders,
              onSelected: (i) => setState(() => genderIndex = i),
            ),
            // DOB
            _buildLabeledField(
              label: "DOB",
              hint: "DD/MM/YYYY",
              icon: Icons.calendar_today_outlined,
              outline: outline,
              labelStyle: labelStyle,
              iconColor: iconColor,
            ),
            // City & State
            Row(
              children: [
                Expanded(
                  child: _buildLabeledField(
                    label: "City",
                    hint: "city",
                    icon: Icons.location_city_outlined,
                    outline: outline,
                    labelStyle: labelStyle,
                    iconColor: iconColor,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildLabeledField(
                    label: "State",
                    hint: "state",
                    icon: Icons.map_outlined,
                    outline: outline,
                    labelStyle: labelStyle,
                    iconColor: iconColor,
                  ),
                ),
              ],
            ),
            // Country & Pincode
            Row(
              children: [
                Expanded(
                  child: _buildLabeledField(
                    label: "Country",
                    hint: "country",
                    icon: Icons.flag_outlined,
                    outline: outline,
                    labelStyle: labelStyle,
                    iconColor: iconColor,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildLabeledField(
                    label: "Pincode",
                    hint: "pincode",
                    icon: Icons.pin_outlined,
                    outline: outline,
                    labelStyle: labelStyle,
                    iconColor: iconColor,
                  ),
                ),
              ],
            ),
            // Address
            _buildLabeledField(
              label: "Address",
              hint: "address",
              icon: Icons.location_on_outlined,
              outline: outline,
              labelStyle: labelStyle,
              iconColor: iconColor,
            ),
            // Update Profile button
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF9001),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  "Update Profile",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
      
    );
    
  }

 Widget _buildLabeledField({
  required String label,
  required String hint,
  required IconData icon,
  required OutlineInputBorder outline,
  required TextStyle labelStyle,
  required Color iconColor,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15), // Increase gap between fields
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 3, bottom: 5),
          child: Text(
            label,
            style: labelStyle.copyWith(fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
        SizedBox(
          height: 54, // <--- Increased field height
          child: TextField(
            style: const TextStyle(color: Colors.white, fontSize: 16.3),
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: iconColor, size: 22),
              hintText: hint,
              hintStyle: labelStyle.copyWith(color: Colors.white60, fontSize: 15),
              enabledBorder: outline,
              focusedBorder: outline,
              border: outline,
              filled: true,
              fillColor: Colors.white.withOpacity(0.07),
              contentPadding: const EdgeInsets.symmetric(vertical: 17, horizontal: 10),
            ),
          ),
        ),
      ],
    ),
  );
}

}

/// Gender radio selector with radio icon on right side of label, matching the mockup
class _GenderRadioSelector extends StatelessWidget {
  final int genderIndex;
  final List<String> genders;
  final ValueChanged<int> onSelected;

  const _GenderRadioSelector({
    super.key,
    required this.genderIndex,
    required this.genders,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(genders.length, (i) {
        final isSelected = genderIndex == i;
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 9, top: 4, bottom: 8),
            child: GestureDetector(
              onTap: () => onSelected(i),
              child: SizedBox(
                height: 54, // Match the field height!
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 120),
                  padding: const EdgeInsets.symmetric(horizontal: 8), // No vertical, height is fixed
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.white.withOpacity(0.12) : Colors.transparent,
                    border: Border.all(
                      color: Colors.white,
                      width: 1.25,
                    ),
                    borderRadius: BorderRadius.circular(19),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        genders[i],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          letterSpacing: 0.2,
                        ),
                      ),
                      Container(
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 1.25,
                          ),
                        ),
                        child: isSelected
                            ? Center(
                                child: Container(
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              )
                            : null,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
    
  }
}

