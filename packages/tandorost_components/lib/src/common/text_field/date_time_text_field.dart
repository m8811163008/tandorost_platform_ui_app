import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:tandorost_components/tandorost_components.dart';

class DateTextField extends StatelessWidget {
  const DateTextField({super.key, required this.upsertDate, this.onPickedDate});
  final DateTime upsertDate;
  final ValueSetter<DateTime?>? onPickedDate;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(
        text: upsertDate.formattedDateTime(context),
      ),
      decoration: InputDecoration(label: Text(context.l10n.upsertDate)),
      readOnly: true,
      onTap: () async {
        final locale = Localizations.localeOf(context);
        late final DateTime? pickedDate;
        if (locale.languageCode == Language.persian.code) {
          Jalali? picked = await showPersianDatePicker(
            context: context,
            initialDate: Jalali.fromDateTime(upsertDate),
            firstDate: Jalali.fromDateTime(
              upsertDate.subtract(Duration(days: 5)),
            ),
            lastDate: Jalali.fromDateTime(upsertDate.add(Duration(days: 5))),
            initialEntryMode: PersianDatePickerEntryMode.calendar,
            initialDatePickerMode: PersianDatePickerMode.day,
            builder: (context, child) {
              return SingleChildScrollView(child: child!);
            },
          );
          pickedDate = picked?.toDateTime();
        } else {
          pickedDate = await showDatePicker(
            context: context,
            initialDate: upsertDate,
            firstDate: upsertDate.subtract(Duration(days: 5)),
            lastDate: upsertDate.add(Duration(days: 5)),
            initialEntryMode: DatePickerEntryMode.calendar,
            initialDatePickerMode: DatePickerMode.day,
            builder: (context, child) {
              return SingleChildScrollView(child: child!);
            },
          );
        }
        if (!context.mounted) {
          return;
        }
        final pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(upsertDate),
          initialEntryMode: TimePickerEntryMode.input,
        );

        final updatedDateTime = pickedDate?.copyWith(
          hour: pickedTime?.hour ?? upsertDate.hour,
          minute: pickedTime?.minute ?? upsertDate.minute,
          second: upsertDate.second,
        );
        onPickedDate?.call(updatedDateTime);
      },
    );
  }
}
