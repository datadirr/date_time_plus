#ifndef FLUTTER_PLUGIN_DATE_TIME_PLUS_PLUGIN_H_
#define FLUTTER_PLUGIN_DATE_TIME_PLUS_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace date_time_plus {

class DateTimePlusPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  DateTimePlusPlugin();

  virtual ~DateTimePlusPlugin();

  // Disallow copy and assign.
  DateTimePlusPlugin(const DateTimePlusPlugin&) = delete;
  DateTimePlusPlugin& operator=(const DateTimePlusPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace date_time_plus

#endif  // FLUTTER_PLUGIN_DATE_TIME_PLUS_PLUGIN_H_
