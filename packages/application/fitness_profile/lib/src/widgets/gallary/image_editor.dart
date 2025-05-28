import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pro_image_editor/pro_image_editor.dart';
import 'package:tandorost_components/tandorost_components.dart';

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