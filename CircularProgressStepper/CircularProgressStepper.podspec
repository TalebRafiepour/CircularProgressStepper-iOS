
Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  
  s.name         = "CircularProgressStepper"
  s.version      = "0.1"
  s.summary      = "CircularProgressStepper View Create For Showing Step Of A Process."
  s.description  = "You Can Show Progress And Steps Of A Process With CircularProgressStepper(CPS), This Framework Is Very Flexible And Responsivable To Use."
  s.homepage     = "https://github.com/TalebRafiepour/CircularProgressStepper-iOS.git"

  s.license      = "MIT"

  s.author             = { "Taleb" => "taleb.r75@gmail.com" }
  # Or just: s.author    = "Taleb"
  # s.authors            = { "Taleb" => "taleb.r75@gmail.com" }
  # s.social_media_url   = "http://twitter.com/Taleb"

  s.platform     = :ios, "12.2"
  s.swift_version = "5" 


  s.source       = { :git => "https://github.com/TalebRafiepour/CircularProgressStepper-iOS.git", :tag => "#{s.version}" }
  s.source_files  = "CircularProgressStepper", "CircularProgressStepper/**/*.swift"

end
