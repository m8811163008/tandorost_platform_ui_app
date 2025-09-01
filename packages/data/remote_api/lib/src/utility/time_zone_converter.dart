DateTime dateTimeUtcFromJson(String date) => DateTime.parse(date).toUtc();
DateTime? dateTimeUtcFromJsonNullaware(String date) =>
    DateTime.tryParse(date)?.toUtc();
String dateTimeUtcToJson(DateTime date) => date.toUtc().toIso8601String();
String? dateTimeUtcToJsonNullaware(DateTime? date) =>
    date?.toUtc().toIso8601String();
