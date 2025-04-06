import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/widgets/auth_app_bar.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/widgets/register_form.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/background_image.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: const AuthAppBar(),
      body: Stack(
        children: [
          const BackgroundImage(bottomMargin: 0),
          Center(
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: secondaryGradient,
              ),
              child: Card(
                child: SizedBox(
                  width: 300,
                  height: 800,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: ListView(
                      physics: const ScrollPhysics(parent: PageScrollPhysics()),
                      children: [
                        RegisterForm(
                          emailController: emailController,
                          nameController: nameController,
                          passwordController: passwordController,
                          confirmPasswordController: confirmPasswordController,
                          formKey: formKey,
                        ),
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
