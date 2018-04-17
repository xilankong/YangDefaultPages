Pod::Spec.new do |s|
  s.name             = 'YangDefaultPages'
  s.version          = '1.2.0'
  s.summary          = 'A short description of YangDefaultPages.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/xilankong/YangDefaultPages'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'xilankong' => 'xilankong@126.com' }
  s.source           = { :git => 'https://github.com/xilankong/YangDefaultPages.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'YangDefaultPages/Classes/**/*'
  s.resource = 'YangDefaultPages/Assets/**/*'

  s.dependency 'FLAnimatedImage'
end
