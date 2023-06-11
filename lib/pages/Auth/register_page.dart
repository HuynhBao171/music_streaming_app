import 'package:flutter/material.dart';
import '../../core/api_client.dart';
import 'login_page.dart';
import 'widgets/my_button.dart';
import 'widgets/my_passwordfield.dart';
import 'widgets/my_textfield.dart';
import 'widgets/square_tile.dart';

class RegisterPage extends StatefulWidget {
  static String id = "Register";
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final ApiClient _apiClient = ApiClient();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signIn() async {
    final response = await _apiClient.signup(
        usernameController.text, emailController.text, passwordController.text);

    if (response != null && response.statusCode == 200) {
      // The user was successfully signed up.
      Navigator.of(context)
          .push(MaterialPageRoute(builder: ((context) => LoginPage())));
    } else {
      // There was an error signing up the user.
      var message = 'An error occurred. Please try again later.';

      if (response != null) {
        message = 'Error ${response.statusCode}: ${response.reasonPhrase}';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Image.asset('assets/icons/appicon.png',height: 150,),
              const SizedBox(height: 30),
              Text(
                'Let\'s create an account for you!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              MyTextField(
                controller: usernameController,
                labelText: 'Username',
                keyboardType: TextInputType.name,
                icon: Icons.person_rounded,
              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: emailController,
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
                icon: Icons.email_rounded,
              ),
              const SizedBox(height: 10),
              MyPasswordField(
                controller: passwordController,
              ),
              const SizedBox(height: 25),
              MyButton(
                text: "Sign up",
                onTap: () {
                  signIn();
                },
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(imagePath: 'assets/icons/facebook.png'),
                  SizedBox(width: 25),
                  SquareTile(imagePath: 'assets/icons/google.png')
                ],
              ),
              const SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => LoginPage())));
                    },
                    child: const Text(
                      'Login now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
