import 'dart:ui';

import 'package:flutter/material.dart';

class AppTransitions {
  /// 1) Slide From Right → Left
  /// الصفحة تدخل من اليمين (مثل iOS)
  static Widget slideFromRight(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    final offset = Tween(begin: const Offset(1, 0), end: Offset.zero)
        .chain(CurveTween(curve: Curves.easeOut));
    return SlideTransition(position: animation.drive(offset), child: child);
  }

  /// 2) Slide From Left → Right
  /// الصفحة تدخل من اليسار (عكس iOS)
  static Widget slideFromLeft(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    final offset = Tween(begin: const Offset(-1, 0), end: Offset.zero)
        .chain(CurveTween(curve: Curves.easeOut));
    return SlideTransition(position: animation.drive(offset), child: child);
  }

  /// 3) Slide From Bottom → Up
  /// الصفحة تطلع من الأسفل (مثل Bottom Sheet)
  static Widget slideFromBottom(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    final offset = Tween(begin: const Offset(0, 1), end: Offset.zero)
        .chain(CurveTween(curve: Curves.easeOutCubic));
    return SlideTransition(position: animation.drive(offset), child: child);
  }

  /// 4) Slide From Top → Down
  /// الصفحة تنزل من الأعلى (مثل Notification Drawer)
  static Widget slideFromTop(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    final offset = Tween(begin: const Offset(0, -1), end: Offset.zero)
        .chain(CurveTween(curve: Curves.easeOut));
    return SlideTransition(position: animation.drive(offset), child: child);
  }

  /// 5) Fade Transition
  /// الصفحة تتلاشى تدريجيًا (Smooth Fade)
  static Widget fade(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return FadeTransition(opacity: animation, child: child);
  }

  /// 6) Scale Transition
  /// الصفحة تكبر من 95% إلى 100% (Zoom In)
  static Widget scale(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    final scaleTween =
    Tween<double>(begin: 0.95, end: 1).chain(CurveTween(curve: Curves.easeOut));
    return ScaleTransition(scale: animation.drive(scaleTween), child: child);
  }

  /// 7) Fade + Slide From Bottom
  /// مزيج بين Fade و Slide (أنيميشن ناعم جدًا)
  static Widget fadeUp(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    final offset = Tween(begin: const Offset(0, 0.2), end: Offset.zero)
        .chain(CurveTween(curve: Curves.easeOut));

    return FadeTransition(
      opacity: animation,
      child: SlideTransition(position: animation.drive(offset), child: child),
    );
  }

  /// 8) Rotate + Fade
  /// الصفحة تدور قليلاً مع Fade (أنيميشن فخم)
  static Widget rotateFade(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    final rotateTween =
    Tween<double>(begin: -0.03, end: 0).chain(CurveTween(curve: Curves.easeOut));

    return FadeTransition(
      opacity: animation,
      child: RotationTransition(
        turns: animation.drive(rotateTween),
        child: child,
      ),
    );
  }

  /// 9) Scale From Bottom Right
  /// الصفحة تكبر من الزاوية السفلية اليمنى (إحساس Material)
  static Widget scaleFromBottomRight(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    final scale = Tween(begin: 0.0, end: 1.0)
        .chain(CurveTween(curve: Curves.easeOutBack));
    final alignment = Alignment.bottomRight;

    return ScaleTransition(
      scale: animation.drive(scale),
      alignment: alignment,
      child: child,
    );
  }

  /// 10) Flip Horizontal
  /// الصفحة تنقلب بشكل أفقي (Flip Animation)
  static Widget flipHorizontal(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    final rotate = Tween(begin: -1.0, end: 0.0)
        .chain(CurveTween(curve: Curves.easeOut));

    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        final angle = rotate.evaluate(animation) * 3.1416; // π
        return Transform(
          transform: Matrix4.rotationY(angle),
          alignment: Alignment.center,
          child: child,
        );
      },
    );
  }

  /// 11) Flip Vertical
  /// الصفحة تنقلب بشكل عمودي (Flip Down)
  static Widget flipVertical(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    final rotate = Tween(begin: -1.0, end: 0.0)
        .chain(CurveTween(curve: Curves.easeOut));

    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        final angle = rotate.evaluate(animation) * 3.1416;
        return Transform(
          transform: Matrix4.rotationX(angle),
          alignment: Alignment.center,
          child: child,
        );
      },
    );
  }

  /// 12) Zoom Out → Zoom In
  /// الصفحة تبدأ كبيرة ثم تصغر ثم تعود لحجمها الطبيعي (Dynamic Zoom)
  static Widget zoomOutIn(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    final zoom = TweenSequence([
      TweenSequenceItem(
        tween: Tween(begin: 1.2, end: 0.9)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 0.9, end: 1.0)
            .chain(CurveTween(curve: Curves.easeIn)),
        weight: 50,
      ),
    ]);

    return ScaleTransition(
      scale: animation.drive(zoom),
      child: child,
    );
  }

  /// 13) Slide + Fade From Left
  /// مزيج بين Slide من اليسار او اليمين حسب dx و Fade (Smooth & Clean)
  static Widget slideFadeByDx(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      double dx,
      ) {
    final offset = Tween(
      begin: Offset(dx, 0),
      end: Offset.zero,
    ).chain(CurveTween(curve: Curves.easeOut));

    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: animation.drive(offset),
        child: child,
      ),
    );
  }


  /// 14) Slide + Scale From Bottom
  /// الصفحة تطلع من الأسفل مع تكبير بسيط (Elegant)
  static Widget slideScaleUp(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    final offset = Tween(begin: const Offset(0, 0.4), end: Offset.zero)
        .chain(CurveTween(curve: Curves.easeOut));

    final scale = Tween(begin: 0.9, end: 1.0)
        .chain(CurveTween(curve: Curves.easeOut));

    return SlideTransition(
      position: animation.drive(offset),
      child: ScaleTransition(
        scale: animation.drive(scale),
        child: child,
      ),
    );
  }

  /// 15) Blur Transition
  /// الصفحة تظهر تدريجيًا مع تقليل الـ Blur (Soft Focus)
  static Widget blurIn(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        final blurValue = (1 - animation.value) * 10; // من 10 إلى 0
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: blurValue,
            sigmaY: blurValue,
          ),
          child: child,
        );
      },
    );
  }

  /// 16) Rotate + Slide From Right
  /// الصفحة تدخل من اليمين مع دوران بسيط (Premium Motion)
  static Widget rotateSlideRight(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    final offset = Tween(begin: const Offset(0.5, 0), end: Offset.zero)
        .chain(CurveTween(curve: Curves.easeOut));

    final rotate = Tween(begin: 0.05, end: 0.0)
        .chain(CurveTween(curve: Curves.easeOut));

    return SlideTransition(
      position: animation.drive(offset),
      child: RotationTransition(
        turns: animation.drive(rotate),
        child: child,
      ),
    );
  }
  /// 17) Border Reveal Transition
  /// - إحساس أن الصفحة "تُبنى" من الأطراف إلى الداخل
  static Widget borderReveal(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      ) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        final value = animation.value;

        return Transform.scale(
          scale: value, // يكبر تدريجيًا
          alignment: Alignment.center,
          child: ClipRRect(
            borderRadius: BorderRadius.circular((1 - value) * 80),
            child: child,
          ),
        );
      },
    );
  }


}