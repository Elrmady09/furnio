import 'package:flutter/material.dart';

class GeneralText extends StatelessWidget {
  final String text;
  final double? sizeText;
  final FontWeight? fontWeight;
  final Color? color; // اختياري – إذا لم تستخدمه سيأخذ من الثيم
  final EdgeInsetsGeometry? padding;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? textDecoration;
  final double? height;
  final String? fontFamily;
  final TextStyle? style; // لو تريد تمرير TextStyle كامل

  const GeneralText({
    super.key,
    required this.text,
    this.sizeText,
    this.fontWeight,
    this.color,
    this.padding,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.textDecoration,
    this.height,
    this.fontFamily,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle baseStyle = Theme.of(context).textTheme.bodyMedium!;

    // تعديل الـ style الأساسي حسب ما يرسله المستخدم
    TextStyle finalStyle = baseStyle.copyWith(
      fontSize: sizeText,
      fontWeight: fontWeight,
      color: color ?? baseStyle.color, // يأخذ من الثيم إلا لو غيرته
      decoration: textDecoration,
      height: height,
      fontFamily: fontFamily ?? baseStyle.fontFamily,
    );

    // لو المستخدم أرسل style خارجي ندمجه فوق الخصائص الأخرى
    if (style != null) {
      finalStyle = finalStyle.merge(style);
    }

    Widget textWidget = Text(
      text,
      style: finalStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );

    if (padding != null) {
      return Padding(
        padding: padding!,
        child: textWidget,
      );
    }

    return textWidget;
  }
}
