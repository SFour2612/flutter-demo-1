// import 'package:app/LoginScreen3.dart';
// import 'package:flutter/material.dart';
// import 'LoginScreen3.dart';
// class SignUpScreen2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Sign Up"),
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: GestureDetector(
//         onTap: () {
//           FocusScope.of(context).unfocus(); // Thoát bàn phím khi nhấn vùng trống
//         },
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text(
//               "Create an account",
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 10),
//             Text(
//               "Please complete your profile",
//               style: TextStyle(fontSize: 16),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 20),
//             TextField(
//               decoration: InputDecoration(labelText: "Full name"),
//             ),
//             TextField(
//               decoration: InputDecoration(labelText: "Date of Birth"),
//             ),
//             TextField(
//               decoration: InputDecoration(labelText: "Phone Number"),
//             ),
//             TextField(
//               decoration: InputDecoration(labelText: "Username"),
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {},
//                   child: Text("Student"),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {},
//                   child: Text("Teacher"),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push( context,
//                   MaterialPageRoute(builder: (context) => SignUpScreen3()),
//                 );
//               },
//               child: Text("Continue"),
//             ),
//           ],
//         ),
//       ),
//     ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'LoginScreen3.dart';

class SignUpScreen2 extends StatelessWidget {
  final _formKey = GlobalKey<FormState>(); // Khóa để kiểm soát trạng thái Form

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Điều chỉnh khi bàn phím xuất hiện
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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // Đóng bàn phím khi nhấn vào vùng trống
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey, // Gắn khóa Form
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
                TextFormField(
                  decoration: InputDecoration(labelText: "Full name"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Full name cannot be empty";
                    }
                    return null; // Trả về null nếu hợp lệ
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(labelText: "Date of Birth"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Date of Birth cannot be empty";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(labelText: "Phone Number"),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Phone Number cannot be empty";
                    }
                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return "Phone Number must be numeric";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(labelText: "Username"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Username cannot be empty";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Logic cho nút "Student"
                      },
                      child: Text("Student"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Logic cho nút "Teacher"
                      },
                      child: Text("Teacher"),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Kiểm tra tính hợp lệ của Form
                    if (_formKey.currentState!.validate()) {
                      // Nếu tất cả hợp lệ
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen3()),
                      );
                    } else {
                      // Nếu có trường không hợp lệ
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please fill out all fields")),
                      );
                    }
                  },
                  child: Text("Continue"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


