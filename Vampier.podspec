Pod::Spec.new do |spec|

    spec.name                   = 'Vampier'
    spec.version                = '1.0.3'
    spec.summary                = 'Vampier'
    spec.description            = 'VIPER framework'
    spec.homepage               = 'https://github.com/ddvhn/vampier.git'
    spec.license                = { :type => 'MIT', :file => 'LICENSE' }
    spec.author                 = { 'Den Dovhan' => 'den.dovgan@gmail.com' }
    spec.source                 = { :git => 'https://github.com/ddvhn/vampier.git', :tag => spec.version.to_s }
    spec.ios.deployment_target  = '12.0'
    spec.default_subspecs       = 'Core'
    spec.framework              = 'UIKit'
    spec.swift_version          = '5.0'

    spec.subspec 'Core' do |core|
        core.source_files = 'Vampier/Vampier/Classes/**/*.{swift}'
    end

end
