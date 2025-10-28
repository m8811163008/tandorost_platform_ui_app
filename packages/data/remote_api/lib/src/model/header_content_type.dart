enum ContentType {
  applicationXWwwFormUrlencoded('application/x-www-form-urlencoded'),
  multipartFormData('multipart/form-data'),
  applicationJson('application/json'),
  textPlain('text/plain');

  final String value;

  const ContentType(this.value);
}
