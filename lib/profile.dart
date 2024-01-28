import 'dart:io';
import 'package:app8/add.dart';
import 'package:app8/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  String selectedGender = '';
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController incomeController = TextEditingController(); // Added incomeController
  final TextEditingController ageController = TextEditingController();
  XFile? _photoImageFile;
  XFile? _idProofImageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green,
        title: Text("Profile"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Name',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 2),
                      ),
                    ),
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'Phone No',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  TextFormField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 2),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'Income/Salary (INR)',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  TextFormField(
                    controller: incomeController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 2),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      Text(
                        'Gender',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(width: 10),
                      GenderOption(
                        gender: 'Male',
                        isSelected: selectedGender == 'Male',
                        onSelect: () {
                          setState(() {
                            selectedGender = 'Male';
                          });
                        },
                      ),
                      SizedBox(width: 10),
                      GenderOption(
                        gender: 'Female',
                        isSelected: selectedGender == 'Female',
                        onSelect: () {
                          setState(() {
                            selectedGender = 'Female';
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 70),

                  // Save Profile Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    child: Text('Save Profile'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.2),
                      minimumSize: Size(double.infinity, 50),backgroundColor: Colors.green,
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

  void saveProfile() {
    // Add your Firebase authentication and profile saving logic here
    // For example:
    // FirebaseAuth.instance.currentUser?.updateProfile(displayName: nameController.text);
    // FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).set({
    //   'name': nameController.text,
    //   'phone': phoneController.text,
    //   'income': incomeController.text,
    //   'age': ageController.text,
    //   'gender': selectedGender,
    //   'photoImagePath': _photoImageFile?.path,
    //   'idProofImagePath': _idProofImageFile?.path,
    // });

    // Add logic to save the images to Firebase Storage or any other desired storage
  }
}

class ImageInputField extends StatefulWidget {
  final String labelText;
  final Function(XFile?) onImageSelected;
  final XFile? initialImage;

  ImageInputField({
    required this.labelText,
    required this.onImageSelected,
    this.initialImage,
  });

  @override
  _ImageInputFieldState createState() => _ImageInputFieldState();
}

class _ImageInputFieldState extends State<ImageInputField> {
  XFile? _selectedImage;

  @override
  void initState() {
    super.initState();
    _selectedImage = widget.initialImage;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          readOnly: true,
          controller: TextEditingController(
            text: _selectedImage != null ? 'Image selected' : '',
          ),
          decoration: InputDecoration(
            labelText: widget.labelText,
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 2),
            ),
            suffixIcon: IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () async {
                XFile? selectedImage =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                setState(() {
                  _selectedImage = selectedImage;
                  widget.onImageSelected(_selectedImage);
                });
              },
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

class GenderOption extends StatelessWidget {
  final String gender;
  final bool isSelected;
  final VoidCallback onSelect;

  GenderOption({
    required this.gender,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          gender,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
