import 'package:flutter/material.dart';

import '../../core/api_client.dart';
import 'login_page.dart';
import 'widgets/my_button.dart';
import 'widgets/my_textfield.dart';

class ForgetPasswordMailPage extends StatefulWidget {
  const ForgetPasswordMailPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordMailPage> createState() => _ForgetPasswordMailPageState();
}

class _ForgetPasswordMailPageState extends State<ForgetPasswordMailPage> {
  final emailController = TextEditingController();
  final ApiClient _apiClient = ApiClient();

  void forgetPassword() async {
    final response = await _apiClient.forgetPassword(emailController.text);

    if (response != null && response.statusCode == 200) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: ((context) => LoginPage())));
    } else {
      var message = 'An error occurred. Please try again later.';
      if (response != null) {
        if (response.statusCode == 401) {
          message = 'Invalid email';
        } else {
          message = 'Error ${response.statusCode}: ${response.reasonPhrase}';
        }
      }
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                const SizedBox(height: 30 * 4),
                Image.asset(
                  'assets/icons/appicon.png',
                  height: 250,
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    'Please enter the email address associated with the account!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                Form(
                  child: Column(
                    children: [
                      MyTextField(
                        controller: emailController,
                        labelText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        icon: Icons.email_rounded,
                      ),
                      const SizedBox(height: 20.0),
                      MyButton(
                        text: "Next",
                        onTap: () async {
                          forgetPassword();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
