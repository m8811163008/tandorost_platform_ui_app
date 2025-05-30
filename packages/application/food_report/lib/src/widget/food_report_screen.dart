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
  });
  final VoidCallback? goToFoodInputRoute;
  final VoidCallback? goToFitnessProfileRoute;

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
    _controller.dispose();
    super.dispose();
  }

  void _onChangeTab() {
    context.read<FoodReportCubit>().onChangeTab(
      SelectedTab.values[_controller.index],
    );
  }

  @override
  Widget build(BuildContext context) {
    final gap = SizedBox(width: context.sizeExtenstion.small);
    final foodListConsumer = FoodListConsumer();

    return BlocBuilder<FoodReportCubit, FoodReportState>(
      buildWhen:
          (previous, current) =>
              previous.selectedFoods != current.selectedFoods,
      builder: (context, state) {
        final canEdit = state.selectedFoods.length == 1;
        final canDelete = state.selectedFoods.isNotEmpty;
        return AppScaffold(
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
                        ? () {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return BlocProvider.value(
                                value: context.read<FoodReportCubit>(),
                                child: EditFoodDialog(
                                  food: state.selectedFoods.single,
                                ),
                              );
                            },
                          );
                        }
                        : null,
                icon: Icon(Icons.edit),
              ),
              gap,
              IconButton.filledTonal(
                onPressed:
                    canDelete
                        ? () {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return BlocProvider.value(
                                value: context.read<FoodReportCubit>(),
                                child: DeleteFoodDialog(
                                  foodsId:
                                      state.selectedFoods
                                          .map((e) => e.id)
                                          .toList(),
                                ),
                              );
                            },
                          );
                        }
                        : null,
                icon: Icon(Icons.delete),
              ),
            ],
            bottom: TabBar(
              controller: _controller,
              tabs: <Widget>[
                Tab(icon: Icon(Icons.monitor_heart), text: 'Rest day'),
                Tab(icon: Icon(Icons.sports), text: 'Excersice day'),
              ],
            ),
          ),
          body: TabBarView(
            controller: _controller,
            children: <Widget>[
              FoodReportView(foodListConsumer: foodListConsumer),
              FoodReportView(foodListConsumer: foodListConsumer),
            ],
          ),
        );
      },
    );
  }
}