import 'dart:typed_data';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:domain_model/domain_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fitness_nutrition/fitness_nutrition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tandorost_components/tandorost_components.dart';
import 'package:pro_image_editor/pro_image_editor.dart';

class FitnessProfileRoute extends StatelessWidget {
  const FitnessProfileRoute({super.key});
  static const String name = 'fitness-profile';
  @override
  Widget build(BuildContext context) {
    return const FitnessProfileView();
  }
}

class FitnessProfileView extends StatelessWidget {
  const FitnessProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final data = FitnessData(
      restingMetabolicRate: 10,
      totalDailyEnergyExpenditure: 10,
      bmi: 10,
      bmiPrime: 10,
      bmiLevel: BmiLevel.healthyWeight,
    );
    final point = DoubleDataPoint(
      value: 170,
      createDate: DateTime.now(),
      dataPointId: 'dataPointId',
    );
    final profile = UserPhysicalProfile(
      id: 'id',
      userId: 'userId',
      gender: Gender.female,
      age: 10,
      height: [point],
      weight: [point],
      waistCircumference: [point],
      armCircumference: [point],
      chestCircumference: [point],
      thighCircumference: [point],
      calfMuscleCircumference: [point],
      hipCircumference: [point],
      activityLevel: [
        ActivityLevelDataPoint(
          value: ActivityLevel.active,
          createDate: DateTime.now(),
          dataPointId: 'dataPointId',
        ),
      ],
    );
    return Column(
      children: [
        FitnessInfo(fitnessData: data),
        ImageGallary(),
        PhysicalDataChart(userPhysicalProfile: profile),
      ],
    );
  }
}

class PhysicalDataChart extends StatelessWidget {
  const PhysicalDataChart({super.key, required this.userPhysicalProfile});
  final UserPhysicalProfile userPhysicalProfile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppLineChart(
          dataPoints: userPhysicalProfile.weight.sublist(
            userPhysicalProfile.weight.length > 10
                ? userPhysicalProfile.weight.length - 10
                : 0,
          ),
        ),
        AppLineChartInputChips(
          chartTypes: [
            ChartType.armCircumference,
            ChartType.waistCircumference,
            ChartType.weight,
          ],
        ),
        Placeholder(),
      ],
    );
    // return BlocBuilder<ProfileCubit, ProfileState>(
    //   buildWhen:
    //       (previous, current) =>
    //           previous.chartType != current.chartType ||
    //           previous.profile.bodyComposition !=
    //               current.profile.bodyComposition,
    //   builder: (context, state) {
    //     if (state.chartData.isEmpty) {
    //       return const SizedBox.shrink();
    //     }
    //     return AppLineChart(
    //       dataPoints: state.chartData.sublist(
    //         state.chartData.length > 10 ? state.chartData.length - 10 : 0,
    //       ),
    //     );
    //   },
    // );
  }
}

class FitnessInfo extends StatelessWidget {
  const FitnessInfo({super.key, required this.fitnessData});
  final FitnessData fitnessData;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        children: [
          _buildFitnessData(
            context,
            'Resting Metabolic Rate',
            fitnessData.restingMetabolicRate.toStringAsFixed(0),
          ),
          _buildFitnessData(
            context,
            'Total Daily Energy Expenditure',
            fitnessData.totalDailyEnergyExpenditure.toStringAsFixed(0),
          ),
          _buildFitnessData(context, 'BMI', fitnessData.bmi.toStringAsFixed(2)),
          _buildFitnessData(
            context,
            'BMI Prime',
            fitnessData.bmiPrime.toStringAsFixed(2),
          ),
          _buildFitnessData(
            context,
            'BMI Level',
            fitnessData.bmiLevel.toString(),
          ),
          _buildFitnessData(
            context,
            'Waist Circumference/Height Ratio',
            fitnessData.waistCircumferenceToHeightRatio?.toStringAsFixed(2) ??
                'N/A',
          ),
          _buildFitnessData(
            context,
            'Is Waist Circumference/Height Ratio Safe',
            fitnessData.isWaistCircumferenceToHeightRatioSafe == null
                ? 'N/A'
                : (fitnessData.isWaistCircumferenceToHeightRatioSafe!
                    ? 'Yes'
                    : 'No'),
          ),
          _buildFitnessData(
            context,
            'Is Waist Circumference Safe Range',
            fitnessData.isWaistCircumferenceSafeRange == null
                ? 'N/A'
                : (fitnessData.isWaistCircumferenceSafeRange! ? 'Yes' : 'No'),
          ),
          // TODO add is weight lose is safe?
        ],
      ),
    );
  }

  Widget _buildFitnessData(BuildContext context, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(width: context.sizeExtenstion.small),
        Text(label),
      ],
    );
  }
}

class ImageGallary extends StatelessWidget {
  const ImageGallary({
    super.key,
    this.filesData = const [],
    this.filesDetail = const [],
  }) : assert(filesData.length == filesDetail.length);
  final List<FileData> filesData;
  final List<FileDetail> filesDetail;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        children: [
          TextButton.icon(
            onPressed: () async {
              final result = await onEditImage(context);
              if (result == null) return;

              final overlay = Overlay.of(context);
              late OverlayEntry entry;

              entry = OverlayEntry(
                builder:
                    (context) => Material(
                      color: Colors.black54,
                      child: Center(
                        child: SizedBox(
                          width: 350,
                          height: 500,
                          child: ImageEditor(
                            bytes: result.bytes,
                            onComplete: (editedBytes) {
                              // Handle the edited image here
                              entry.remove(); // Remove the overlay
                            },
                          ),
                        ),
                      ),
                    ),
              );

              overlay.insert(entry);
            },
            label: Text('Add new image'),
          ),
          CarouselSlider(
            options: CarouselOptions(height: 400.0, aspectRatio: 9 / 11),
            items:
                filesDetail.map((fileDetail) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Image.memory(fileDetail.bytes);
                    },
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }

  Future<FileDetail?> onEditImage(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg', 'jpeg'],
    );
    if (result != null) {
      final singleResult = result.files.single;
      if (singleResult.bytes == null) {
        return null;
      }
      final fileDetail = FileDetail(
        fileName: singleResult.name,
        bytes: singleResult.bytes!,
      );
      return fileDetail;
    }
  }
}

class ImageEditor extends StatelessWidget {
  const ImageEditor({super.key, required this.bytes, this.onComplete});
  final Uint8List bytes;
  final ValueSetter<Uint8List>? onComplete;

  @override
  Widget build(BuildContext context) {
    return ProImageEditor.memory(
      bytes,
      callbacks: ProImageEditorCallbacks(
        onImageEditingComplete: (Uint8List bytes) async {
          /*
          Your code to process the edited image, such as uploading it to your server.

          You can choose to use await to keep the loading dialog visible until 
          your code completes, or run it without async to close the loading dialog immediately.

          By default, the image bytes are in JPG format.
        */
          Navigator.pop(context);
        },
        /* 
        Optional: If you want haptic feedback when a line is hit, similar to WhatsApp, 
        you can use the code below along with the vibration package.

          mainEditorCallbacks: MainEditorCallbacks(
            helperLines: HelperLinesCallbacks(
              onLineHit: () {
                Vibration.vibrate(duration: 3);
              }
            ),
          ),
        */
      ),
    );
  }
}
