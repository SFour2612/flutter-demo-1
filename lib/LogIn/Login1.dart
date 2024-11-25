import 'package:flutter/material.dart';


class Login1 extends StatefulWidget {
  @override
  _Login1State createState() => _Login1State();
}

class _Login1State extends State<Login1> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isEmailValid = false;
  bool _isPasswordValid = false;


  // Kiểm tra email
  void _checkEmailValidity(String email) {
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.(com|edu\.vn)$');
    setState(() {
      _isEmailValid = regex.hasMatch(email);
    });
  }

  // Kiểm tra mật khẩu
  void _checkPasswordValidity(String password) {
    setState(() {
      _isPasswordValid = password.length >= 6;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100), // Tăng chiều cao AppBar
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40), // Tạo khoảng cách trên cùng
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.blue),
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Log in',
                    style: TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Padding(padding:EdgeInsets.symmetric(horizontal: 20) , // Khoảng cách giữa Login và đường gạch
              child: Container(
               
                height: 5,// Đường gạch kéo dài toàn màn hình
                color: Colors.blue,
              ),
              )
            ],
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "App name",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Your Email",style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black87,)
                ),
              ),
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
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Password",
                style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black87,)),
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                onChanged: _checkPasswordValidity,
                decoration: InputDecoration(
                  labelText: "Enter your password",
                  border: OutlineInputBorder(),
                  errorText: !_isPasswordValid &&
                          _passwordController.text.isNotEmpty
                      ? 'Password must be at least 6 characters'
                      : null,
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: (_isEmailValid && _isPasswordValid)
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Continue()),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                    backgroundColor: (_isEmailValid && _isPasswordValid)
                        ? Colors.black87
                        : Colors.blueGrey,
                  ),
                  child: Text(
                    "Continue",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPassword()),
                    );
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  "or",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: OutlinedButton.icon(
                  icon: Icon(Icons.g_mobiledata, color: Colors.red),
                  label: Text("Continue with Google"),
                  onPressed: () {
                    // Thêm logic xử lý Google Sign-In tại đây
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: OutlinedButton.icon(
                  icon: Icon(Icons.apple, color: Colors.black),
                  label: Text("Continue with Apple"),
                  onPressed: () {
                    // Thêm logic xử lý Apple Sign-In tại đây
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Continue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Continue"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("This is the Continue screen"),
      ),
    );
  }
}

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Forgot Password Screen"),
      ),
    );
  }
}
