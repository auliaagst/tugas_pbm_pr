import 'package:flutter/material.dart';
import 'package:bismillah/pages/register_page.dart';
import 'package:bismillah/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  static Map<String, String> users = {};

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/1.png',
              height: 300,
              width: 300,
            ),
            SizedBox(height: 30),
            TextFormField(
              controller: _usernameController,
              decoration:  InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    width: 2.0,
                    color: Colors.purple
                  )
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Username harus diisi';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    width: 2.0,
                    color: Colors.purple
                  )
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password harus diisi';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final String username = _usernameController.text.trim();
                  final String password = _passwordController.text.trim();

                  if (RegisterPage.users.containsKey(username) && 
                      RegisterPage.users[username] == password) {
                        Navigator.pushNamed(context, '/home', arguments: {
                          'username':username,
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Username atau password salah'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                }
              }, 
              child: Text('Login'),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: (){
                Navigator.pushNamed(context, '/register');
              },
              child: Text('Belum punya akun? Register'),
            ),
          ],
        ),
      ),
    );
  }
}