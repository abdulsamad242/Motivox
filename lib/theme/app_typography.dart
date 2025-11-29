import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  // ───────────────────────────────
  // ORIGINAL STYLES (unchanged)
  // ───────────────────────────────

  // Quote
  static TextStyle quote = GoogleFonts.rethinkSans(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    height: 1.3,
    color: Colors.white,
  );

  // Main Title (e.g. screen titles)
  static TextStyle title = GoogleFonts.rethinkSans(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  // Subtitle (light)
  static TextStyle subtitle = GoogleFonts.rethinkSans(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.white70,
  );

  // Section Title (e.g. “Your Basic Identity”)
  static TextStyle sectionTitle = GoogleFonts.rethinkSans(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  // Form Label
  static TextStyle formLabel = GoogleFonts.rethinkSans(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.white70,
  );

  // TextField Hint
  static TextStyle hint = GoogleFonts.rethinkSans(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.white54,
  );

  static TextStyle hint1 = GoogleFonts.rethinkSans(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.white60,
  );

  // Social Button
  static TextStyle social = GoogleFonts.rethinkSans(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  // ───────────────────────────────
  // NEW STYLES (added, nothing removed)
  // ───────────────────────────────

  // Medium body text for cards
  static TextStyle bodyMedium = GoogleFonts.rethinkSans(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  // Small card text (labels inside cards)
  static TextStyle bodySmall = GoogleFonts.rethinkSans(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  // Tiny labels (like "Emotion Type")
  static TextStyle caption = GoogleFonts.rethinkSans(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.white70,
  );

  // Button text used in new glass buttons
  static TextStyle button = GoogleFonts.rethinkSans(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  // Utility opacity colors (to avoid .withOpacity everywhere)
  static TextStyle white60 = GoogleFonts.rethinkSans(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.white60,
  );

  static TextStyle white70 = GoogleFonts.rethinkSans(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.white70,
  );

  static TextStyle white50 = GoogleFonts.rethinkSans(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.white54,
  );
}
