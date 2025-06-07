import 'package:fitness_profile_app/src/widgets/fitness_insight/add_measurement_button.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class NoDataFound extends StatelessWidget {
  const NoDataFound({super.key, this.title = ''});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppCardHeader(title: title),
          Center(
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: context.sizeExtenstion.medium,
                  ),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    child: AppRoundedRectangleBorder(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          context.sizeExtenstion.small,
                        ),
                        child: EmptyChartImage(),
                      ),
                    ),
                  ),
                ),
                AddMeasurementButton.filled(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
