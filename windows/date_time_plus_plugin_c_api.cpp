#include "include/date_time_plus/date_time_plus_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "date_time_plus_plugin.h"

void DateTimePlusPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  date_time_plus::DateTimePlusPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
