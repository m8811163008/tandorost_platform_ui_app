import 'dart:math';
import 'dart:typed_data';

import 'package:domain_model/domain_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:profile_app/src/bodybuilding_coach_program.dart';
import 'package:profile_app/src/cubit/profile_cubit.dart';
import 'package:profile_app/src/edit_dialog.dart';
import 'package:profile_app/src/edit_name_button.dart';
import 'package:tandorost_components/tandorost_components.dart';
import 'package:pro_image_editor/pro_image_editor.dart';

class BodyBuildingCoachCard extends StatelessWidget {
  const BodyBuildingCoachCard({super.key});

  @override
  Widget build(BuildContext context) {
    final gap = SizedBox(height: context.sizeExtenstion.medium);
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Text(
            context.l10n.coachSettingLabel,
            style: context.textTheme.headlineMedium,
          ),
          gap,
          SettingRadioButton(
            label: context.l10n.coachSettingActivateToggleLabel,
            value: context.select(
              (ProfileCubit cubit) =>
                  cubit.state.userProfile?.isBodybuildingCoach ?? false,
            ),
            onChanged: context
                .read<ProfileCubit>()
                .onChangeBodybuildingCoachRole,
          ),
          if (context.select(
            (ProfileCubit cubit) =>
                cubit.state.userProfile?.isBodybuildingCoach ?? false,
          )) ...[
            gap,
            SettingRadioButton(
              label: context.l10n.coachSettingAvailabilityToggleLabel,
              value: context.select(
                (ProfileCubit cubit) =>
                    cubit.state.coachProfile?.isActive ?? false,
              ),
              onChanged: context.read<ProfileCubit>().onChangeIsCoachAvailable,
            ),
            gap,
            UserInfoRichText(
              label: context.l10n.coachSettingBiographyLabel,
              value: context.select(
                (ProfileCubit cubit) =>
                    cubit.state.coachProfile?.biography ?? '',
              ),
              editValueButton: EditDialog(
                dialog: EditUserInfoDialog(
                  dialogTitle: context.l10n.coachSettingBiographyDialogTitle,
                  textFieldlabel:
                      context.l10n.coachSettingBiographyDialogTextFieldlabel,
                  hint: context.l10n.coachSettingBiographyDialogTextFieldHint,
                  maxLines: 4,
                  maxLength: 700,
                  initialValue: context.select(
                    (ProfileCubit cubit) =>
                        cubit.state.coachProfile?.biography ?? '',
                  ),
                  onChnaged: context
                      .read<ProfileCubit>()
                      .onChangeCoachBiography,
                  onSubmit: context.read<ProfileCubit>().updateCoachBiography,
                ),
              ),
            ),
            gap,
            Text(
              context.l10n.profileCertificatesLabel,
              style: context.textTheme.titleSmall,
            ),
            gap,
            CoachImagesSection(gallaryTag: GallaryTag.certificate),
            gap,
            Text(
              context.l10n.profileAchievementsLabel,
              style: context.textTheme.titleSmall,
            ),
            gap,
            CoachImagesSection(gallaryTag: GallaryTag.achievement),
            gap,
            Text(
              context.l10n.profileCoachProfileCoachProgramCardTitle,
              style: context.textTheme.titleSmall,
            ),
            gap,
            BodyBuldingCoachPrograms(),
          ],
        ],
      ),
    );
  }
}

