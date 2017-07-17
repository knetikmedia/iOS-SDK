#
#  Be sure to run `pod spec lint knetik-jsapi.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "knetik_jsapi"
  s.version      = "3.2.1"
  s.summary      = "knetik Jsapi"
  s.description  = <<-DESC
                   Connecting to JSAPI using IOS Swift
                   DESC
  s.homepage     = "https://github.com/knetikmedia/iOS-SDK"
  s.license      = "MIT"
  s.license      = { :type => "BSD", :file => "LICENSE" }
  s.author             = { "Knetik" => "dev@knetik.com" }
  s.platform     = :ios, "10.0"
  s.source       = { :git => "https://github.com/knetikmedia/iOS-SDK.git", :tag => '3.2.1' }

  s.source_files  = "JsapiApi/**/*.swift"
  s.requires_arc = true
end
