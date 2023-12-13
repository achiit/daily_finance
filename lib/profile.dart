import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedGender = '';
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  XFile? _photoImageFile;
  XFile? _idProofImageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                        'Age',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  TextFormField(
                    controller: ageController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 2),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),

                  // Custom Image Input Field for Photo
                  ImageInputField(
                    labelText: 'Upload your Photo',
                    onImageSelected: (XFile? image) {
                      setState(() {
                        _photoImageFile = image;
                      });
                    },
                    initialImage: _photoImageFile,
                  ),

                  // Display selected photo for Photo
                  if (_photoImageFile != null)
                    Image.file(
                      File(_photoImageFile!.path),
                      height: 100,
                      width: 100,
                    ),

                  SizedBox(height: 20),

                  // Custom Image Input Field for ID proof
                  ImageInputField(
                    labelText: 'Upload your ID Proof',
                    onImageSelected: (XFile? image) {
                      setState(() {
                        _idProofImageFile = image;
                      });
                    },
                    initialImage: _idProofImageFile,
                  ),

                  // Display selected photo for ID proof
                  if (_idProofImageFile != null)
                    Image.file(
                      File(_idProofImageFile!.path),
                      height: 100,
                      width: 100,
                    ),

                  SizedBox(height: 20),

                  // Select Your Gender
                  Text(
                    'Select Your Gender',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GenderOption(
                        gender: 'Male',
                        isSelected: selectedGender == 'Male',
                        onSelect: () {
                          setState(() {
                            selectedGender = 'Male';
                          });
                        },
                      ),
                      SizedBox(width: 20),
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
                  SizedBox(height: 20),

                  // Save Profile Button
                  ElevatedButton(
                    onPressed: saveProfile,
                    child: Text('Save Profile'),
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
          color: isSelected ? Colors.blue : Colors.grey,
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
