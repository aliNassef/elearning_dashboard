import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/app_color.dart';
import '../manger/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repo/login_repo.dart';
import '../widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(
          injector<LoginRepo>(),
        ),
        child: const LoginViewBody(),
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    List<Offset> points = [
      const Offset(0, 0),
      Offset(size.width / 2, 0),
      Offset(size.width / 2, size.height / 2),
      Offset(0, size.height / 2),
    ];
    Paint paint = Paint()
      ..color = AppColors.secondaryColor
      ..strokeWidth = 4;
    Path path = Path();
    path.moveTo(points[0].dx, points[0].dy);
    path.lineTo(points[1].dx, points[1].dy);
    path.lineTo(points[3].dx, points[3].dy);
    path.lineTo(points[2].dx, points[2].dy);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
