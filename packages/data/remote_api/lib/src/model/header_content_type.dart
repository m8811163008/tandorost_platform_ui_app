enum ContentType {
  applicationXWwwFormUrlencoded('application/x-www-form-urlencoded'),
  multipartFormData('multipart/form-data'),
  applicationJson('application/json');

  final String value;

  const ContentType(this.value);
}
