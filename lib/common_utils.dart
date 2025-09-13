import 'dart:math';

class Utils {
  static String generateUniQueString(int length) {
    const chars = "abcdefghijklmnopqrstuvwxyz0123456789";
    Random random = Random();

    return List.generate(
      length,
      (index) => chars[random.nextInt(chars.length)],
    ).join();
  }
}
