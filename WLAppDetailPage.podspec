Pod::Spec.new do |s|
  s.name         = "WLAppDetailPage"
  s.version      = "1.0.0"
  s.summary      = "a light weight and easy to use app detail page."

  s.homepage     = "https://github.com/expll/WLAppDetailPage"
  s.license      = 'MIT'
  s.author       = { "expll" => "wang.lei732@gmail.com" }
  s.platform     = :ios, "7.0"
  s.ios.deployment_target = "7.0"
  s.source       = { :git => "git@github.com:expll/WLAppDetailPage.git", :tag => s.version}
  s.source_files  = '*.{h,m,xib}'
  s.requires_arc = true
end
