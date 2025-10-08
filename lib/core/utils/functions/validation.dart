class Validation{
  
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }
    final v = value.trim();
    if (v.length < 2) {
      return 'name must be at least two letters.';
    }
    final nameRegExp = RegExp(r"^[\p{L} .'-]+$", unicode: true);
    if (!nameRegExp.hasMatch(v)) {
      return 'name must contain only letters and spaces';
    }
    return null;
  }
  static  String? validateEmail(String? value) {
            if (value == null || value.trim().isEmpty) {
              return 'Email is required';
            }
            return null;
          }

static  String? validatePassword(String? value) {
            if (value == null || value.trim().isEmpty) {
              return 'Password is required';
            }
            return null;
          }
}

