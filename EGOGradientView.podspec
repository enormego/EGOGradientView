Pod::Spec.new do |s|
  s.name         = "EGOGradientView"
  s.version      = "2.0.0"
  s.summary      = "CAGradientLayer backed UIView, with pass-through properties"
  s.homepage     = "https://github.com/enormego/EGOGradientView"
  s.license      = "MIT"
  s.author       = "Shaun Harrison"
  s.social_media_url = "http://twitter.com/shnhrrsn"
  s.source       = { :git => "https://github.com/enormego/EGOGradientView.git", :tag => s.version.to_s }
  s.requires_arc = true
  s.source_files = "Sources/*.{h,m}"
  s.ios.deployment_target  = "7.0"
  s.tvos.deployment_target = "9.0"
end
