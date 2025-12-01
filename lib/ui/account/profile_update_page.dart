import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/app_background.dart';
import '../../widgets/app_header.dart';
import '../../theme/app_typography.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  int genderIndex = 0;
  final genders = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: AppBackground(
        
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            children: [
              const SizedBox(height: 10),
              const AppHeader(),

              const SizedBox(height: 20),

              // ----- TITLE ROW -----
              Row(
                children: [
                  Container(
                    
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.13),
                      shape: BoxShape.circle,
                    ),
                    child:  Image.asset("assets/icons/pro.png"),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Update Profile",
                    style: AppTypography.sectionTitle.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // ===== PROFILE CARD =====
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    // Profile Pic
                    Container(
                      padding: const EdgeInsets.all(2),
                      
                      child: CircleAvatar(
                        radius: 24,
                        backgroundImage: const AssetImage("assets/images/profile_pic.png"),
                      ),
                    ),

                    const SizedBox(width: 14),

                    Expanded(
                      child: Text(
                        "Hi, Alex",
                        style: AppTypography.sectionTitle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.15),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        "Upload new picture",
                        style: AppTypography.sectionTitle.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // ==== FIELDS ====
              _glassField(label: "Name", hint: "Enter your name", icon: Icons.person_outline),
              _glassField(label: "Email", hint: "Enter your email", icon: Icons.email_outlined),
              _glassField(label: "Phone Number", hint: "Enter your phone number", icon: Icons.phone_outlined),

              // ==== GENDER ====
              Padding(
                padding: const EdgeInsets.only(left: 4, bottom: 6, top: 10),
                child: Text(
                  "Gender",
                  style: AppTypography.sectionTitle.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              _GenderSelector(
                genders: genders,
                selectedIndex: genderIndex,
                onSelected: (i) => setState(() => genderIndex = i),
              ),

              const SizedBox(height: 10,),

              _glassField(label: "DOB", hint: "DD/MM/YYYY", icon: Icons.calendar_today_outlined),

              Row(
                children: [
                  Expanded(
                    child: _glassField(
                        label: "City",
                        hint: "City",
                        icon: Icons.location_city_outlined),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _glassField(
                        label: "State",
                        hint: "State",
                        icon: Icons.map_outlined),
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: _glassField(
                        label: "Country",
                        hint: "Country",
                        icon: Icons.flag_outlined),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _glassField(
                        label: "Pincode",
                        hint: "Pincode",
                        icon: Icons.pin_outlined),
                  ),
                ],
              ),

              _glassField(label: "Address", hint: "Address", icon: Icons.location_on_outlined),

              const SizedBox(height: 20),

              // UPDATE BUTTON
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => context.go('/todoList'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF9001),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Update Profile",
                    style: AppTypography.sectionTitle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      
    );
  }

  // ===== GLASS FIELD =====
Widget _glassField({
  required String label,
  required String hint,
  required IconData icon,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 6),
          child: Text(
            label,
            style: AppTypography.sectionTitle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        // OUTER GLASS CARD
        Container(
          height: 54,
          padding: const EdgeInsets.only(left: 4),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.09),   // GLASS CARD
            borderRadius: BorderRadius.circular(25),
            border: BoxBorder.all(
              color: Colors.white.withOpacity(0.5)
            )
          ),

          child: TextField(
            style: AppTypography.sectionTitle.copyWith(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),

            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: Colors.white70, size: 22),
              hintText: hint,
              hintStyle: AppTypography.hint1,

              // 🔥 REQUIRED BY YOU
              filled: false,
              fillColor: Colors.transparent,

              // 🔥 NO BORDER FOR TEXTFIELD (GLASS FORMAT)
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,

              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 0, vertical: 17),
            ),
          ),
        ),
      ],
    ),
  );
}

}

/// ===== GENDER SELECTOR =====
class _GenderSelector extends StatelessWidget {
  final int selectedIndex;
  final List<String> genders;
  final ValueChanged<int> onSelected;

  const _GenderSelector({
    super.key,
    required this.selectedIndex,
    required this.genders,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(genders.length, (i) {
        final isSelected = selectedIndex == i;

        return Expanded(
          child: GestureDetector(
            onTap: () => onSelected(i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 120),
              height: 54,
              margin: EdgeInsets.only(right: i == genders.length - 1 ? 0 : 10),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.white.withOpacity(0.15)
                    : Colors.white.withOpacity(0.10),
                borderRadius: BorderRadius.circular(25),
                border: BoxBorder.all(
                  color: Colors.white.withOpacity(0.5)
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    genders[i],
                    style: AppTypography.sectionTitle.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: BoxBorder.all(color: Colors.white.withOpacity(0.5), width: 1.2),
                    ),
                    child: isSelected
                        ? Center(
                            child: Container(
                              width: 12,
                              height: 12,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : null,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
