import 'dart:io';

import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final bool isEdit;
  final VoidCallback onClicked;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
    this.isEdit = false,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Center(
      child: Stack(
        children: [
          buildImage(),
          /*  Positioned(
            bottom: 0,
            right: 4,
            child: buildEditIcon(color),
          ),*/
        ],
      ),
    );
  }

  Widget buildImage() {
    final image = imagePath.contains('https://')
        ? NetworkImage(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoAtoBGlUOqvfic4l51lnDur4HUczWxdihwu-my52a41hMzB7IUro9P2Sf2SZl9igHhi8&usqp=CAU',
          )
        : FileImage(File(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoAtoBGlUOqvfic4l51lnDur4HUczWxdihwu-my52a41hMzB7IUro9P2Sf2SZl9igHhi8&usqp=CAU',
          ));

    return ClipOval(
      child: Material(
        color: Color.fromARGB(0, 3, 16, 68),
        child: Ink.image(
          image: image as ImageProvider,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(onTap: onClicked),
        ),
      ),
    );
  }

  //Widget buildEditIcon(Color color) => buildCircle(
  // color: Colors.white,
  //   all: 3,
  //   child: buildCircle(
  //    color: color,
  //   all: 8,
  //    child: Icon(
  //isEdit ? Icons.add_a_photo : Icons.edit,
  //  color: Colors.white,
  //   size: 20,
  // ),
  //  ),
  //  );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
