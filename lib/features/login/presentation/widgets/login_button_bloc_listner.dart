import 'package:animate_do/animate_do.dart';
import '../../../../core/shared/functions/build_error_message.dart';
import '../../../../core/shared/functions/build_loading_box.dart';
import '../../../../core/shared/functions/toast_dialog.dart';
import '../../../../core/shared/widgets/default_app_button.dart';
import '../../../../core/utils/app_color.dart';
import '../../../courses/presentation/view/courses_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/user_entity.dart';
import '../manger/cubit/login_cubit.dart';

class LoginButtonBlocListner extends StatelessWidget {
  const LoginButtonBlocListner({
    super.key,
    required this.email,
    required this.password,
  });

  final TextEditingController email;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return SlideInUp(
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            Navigator.pop(context);
            buildErrorMessage(context, errMessage: state.errMessage);
          } else if (state is LoginSuccess) {
            Navigator.pop(context);
            showToast(text: 'Login Successfully');
            Navigator.pushReplacementNamed(context, CoursesView.routeName);
          } else {
            buildLoadingBox(context);
          }
        },
        child: DefaultAppButton(
          onPressed: () {
            UserEntity user = UserEntity(
              email: email.text,
              password: password.text,
            );
            context.read<LoginCubit>().login(user: user);
          },
          text: 'Login',
          backgroundColor: AppColors.primaryColor,
          textColor: Colors.white,
        ),
      ),
    );
  }
}
