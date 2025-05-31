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
                AppRoundedRectangleBorder(
                  child: ChartAnimation(size: Size.fromHeight(200)),
                ),
                ElevatedButton(onPressed: (){}, child: Text('add measurement'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}