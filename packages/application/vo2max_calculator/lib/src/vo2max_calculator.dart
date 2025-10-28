import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';
import 'package:vo2max_calculator/src/fuel_mixture.dart';
import 'package:vo2max_calculator/src/vo2max_info_dialog.dart';

class Vo2maxCalculatorRoute extends StatelessWidget {
  const Vo2maxCalculatorRoute({
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
          context.l10n.appRoutesName(RoutesNames.vo2maxCalculator.name),
        ),
      ),
      body: Vo2maxCalculatorView(),
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

class Vo2maxCalculatorView extends StatelessWidget {
  const Vo2maxCalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Vo2maxCalculatorCard();
  }
}

class Vo2maxCalculatorCard extends StatefulWidget {
  const Vo2maxCalculatorCard({super.key});

  @override
  State<Vo2maxCalculatorCard> createState() => _Vo2maxCalculatorCardState();
}

class _Vo2maxCalculatorCardState extends State<Vo2maxCalculatorCard> {
  double vo2max = 0;
  double maxDistanceInMeterInOneMinues = 0;
  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppCardHeader(title: context.l10n.vo2maxLabel),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.l10n.vo2maxCalculatorLabel,
                  style: context.textTheme.titleMedium,
                ),
                IconButton.outlined(
                  icon: Icon(Icons.info),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Vo2maxInfoDialog();
                      },
                    );
                  },
                ),
              ],
            ),
            _buildEnergyCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildEnergyCard(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.sizeExtenstion.medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.vo2maxCalculatorText13,
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: context.sizeExtenstion.medium),
          Text(
            context.l10n.vo2maxCalculatorText14,
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: context.sizeExtenstion.medium),
          TextField(
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              labelText: context.l10n.vo2maxCalculatorLabelText,
              hintText: context.l10n.vo2maxCalculatorHintText,
            ),
            onChanged: (value) {
              setState(() {
                if (value.isEmpty) {
                  vo2max = 0;
                  return;
                }
                vo2max = (22.351 * (int.parse(value) / 1000)) - 11.288;
                // in 12 minues
                maxDistanceInMeterInOneMinues =
                    ((0.62 * vo2max) + 11.288) * 1000 / (22.351 * 12);
              });
            },
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            textInputAction: TextInputAction.done,
          ),
          if (vo2max != 0) ...[
            SizedBox(height: context.sizeExtenstion.medium),
            Text(
              context.l10n.vo2maxCalculatorVo2maxRate(vo2max),
              textAlign: TextAlign.justify,
            ),
            Text(
              context.l10n.vo2maxCalculatorVo2maxEfficientDistance(
                maxDistanceInMeterInOneMinues,
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: context.sizeExtenstion.medium),
            Text(
              context.l10n.vo2maxCalculatorVo2maxRecommandation,
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: context.sizeExtenstion.medium),
            Text(
              context.l10n.vo2maxCalculatorVo2maxDistance(
                15,
                maxDistanceInMeterInOneMinues.toInt() * 15,
              ),

              textAlign: TextAlign.justify,
            ),
            Text(
              context.l10n.vo2maxCalculatorVo2maxDistance(
                20,
                maxDistanceInMeterInOneMinues.toInt() * 20,
              ),
              textAlign: TextAlign.justify,
            ),
            Text(
              context.l10n.vo2maxCalculatorVo2maxDistance(
                25,
                maxDistanceInMeterInOneMinues.toInt() * 25,
              ),
              textAlign: TextAlign.justify,
            ),
            Text(
              context.l10n.vo2maxCalculatorVo2maxDistance(
                30,
                maxDistanceInMeterInOneMinues.toInt() * 30,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ],
      ),
    );
  }
}
