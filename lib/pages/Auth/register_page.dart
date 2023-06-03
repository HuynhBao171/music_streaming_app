import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../../core/api_client.dart';
import '../../widgets/navbar.dart';
import 'login_page.dart';
import 'widgets/my_button.dart';
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
  void signUserIn() async {
    try {
      final response = await _apiClient.signup(usernameController.toString(),emailController.toString(), passwordController.toString());

      if (response?.statusCode == 200) {
        // The user was successfully signed up.
        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => CustomNavBar())));
      } else {
        // There was an error signing up the user.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response?.data['message']),
          ),
        );
      }
    } on DioError catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.response!.data['message']),
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
              const Icon(
                Icons.lock,
                size: 100,
              ),
              const SizedBox(height: 50),
              Text(
                'Let\'s create an account for you!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),
              MyTextField(
                controller: usernameController,
                labelText: 'Username',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: emailController,
                labelText: 'Email',
                obscureText: true,
              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: passwordController,
                labelText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 25),
              MyButton(
                text: "Sign up",
                onTap: (){
                      signUserIn();
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
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
                    'Already have an account?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: (){
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