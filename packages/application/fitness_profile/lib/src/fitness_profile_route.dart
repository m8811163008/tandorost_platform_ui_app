import 'package:domain_model/domain_model.dart';
import 'package:fitness_nutrition/fitness_nutrition.dart';
import 'package:fitness_profile_app/src/cubit/fitness_profile_cubit.dart';
import 'package:fitness_profile_app/src/widgets/chart/chart.dart';
import 'package:fitness_profile_app/src/widgets/fitness_insight/fitness_insight.dart';
import 'package:fitness_profile_app/src/widgets/gallary/gallary.dart';
import 'package:flutter/material.dart';
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
      create: (_) => FitnessProfileCubit(
        imageRepository: RepositoryProvider.of<ImageRepository>(context),
        fitnessNutrition: RepositoryProvider.of<FitnessNutrition>(context),
      ),
      lazy: false,
      child: AppScaffold(
        appBar: AppBar(
          actions: [AddMeasurementButton(), ArchiveImagesButton()],
          title: Text(
            context.l10n.appRoutesName(RoutesNames.fitnessProfileRoute.name),
          ),
        ),
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

class ArchiveImagesButton extends StatelessWidget {
  const ArchiveImagesButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FitnessProfileCubit>();
    return BlocConsumer<FitnessProfileCubit, FitnessProfileState>(
      listenWhen: (previous, current) =>
          previous.archivingImagesStatus != current.archivingImagesStatus,
      listener: (context, state) {
        if (state.archivingImagesStatus.isConnectionError) {
          final content = context.l10n.networkError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.archivingImagesStatus.isInternetConnectionError) {
          final content = context.l10n.internetConnectionError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.archivingImagesStatus.isSuccess) {
          cubit.readUserImageGallary();
        }
      },
      buildWhen: (previous, current) =>
          previous.archivingImagesStatus != current.archivingImagesStatus ||
          previous.archiveImagesId != current.archiveImagesId,
      builder: (context, state) {
        final isLoading = state.archivingImagesStatus.isLoading;
        final isImagesIdNotEmpty = state.archiveImagesId.isNotEmpty;
        return IconButton(
          onPressed: !isLoading && isImagesIdNotEmpty
              ? cubit.archiveImages
              : null,
          tooltip: context.l10n.prfileArchiveImagesButtonTooltip,
          icon: Icon(Icons.archive),
        );
      },
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
        children: [ImageGallary(), FitnessInfoConsumer(), PhysicalDataChart()],
      ),
    );
  }
}
