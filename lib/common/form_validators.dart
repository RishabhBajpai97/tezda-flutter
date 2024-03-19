String? emailValidator(String? value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern as String);
  if (value!.contains('@')) {
    if (!regex.hasMatch(value.trim()))
      return '*Enter a valid email';
    else
      return null;
  } else {
    if (value.trim().isEmpty)
      return '*Required';
    else
      return null;
  }
}

String? passwordValidator(String? value) {
  return value!.isEmpty
      ? "*Required"
      : value.length < 6
          ? "Password must be atleast of 6 characters"
          : null;
}
String? requiredValidator(String? value) {
  return value!.isEmpty ? "*Required" : null;
}
