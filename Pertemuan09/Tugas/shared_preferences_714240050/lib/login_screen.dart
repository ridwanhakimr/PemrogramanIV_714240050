import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_714240050/botnav.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  late SharedPreferences loginData;
  late bool newUser;
  bool _rememberMe = false;
  bool _isLoading = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void checkLogin() async {
    loginData = await SharedPreferences.getInstance();

    if (!mounted) return;

    newUser = loginData.getBool('login') ?? true;

    if (!newUser) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const DynamicBottomNavBar()),
        (route) => false,
      );
      return;
    }

    final savedUsername = loginData.getString('remembered_username');

    setState(() {
      if (savedUsername != null) {
        _usernameController.text = savedUsername;
        _rememberMe = true;
      }
      _isLoading = false;
    });
  }

  void initState() {
    super.initState();
    checkLogin();
  }

  String? _validateUsername(String? value) {
    if (value != null && value.length < 4) {
      return 'Masukkan minimal 4 karakter';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value != null && value.length < 3) {
      return 'Masukkan minimal 3 karakter';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Shared Preference')),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _usernameController,
                      validator: _validateUsername,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.account_circle_rounded),
                        hintText: 'Write username here...',
                        labelText: 'Username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        fillColor: Color.fromARGB(255, 242, 254, 255),
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: true,
                      validator: _validatePassword,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.password_rounded),
                        hintText: 'Write your password here...',
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        fillColor: Color.fromARGB(255, 242, 254, 255),
                        filled: true,
                      ),
                    ),
                  ),
                  CheckboxListTile(
                    title: const Text('Remember Me'),
                    value: _rememberMe,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: _isLoading
                        ? null
                        : (bool? value) {
                            setState(() {
                              _rememberMe = value ?? false;
                            });
                          },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: _isLoading
                          ? null
                          : () async {
                              final isValidForm = _formKey.currentState!
                                  .validate();
                              final username = _usernameController.text;

                              if (isValidForm) {
                                if (_rememberMe) {
                                  await loginData.setString(
                                    'remembered_username',
                                    username,
                                  );
                                } else {
                                  await loginData.remove('remembered_username');
                                }

                                await loginData.setBool('login', false);
                                await loginData.setString('username', username);

                                if (!mounted) return;

                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const DynamicBottomNavBar(),
                                  ),
                                  (route) => false,
                                );
                              }
                            },
                      child: const Text('Login'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
