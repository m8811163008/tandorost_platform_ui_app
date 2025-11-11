import 'package:athletes_directory/src/cubit/athelte_directory_cubit.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class BodyBuldingCoachPrograms extends StatelessWidget {
  const BodyBuldingCoachPrograms({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AthelteDirectoryCubit, AthelteDirectoryState>(
      buildWhen: (previous, current) =>
          previous.readingCoachProgram != current.readingCoachProgram ||
          previous.updatingCoachProgram != current.updatingCoachProgram ||
          previous.deletingCoachProgram != current.deletingCoachProgram,
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.of(context).size.height / 2.5,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            primary: false,
            itemBuilder: (context, index) =>
                ProgramCard(program: state.coachPrograms[index]),
            separatorBuilder: (context, index) {
              return SizedBox(width: context.sizeExtenstion.medium);
            },
            itemCount: state.coachPrograms.length,
          ),
        );
      },
    );
  }
}

class ProgramCard extends StatelessWidget {
  const ProgramCard({super.key, required this.program});
  final CoachProgram program;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.sizeExtenstion.small),
        border: BoxBorder.all(width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.all(context.sizeExtenstion.small),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            ProgramCardRichTextRow(
              label: context.l10n.profileCoachProfileCoachProgramTitleLabel,
              value: program.title,
            ),
            ProgramCardRichTextRow(
              label:
                  context.l10n.profileCoachProfileCoachProgramDescriptionLabel,
              value: program.description,
            ),
            ProgramCardRichTextRow(
              label:
                  context.l10n.profileCoachProfileCoachProgramDurationWeekLabel,
              value: program.durationWeeks.toString(),
            ),
            ProgramCardRichTextRow(
              label: context.l10n.profileCoachProfileCoachProgramPriceLabel,
              value:
                  '${(program.price.price * 10000).toStringAsFixed(0)} ${program.currency.name}',
            ),
            ProgramCardRichTextRow(
              label: context.l10n.profileCoachProfileCoachProgramFeatureLabel,
              value: program.features
                  .map(
                    (feature) => context.l10n
                        .profileCoachProfileCoachProgramFeatureValue(
                          feature.name,
                        ),
                  )
                  .join('\n'),
            ),
            Spacer(),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return BlocProvider.value(
                          value: context.read<AthelteDirectoryCubit>(),
                          child: UpsertProgramDialog(coachProgram: program),
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return BlocProvider.value(
                          value: context.read<AthelteDirectoryCubit>(),
                          child: DeleteProgramDialog(id: program.id!),
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.delete),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProgramCardRichTextRow extends StatelessWidget {
  const ProgramCardRichTextRow({
    super.key,
    required this.label,
    this.value = '',
  });
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: '$label : ', style: context.textTheme.labelMedium),
          TextSpan(text: value, style: context.textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class AddNewProgram extends StatelessWidget {
  const AddNewProgram({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton.filledTonal(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) {
              return BlocProvider.value(
                value: context.read<AthelteDirectoryCubit>(),
                child: UpsertProgramDialog(),
              );
            },
          );
        },
        icon: Icon(Icons.add),
      ),
    );
  }
}

class UpsertProgramDialog extends StatefulWidget {
  const UpsertProgramDialog({super.key, this.coachProgram});
  final CoachProgram? coachProgram;

  @override
  State<UpsertProgramDialog> createState() => _UpsertProgramDialogState();
}

