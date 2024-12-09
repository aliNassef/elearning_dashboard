import 'package:animate_do/animate_do.dart';
import '../../../../core/shared/widgets/custom_text_form_field.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'login_button_bloc_listner.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({
    super.key,
  });

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppConstants.kHorizontalPadding,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideInDown(
                child: Text(
                  'Login',
                  style: AppStyles.textStyle24B.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              const VerticalSpace(16),
              SlideInLeft(
                child: CustomTextFormField(
                  hintText: 'Enter Your Email',
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              const VerticalSpace(16),
              SlideInRight(
                child: CustomTextFormField(
                  hintText: 'Enter Your Password',
                  controller: password,
                  isPassword: true,
                  keyboardType: TextInputType.visiblePassword,
                ),
              ),
              const VerticalSpace(16),
              LoginButtonBlocListner(email: email, password: password),
            ],
          ),
        ),
      ),
    );
  }
}