class CoachImagesSection extends StatelessWidget {
  const CoachImagesSection({super.key, required this.gallaryTag});
  final GallaryTag gallaryTag;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) =>
          previous.readUserImageGallaryStatus !=
              current.readUserImageGallaryStatus ||
          previous.filesData != current.filesData ||
          previous.archivingImagesStatus != current.archivingImagesStatus ||
          previous.archiveImagesId != current.archiveImagesId,
      builder: (context, state) {
        final filesData = state.filesData
            .where((e) => e.tag == gallaryTag)
            .toList();
        return SizedBox(
          height: MediaQuery.of(context).size.height / 3.5,
          child: ListView.separated(
            primary: false,
            scrollDirection: Axis.horizontal,
            itemCount: filesData.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return ImagePlaceholder(tag: gallaryTag);
              }
              final fileData = filesData[index - 1];
              final fileDetail = state.filesDetail.singleWhere(
                (element) => element.fileName == fileData.fileName,
              );
              return ImagePlaceholder(
                bytes: fileDetail.bytes,
                imageId: fileData.id,
                description: fileData.description,
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 16);
            },
          ),
        );
      },
    );
  }
}

class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({
    super.key,
    this.bytes,
    this.imageId,
    this.tag,
    this.description,
  }) : assert(bytes != null || tag != null);

  final Uint8List? bytes;
  final String? imageId;
  final GallaryTag? tag;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: context.sizeExtenstion.medium),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 3.5,
              width: MediaQuery.of(context).size.height / 6 * 1.6,
              child: AppRoundedRectangleBorder(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    context.sizeExtenstion.small,
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      if (bytes != null) ...[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ImageGestureDetector(
                              imageId: imageId!,
                              child: Center(child: Image.memory(bytes!)),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: context.sizeExtenstion.small,
                              ),
                              child: Text(
                                description ?? '',
                                style: context.textTheme.labelSmall,
                                overflow: TextOverflow.clip,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ] else ...[
                        AddImageButton(tag: tag!),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageGestureDetector extends StatelessWidget {
  const ImageGestureDetector({
    super.key,
    required this.child,
    required this.imageId,
  });
  final Widget child;
  final String imageId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) =>
          previous.archiveImagesId != current.archiveImagesId,
      builder: (context, state) {
        final isShowRadio = state.archiveImagesId.isNotEmpty;
        final isSelected = state.archiveImagesId.contains(imageId);

        return GestureDetector(
          onTap: () {
            final isSelectedImageEmpty = context
                .read<ProfileCubit>()
                .state
                .archiveImagesId
                .isEmpty;
            if (isSelectedImageEmpty) {
              showImageFullscreenRoute(context);
            } else {
              onInsertOrDeleteImage(context);
            }
          },
          onLongPress: () {
            onInsertOrDeleteImage(context);
          },
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              if (isShowRadio)
                Checkbox(
                  value: isSelected,
                  onChanged: (_) {
                    onInsertOrDeleteImage(context);
                  },
                ),
              child,
            ],
          ),
        );
      },
    );
  }

  void showImageFullscreenRoute(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(),
          body: Center(child: child),
        ),
      ),
    );
  }

  void onInsertOrDeleteImage(BuildContext context) {
    context.read<ProfileCubit>().insertOrDeleteFromArchiveImageList(imageId);
  }
}

class AddImageButton extends StatelessWidget {
  const AddImageButton({super.key, required this.tag});

  final GallaryTag tag;

  @override
  Widget build(BuildContext context) {
    // final label = Text(context.l10n.fitnessProfileAddImageButton);
    onPressed() {
      onPress(context);
    }

    return IconButton.filledTonal(
      onPressed: onPressed,
      // label: label,
      icon: Icon(Icons.add_a_photo),
    );
  }

  Future<FileDetail?> onPickImage(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg', 'jpeg'],
      withData: true,
    );
    if (result == null || result.files.isEmpty) return null;

    final file = result.files.single;
    if (file.bytes == null) return null;
    final randomString = Random().nextInt(99999) + 10000;
    final fileName = '${tag.name}_${randomString}_${file.name}';
    return FileDetail(fileName: fileName, bytes: file.bytes!);
  }

  void onPress(BuildContext context) async {
    final naviagtor = Navigator.of(context);
    final result = await onPickImage(context);

    if (result == null) return;

    await naviagtor.push(
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: context.read<ProfileCubit>(),
          child: AppScaffold(
            // appBar: AppBar(title: Text('Edit Image')),
            body: EditImageScreen(pickedFile: result, tag: tag),
          ),
        ),
        fullscreenDialog: true,
      ),
    );
  }
}

