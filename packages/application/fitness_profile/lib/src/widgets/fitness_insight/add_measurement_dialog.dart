import 'package:domain_model/domain_model.dart';
import 'package:fitness_profile_app/src/cubit/fitness_profile_cubit.dart';
import 'package:fitness_profile_app/src/widgets/fitness_insight/add_mesurement_dialog_hint.dart';
import 'package:fitness_profile_app/src/widgets/fitness_insight/waist_circumference_field_hint.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class AddNewMeasurementDialog extends StatefulWidget {
  const AddNewMeasurementDialog({super.key});

  @override
  State<AddNewMeasurementDialog> createState() =>
      _AddNewMeasurementDialogState();
}

class _AddNewMeasurementDialogState extends State<AddNewMeasurementDialog> {
  bool isGenderError = false;
  bool isActivityLevelError = false;
  bool isBirthdayError = false;
  bool isHeightError = false;
  bool isWeightError = false;
  bool get isValidForm =>
      !isGenderError &&
      !isActivityLevelError &&
      !isBirthdayError &&
      !isHeightError &&
      !isWeightError;
  void validate() {
    final cubit = context.read<FitnessProfileCubit>();
    final userPhysicalDataUpsert = cubit.state.userPhysicalDataUpsert;

    setState(() {
      isHeightError = userPhysicalDataUpsert.height == null;
      isWeightError = userPhysicalDataUpsert.weight == null;
      isGenderError = userPhysicalDataUpsert.gender == null;

      isActivityLevelError = userPhysicalDataUpsert.activityLevel == null;
      isBirthdayError = userPhysicalDataUpsert.birthday == null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FitnessProfileCubit>();
    final gap = SizedBox(height: context.sizeExtenstion.small);
    final isRequiredFields = cubit.state.userPhysicalProfile == null;
    final bodyShapeFields = [
      NumberTextField(
        label: context.l10n.fitnessProfileNewMeasurementDialogArmCircumference,
        onChange: (value) {
          cubit.onChangeArmCircumference(double.tryParse(value));
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
        label:
            context.l10n.fitnessProfileNewMeasurementDialogChestCircumference,
        onChange: (value) {
          cubit.onChangeChestCircumference(double.tryParse(value));
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
        label:
            context.l10n.fitnessProfileNewMeasurementDialogThighCircumference,
        onChange: (value) {
          cubit.onChangeThighCircumference(double.tryParse(value));
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
        label:
            context
                .l10n
                .fitnessProfileNewMeasurementDialogCalfMuscleCircumference,
        onChange: (value) {
          cubit.onChangeCalfMuscleCircumference(double.tryParse(value));
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
        label: context.l10n.fitnessProfileNewMeasurementDialogHipCircumference,
        onChange: (value) {
          cubit.onChangeHipCircumference(double.tryParse(value));
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
    ];
    final demographicFields = [
      DropDownField<Gender>(
        label: context.l10n.fitnessProfileNewMeasurementDialogGender,
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
        errorText: isGenderError ? '' : null,
      ),
      gap,
      DropDownField<ActivityLevel>(
        label: context.l10n.fitnessProfileNewMeasurementDialogActivityLevel,
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
        errorText: isActivityLevelError ? '' : null,
      ),
      gap,
      RegullarTextField(
        label: context.l10n.fitnessProfileNewMeasurementBirthday,
        readOnly: true,
        errorMessage: isBirthdayError ? '' : null,
        initalValue: context.select<FitnessProfileCubit, String?>((cubit) {
          final birthDay = cubit.state.userPhysicalDataUpsert.birthday;
          if (birthDay == null) {
            return null;
          }
          return birthDay.formattedDate(context);
        }),
        onTap: () async {
          final locale = Localizations.localeOf(context);
          late final DateTime? pickedDate;
          if (locale.languageCode == Language.persian.code) {
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
        label:
            '${context.l10n.fitnessProfileNewMeasurementHeight} (${context.l10n.measurementUnitCM})',
        onChange: (value) {
          cubit.onChangeHeight(double.tryParse(value));
        },
        initalValue:
            context
                .read<FitnessProfileCubit>()
                .state
                .userPhysicalDataUpsert
                .height
                .tryToString(),
        errorMessage: isHeightError ? '' : null,
      ),
      gap,
    ];
    return BlocListener<FitnessProfileCubit, FitnessProfileState>(
      listenWhen:
          (previous, current) =>
              previous.updateUserPhysicalDataStatus !=
              current.updateUserPhysicalDataStatus,
      listener: (context, state) {
        if (state.updateUserPhysicalDataStatus.isConnectionError) {
          final content = context.l10n.networkError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.updateUserPhysicalDataStatus.isConnectionError) {
          final content = context.l10n.internetConnectionError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.updateUserPhysicalDataStatus.isSuccess) {
          Navigator.of(context).pop();
          context.read<FitnessProfileCubit>().readFitnessData();
        }
      },
      child: AppDialog(
        title: context.l10n.fitnessProfileNewMeasurementLabel,
        dialogHint: HintButton(child: AddMesurementDialogHint()),

        contents: [
          if (isRequiredFields) ...demographicFields,

          NumberTextField(
            label:
                '${context.l10n.fitnessProfileNewMeasurementWeight} (${context.l10n.measurementUnitKG})',
            onChange: (value) {
              cubit.onChangeWeight(double.tryParse(value));
            },
            initalValue:
                context
                    .read<FitnessProfileCubit>()
                    .state
                    .userPhysicalDataUpsert
                    .weight
                    .tryToString(),
            errorMessage: isWeightError ? '' : null,
          ),
          gap,
          NumberTextField(
            label:
                '${context.l10n.fitnessProfileNewMeasurementDialogWaistCircumference} (${context.l10n.measurementUnitCM})',
            onChange: (value) {
              cubit.onChangeWaistCircumference(double.tryParse(value));
            },
            initalValue:
                context
                    .read<FitnessProfileCubit>()
                    .state
                    .userPhysicalDataUpsert
                    .waistCircumference
                    .tryToString(),
            suffix: HintButton(child: WaistCircumferenceFieldHint()),
          ),
          gap,
          if (!isRequiredFields) ...[...bodyShapeFields, ...demographicFields],
        ],

        submitButton: BlocBuilder<FitnessProfileCubit, FitnessProfileState>(
          builder: (context, state) {
            final label = context.l10n.update;
            return state.updateUserPhysicalDataStatus.isLoading
                ? AppTextButton.loading(label: label)
                : AppTextButton(
                  label: label,
                  onTap: () {
                    if (isRequiredFields) {
                      validate();
                    }
                    if (isValidForm) {
                      context
                          .read<FitnessProfileCubit>()
                          .updateUserPhysicalData();
                    }
                  },
                );
          },
        ),
      ),
    );
  }
}

class HintButton extends StatelessWidget {
  const HintButton({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return child;
          },
        );
      },
      icon: Icon(Icons.info),
    );
  }
}

extension on double? {
  String tryToString() {
    return this == null ? '' : this.toString();
  }
}
