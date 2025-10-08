class Validation{
  static String? validatePassword(
    String? value, {
    int minLength = 8,
    bool requireUpper = true,
    bool requireDigit = true,
    bool requireSpecial = true,
  }) {
    if (value == null || value.isEmpty) {
      return 'كلمة المرور مطلوبة';
    }
    if (value.length < minLength) {
      return 'كلمة المرور يجب أن تكون على الأقل $minLength أحرف';
    }
    if (requireUpper && !RegExp(r'[A-Z]').hasMatch(value)) {
      return 'يجب أن تحتوي كلمة المرور على حرف كبير واحد على الأقل';
    }
    if (requireDigit && !RegExp(r'\d').hasMatch(value)) {
      return 'يجب أن تحتوي كلمة المرور على رقم واحد على الأقل';
    }
    return null;
  }
  static   String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'البريد الإلكتروني مطلوب';
    }
    final v = value.trim();
    final emailRegExp = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@"
      r"[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?"
      r"(?:\.[a-zA-Z]{2,})+$",
    );
    if (!emailRegExp.hasMatch(v)) {
      return 'أدخل بريدًا إلكترونيًا صحيحًا';
    }
    return null;
  }
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'الاسم مطلوب';
    }
    final v = value.trim();
    if (v.length < 2) {
      return 'الاسم لازم يكون على الأقل حرفين';
    }
    final nameRegExp = RegExp(r"^[\p{L} .'-]+$", unicode: true);
    if (!nameRegExp.hasMatch(v)) {
      return 'الاسم يجب أن يحتوي حروفاً ومسافات فقط';
    }
    return null;
  }
}

