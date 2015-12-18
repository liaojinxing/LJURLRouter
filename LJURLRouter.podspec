#
#  Be sure to run `pod spec lint LJAutoScrollView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "LJURLRouter"
  s.version      = "1.0.3"
  s.summary      = "URL Router for any object in iOS"

  s.description  = <<-DESC
                   LJURLRouter offers url mapping for any object. After url formats and the matching class are registed, you can get object instance which matches the url, parameters will be parsed automatically. UIViewController category is also provided for convienient use.

                   DESC

  s.homepage     = "https://github.com/liaojinxing/LJURLRouter"

   s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Jinxing Liao" => "jinxingliao@gmail.com" }
   s.platform     = :ios, "6.0"
  s.source       = { :git => "https://github.com/liaojinxing/LJURLRouter.git", :tag => "1.0.3" }
  s.source_files  = "LJURLRouter/**/*.{h,m}"
   s.framework  = "UIKit"
   s.requires_arc = true
end
