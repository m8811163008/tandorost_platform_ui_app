import 'dart:typed_data';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:domain_model/domain_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fitness_nutrition/fitness_nutrition.dart';
import 'package:fitness_profile_app/src/cubit/fitness_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_repository/image_repository.dart';
import 'package:tandorost_components/tandorost_components.dart';
import 'package:pro_image_editor/pro_image_editor.dart';

class FitnessProfileRoute extends StatelessWidget {
  const FitnessProfileRoute({super.key});
  static const String name = 'fitness-profile';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) => FitnessProfileCubit(
            imageRepository: RepositoryProvider.of<ImageRepository>(context),
            fitnessNutrition: RepositoryProvider.of<FitnessNutrition>(context),
          ),
      lazy: false,
      child: const FitnessProfileView(),
    );
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
    return SingleChildScrollView(
      child: Column(
        children: [
          ImageGallary(),
          FitnessInfoConsumer(),
          PhysicalDataChart(userPhysicalProfile: profile),
        ],
      ),
    );
  }
}

class FitnessInfoConsumer extends StatelessWidget {
  const FitnessInfoConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FitnessProfileCubit, FitnessProfileState>(
      listenWhen:
          (previous, current) =>
              previous.readFitnessDataStatus != current.readFitnessDataStatus,
      listener: (context, state) {
        if (state.readUserImageGallaryStatus.isServerConnectionError) {
          final content = context.l10n.networkError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.readUserImageGallaryStatus.isServerConnectionError) {
          final content = context.l10n.internetConnectionError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        }
      },
      buildWhen:
          (previous, current) =>
              previous.readFitnessDataStatus != current.readFitnessDataStatus,
      builder:
          (context, state) => switch (state.readFitnessDataStatus) {
            AsyncProcessingStatus.inital => AppState.inital(),
            AsyncProcessingStatus.loading => AppState.loading(),
            AsyncProcessingStatus.serverConnectionError =>
              AppState.serverError(),
            AsyncProcessingStatus.internetConnectionError =>
              AppState.internetConnectionError(),
            AsyncProcessingStatus.success => FitnessInfo(
              fitnessData: state.fitnessData!,
            ),
          },
    );
  }
}

class AppState extends StatelessWidget {
  const AppState.inital({super.key}) : _status = AsyncProcessingStatus.inital;
  const AppState.loading({super.key}) : _status = AsyncProcessingStatus.loading;
  const AppState.serverError({super.key})
    : _status = AsyncProcessingStatus.serverConnectionError;
  const AppState.internetConnectionError({super.key})
    : _status = AsyncProcessingStatus.internetConnectionError;
  final AsyncProcessingStatus _status;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Center(
        child: Builder(
          builder: (context) {
            switch (_status) {
              case AsyncProcessingStatus.inital:
                return const Text('Initial state');
              case AsyncProcessingStatus.loading:
                return const LoadingLottie();
              case AsyncProcessingStatus.serverConnectionError:
                return const Text('Server connection error');
              case AsyncProcessingStatus.internetConnectionError:
                return const Text('Internet connection error');
              default:
                return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}

class PhysicalDataChart extends StatelessWidget {
  const PhysicalDataChart({super.key, required this.userPhysicalProfile});
  final UserPhysicalProfile userPhysicalProfile;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Physical data chart', style: context.textTheme.headlineMedium),
          SizedBox(height: context.sizeExtenstion.medium),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) {
                  return BlocProvider.value(
                    value: context.read<FitnessProfileCubit>(),
                    child: AddNewMeasurementDialog(),
                  );
                },
              );
            },
            child: Text('Add new measurement'),
          ),
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
          // Placeholder(),
        ],
      ),
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

