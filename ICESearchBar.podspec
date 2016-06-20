
Pod::Spec.new do |s|
s.name             = 'ICESearchBar'
s.version          = '0.1.0'
s.summary          = '自定义searchBar'
s.description      = <<-DESC
TODO: This is a simple custom SearchBar.
DESC

s.homepage         = 'https://github.com/My-Pod/ICESearchBar'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'gumengxiao' => 'rare_ice@163.com' }
s.source           = { :git => 'https://github.com/My-Pod/ICESearchBar.git', :tag => s.version.to_s }

s.ios.deployment_target = '7.0'

s.source_files = 'ICESearchBar/Classes/**/*'
s.resource_bundles = {
   'ICECustomSearchBar' => ['ICESearchBar/Assets/*.png']
}

end
