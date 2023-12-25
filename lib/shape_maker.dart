library shape_maker;

import 'package:flutter/material.dart';
import 'package:shape_maker/shape_maker_painter.dart';

class ShapeMaker extends StatelessWidget {
  final Widget? widget;
  final Color bgColor;

  final ShapeType shapeType;
  final double width;
  final double height;

  const ShapeMaker({this.width = 180, this.height = 190, this.widget, this.bgColor = Colors.black, this.shapeType = ShapeType.octagon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ShapeMakerPainter(
          strokeColor: bgColor,
          paintingStyle: PaintingStyle.fill,
          shapeType: shapeType
      ),
      child: SizedBox(
        height: height,
        width: width,
        child: Center(child: widget),
      ),
    );
  }
}
