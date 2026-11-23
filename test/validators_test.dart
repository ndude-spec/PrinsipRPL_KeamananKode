import 'package:flutter_test/flutter_test.dart';
import 'package:rpl_keamanan/utils/validators.dart'; // Sesuaikan "rpl_keamanan" dengan nama project Anda di pubspec.yaml

void main() {
  group('Validators Test', () {
    test('isValidEmail mengembalikan true untuk email valid', () {
      expect(Validators.isValidEmail('test@example.com'), isTrue);
    });

    test('isValidEmail mengembalikan false untuk email tidak valid', () {
      expect(Validators.isValidEmail('testexample.com'), isFalse);
    });

    test('sanitize mengganti karakter berbahaya menjadi entitas HTML', () {
      final input = '<script>alert("hacked")</script>';
      final sanitized = Validators.sanitize(input);
      expect(
        sanitized,
        '&lt;script&gt;alert(&quot;hacked&quot;)&lt;/script&gt;',
      );
    });

    test('validateText dengan input dan panjang yang sesuai', () {
      final result = Validators.validateText(
        'Valid Text',
        minLength: 3,
        maxLength: 20,
      );
      expect(result, isNull); // isNull berarti tidak ada pesan error (valid)
    });

    test('validateText mengembalikan pesan error jika terlalu pendek', () {
      final result = Validators.validateText('Hi', minLength: 5, maxLength: 20);
      expect(result, isNotNull);
    });
  });
}
