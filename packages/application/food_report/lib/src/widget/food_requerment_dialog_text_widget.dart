import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class DialogBodyText extends StatelessWidget {
  const DialogBodyText(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.sizeExtenstion.small),
      child: Text(text, textAlign: TextAlign.justify),
    );
  }
}

class DialogBodyTitle extends StatelessWidget {
  const DialogBodyTitle(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.sizeExtenstion.medium),
      child: Text(text, style: context.textTheme.titleMedium),
    );
  }
}

class DialogNetworkImage extends StatelessWidget {
  const DialogNetworkImage(this.path, {super.key});
  final String path;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.sizeExtenstion.small),
      child: Image.network(path),
    );
  }
}
