class Validators {
  static bool isValidEmail(String email) {
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return regex.hasMatch(email);
  }

  static bool isNotEmpty(String? value) {
    return value != null && value.trim().isNotEmpty;
  }

  static bool hasValidLength(String value, {int min = 1, int max = 100}) {
    final length = value.trim().length;
    return length >= min && length <= max;
  }

  static String sanitize(String input) {
    return input
        .replaceAll('<', '&lt;')
        .replaceAll('>', '&gt;')
        .replaceAll('"', '&quot;')
        .replaceAll("'", '&#39;')
        .trim();
  }

  static String? validateText(
    String? value, {
    String fieldName = 'Field',
    int minLength = 1,
    int maxLength = 100,
  }) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName tidak boleh kosong';
    }
    if (!hasValidLength(value, min: minLength, max: maxLength)) {
      return '$fieldName harus antara $minLength-$maxLength karakter';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email tidak boleh kosong';
    }
    if (!isValidEmail(value.trim())) {
      return 'Format email tidak valid';
    }
    return null;
  }

  // Latihan 3: Tambahan Validasi Lebih Ketat
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty)
      return 'Nomor telepon tidak boleh kosong';
    final regex = RegExp(r'^[0-9]{10,13}$');
    if (!regex.hasMatch(value))
      return 'Nomor telepon tidak valid (10-13 digit angka)';
    return null;
  }

  static String? validateUrl(String? value) {
    if (value == null || value.isEmpty) return 'URL tidak boleh kosong';
    final regex = RegExp(r'^(http|https)://');
    if (!regex.hasMatch(value))
      return 'URL harus dimulai dengan http:// atau https://';
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password tidak boleh kosong';
    final regex = RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$');
    if (!regex.hasMatch(value))
      return 'Password min 8 karakter, ada huruf kapital, angka, & simbol';
    return null;
  }
}
