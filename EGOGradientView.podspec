Pod::Spec.new do |s|
	s.name              = "EGOGradientView"
	s.version           = "1.0.0"
	s.summary           = "CAGradientLayer backed UIView, with pass-through properties"

	s.homepage          = "http://developers.enormego.com"

	s.license           = "MIT"
	s.author            = "enormego"
	s.social_media_url  = "http://twitter.com/enormego"

	s.platform          = :ios
	s.ios.deployment_target  = "7.0"
	s.tvos.deployment_target = "9.0"
	s.source            = { :git => "https://github.com/enormego/EGOGradientView.git", :tag => "1.0.0" }

	s.source_files      = "Sources/*.{h,m}"
	s.requires_arc      = false
end