class _UpsertProgramDialogState extends State<UpsertProgramDialog> {
  late CoachProgram _coachProgram;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _coachProgram = widget.coachProgram ?? CoachProgram.empty();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final gap = SizedBox(height: context.sizeExtenstion.medium);
    return Form(
      key: _formKey,
      child: AppDialog(
        title: context.l10n.profileCoachProfileCoachProgramDialogTitle,
        contents: [
          RegullarTextField(
            label: context.l10n.profileCoachProfileCoachProgramTitleLabel,
            initalValue: _coachProgram.title,
            onChange: (value) {
              _coachProgram = _coachProgram.copyWith(title: value);
              // setState(() {});
            },
          ),
          gap,
          RegullarTextField(
            label: context.l10n.profileCoachProfileCoachProgramDescriptionLabel,
            initalValue: _coachProgram.description,
            minLines: 3,
            keyboardType: TextInputType.multiline,
            onChange: (value) {
              _coachProgram = _coachProgram.copyWith(description: value);
              // setState(() {});
            },
          ),
          gap,
          // NumberTextField(
          //   label:
          //       context.l10n.profileCoachProfileCoachProgramDurationWeekLabel,
          //   initialValue: _coachProgram.durationWeeks.toString(),
          //   onChange: (value) {
          //     if (value.isEmpty) return;
          //     _coachProgram = _coachProgram.copyWith(
          //       durationWeeks: int.parse(value),
          //     );
          //   },
          //   validator: (value) {
          //     if (value == null || value.isEmpty) {
          //       return context.l10n.emptyFormFieldValidationError;
          //     } else if (int.parse(value) < 1) {
          //       return context
          //           .l10n
          //           .profileCoachProfileCoachProgramDurationWeekFieldValidationError;
          //     }
          //     return null;
          //   },
          // ),
          DropDownField<int>(
            label:
                context.l10n.profileCoachProfileCoachProgramDurationWeekLabel,
            value: _coachProgram.durationWeeks,
            items: List.generate(25, (i) => i * 2)
                .map((e) => DropdownMenuItem(value: e, child: Text('$e')))
                .toList(),
            onChange: (value) {
              if (value != null) {
                _coachProgram = _coachProgram = _coachProgram.copyWith(
                  durationWeeks: value,
                );

                setState(() {});
              }
            },
            errorText: null,
          ),
          gap,
          DropDownField<PriceLabel>(
            label: context.l10n.profileCoachProfileCoachProgramPriceLabel,
            value: _coachProgram.price,
            items: PriceLabel.values
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(e.price.toStringAsFixed(0)),
                  ),
                )
                .toList(),
            onChange: (value) {
              if (value != null) {
                _coachProgram = _coachProgram.copyWith(price: value);

                setState(() {});
              }
            },
            errorText: null,
          ),
          gap,
          Text(context.l10n.profileCoachProfileCoachProgramFeatureLabel),
          Wrap(
            children: ProgramFeature.values
                .map(
                  (feature) => FeatureCheckBox(
                    feature: feature,
                    value: _coachProgram.features.contains(feature),
                    onTap: () {
                      if (_coachProgram.features.contains(feature)) {
                        _coachProgram.features.remove(feature);
                      } else {
                        _coachProgram.features.add(feature);
                      }
                      setState(() {});
                    },
                  ),
                )
                .toList(),
          ),
        ],
        submitButton:
            BlocConsumer<AthelteDirectoryCubit, AthelteDirectoryState>(
              listenWhen: (previous, current) =>
                  previous.updatingCoachProgram != current.updatingCoachProgram,
              listener: (context, state) {
                if (state.updatingCoachProgram.isConnectionError) {
                  final content = context.l10n.networkError;
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(content)));
                } else if (state.updatingCoachProgram.isConnectionError) {
                  final content = context.l10n.internetConnectionError;
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(content)));
                } else if (state.updatingCoachProgram.isSuccess) {
                  Navigator.of(context).pop();
                  context.read<AthelteDirectoryCubit>().readCoachPrograms();
                }
              },
              buildWhen: (previous, current) =>
                  previous.updatingCoachProgram != current.updatingCoachProgram,
              builder: (context, state) {
                final buttonLabel = widget.coachProgram == null
                    ? context
                          .l10n
                          .profileCoachProfileCoachProgramSaveButtonLabel
                    : context.l10n.update;
                return state.updatingCoachProgram.isLoading
                    ? AppTextButton.loading(label: buttonLabel)
                    : AppTextButton(
                        label: buttonLabel,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            context
                                .read<AthelteDirectoryCubit>()
                                .onChangeCoachProgram(_coachProgram);
                            context
                                .read<AthelteDirectoryCubit>()
                                .upsertCoachProgram();
                          }
                        },
                      );
              },
            ),
      ),
    );
  }
}

class FeatureCheckBox extends StatelessWidget {
  const FeatureCheckBox({
    super.key,
    required this.feature,
    required this.value,
    this.onTap,
  });
  final ProgramFeature feature;
  final bool value;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: (_) {
            onTap?.call();
          },
        ),
        Expanded(
          child: GestureDetector(
            onTap: onTap,
            child: Text(
              context.l10n.profileCoachProfileCoachProgramFeatureValue(
                feature.name,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DeleteProgramDialog extends StatelessWidget {
  const DeleteProgramDialog({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: context.l10n.profileCoachProfileCoachProgramDeleteDialogTitle,
      contents: [
        Text(context.l10n.profileCoachProfileCoachProgramDeleteDialogLabel),
      ],
      submitButton: BlocConsumer<AthelteDirectoryCubit, AthelteDirectoryState>(
        listenWhen: (previous, current) =>
            previous.deletingCoachProgram != current.deletingCoachProgram,
        listener: (context, state) {
          if (state.deletingCoachProgram.isConnectionError) {
            final content = context.l10n.networkError;
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(content)));
          } else if (state.deletingCoachProgram.isConnectionError) {
            final content = context.l10n.internetConnectionError;
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(content)));
          } else if (state.deletingCoachProgram.isSuccess) {
            Navigator.of(context).pop();
            context.read<AthelteDirectoryCubit>().readCoachPrograms();
          }
        },
        buildWhen: (previous, current) =>
            previous.deletingCoachProgram != current.deletingCoachProgram,
        builder: (context, state) {
          return state.deletingCoachProgram.isLoading
              ? AppTextButton.loading(label: context.l10n.delete)
              : AppTextButton(
                  label: context.l10n.delete,
                  onTap: () {
                    context.read<AthelteDirectoryCubit>().deleteCoachProgram(
                      id,
                    );
                  },
                );
        },
      ),
    );
  }
}
