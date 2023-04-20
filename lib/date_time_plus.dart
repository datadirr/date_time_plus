import 'date_time_plus_platform_interface.dart';

class DateTimePlus {
  Future<String?> getPlatformVersion() {
    return DateTimePlusPlatform.instance.getPlatformVersion();
  }
}
