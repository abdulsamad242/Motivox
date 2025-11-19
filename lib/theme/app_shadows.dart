import 'package:flutter/material.dart';

class AppShadows {
  // Soft shadow for cards
  static List<BoxShadow> soft = [
    BoxShadow(
      color: Colors.black.withOpacity(0.15),
      blurRadius: 10,
      offset: const Offset(0, 4),
    ),
  ];

  // Medium shadow for elevated elements
  static List<BoxShadow> medium = [
    BoxShadow(
      color: Colors.black.withOpacity(0.25),
      blurRadius: 16,
      offset: const Offset(0, 8),
    ),
  ];

  // Button shadow
  static List<BoxShadow> button = [
    BoxShadow(
      color: const Color(0xFFFF8C42).withOpacity(0.3),
      blurRadius: 12,
      offset: const Offset(0, 4),
    ),
  ];

  // Strong shadow for modals
  static List<BoxShadow> strong = [
    BoxShadow(
      color: Colors.black.withOpacity(0.4),
      blurRadius: 24,
      offset: const Offset(0, 12),
    ),
  ];

  // Very subtle shadow for cards in mockup
  static List<BoxShadow> subtle = [
    BoxShadow(
      color: Colors.black.withOpacity(0.08),
      blurRadius: 8,
      offset: const Offset(0, 2),
    ),
  ];
}