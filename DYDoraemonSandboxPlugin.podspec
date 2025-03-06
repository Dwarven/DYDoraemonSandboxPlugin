Pod::Spec.new do |s|

  s.name             = 'DYDoraemonSandboxPlugin'
  s.version          = '0.0.1'
  s.summary          = 'sandbox plugin for DoraemonKit with custom path'
  s.homepage         = 'https://github.com/Dwarven/DYDoraemonSandboxPlugin'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Dwarven' => 'prison.yang@gmail.com' }
  s.platform         = :ios, '9.0'
  s.source           = { :git => 'https://github.com/Dwarven/DYDoraemonSandboxPlugin.git', :tag => s.version }
  s.framework        = 'UIKit'
  s.source_files     = 'DYDoraemonSandboxPlugin/*.{h,m}'
  s.module_name      = 'DYDoraemonSandboxPlugin'
  s.dependency 'DoraemonKit/Core', '~> 3.0'

end