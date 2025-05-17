import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_input_app/src/result_route/result_body.dart';
import 'package:tandorost_components/tandorost_components.dart';

class ResultRoute extends StatelessWidget {
  const ResultRoute({super.key});
  static const String name = 'result-route';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(),
      fab: FloatingActionButton(onPressed: () {}),
      body: const ResultBody(),
    );
  }
}
