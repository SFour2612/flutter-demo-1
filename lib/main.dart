import 'package:flutter/material.dart';

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

// Screen 1: Email Input
// class SignUpScreen1 extends StatelessWidget {
//   @override
//   _SignUpScreen1State createState() => _SignUpScreen1State();
// }

// class _SignUpScreen1State extends State<SignUpScreen1> {
//   final TextEditingController _emailController = TextEditingController();
//   bool _isEmailValid = false;

//   void _checkEmailValidity(String email) {
//     // Kiểm tra xem email có kết thúc bằng @gmail.com không
//     if (email.endsWith('@gmail.com')) {
//       setState(() {
//         _isEmailValid = true;
//       });
//     } else {
//       setState(() {
//         _isEmailValid = false;
//       });
//     }
//   }
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Padding(padding:const EdgeInsets.only(  top: 5),
//                            child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                              children: [
//                               Padding(
//                                 padding:  EdgeInsets.only(top: 15),                            
//                                 child: TextButton(
//                                     onPressed: () {},
//                                        child: Text ('Sign up',
//                                           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.greenAccent),
//                                          ),
//                                 )
//                               ),
//                               Padding(
//                                 padding:  EdgeInsets.only(top: 15),                            
//                                 child: TextButton(
//                                     onPressed: () {},
//                                        child: Text ('Sign up',
//                                           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.greenAccent),
//                                          ),
//                                 )
//                               )
//                              ],
                             
//                            )
//                         ),
//         ),
       
            
      
        
      
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text(
//               "App name",
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.lightBlue),/-strong/-heart:>:o:-((:-h //               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 20),
//             Text(
//               "Create an account",
//               style: TextStyle(fontSize: 18),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 20),
//             Text(
//               "Enter your email to sign up for this app",
//               style: TextStyle(fontSize: 18),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 10),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: "Email",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                   Navigator.push(context,
//                      MaterialPageRoute(builder: (context) => SignUpScreen2()),
//                     );
//                     },
//                     style: ElevatedButton.styleFrom( 
//                       padding: EdgeInsets.symmetric(vertical: 15),
//                       backgroundColor: Colors.black,
//                       foregroundColor: Colors.white,
//                     ),
                      
              
//               child: Text( "Continue"),
//             ),
            
//             SizedBox(height: 20),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton.icon(
//                   icon: Icon(Icons.abc),
//                   label: Text("Continue with Google"),
//                   onPressed: () {},
//                 ),
//                 SizedBox(width: 10),
//                 ElevatedButton.icon(
//                   icon: Icon(Icons.apple),
//                   label: Text("Continue with Apple"),
//                   onPressed: () {},
//                 ),
//               ],
//             ),
//           ],
//         ),
//     ),
//     );
    
//   }
// }

class SignUpScreen1 extends StatefulWidget {
  @override
  _SignUpScreen1State createState() => _SignUpScreen1State();
}

class _SignUpScreen1State extends State<SignUpScreen1> {
  final TextEditingController _emailController = TextEditingController();
  bool _isEmailValid = false;

  void _checkEmailValidity(String email) {
    // Kiểm tra xem email có kết thúc bằng @gmail.com không
    if (email.endsWith('@gmail.com')||email.endsWith('.edu.vn')||email.endsWith('@yahoo.com')) {
      setState(() {
        _isEmailValid = true;
      });
    } else {
      setState(() {
        _isEmailValid = false;
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
              Padding(padding: EdgeInsets.only(top: 15),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 15),                            
                  child: TextButton(
                    onPressed: () {},
                      child: Text ('Log in',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.lightBlue),
                  ),
                )
              )
            ],
          ),
        ),
      ),
      body: Padding(
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
                        MaterialPageRoute(builder: (context) => SignUpScreen2()),
                      );
                    }
                  : null, // Vô hiệu hóa nút nếu email không hợp lệ
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15),
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
              child: Text("Continue"),
            ),
            
            SizedBox(height: 20),
            Text(
              "You already have an account?", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            
            SizedBox(height: 20),
            Text(
              "or",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.g_mobiledata_rounded),
                  label: Text("Continue with Google"),
                  onPressed: () {},
                ),
                SizedBox(width: 10),
                ElevatedButton.icon(
                  icon: Icon(Icons.apple,color: Colors.black,),
                  label: Text("Continue with Apple"),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Screen 2: Profile Details
class SignUpScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Create an account",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              "Please complete your profile",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(labelText: "Full name"),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Date of Birth"),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Phone Number"),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Username"),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Student"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Teacher"),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push( context,
                  MaterialPageRoute(builder: (context) => SignUpScreen3()),
                );
              },
              child: Text("Continue"),
            ),
          ],
        ),
      ),
    );
  }
}

// Screen 3: Secure Account
class SignUpScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Secure Your Account"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Secure Your Account",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "New Password",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Confirm New Password",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text("Save New Password"),
            ),
          ],
        ),
      ),
    );
  }
}