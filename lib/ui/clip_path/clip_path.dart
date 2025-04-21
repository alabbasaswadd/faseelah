import 'package:flutter/material.dart';

class ChatBubbleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 20;
    double tailLength = 40;
    double tailRadius = 14;

    final path = Path();

    // 1. ابدأ من أعلى يسار
    path.moveTo(radius, 0);
    path.lineTo(size.width - radius, 0);

    // 2. الزاوية العلوية اليمنى
    path.quadraticBezierTo(size.width, 0, size.width, radius);

    // 3. خروج الذيل بشكل حاد من أعلى اليمين، للأسفل
    path.lineTo(size.width, radius + tailLength);

    // 4. دائرة صغيرة تلتقي مع جسم الفقاعة
    path.arcToPoint(
      Offset(size.width - tailRadius, radius + tailLength + tailRadius),
      radius: Radius.circular(tailRadius),
      clockwise: true,
    );

    // 5. نزول إلى الزاوية اليمنى السفلية
    path.lineTo(size.width - tailRadius, size.height - radius);
    path.quadraticBezierTo(size.width - tailRadius, size.height,
        size.width - tailRadius - radius, size.height);

    // 6. خط القاعدة
    path.lineTo(radius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - radius);
    path.lineTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
