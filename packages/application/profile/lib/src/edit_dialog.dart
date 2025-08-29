import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_app/src/cubit/profile_cubit.dart';

class EditDialog extends StatelessWidget {
  const EditDialog({super.key, required this.dialog});
  final Widget dialog;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      visualDensity: VisualDensity.compact,
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) {
            return BlocProvider.value(
              value: context.read<ProfileCubit>(),
              child: dialog,
            );
          },
        );
      },
      icon: Icon(Icons.edit),
    );
  }
}