class AddNewMeasurementDialog extends StatelessWidget {
  const AddNewMeasurementDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FitnessProfileCubit>();
    final gap = SizedBox(height: context.sizeExtenstion.small);
    return AppDialog(
      title: 'Add new measurement',
      contents: [
        DropDownField<Gender>(
          label: 'gender',
          onChange: context.read<FitnessProfileCubit>().onChangeGender,
          value: context.select<FitnessProfileCubit, Gender?>(
            (cubit) => cubit.state.userPhysicalDataUpsert.gender,
          ),
          items:
              Gender.values
                  .sublist(0, Gender.values.length - 1)
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(context.l10n.physicalDataGender(e.name)),
                    ),
                  )
                  .toList(),
        ),
        gap,
        RegullarTextField(
          label: 'birthday',
          readOnly: true,
          initalValue: context.select<FitnessProfileCubit, String?>(
            (cubit) =>
                cubit.state.userPhysicalDataUpsert.birthday
                    ?.toLocal()
                    .toIso8601String(),
          ),
          onTap: () async {
            final locale = Localizations.localeOf(context);
            late final DateTime? pickedDate;
            if (locale.languageCode == 'fa') {
              Jalali? picked = await showPersianDatePicker(
                context: context,
                initialDate: Jalali.fromDateTime(
                  DateTime.now().subtract(Duration(days: 365 * 25)),
                ),
                firstDate: Jalali(1350),
                lastDate: Jalali.fromDateTime(
                  DateTime.now().subtract(Duration(days: 365 * 17)),
                ),

                initialEntryMode: PersianDatePickerEntryMode.calendarOnly,
                initialDatePickerMode: PersianDatePickerMode.year,
              );
              pickedDate = picked?.toDateTime();
            } else {
              pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now().subtract(Duration(days: 365 * 25)),
                firstDate: DateTime(1950),
                // to limit the application to users who are at least 18 years old
                lastDate: DateTime.now().subtract(Duration(days: 365 * 17)),
              );
            }

            if (pickedDate == null) {
              return;
            }
            cubit.onChangeBirthDay(pickedDate);
          },
        ),
        gap,
        NumberTextField(
          label: 'height',
          onChange: (value) {
            cubit.onChangeHeight(double.parse(value));
          },
          initalValue:
              context
                  .read<FitnessProfileCubit>()
                  .state
                  .userPhysicalDataUpsert
                  .height
                  .tryToString(),
        ),
        gap,
        NumberTextField(
          label: 'weight',
          onChange: (value) {
            cubit.onChangeWeight(double.parse(value));
          },
          initalValue:
              context
                  .read<FitnessProfileCubit>()
                  .state
                  .userPhysicalDataUpsert
                  .weight
                  .tryToString(),
        ),
        gap,
        NumberTextField(
          label: 'WaistCircumference',
          onChange: (value) {
            cubit.onChangeWaistCircumference(double.parse(value));
          },
          initalValue:
              context
                  .read<FitnessProfileCubit>()
                  .state
                  .userPhysicalDataUpsert
                  .waistCircumference
                  .tryToString(),
        ),
        gap,
        NumberTextField(
          label: 'ArmCircumference',
          onChange: (value) {
            cubit.onChangeArmCircumference(double.parse(value));
          },
          initalValue:
              context
                  .read<FitnessProfileCubit>()
                  .state
                  .userPhysicalDataUpsert
                  .armCircumference
                  .tryToString(),
        ),
        gap,
        NumberTextField(
          label: 'ChestCircumference',
          onChange: (value) {
            cubit.onChangeChestCircumference(double.parse(value));
          },
          initalValue:
              context
                  .read<FitnessProfileCubit>()
                  .state
                  .userPhysicalDataUpsert
                  .chestCircumference
                  .tryToString(),
        ),
        gap,
        NumberTextField(
          label: 'ThighCircumference',
          onChange: (value) {
            cubit.onChangeThighCircumference(double.parse(value));
          },
          initalValue:
              context
                  .read<FitnessProfileCubit>()
                  .state
                  .userPhysicalDataUpsert
                  .thighCircumference
                  .tryToString(),
        ),
        gap,
        NumberTextField(
          label: 'CalfMuscleCircumference',
          onChange: (value) {
            cubit.onChangeCalfMuscleCircumference(double.parse(value));
          },
          initalValue:
              context
                  .read<FitnessProfileCubit>()
                  .state
                  .userPhysicalDataUpsert
                  .calfMuscleCircumference
                  .tryToString(),
        ),
        gap,
        NumberTextField(
          label: 'HipCircumference',
          onChange: (value) {
            cubit.onChangeHipCircumference(double.parse(value));
          },
          initalValue:
              context
                  .read<FitnessProfileCubit>()
                  .state
                  .userPhysicalDataUpsert
                  .hipCircumference
                  .tryToString(),
        ),
        gap,
        DropDownField<ActivityLevel>(
          label: 'Activity Level',
          onChange: context.read<FitnessProfileCubit>().onChangeActivityLevel,
          value: context.select<FitnessProfileCubit, ActivityLevel?>(
            (cubit) => cubit.state.userPhysicalDataUpsert.activityLevel,
          ),
          items:
              ActivityLevel.values
                  .sublist(0, ActivityLevel.values.length - 1)
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(context.l10n.physicalActivityLevel(e.name)),
                    ),
                  )
                  .toList(),
        ),
      ],
      fullscreen: true,
      submitButton: TextButton(
        onPressed: context.read<FitnessProfileCubit>().updateUserPhysicalData,
        child: Text('add new'),
      ),
    );
  }
}

