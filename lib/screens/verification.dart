import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // For image picking

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  String imgURL = "";
  final ImagePicker _picker = ImagePicker();

  Future<void> uploadImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imgURL = image.path; // Store the local path of the image
      });
    }
  }

  Future<void> verifyUser() async {
    // Logic for verifying user
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("User verified successfully!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Profile Verification", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF00492E),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SizedBox(height: 20),
          Center(
            child: Container(
              width: 500,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[300],
                image: imgURL.isNotEmpty
                    ? DecorationImage(
                        image: FileImage(File(imgURL)), // Use FileImage to display the local image
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: imgURL.isEmpty
                  ? const Icon(Icons.file_upload, size: 72, color: Colors.grey)
                  : null,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: uploadImage,
            child: const Text("Upload Aadhaar"),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00492E),
              foregroundColor: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: verifyUser,
            child: const Text("Verify User"),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00492E),
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}



// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'dart:ui';
// import 'package:image_picker/image_picker.dart'; // For image picking

// class EditProfilePage extends StatefulWidget {
//   const EditProfilePage({super.key});

//   @override
//   State<EditProfilePage> createState() => _EditProfilePageState();
// }

// class _EditProfilePageState extends State<EditProfilePage> {
//   final User? user = FirebaseAuth.instance.currentUser;
//   String imgURL = "Loading";
//   final ImagePicker _picker = ImagePicker();

//   @override
//   void initState() {
//     super.initState();
//     fetchUserData();
//   }

//   Future<void> fetchUserData() async {
//     if (user != null) {
//       try {
//         DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
//             .collection('Users')
//             .doc(user!.uid)
//             .get();

//         if (documentSnapshot.exists) {
//           setState(() {
//             imgURL = documentSnapshot['imgURL'] ?? 'No Image Found';
//           });
//         }
//       } catch (e) {
//         print('Error fetching user data: $e');
//       }
//     }
//   }

//   Future<void> uploadImage() async {
//     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       // Here, you would typically upload the image to Firebase Storage and get the download URL
//       // For simplicity, we'll just update the imgURL state
//       setState(() {
//         imgURL = image.path; // This should be replaced with the upload URL
//       });
//     }
//   }

//   Future<void> verifyUser() async {
//     // Logic for verifying user
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("User verified successfully!")),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         title: const Text("Profile Verification", style: TextStyle(color: Colors.white)),
//         backgroundColor: const Color(0xFF00492E),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16.0),
//         children: [
//           const SizedBox(height: 20),
//           Center(
//             child: Container(
//               width: 140,
//               height: 100,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 color: Colors.grey[300],
//                 image: imgURL.isNotEmpty
//                     ? DecorationImage(
//                         image: NetworkImage(imgURL),
//                         fit: BoxFit.cover,
//                       )
//                     : null,
//               ),
//               child: imgURL.isEmpty
//                   ? const Icon(Icons.person, size: 72, color: Colors.grey)
//                   : null,
//             ),
//           ),
//           const SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: uploadImage,
//             child: const Text("Upload Aadhaar"),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color(0xFF00492E), // Button background color
//               foregroundColor: Colors.white, // Text color
//             ),
//           ),

//           const SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: verifyUser,
//             child: const Text("Verify User"),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color(0xFF00492E),
//               foregroundColor: Colors.white, // Text color
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
