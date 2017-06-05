platform :ios, '8.0'


target 'Localz' do
    # Comment this line if you're not using Swift and don't want to use dynamic frameworks
    use_frameworks!
    pod 'SASlideMenu'
    pod 'EDStarRating'
    pod 'LTNavigationBar'
    pod 'Fabric'
    pod 'Crashlytics'
    pod 'TTRangeSlider'
    pod 'THCalendarDatePicker'
    
    # Pods for SaveUP
    
    target 'LocalzTests' do
        inherit! :search_paths
        # Pods for testing
    end
    
    target 'LocalzUITests' do
        inherit! :search_paths
        # Pods for testing
    end
    
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end











