platform :ios, '10.0'

inhibit_all_warnings!

target 'swift-2048' do
  use_frameworks!

  target 'swift-2048Tests' do
    inherit! :search_paths
    pod 'iOSSnapshotTestCase', '~> 6.0.0'
    pod 'SnapshotTesting', '~> 1.5'
  end

  target 'swift-2048UITests' do
    inherit! :search_paths
    pod 'iOSSnapshotTestCase', '~> 6.0.0'
    pod 'SnapshotTesting', '~> 1.5'
  end
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['ENABLE_BITCODE'] = 'NO'
      config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = "YES"
      config.build_settings.delete('CODE_SIGNING_ALLOWED')
      config.build_settings.delete('CODE_SIGNING_REQUIRED')
    end
  end
end
