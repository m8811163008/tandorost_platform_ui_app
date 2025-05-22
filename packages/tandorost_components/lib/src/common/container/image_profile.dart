import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({super.key});
  

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: context.sizeExtenstion.profileRadius,
      child: Placeholder(),
    );
  }
}