class EditImageScreen extends StatefulWidget {
  const EditImageScreen({
    super.key,
    required this.pickedFile,
    required this.tag,
  });
  final FileDetail pickedFile;
  final GallaryTag tag;

  @override
  State<EditImageScreen> createState() => _EditImageScreenState();
}

class _EditImageScreenState extends State<EditImageScreen> {
  late final TextEditingController _textEditingController;
  @override
  void initState() {
    _textEditingController = TextEditingController(text: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listenWhen: (previous, current) =>
          previous.addUserImageStatus != current.addUserImageStatus,
      listener: (context, state) {
        if (state.addUserImageStatus.isConnectionError) {
          final content = context.l10n.networkError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        } else if (state.addUserImageStatus.isConnectionError) {
          final content = context.l10n.internetConnectionError;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(content)));
        }
      },
      child: Center(
        child: SizedBox.fromSize(
          size: MediaQuery.of(context).size,
          child: ImageEditor(
            bytes: widget.pickedFile.bytes,
            onComplete: (editedBytes) async {
              // Todo add description
              await showDialog(
                context: context,
                builder: (context) {
                  return SimpleDialog(
                    title: Text(
                      context.l10n.profileImageCoachDescriptionDialogTitle,
                    ),
                    titlePadding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
                    contentPadding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 16.0),
                    children: [
                      TextField(
                        controller: _textEditingController,
                        maxLines: 2,
                        decoration: InputDecoration(
                          labelText: context
                              .l10n
                              .profileImageCoachDescriptionDialogTextFieldLabel,
                          hintText: context
                              .l10n
                              .profileImageCoachDescriptionDialogTextFieldHint,
                        ),
                      ),
                      SimpleDialogOption(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('done'),
                      ),
                    ],
                  );
                },
              );
              if (context.mounted) {
                context.read<ProfileCubit>().onEditImageComplete(
                  editedBytes,
                  widget.pickedFile.fileName,
                  widget.tag,
                  _textEditingController.text,
                  widget.pickedFile.uploadDate,
                );
                Navigator.of(context).pop();
              }
            },
          ),
        ),
      ),
    );
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
      configs: ProImageEditorConfigs(i18n: _buildI18n(context)),

      callbacks: ProImageEditorCallbacks(
        onImageEditingComplete: (Uint8List bytes) async {
          onComplete?.call(bytes);
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

  I18n _buildI18n(BuildContext context) {
    return I18n(
      layerInteraction: I18nLayerInteraction(
        remove: context.l10n.photoEditorRemove,
        edit: context.l10n.photoEditorEdit,
        rotateScale: context.l10n.photoEditorRotateScale,
      ),
      paintEditor: I18nPaintEditor(
        moveAndZoom: context.l10n.photoEditorMoveAndZoom,
        bottomNavigationBarText:
            context.l10n.photoEditorBottomNavigationBarText,
        freestyle: context.l10n.photoEditorFreestyle,
        arrow: context.l10n.photoEditorArrow,
        line: context.l10n.photoEditorLine,
        rectangle: context.l10n.photoEditorRectangle,
        circle: context.l10n.photoEditorCircle,
        dashLine: context.l10n.photoEditorDashLine,
        blur: context.l10n.photoEditorBlur,
        pixelate: context.l10n.photoEditorPixelate,
        lineWidth: context.l10n.photoEditorLineWidth,
        eraser: context.l10n.photoEditorEraser,
        toggleFill: context.l10n.photoEditorToggleFill,
        changeOpacity: context.l10n.photoEditorChangeOpacity,
        undo: context.l10n.photoEditorUndo,
        redo: context.l10n.photoEditorRedo,
        done: context.l10n.photoEditorDone,
        back: context.l10n.photoEditorBack,
        smallScreenMoreTooltip: context.l10n.photoEditorSmallScreenMoreTooltip,
      ),
      textEditor: I18nTextEditor(
        inputHintText: context.l10n.photoEditorInputHintText,
        bottomNavigationBarText:
            context.l10n.photoEditorBottomNavigationBarTextText,
        back: context.l10n.photoEditorBackText,
        done: context.l10n.photoEditorDoneText,
        textAlign: context.l10n.photoEditorTextAlign,
        fontScale: context.l10n.photoEditorFontScale,
        backgroundMode: context.l10n.photoEditorBackgroundMode,
        smallScreenMoreTooltip:
            context.l10n.photoEditorSmallScreenMoreTooltipText,
      ),
      cropRotateEditor: I18nCropRotateEditor(
        bottomNavigationBarText:
            context.l10n.photoEditorBottomNavigationBarTextCropRotate,
        rotate: context.l10n.photoEditorRotate,
        flip: context.l10n.photoEditorFlip,
        ratio: context.l10n.photoEditorRatio,
        back: context.l10n.photoEditorBack,
        done: context.l10n.photoEditorDone,
        cancel: context.l10n.photoEditorCancel,
        undo: context.l10n.photoEditorUndo,
        redo: context.l10n.photoEditorRedo,
        smallScreenMoreTooltip: context.l10n.photoEditorSmallScreenMoreTooltip,
        reset: context.l10n.photoEditorReset,
      ),
      filterEditor: I18nFilterEditor(
        bottomNavigationBarText:
            context.l10n.photoEditorBottomNavigationBarTextFilter,
        back: context.l10n.photoEditorBack,
        done: context.l10n.photoEditorDone,
      ),
      tuneEditor: I18nTuneEditor(
        bottomNavigationBarText:
            context.l10n.photoEditorBottomNavigationBarTextTune,
        back: context.l10n.photoEditorBack,
        done: context.l10n.photoEditorDone,
        brightness: context.l10n.photoEditorBrightness,
        contrast: context.l10n.photoEditorContrast,
        saturation: context.l10n.photoEditorSaturation,
        exposure: context.l10n.photoEditorExposure,
        hue: context.l10n.photoEditorHue,
        temperature: context.l10n.photoEditorTemperature,
        sharpness: context.l10n.photoEditorSharpness,
        fade: context.l10n.photoEditorFade,
        luminance: context.l10n.photoEditorLuminance,
        undo: context.l10n.photoEditorUndoText,
        redo: context.l10n.photoEditorRedoText,
      ),
      blurEditor: I18nBlurEditor(
        bottomNavigationBarText:
            context.l10n.photoEditorBottomNavigationBarTextBlur,
        back: context.l10n.photoEditorBack,
        done: context.l10n.photoEditorDone,
      ),
      stickerEditor: I18nStickerEditor(
        bottomNavigationBarText:
            context.l10n.photoEditorBottomNavigationBarTextSticker,
      ),
      various: I18nVarious(
        loadingDialogMsg: context.l10n.photoEditorLoadingDialogMsg,
        closeEditorWarningTitle:
            context.l10n.photoEditorCloseEditorWarningTitle,
        closeEditorWarningMessage:
            context.l10n.photoEditorCloseEditorWarningMessage,
        closeEditorWarningConfirmBtn:
            context.l10n.photoEditorCloseEditorWarningConfirmBtn,
        closeEditorWarningCancelBtn:
            context.l10n.photoEditorCloseEditorWarningCancelBtn,
      ),
      importStateHistoryMsg: context.l10n.photoEditorImportStateHistoryMsg,
      cancel: context.l10n.photoEditorCancel,
      undo: context.l10n.photoEditorUndo,
      redo: context.l10n.photoEditorRedo,
      done: context.l10n.photoEditorDone,
      remove: context.l10n.photoEditorRemove,
      doneLoadingMsg: context.l10n.photoEditorDoneLoadingMsg,
    );
  }
}
