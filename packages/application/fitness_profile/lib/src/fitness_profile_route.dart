import 'package:fitness_nutrition/fitness_nutrition.dart';
import 'package:fitness_profile_app/src/cubit/fitness_profile_cubit.dart';
import 'package:fitness_profile_app/src/widgets/chart/chart.dart';
import 'package:fitness_profile_app/src/widgets/fitness_insight/fitness_insight.dart';
import 'package:fitness_profile_app/src/widgets/gallary/gallary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_repository/image_repository.dart';
import 'package:tandorost_components/tandorost_components.dart';

class FitnessProfileRoute extends StatelessWidget {
  const FitnessProfileRoute({super.key});
  static const String name = 'fitness-profile';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) => FitnessProfileCubit(
            imageRepository: RepositoryProvider.of<ImageRepository>(context),
            fitnessNutrition: RepositoryProvider.of<FitnessNutrition>(context),
          ),
      lazy: false,
      child: AppScaffold(
        appBar: AppBar(actions: [AddMeasurementButton(), AddImageButton()]),
        body: FitnessProfileView(),
      ),
    );
  }
}

class FitnessProfileView extends StatelessWidget {
  const FitnessProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [ImageGallary(), FitnessInfoConsumer(), PhysicalDataChart()],
      ),
    );
  }
}
