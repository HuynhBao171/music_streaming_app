import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/api_client.dart';
import '../../widgets/navbar.dart';
import 'register_page.dart';
import 'widgets/my_button.dart';
import 'widgets/my_passwordfield.dart';
import 'widgets/my_textfield.dart';
import 'widgets/square_tile.dart';

class LoginPage extends StatefulWidget {
  static String id = "Login";
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ApiClient _apiClient = ApiClient();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void LogIn() async {
    final response = await _apiClient.login(
        usernameController.text, passwordController.text);

    if (response != null && response.statusCode == 200) {
      // The user was successfully logged in.
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("loggedIn", true);
      prefs.setString("UserName", usernameController.text);

      Navigator.of(context)
          .push(MaterialPageRoute(builder: ((context) => CustomNavBar())));
    } else {
      // There was an error logging in the user.
      var message = 'An error occurred. Please try again later.';

      if (response != null) {
        if (response.statusCode == 401) {
          message = 'Invalid email or password.';
        } else {
          message = 'Error ${response.statusCode}: ${response.reasonPhrase}';
        }
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
              // const Icon(
              //   Icons.lock,
              //   size: 100,
              // ),
              Image.asset('assets/icons/appicon.png',height: 150,),
              const SizedBox(height: 50),
              Text(
                'Welcome back!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 25),
              MyTextField(
                controller: usernameController,
                labelText: 'Username',
                keyboardType: TextInputType.name,
                icon: Icons.person_rounded,
              ),
              const SizedBox(height: 10),
              MyPasswordField(
                controller: passwordController,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              MyButton(
                text: "Login",
                onTap: () async {
                  LogIn();
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
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => RegisterPage())));
                    },
                    child: const Text(
                      'Register now',
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
