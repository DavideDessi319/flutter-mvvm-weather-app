import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app_alpian/utils/extensions/date_utils_extension.dart';

void main() {
  test(
      'When timestamp is passed, return the formatted string (EEEE, MMM d, hh:mm a)',
      () {
    expect(DateUtilsExtension.timestampToFormattedString(1652860771),
        'Wednesday, May 18, 09:59 AM');
  });

  test('When timestamp is passed, return the day of the week', () {
    expect(DateUtilsExtension.timestampToDayOfWeek(1652860771), 'Wednesday');
  });
}
