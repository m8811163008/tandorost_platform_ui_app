import 'dart:math';

import 'package:domain_model/domain_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class AppLineChart extends StatefulWidget {
  AppLineChart({super.key, required this.dataPoints, this.onSpotLongPreesed})
    : assert(dataPoints.isNotEmpty);
  final List<DoubleDataPoint> dataPoints;

  /// this value set the index of x like 0,1.
  final ValueSetter<int>? onSpotLongPreesed;

  @override
  State<AppLineChart> createState() => _AppLineChartState();
}

class _AppLineChartState extends State<AppLineChart> {
  List<Color> gradientColors = const [];

  @override
  void didChangeDependencies() {
    gradientColors = [
      context.themeData.colorScheme.secondary,
      context.themeData.colorScheme.tertiary,
    ];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(aspectRatio: 1, child: LineChart(mainData()));
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    if (value.toDouble() < widget.dataPoints.length) {
      Widget text = _buildBottomTitle(
        widget.dataPoints[value.toInt()].createDate,
      );

      return SideTitleWidget(
        meta: TitleMeta(
          axisSide: meta.axisSide,
          min: meta.min,
          max: meta.max,
          parentAxisSize: meta.parentAxisSize,
          axisPosition: meta.axisPosition,
          appliedInterval: meta.appliedInterval,
          sideTitles: meta.sideTitles,
          formattedValue: meta.formattedValue,
          rotationQuarterTurns: meta.rotationQuarterTurns,
        ),
        child: text,
      );
    } else {
      return SideTitleWidget(
        meta: TitleMeta(
          axisSide: meta.axisSide,
          min: meta.min,
          max: meta.max,
          parentAxisSize: meta.parentAxisSize,
          axisPosition: meta.axisPosition,
          appliedInterval: meta.appliedInterval,
          sideTitles: meta.sideTitles,
          formattedValue: meta.formattedValue,
          rotationQuarterTurns: meta.rotationQuarterTurns,
        ),
        child: const Text('+'),
      );
    }
  }

  Widget _buildBottomTitle(DateTime dateTime) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final locale = Localizations.localeOf(context);
    late final String formattedDate;
    if (locale.languageCode == Language.persian.code) {
      final shamsiDate = Jalali.fromDateTime(dateTime);
      formattedDate =
          '${shamsiDate.year}/${twoDigits(shamsiDate.month)}/${twoDigits(shamsiDate.day)}';
    } else {
      formattedDate =
          '${dateTime.year}/${twoDigits(dateTime.month)}/${twoDigits(dateTime.day)}';
    }

    return RotatedBox(
      quarterTurns: 3,
      child: Text(formattedDate, style: context.themeData.textTheme.labelSmall),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    return Text(
      value.toStringAsFixed(0),
      style: context.themeData.textTheme.labelSmall,
      textAlign: TextAlign.center,
    );
  }

  LineChartData mainData() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchCallback: (touchEvent, touchResponse) {
          if (touchEvent is FlLongPressStart) {
            if (touchResponse?.lineBarSpots?.first.spotIndex == null) return;
            widget.onSpotLongPreesed?.call(
              touchResponse!.lineBarSpots!.first.spotIndex,
            );
          }
        },
        touchTooltipData: LineTouchTooltipData(
          showOnTopOfTheChartBoxArea: true,
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((touchedSpot) {
              return null;
            }).toList();
          },
        ),
        getTouchedSpotIndicator: (barData, indicators) {
          return indicators.map((int index) {
            /// Indicator Line
            final flLine = FlLine(
              color: context.themeData.colorScheme.primary,
              strokeWidth: 0,
            );

            final dotData = FlDotData(
              getDotPainter:
                  (spot, percent, bar, index) => FlDotCirclePainter(
                    // uncommend when enable long press to edit
                    // radius: 64,
                    color: context.themeData.colorScheme.inversePrimary
                        .withAlpha(100),
                  ),
            );

            return TouchedSpotIndicatorData(flLine, dotData);
          }).toList();
        },
      ),
      gridData: const FlGridData(
        show: true,
        drawVerticalLine: true,
        drawHorizontalLine: true,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 80,
            // interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 24,
          ),
        ),
      ),
      minX: 0,
      maxX: 9,
      // parmeter
      minY: widget.dataPoints.map((e) => e.value).reduce(min).toDouble() - 2,
      // parmeter
      maxY: widget.dataPoints.map((e) => e.value).reduce(max).toDouble() + 2,
      lineBarsData: [
        LineChartBarData(
          // parmeter
          spots: List.generate(10, (index) {
            if (index < widget.dataPoints.length) {
              final value = widget.dataPoints[index].value.toDouble();
              return FlSpot(index.toDouble(), value);
            }

            return FlSpot(
              index.toDouble(),
              widget.dataPoints.last.value.toDouble(),
            );
          }),
          gradient: LinearGradient(colors: gradientColors),
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
            getDotPainter: (flSpot, percentage, barData, index) {
              return FlDotCirclePainter(
                radius: 6,
                color: context.themeData.colorScheme.inversePrimary,
              );
            },
          ),
        ),
      ],
    );
  }
}
