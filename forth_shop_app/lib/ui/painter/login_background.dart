import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import '../../ui/pages/user_login_page.dart';

class LoginBackground extends CustomPainter {
  AuthMode isLogin;

  LoginBackground({this.isLogin});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = isLogin == AuthMode.Login ? Colors.purple : Colors.red;
    canvas.drawCircle(
        Offset(size.width * 0.5, size.height * 0.2), size.height * 0.5, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
