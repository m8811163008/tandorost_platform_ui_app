import 'package:fitness_profile_app/src/cubit/fitness_profile_cubit.dart';
import 'package:fitness_profile_app/src/widgets/fitness_insight/fitness_insight.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class AddMeasurementButton extends StatelessWidget {
  const AddMeasurementButton({super.key}) : _isFilled = false;
  const AddMeasurementButton.filled({super.key}) : _isFilled = true;
  final bool _isFilled;

  @override
  Widget build(BuildContext context) {
    final label = Text(context.l10n.fitnessProfileNewMeasurementLabel);
    onPress() {
      _onPress(context);
    }
    return _isFilled
        ? ElevatedButton(onPressed: onPress, child: label)
        : TextButton.icon(
          onPressed: onPress,
          label: label,
          icon: Icon(Icons.add),
        );
  }

  void _onPress(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (_) {
        return BlocProvider.value(
          value: context.read<FitnessProfileCubit>(),
          child: AddNewMeasurementDialog(),
        );
      },
    );
  }
}
