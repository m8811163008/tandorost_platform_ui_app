import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({
    super.key,
    this.imageProfile,
    this.onEditPressed,
    this.isUploading = false,
  });

  final FileDetail? imageProfile;
  final VoidCallback? onEditPressed;
  final bool isUploading;

  @override
  Widget build(BuildContext context) {
    final image =
        imageProfile != null ? MemoryImage(imageProfile!.bytes) : null;
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        CircleAvatar(
          radius: context.sizeExtenstion.profileRadius,
          backgroundImage: image,
          child: image == null ? Icon(Icons.image) : null,
        ),
        if (!isUploading)
          IconButton.outlined(icon: Icon(Icons.edit), onPressed: onEditPressed)
        else
          IconButton.outlined(
            icon: Transform.scale(
              scale: 0.7,
              child: CircularProgressIndicator(),
            ),
            onPressed: null,
          ),
      ],
    );
  }
}
