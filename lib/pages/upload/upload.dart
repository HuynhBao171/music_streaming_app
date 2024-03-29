import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';

import '../../core/api_client.dart';
import 'widgets/appbar_upload.dart';

class UploadPage extends StatefulWidget {
  static String id = "Upload";
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final ApiClient _apiClient = ApiClient();
  @override
  Widget build(BuildContext context) {
    bool showFab = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
            headerSliverBuilder: (ctx, i) => [
              CustomAppBarUpload(title: "Upload"),
            ],
            body: const MainBodyUpload()),
      ),
      floatingActionButton: Visibility(
        visible: !showFab,
        child: FloatingActionButton.extended(
          elevation: 20,
          onPressed: () async {
            _uploadAudio();
          },
          highlightElevation: 5,
          splashColor: Colors.orange,
          foregroundColor: Colors.orange,
          backgroundColor: Colors.white,
          icon: const Icon(Icons.upload),
          label: const Text('Upload'),
        ),
      ),
    );
  }

  void _uploadAudio() async {
    // final response = await _apiClient.login(
    //     usernameController.text, passwordController.text);

    // if (response != null && response.statusCode == 200) {
    //   // The user was successfully logged in.
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   prefs.setBool("loggedIn", true);
    //   prefs.setString("UserName", usernameController.text);

    //   Navigator.of(context)
    //       .push(MaterialPageRoute(builder: ((context) => CustomNavBar())));
    // } else {
    //   // There was an error logging in the user.
    //   var message = 'An error occurred. Please try again later.';

    //   if (response != null) {
    //     if (response.statusCode == 401) {
    //       message = 'Invalid email or password.';
    //     } else {
    //       message = 'Error ${response.statusCode}: ${response.reasonPhrase}';
    //     }
    //   }

    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text(message),
    //     ),
    //   );
    // }

  }
}
class MainBodyUpload extends StatefulWidget {
  const MainBodyUpload({super.key});

  @override
  State<MainBodyUpload> createState() => _MainBodyUploadState();
}

class _MainBodyUploadState extends State<MainBodyUpload> {
  File? _image;
  String? _songName;
  String? _selectedGenre;
  final songController = TextEditingController();
  final describeController = TextEditingController();

  final List<String> _genres = [
    'Pop',
    'Rock',
    'Jazz',
    'Blues',
    'R&B/Soul',
    'Hip hop',
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  _selectImage();
                },
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: Colors.black.withOpacity(0.1)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: _image != null
                        ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        _image!,
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    )
                        : const Icon(LineIcons.camera),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    labelText: 'Genre',
                    labelStyle: TextStyle(color: Colors.grey[500]),
                  ),
                  value: _selectedGenre,
                  onChanged: (value) {
                    setState(() {
                      _selectedGenre = value;
                    });
                  },
                  items: _genres.map((genre) {
                    return DropdownMenuItem(
                      value: genre,
                      child: Text(genre),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: SizedBox(
                      child: _songName != null
                          ? TextField(
                        controller: songController,
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.grey.shade400),
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          labelText: 'Song name',
                          labelStyle: TextStyle(color: Colors.grey[500]),
                        ),
                      )
                          : TextField(
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.grey.shade400),
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          labelText: "Choose the song",
                          labelStyle: TextStyle(color: Colors.grey[500]),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: () async {
                        await _selectAudio();
                      },
                      icon: const Icon(LineIcons.music),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                controller: describeController,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  labelText: "Describe your track",
                  labelStyle: TextStyle(color: Colors.grey[500]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectAudio() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
      allowMultiple: false,
    );
    if (result == null || result.files.isEmpty) {
      return;
    }
    setState(() {
      _songName = result.files.single.name;
      songController.text = _songName ?? '';
    });
  }

  Future<void> _selectImage() async {
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Select Image from Gallery'),
              onTap: () async {
                var image =
                await ImagePicker().pickImage(source: ImageSource.gallery);

                if (image == null) {
                  return;
                }

                setState(() {
                  _image = File(image.path);
                });

                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Take a Photo'),
              onTap: () async {
                var image =
                await ImagePicker().pickImage(source: ImageSource.camera);
                if (image == null) {
                  return;
                }
                setState(() {
                  _image = File(image.path);
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}