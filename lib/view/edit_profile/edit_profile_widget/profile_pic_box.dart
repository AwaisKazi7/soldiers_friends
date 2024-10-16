import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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

    if (image != null) {
      setState(() {
        _profilePictures.add(File(image.path)); // Store selected image
      });
    }
  }

  Widget _buildProfilePictureBox(File? image) {
    if (image != null) {
      return Container(
        width: 113.32,
        height: 178.15,
        margin: EdgeInsets.only(right: 10),
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
        child: Image.file(image, fit: BoxFit.cover,)
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
    List<Widget> pictureBoxes = _profilePictures
        .map((image) => _buildProfilePictureBox(image))
        .toList();

    // Always add a dotted box at the end
    pictureBoxes.add(_buildProfilePictureBox(null));

    return Container(
      height: 178.15,
      child: ListView(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        children: pictureBoxes,
      ),
    );
  }
}
