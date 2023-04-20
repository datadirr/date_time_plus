import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'date_time_plus_method_channel.dart';

abstract class DateTimePlusPlatform extends PlatformInterface {
  /// Constructs a DateTimePlusPlatform.
  DateTimePlusPlatform() : super(token: _token);

  static final Object _token = Object();

  static DateTimePlusPlatform _instance = MethodChannelDateTimePlus();

  /// The default instance of [DateTimePlusPlatform] to use.
  ///
  /// Defaults to [MethodChannelDateTimePlus].
  static DateTimePlusPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DateTimePlusPlatform] when
  /// they register themselves.
  static set instance(DateTimePlusPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
