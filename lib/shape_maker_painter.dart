import 'package:flutter/material.dart';

enum ShapeType {
  triangle, octagon, hexagon
}

class ShapeMakerPainter extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  ShapeType shapeType = ShapeType.triangle;

  ShapeMakerPainter({this.shapeType = ShapeType.triangle, this.strokeColor = Colors.black, this.paintingStyle = PaintingStyle.stroke});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = strokeColor
      // ..strokeWidth = strokeWidth
      ..style = paintingStyle;

    canvas.drawPath(getShapePath(size), paint);
  }

  Path getShapePath(Size size) {
    Path path = Path();

    switch (shapeType){
      case ShapeType.triangle:
        path
          ..moveTo(0, size.height)
          ..lineTo(size.width / 2, 0)
          ..lineTo(size.width, size.height)
          ..lineTo(0, size.height);
        break;
      case ShapeType.octagon:
        path.moveTo(size.width * 0.7070941, size.height);
        path.lineTo(size.width * 0.2929059, size.height);
        path.lineTo(0, size.height * 0.7070941);
        path.lineTo(0, size.height * 0.2928924);
        path.lineTo(size.width * 0.2928924,0);
        path.lineTo(size.width * 0.7071076,0);
        path.lineTo(size.width, size.height * 0.2928924);
        path.lineTo(size.width, size.height * 0.7071076);
        path.lineTo(size.width * 0.7070941, size.height);
        path.close();
        // path.moveTo(size.width * 0.3097045, size.height * 0.9594238);
        // path.lineTo(size.width * 0.6902955, size.height * 0.9594238);
        // path.lineTo(size.width * 0.9594238, size.height * 0.6903091);
        // path.lineTo(size.width * 0.9594238, size.height * 0.3097045);
        // path.lineTo(size.width * 0.6902955, size.height * 0.04056266);
        // path.lineTo(size.width * 0.3097045, size.height * 0.04056266);
        // path.lineTo(size.width * 0.04057618, size.height * 0.3096909);
        // path.lineTo(size.width * 0.04057618, size.height * 0.6902955);
        // path.lineTo(size.width * 0.3097045, size.height * 0.9594238);
        // path.close();
        break;
      case ShapeType.hexagon:
        path
          ..moveTo(size.width / 2, 0) // moving to topCenter 1st, then draw the path
          ..lineTo(size.width, size.height * .25)
          ..lineTo(size.width, size.height * .75)
          ..lineTo(size.width * .5, size.height)
          ..lineTo(0, size.height * .75)
          ..lineTo(0, size.height * .25)
          ..close();
        break;

    }

    return path;
  }

  @override
  bool shouldRepaint(ShapeMakerPainter oldDelegate) {
    return oldDelegate.strokeColor != strokeColor ||
        oldDelegate.paintingStyle != paintingStyle;
  }
}
