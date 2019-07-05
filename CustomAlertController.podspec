Pod::Spec.new do |s|
  s.name         = "CustomAlertController"
  s.version      = "1.0.6"
  s.summary      = "Provides easy way to make Customized Alert."

  s.description  = <<-DESC
CustomKeyboardTextField provides easy way to make Customized Alert.
                   DESC

  s.homepage     = "https://github.com/shahbazsaleem01/CustomAlertController"
  # s.screenshots  = "https://raw.githubusercontent.com/giginet/CustomKeyboardTextField/master/Documentation/Image/demo.gif"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Shahbaz Saleem" => "shahbaz@saleems.me" }
  s.social_media_url   = "https://shahbaz.saleems.me"
  s.platform     = :ios
  s.platform     = :ios, "11.0"

  s.source       = { :git => "https://github.com/shahbazsaleem01/CustomAlertController.git", :tag => "#{s.version}" }
  s.swift_version = '5.0'
  s.source_files  = "Source/*"
end
