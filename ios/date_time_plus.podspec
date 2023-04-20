#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint date_time_plus.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'date_time_plus'
  s.version          = '0.0.1'
  s.summary          = 'Pick Date and Time functions, Date and Time convert functions.'
  s.description      = <<-DESC
Pick Date and Time functions, Date and Time convert functions.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
