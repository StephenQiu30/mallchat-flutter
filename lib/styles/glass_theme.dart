import 'package:flutter/material.dart';

/// MallChat Premium Liquid Glass Design System
class GlassTheme {
  // --- Colors ---
  static const Color primaryBlue = Color(0xFF3B82F6);
  static const Color backgroundGray = Color(0xFFF6F7F9);
  static const Color textDark = Color(0xFF1F2937);
  static const Color textGray = Color(0xFF6B7280);
  static const Color textLightGray = Color(0xFF9CA3AF);
  static const Color cardWhite = Colors.white;
  static const Color danger = Color(0xFFEF4444);
  
  // --- Shadows (Liquid Glass Style) ---
  static List<BoxShadow> softShadow = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.04),
      blurRadius: 12,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> mediumShadow = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.06),
      blurRadius: 20,
      offset: const Offset(0, 8),
    ),
  ];

  static List<BoxShadow> deepShadow = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.1),
      blurRadius: 30,
      offset: const Offset(0, 12),
    ),
  ];

  // --- Borders ---
  static BorderRadius radius16 = BorderRadius.circular(16);
  static BorderRadius radius24 = BorderRadius.circular(24);
  static BorderRadius radiusMax = BorderRadius.circular(999);
  
  // --- Border Styles ---
  static BorderSide thinBorder = BorderSide(
    color: Colors.black.withValues(alpha: 0.05),
    width: 1,
  );
}
