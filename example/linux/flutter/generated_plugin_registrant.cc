//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <date_time_plus/date_time_plus_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) date_time_plus_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "DateTimePlusPlugin");
  date_time_plus_plugin_register_with_registrar(date_time_plus_registrar);
}
