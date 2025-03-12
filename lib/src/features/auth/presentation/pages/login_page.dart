import 'package:community_with_legends_mobile/src/features/auth/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';

import '../../../../../config/colors.dart';
import '../../../../shared/presentation/widgets/background_image.dart';
import '../widgets/auth_app_bar.dart';

class LoginPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AuthAppBar(),
      body: Stack(
        children: [
          BackgroundImage(bottomMargin: 0),
          Center(
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: secondaryGradient,
              ),
              child: Card(
                child: SizedBox(
                  width: 300,
                  height: 670,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: ListView(
                      physics: ScrollPhysics(parent: PageScrollPhysics()),
                      children: [
                        LoginForm(
                          emailController: emailController,
                          passwordController: passwordController,
                          formKey: formKey,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
