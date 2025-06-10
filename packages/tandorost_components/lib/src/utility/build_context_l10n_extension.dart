import 'package:flutter/widgets.dart';
import 'package:tandorost_components/src/l10n/component_library_localizations.dart';

extension BuildContextL10nExtension on BuildContext{
  ComponentLibraryLocalizations get l10n => ComponentLibraryLocalizations.of(this);

}