# Uncomment this line to define a global platform for your project
 platform :ios, '10.0'
# Uncomment this line if you're using Swift
 use_frameworks!

target 'MoolProject' do

pod 'XLPagerTabStrip', '~> 6.0'
pod 'Font-Awesome-Swift', '~> 1.5.2'

end

target 'MoolProjectTests' do

end

target 'MoolProjectUITests' do

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
