import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'date_time_plus_platform_interface.dart';

/// An implementation of [DateTimePlusPlatform] that uses method channels.
class MethodChannelDateTimePlus extends DateTimePlusPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('date_time_plus');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
