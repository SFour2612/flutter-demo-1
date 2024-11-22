import 'package:flutter/material.dart';
import 'SignupScreen2.dart';

void main() {
  runApp(SignUpApp());
}

class SignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SignUpScreen1(),
    );
  }
}

class SignUpScreen1 extends StatefulWidget {
  @override
  _SignUpScreen1State createState() => _SignUpScreen1State();
}

class _SignUpScreen1State extends State<SignUpScreen1> {
  final TextEditingController _emailController = TextEditingController();
  bool _isEmailValid = false; // Trạng thái kiểm tra email
  bool _isSignUpSelected = true; // Trạng thái của nút Sign up/Log in

  // Kiểm tra tính hợp lệ của email
  void _checkEmailValidity(String email) {
    // Regex kiểm tra email với đuôi .com hoặc .edu.vn
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.(com|edu\.vn)$');

    setState(() {
      _isEmailValid = regex.hasMatch(email); // Đánh dấu hợp lệ nếu regex khớp
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isSignUpSelected = true; // Chuyển sang Sign up
                  });
                },
                child: Column(
                  children: [
                    Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: _isSignUpSelected ? Colors.blue : Colors.grey,
                      ),
                    ),
                    if (_isSignUpSelected)
                      Container(
                        height: 5,
                        width: 85,
                        color: Colors.blue,
                        margin: EdgeInsets.only(top: 5),
                      ),
                  ],
                ),
              ),
              SizedBox(width: 30),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isSignUpSelected = false; // Chuyển sang Log in
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogInScreen()),
                  );
                },
                child: Column(
                  children: [
                    Text(
                      'Log in',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: !_isSignUpSelected ? Colors.blue : Colors.grey,
                      ),
                    ),
                    if (!_isSignUpSelected)
                      Container(
                        height: 5,
                        width: 85,
                        color: Colors.blue,
                        margin: EdgeInsets.only(top: 5),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              Text(
                "App name",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                "Create an account",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                "Enter your email to sign up for this app",
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _emailController,
                onChanged: _checkEmailValidity, // Gọi hàm kiểm tra email
                decoration: InputDecoration(
                  labelText: "email@domain.com",
                  border: OutlineInputBorder(),
                  errorText: !_isEmailValid && _emailController.text.isNotEmpty
                      ? 'Invalid email. Must end with .com or .edu.vn'
                      : null,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isEmailValid
                    ? () {
                        // Chuyển sang màn hình tiếp theo nếu email hợp lệ
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen2()),
                        );
                      }
                    : null, // Vô hiệu hóa nút nếu email không hợp lệ
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  backgroundColor:
                      _isEmailValid ? Colors.black87 : Colors.grey, // Đổi màu theo trạng thái
                ),
                child: Text(
                  "Continue",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "You already have an account?",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                "or",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              OutlinedButton.icon(
                icon: Icon(Icons.g_mobiledata, color: Colors.red),
                label: Text("Continue with Google"),
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
              SizedBox(height: 10),
              OutlinedButton.icon(
                icon: Icon(Icons.apple, color: Colors.black),
                label: Text("Continue with Apple"),
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
              SizedBox(height: 30),
              Text(
                "By clicking continue, you agree to our Terms of Service and Privacy Policy",
                style: TextStyle(fontSize: 12, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Dummy LogInScreen
class LogInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log In"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("This is the Log In screen"),
      ),
    );
  }
}
