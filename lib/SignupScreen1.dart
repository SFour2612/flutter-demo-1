// import 'package:app/LonginScreen2.dart';
// import 'package:flutter/material.dart';
// import 'LonginScreen2.dart';
// void main() {
//   runApp(SignUpApp());
// }

// class SignUpApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: SignUpScreen1(),
//     );
//   }
  
// }
// class SignUpScreen1 extends StatefulWidget {
//   @override
//   _SignUpScreen1State createState() => _SignUpScreen1State();
// }


// class _SignUpScreen1State extends State<SignUpScreen1> {
//   final TextEditingController _emailController = TextEditingController();
//   bool _isEmailValid = false;

//   void _checkEmailValidity(String email) {
//   if (email.contains(' ')) {
//     setState(() {
//       _isEmailValid = false; // Không hợp lệ nếu có dấu cách
//     });
//   } else if (email.endsWith('@gmail.com') || email.endsWith('.edu.vn') || email.endsWith('@yahoo.com')) {
//     setState(() {
//       _isEmailValid = true; // Hợp lệ nếu email đúng định dạng và không có dấu cách
//     });
//   } else {
//     setState(() {
//       _isEmailValid = false; // Không hợp lệ nếu không đúng định dạng
//     });
//   }
// }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Padding(
//           padding: const EdgeInsets.only(top: 5),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Padding(padding: EdgeInsets.only(top: 15),
//                 child: TextButton(
//                   onPressed: () {},
//                   child: Text(
//                     'Sign up',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.lightBlue,
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding:  EdgeInsets.only(top: 15),                            
//                   child: TextButton(
//                     onPressed: () {},
//                       child: Text ('Log in',
//                         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.lightBlue),
//                   ),
//                 )
//               )
//             ],
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text(
//               "App name",
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black87,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 20),
//             Text(
//               "Create an account",
//               style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 20),
//             Text(
//               "Enter your email to sign up for this app",
//               style: TextStyle(fontSize: 15),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 10),
//             TextField(
//               controller: _emailController,
//               onChanged: _checkEmailValidity, // Kiểm tra email mỗi khi thay đổi
//               decoration: InputDecoration(
//                 labelText: "Email@domain.com",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _isEmailValid
//                   ? () {
//                       // Chuyển sang màn hình tiếp theo
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => SignUpScreen2()),
//                       );
//                     }
//                   : null, // Vô hiệu hóa nút nếu email không hợp lệ
//               style: ElevatedButton.styleFrom(
//                 padding: EdgeInsets.symmetric(vertical: 15),
//                 backgroundColor: Colors.black,
//                 foregroundColor: Colors.white,
//               ),
//               child: Text("Continue"),
//             ),
            
//             SizedBox(height: 20),
//             Text(
//               "You already have an account?", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),
//               textAlign: TextAlign.center,
//             ),
            
//             SizedBox(height: 20),
//             Text(
//               "or",
//               style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 20),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton.icon(
//                   icon: Icon(Icons.g_mobiledata_rounded),
//                   label: Text("Continue with Google"),
//                   onPressed: () {},
//                 ),
//                 SizedBox(width: 10),
//                 ElevatedButton.icon(
//                   icon: Icon(Icons.apple,color: Colors.black,),
//                   label: Text("Continue with Apple"),
//                   onPressed: () {},
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'LonginScreen2.dart';

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
  bool _isEmailValid = false;

  // Trạng thái nút đang được chọn
  bool _isSignUpSelected = true; // Mặc định chọn Sign Up

  void _checkEmailValidity(String email) {
    if (email.contains(' ')) {
      setState(() {
        _isEmailValid = false; // Không hợp lệ nếu có dấu cách
      });
    } else if (email.endsWith('@gmail.com') ||
        email.endsWith('.edu.vn') ||
        email.endsWith('@yahoo.com')) {
      setState(() {
        _isEmailValid = true; // Hợp lệ nếu email đúng định dạng và không có dấu cách
      });
    } else {
      setState(() {
        _isEmailValid = false; // Không hợp lệ nếu không đúng định dạng
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isSignUpSelected = true; // Chọn Sign Up
                  });
                },
                child: Text(
                  'Sign up',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue,
                    decoration: _isSignUpSelected
                        ? TextDecoration.underline
                        : TextDecoration.none, // Gạch chân nếu được chọn
                    decorationThickness: 3,
                    decorationColor: Colors.lightBlue,
                    height: 50,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isSignUpSelected = false; // Chọn Log In
                  });
                  // Điều hướng sang màn hình Log In
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogInScreen()),
                  );
                },
                child: Text(
                  'Log in',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue,
                    decoration: !_isSignUpSelected
                        ? TextDecoration.underline
                        : TextDecoration.none, // Gạch chân nếu được chọn
                    decorationThickness: 3,
                    decorationColor: Colors.lightBlue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // Thoát bàn phím khi nhấn vùng trống
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "App name",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                "Create an account",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                "Enter your email to sign up for this app",
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              TextField(
                controller: _emailController,
                onChanged: _checkEmailValidity, // Kiểm tra email mỗi khi thay đổi
                decoration: InputDecoration(
                  labelText: "Email@domain.com",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isEmailValid
                    ? () {
                        // Chuyển sang màn hình tiếp theo
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
                      _isEmailValid ? Colors.blue : Colors.grey, // Nút mờ khi vô hiệu
                  foregroundColor: Colors.white,
                ),
                child: Text("Continue"),
              ),
              SizedBox(height: 20),
              Text(
                "You already have an account?",
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                "or",
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                icon: Icon(Icons.g_mobiledata_rounded),
                label: Text("Continue with Google"),
                onPressed: () {
                  // TODO: Thêm logic đăng nhập với Google
                },
              ),
              SizedBox(height: 10),
              ElevatedButton.icon(
                icon: Icon(Icons.apple, color: Colors.black),
                label: Text("Continue with Apple"),
                onPressed: () {
                  // TODO: Thêm logic đăng nhập với Apple
                },
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
      ),
      body: Center(
        child: Text("This is the Log In screen"),
      ),
    );
  }
}
