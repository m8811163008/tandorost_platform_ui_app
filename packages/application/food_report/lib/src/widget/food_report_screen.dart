import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_report_app/src/cubit/food_report_cubit.dart';
import 'package:food_report_app/src/widget/delete_food_dialog.dart';
import 'package:food_report_app/src/widget/edit_food_dialog.dart';
import 'package:food_report_app/src/widget/food_list_consumer.dart';
import 'package:food_report_app/src/widget/food_report_view.dart';
import 'package:tandorost_components/tandorost_components.dart';

class FoodReportScreen extends StatefulWidget {
  const FoodReportScreen({
    super.key,
    this.goToFoodInputRoute,
    this.goToFitnessProfileRoute,
    this.onBottomNavigationChanged,
    required this.bottomNavigationIndex,
    this.onDrawerNavigationChanged,
    required this.drawerNavigationIndex,
  });
  final VoidCallback? goToFoodInputRoute;
  final VoidCallback? goToFitnessProfileRoute;
  final ValueChanged<int>? onBottomNavigationChanged;
  final int bottomNavigationIndex;
  final ValueChanged<int>? onDrawerNavigationChanged;
  final int drawerNavigationIndex;

  @override
  State<FoodReportScreen> createState() => _FoodReportScreenState();
}

class _FoodReportScreenState extends State<FoodReportScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _controller;
  @override
  void initState() {
    _controller = TabController(
      length: SelectedTab.values.length,
      vsync: this,
      animationDuration: Duration(milliseconds: 700),
    )..addListener(_onChangeTab);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_onChangeTab);
    _controller.dispose();
    super.dispose();
  }

  void _onChangeTab() async {
    if (!_controller.indexIsChanging) {
      context.read<FoodReportCubit>().onChangeTab(
        SelectedTab.values[_controller.index],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final gap = SizedBox(width: context.sizeExtenstion.small);
    final foodListConsumer = FoodListConsumer();
    final foodReportView = FoodReportView(
      foodListConsumer: foodListConsumer,
      goToFitnessProfileRoute: widget.goToFitnessProfileRoute,
    );

    return BlocBuilder<FoodReportCubit, FoodReportState>(
      buildWhen:
          (previous, current) =>
              previous.selectedFoods != current.selectedFoods,
      builder: (context, state) {
        final canEdit = state.selectedFoods.length == 1;
        final canDelete = state.selectedFoods.isNotEmpty;
        return AppScaffold(
          drawer: NavigationDrawer(
            onDestinationSelected: widget.onDrawerNavigationChanged,
            selectedIndex: widget.drawerNavigationIndex,
            children: AppNavigation.getDrawerChildren(context),
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: widget.onBottomNavigationChanged,
            currentIndex: widget.bottomNavigationIndex,
            items: AppNavigation.bottomNavigationItems(context),
          ),
          appBar: AppBar(
            actions: [
              IconButton.outlined(
                onPressed: widget.goToFoodInputRoute,
                icon: Icon(Icons.add),
              ),
              gap,
              IconButton.filledTonal(
                onPressed:
                    canEdit
                        ? () => _showEditDialog(state.selectedFoods.single)
                        : null,
                icon: Icon(Icons.edit),
              ),
              gap,
              IconButton.filledTonal(
                onPressed:
                    canDelete
                        ? () => _showDeleteDialog(state.selectedFoods)
                        : null,
                icon: Icon(Icons.delete),
              ),
            ],
            bottom: TabBar(
              controller: _controller,
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.monitor_heart),
                  text: context.l10n.foodReportTabLabelRestDay,
                ),
                Tab(
                  icon: Icon(Icons.sports),
                  text: context.l10n.foodReportTabLabelTrainingDay,
                ),
              ],
            ),
          ),
          body: TabBarView(
            controller: _controller,
            children: <Widget>[foodReportView, foodReportView],
          ),
        );
      },
    );
  }

  void _showEditDialog(Food food) async {
    await showDialog(
      context: context,
      builder: (_) {
        return BlocProvider.value(
          value: context.read<FoodReportCubit>(),
          child: EditFoodDialog(food: food),
        );
      },
    );
  }

  void _showDeleteDialog(List<Food> selectedFoods) async {
    await showDialog(
      context: context,
      builder: (_) {
        return BlocProvider.value(
          value: context.read<FoodReportCubit>(),
          child: DeleteFoodDialog(
            foodsId: selectedFoods.map((e) => e.id).toList(),
          ),
        );
      },
    );
  }
}
