# platform :ios, '9.0'

target 'pesb' do
  use_frameworks!

  # Pods for pesb
  pod 'Charts', '~>3.0'
end

swift_32 = []
swift4 = ['Charts']

post_install do |installer|
  installer.pods_project.targets.each do |target|
    swift_version = nil

    if swift_32.include?(target.name)
      swift_version = '3.2'
    end

    if swift4.include?(target.name)
      swift_version = '4.0'
    end

    if swift_version
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = swift_version
      end
    end
  end
end