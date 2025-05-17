
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({super.key});

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AIChatButton(
              onLongPressStart: () {},
              onLongPressUp: () {},
            ),
            IconButton.filledTonal(
              onPressed: () {},
              icon: Icon(Icons.keyboard),
            ),
          ],
        ),
      ],
    );
  }
}