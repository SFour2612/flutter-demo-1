import 'package:app/LogIn/Login1.dart';
import 'package:app/SignUp/SignupScreen2.dart';
import 'package:flutter/material.dart';

class SignUpScreen1 extends StatefulWidget {
  @override
  _SignUpScreen1State createState() => _SignUpScreen1State();
}

class _SignUpScreen1State extends State<SignUpScreen1> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _loginEmailController = TextEditingController();
  final TextEditingController _loginPasswordController = TextEditingController();

  bool _isEmailValid = false;
  bool _isLoginEmailValid = false;
  bool _isPasswordValid = false;
  int _selectedIndex = 0; // 0: Sign Up, 1: Log In

  // Kiểm tra email
  void _checkEmailValidity(String email) {
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.(com|edu\.vn)$');
    setState(() {
      _isEmailValid = regex.hasMatch(email);
    });
  }

  void _checkLoginEmailValidity(String email) {
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.(com|edu\.vn)$');
    setState(() {
      _isLoginEmailValid = regex.hasMatch(email);
    });
  }

  void _checkPasswordValidity(String password) {
    setState(() {
      _isPasswordValid = password.length >= 6;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Bỏ focus khi nhấn ngoài
      },
      child: Scaffold(
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
                      _selectedIndex = 0; // Chuyển sang Sign Up
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        'Sign up',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
                        ),
                      ),
                      if (_selectedIndex == 0)
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
                      _selectedIndex = 1; // Chuyển sang Log In
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        'Log in',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: _selectedIndex == 1 ? Colors.blue : Colors.grey,
                        ),
                      ),
                      if (_selectedIndex == 1)
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
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            _buildSignUpContent(context),
            _buildLoginContent(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSignUpContent(BuildContext context) {
    return SingleChildScrollView(
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
            onChanged: _checkEmailValidity,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen2()),
                    );
                  }
                : null,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15),
              backgroundColor: _isEmailValid ? Colors.black87 : Colors.grey,
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
            "or",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          OutlinedButton.icon(
            icon: Icon(Icons.g_mobiledata, color: Colors.red),
            label: Text("Continue with Google"),
            onPressed: () {
              // Thêm logic xử lý Google Sign-In tại đây
            },
          ),
          SizedBox(height: 10),
          OutlinedButton.icon(
            icon: Icon(Icons.apple, color: Colors.black),
            label: Text("Continue with Apple"),
            onPressed: () {
              // Thêm logic xử lý Apple Sign-In tại đây
            },
          ),
          SizedBox(height: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
              children: [Text(
                'By clicking continue, you agree to our ',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TermsScreen()),
                  );
                },
                child: Text(
                  'Terms of Service',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
              ),
              
            ]
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('and ',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>TermsScreen()
                      )
                      );
                    },
                    child: Text('Privacy Policy',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87)),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLoginContent(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "App Name",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _loginEmailController,
            onChanged: _checkLoginEmailValidity,
            decoration: InputDecoration(
              labelText: "email@domain.com",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _loginPasswordController,
            obscureText: true,
            onChanged: _checkPasswordValidity,
            decoration: InputDecoration(
              labelText: "Enter your password",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          Align(
  alignment: Alignment.centerRight,
  child: GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ForgotPassword()),
      );
    },
    child: Text(
      'Forgot Password',
      style: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w800,
        color: Colors.black87,
      ),
    ),
  ),
),
          SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            height:50 ,
            child: ElevatedButton(
            onPressed: (_isLoginEmailValid && _isPasswordValid) ? () {} : null,
            style: ElevatedButton.styleFrom(padding: 
            EdgeInsets.symmetric(vertical: 15),
            backgroundColor: _isLoginEmailValid && _isPasswordValid ? Colors.black87 : Colors.grey,),
            child: Text("Log in",
            style: TextStyle(color: Colors.white),),
          ),),
          SizedBox(height: 8),
          Text(
            "or",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 18),
          SizedBox(
            width: double.infinity,
            child: 
          OutlinedButton.icon(
            icon: Icon(Icons.g_mobiledata, color: Colors.red),
            label: Text("Continue with Google"),
            onPressed: () {
              // Thêm logic xử lý Google Sign-In tại đây
            },
          ),),
          SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: 
          OutlinedButton.icon(
            icon: Icon(Icons.apple, color: Colors.black),
            label: Text("Continue with Apple"),
            onPressed: () {
              // Thêm logic xử lý Apple Sign-In tại đây
            },
          ),)
        ],
      ),
    );
  }
}


class TermsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Terms of Service")),
      body: Center(child: Text("Terms of Service content here.")),
    );
  }
}

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Privacy Policy")),
      body: Center(child: Text("Privacy Policy content here.")),
    );
  }
}
