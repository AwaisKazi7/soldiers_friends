import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:soldiers_friends/view/edit_profile/edit_profile_controller.dart';
import 'dart:io';
import 'package:soldiers_friends/view/edit_profile/edit_profile_widget/dotted_box_widget.dart';

class ProfilePictureRow extends StatefulWidget {
  @override
  _ProfilePictureRowState createState() => _ProfilePictureRowState();
}

class _ProfilePictureRowState extends State<ProfilePictureRow> {
  List<File?> _profilePictures = []; // List to store profile images

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery, // Change to ImageSource.camera for camera
    );
    if (_profilePictures.length < 3) {
      if (image != null) {
        setState(() {
          _profilePictures.add(File(image.path)); // Store selected image
        });
      }
    } else {}
  }

  Widget _buildProfilePictureBox(File? image) {
    if (image != null) {
      return GestureDetector(
        onTap: () {
          setState(() {
            _profilePictures.remove(image);
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                  width: 113.32,
                  height: 178.15,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                    image: image != null
                        ? DecorationImage(
                            image: FileImage(image),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: Image.file(
                    image,
                    fit: BoxFit.cover,
                  )),
              Container(
                  width: 113.32,
                  height: 178.15,
                  decoration:
                      BoxDecoration(color: Colors.white.withOpacity(0.4)),
                  child: Center(
                      child: Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 30,
                  )))
            ],
          ),
        ),
      );
    }
    return GestureDetector(
      onTap: () {
        _pickImage();
      },
      child: DottedBoxWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(builder: (controller) {
      List<Widget> pictureBoxes = _profilePictures.map((image) {
        controller.imagesList.add(image);
        return _buildProfilePictureBox(image);
      }).toList();

      if (pictureBoxes.length < 3) {
        pictureBoxes.add(_buildProfilePictureBox(null));
      }
      return Container(
        height: 178.15,
        child: ListView(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          children: pictureBoxes,
        ),
      );
    });
  }
}
