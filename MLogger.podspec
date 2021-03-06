#
# Be sure to run `pod lib lint MLogger.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MLogger'
  s.version          = '1.1.1'
  s.summary          = 'This is MLogger a debugging log.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/MahmoudAbdelshafi/MLogger'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Mahmoud' => 'mahmoudabdelshafi4@gmail.com' }
  s.source           = { :git => 'https://github.com/MahmoudAbdelshafi/MLogger.git', :tag => s.version.to_s }
 

  s.ios.deployment_target = '10.0'
  s.swift_version = '4.0'

  s.source_files = 'Source/*.swift'
  
  # s.resource_bundles = {
  #   'MLogger' => ['MLogger/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
