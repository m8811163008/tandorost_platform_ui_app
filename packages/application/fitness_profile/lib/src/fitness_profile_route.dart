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
  const FitnessProfileRoute({
    super.key,
    this.onBottomNavigationChanged,
    required this.bottomNavigationIndex,
    this.onDrawerNavigationChanged,
    required this.drawerNavigationIndex,
  });
  final ValueChanged<int>? onBottomNavigationChanged;
  final int bottomNavigationIndex;
  final ValueChanged<int>? onDrawerNavigationChanged;
  final int drawerNavigationIndex;
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
        drawer: NavigationDrawer(
          onDestinationSelected: onDrawerNavigationChanged,
          selectedIndex: drawerNavigationIndex,
          children: AppNavigation.getDrawerChildren(context),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: onBottomNavigationChanged,
          currentIndex: bottomNavigationIndex,
          items: AppNavigation.bottomNavigationItems(context),
        ),
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Builder(
            builder: (context) {
              return ImageGallary();
            },
          ),
          Builder(
            builder: (context) {
              return FitnessInfoConsumer();
            },
          ),
          Builder(
            builder: (context) {
              return PhysicalDataChart();
            },
          ),
        ],
      ),
    );
  }
}
