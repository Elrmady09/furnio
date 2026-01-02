import 'package:flutter/services.dart';

class ExpiryDateFormatter extends TextInputFormatter {
  // يسمح بإدخال 4 أرقام كحد أقصى: MMDD
  // ويعرضها بصيغة MM/DD
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final oldText = oldValue.text;
    final newText = newValue.text;

    // نحصل على الأرقام فقط (MMDD)
    final rawOld = _getOnlyDigits(oldText);
    final rawNew = _getOnlyDigits(newText);

    // لا نسمح بأكثر من 4 أرقام
    if (rawNew.length > 4) {
      return oldValue;
    }

    // ---- تحقق من صحة الشهر (MM) ----
    if (rawNew.length >= 2) {
      final monthStr = rawNew.substring(0, 2);
      final month = int.tryParse(monthStr) ?? 0;

      // إذا كان المستخدم يحاول إضافة رقم (rawNew أطول) ونطاق الشهر غير صحيح -> ارفض الإضافة
      if (month < 1 || month > 12) {
        if (rawNew.length > rawOld.length) {
          return oldValue;
        }
        // إذا كان المستخدم يحذف (rawNew أقصر)، نسمح بالمسح.
      }
    }

    // ---- تحقق مبدئي من خانة عشرات اليوم (عند وجود رقم واحد لليوم) ----
    // عندما يكون طول rawNew == 3 فأنت كتبت خانة عشرات اليوم فقط
    if (rawNew.length == 3) {
      final tensDayChar = rawNew[2];
      // خانة عشرات اليوم يجب أن تكون 0..3 (لأن أقصى يوم 30)
      if (!RegExp(r'^[0-3]$').hasMatch(tensDayChar)) {
        // إذا كان المستخدم يضيف (rawNew أطول من rawOld) نرفض هذا الحرف
        if (rawNew.length > rawOld.length) {
          return oldValue;
        }
      }
    }

    // ---- تحقق كامل لليوم (عند وجود خانتين لليوم) ----
    if (rawNew.length == 4) {
      final dayStr = rawNew.substring(2, 4);
      final day = int.tryParse(dayStr) ?? 0;

      // اليوم يجب أن يكون بين 1 و 30
      if (day < 1 || day > 30) {
        // إذا المستخدم يحاول الإضافة (rawNew أطول) نرفض
        if (rawNew.length > rawOld.length) {
          return oldValue;
        }
        // أما لو هو حذف فاسمح به
      }
    }

    // ---- بناء النص المنسق MM/DD ----
    String formatted;
    if (rawNew.length <= 2) {
      formatted = rawNew;
    } else {
      formatted = rawNew.substring(0, 2) + '/' + rawNew.substring(2);
    }

    // وضع المؤشر في نهاية النص (سلوك عملي ومباشر)
    final selectionIndex = formatted.length;

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }

  String _getOnlyDigits(String input) {
    return input.replaceAll(RegExp(r'[^0-9]'), '');
  }
}