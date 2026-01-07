import 'package:flutter/material.dart';
//lib/core/widgets/space
class HeightSpace extends StatelessWidget {
  const HeightSpace({super.key, required this.space});
  final double space;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(height: size.height * space);
  }
}

class WidthSpace extends StatelessWidget {
  const WidthSpace({super.key, required this.space});
  final double space;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(width: size.width * space);
  }
}


class HeightSpace1 extends StatelessWidget {
  const HeightSpace1({super.key, required this.space});
  final double space;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height:space);
  }
}

class WidthSpace1 extends StatelessWidget {
  const WidthSpace1({super.key, required this.space});
  final double space;
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: space);
  }
}
