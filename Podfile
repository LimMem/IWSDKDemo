# Uncomment the next line to define a global platform for your project
 platform :ios, '10.0'

source 'https://github.com/CocoaPods/Specs.git'
source 'http://gitlab.iwhalecloud.com/Whale-iOS/specs.git'

inhibit_all_warnings!
target 'iOS SDK Demo' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  pod 'LookinServer', :configurations => ['Debug']
	pod "IWShareSDK"
  # Pods for iOS SDK Demo

  target 'iOS SDK DemoTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'iOS SDK DemoUITests' do
    # Pods for testing
  end

end
