import 'package:flutter_test/flutter_test.dart';
import 'package:date_time_plus/date_time_plus.dart';
import 'package:date_time_plus/date_time_plus_platform_interface.dart';
import 'package:date_time_plus/date_time_plus_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDateTimePlusPlatform
    with MockPlatformInterfaceMixin
    implements DateTimePlusPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final DateTimePlusPlatform initialPlatform = DateTimePlusPlatform.instance;

  test('$MethodChannelDateTimePlus is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDateTimePlus>());
  });

  test('getPlatformVersion', () async {
    DateTimePlus dateTimePlusPlugin = DateTimePlus();
    MockDateTimePlusPlatform fakePlatform = MockDateTimePlusPlatform();
    DateTimePlusPlatform.instance = fakePlatform;

    expect(await dateTimePlusPlugin.getPlatformVersion(), '42');
  });
}
