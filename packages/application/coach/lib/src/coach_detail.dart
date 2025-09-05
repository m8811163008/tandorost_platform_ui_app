import 'package:coach/src/cubit/coach_cubit.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class CoachDetailRoute extends StatelessWidget {
  const CoachDetailRoute({
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
    return AppScaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.appRoutesName(RoutesNames.coachDetailRoute.name),
        ),
      ),
      body: CoachDetailListener(),
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
    );
  }
}

class CoachDetailListener extends StatelessWidget {
  const CoachDetailListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CoachCubit, CoachState>(
      listenWhen: (previous, current) =>
          previous.readSelectedCoachProgramsStatus !=
          current.readSelectedCoachProgramsStatus,
      listener: (context, state) {
        if (state.readSelectedCoachProgramsStatus.isConnectionError) {
          final content = context.l10n.networkError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state
            .readSelectedCoachProgramsStatus
            .isInternetConnectionError) {
          final content = context.l10n.internetConnectionError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        }
      },
      child: CoachDetailBuilder(),
    );
  }
}

class CoachDetailBuilder extends StatelessWidget {
  const CoachDetailBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoachCubit, CoachState>(
      buildWhen: (previous, current) =>
          previous.readSelectedCoachProgramsStatus !=
          current.readSelectedCoachProgramsStatus,
      builder: (context, state) {
        return Text('Hello');
      },
    );
  }
}