extension on double? {
  String tryToString() {
    return this == null ? '' : this.toString();
  }
}

class FitnessInfo extends StatelessWidget {
  const FitnessInfo({super.key, required this.fitnessData});
  final FitnessData fitnessData;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Your Physical data', style: context.textTheme.headlineMedium),
          SizedBox(height: context.sizeExtenstion.medium),
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
        Text(value),
      ],
    );
  }
}

class ImageGallary extends StatelessWidget {
  const ImageGallary({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Your image gallary', style: context.textTheme.headlineMedium),
          SizedBox(height: context.sizeExtenstion.medium),
          AddImageTextButton(),
          CarouselSliderBuilder(),
        ],
      ),
    );
  }
}

class CarouselSliderBuilder extends StatelessWidget {
  const CarouselSliderBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FitnessProfileCubit, FitnessProfileState>(
      listenWhen:
          (previous, current) =>
              previous.readUserImageGallaryStatus !=
              current.readUserImageGallaryStatus,
      listener: (context, state) {
        if (state.readUserImageGallaryStatus.isServerConnectionError) {
          final content = context.l10n.networkError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.readUserImageGallaryStatus.isServerConnectionError) {
          final content = context.l10n.internetConnectionError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        }
      },
      buildWhen:
          (previous, current) => previous.filesDetail != current.filesDetail,
      builder: (context, state) {
        if (state.filesDetail.isEmpty) {
          return Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: UserImageBorder(child: AddNewImageSelfie()),
              ),
              Text(
                'Add your new Image',
                style: context.textTheme.headlineSmall!.copyWith(
                  backgroundColor: context.themeData.colorScheme.primary,
                ),
              ),
            ],
          );
        }
        return CarouselSlider(
          options: CarouselOptions(
            enableInfiniteScroll: false,
            scrollDirection: Axis.vertical,
          ),
          items:
              state.filesDetail.map((fileDetail) {
                return Builder(
                  builder: (BuildContext context) {
                    return UserImageBorder(
                      child: Image.memory(fileDetail.bytes),
                    );
                  },
                );
              }).toList(),
        );
      },
    );
  }
}

class UserImageBorder extends StatelessWidget {
  const UserImageBorder({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.sizeExtenstion.small),
      child: Material(
        shape: RoundedRectangleBorder(
          side: BorderSide(),
          borderRadius: BorderRadius.circular(context.sizeExtenstion.small),
        ),

        child: child,
      ),
    );
  }
}

class AddImageTextButton extends StatelessWidget {
  const AddImageTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final naviagtor = Navigator.of(context);
    return TextButton.icon(
      onPressed: () async {
        final result = await onEditImage(context);
        if (result == null) return;

        await naviagtor.push(
          MaterialPageRoute(
            builder:
                (_) => BlocProvider.value(
                  value: context.read<FitnessProfileCubit>(),
                  child: Scaffold(
                    // appBar: AppBar(title: Text('Edit Image')),
                    body: Builder(
                      builder: (context) {
                        return BlocListener<
                          FitnessProfileCubit,
                          FitnessProfileState
                        >(
                          listenWhen:
                              (previous, current) =>
                                  previous.addUserImageStatus !=
                                  current.addUserImageStatus,
                          listener: (context, state) {
                            if (state
                                .addUserImageStatus
                                .isServerConnectionError) {
                              final content = context.l10n.networkError;
                              ScaffoldMessenger.of(
                                context,
                              ).showSnackBar(SnackBar(content: Text(content)));
                            } else if (state
                                .addUserImageStatus
                                .isServerConnectionError) {
                              final content =
                                  context.l10n.internetConnectionError;
                              ScaffoldMessenger.of(
                                context,
                              ).showSnackBar(SnackBar(content: Text(content)));
                            }
                          },
                          child: Center(
                            child: SizedBox.fromSize(
                              size: MediaQuery.of(context).size,
                              child: ImageEditor(
                                bytes: result.bytes,
                                onComplete: (editedBytes) {
                                  context
                                      .read<FitnessProfileCubit>()
                                      .onEditImageComplete(
                                        editedBytes,
                                        result.fileName,
                                      );
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
            fullscreenDialog: true,
          ),
        );
      },
      label: Text('Add new image'),
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
