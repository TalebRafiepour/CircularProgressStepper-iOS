
Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  
s.name         = "CircularProgressStepper"
s.version      = "0.1"
s.summary      = "CircularProgressStepper View Create For Showing Step Of A Process."
s.description  = "You Can Show Progress And Steps Of A Process With CircularProgressStepper(CPS), This Framework Is Very Flexible And Responsivable To Use."
s.homepage     = ""

  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.license      = "MIT"

  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  s.author             = { "Taleb" => "taleb.r75@gmail.com" }
  # Or just: s.author    = "Taleb"
  # s.authors            = { "Taleb" => "taleb.r75@gmail.com" }
  # s.social_media_url   = "http://twitter.com/Taleb"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.platform     = :ios, "12.2"
  s.swift_version = "5" 



  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.source       = { :git 'https://github.com/TalebRafiepour/CircularProgressStepper-iOS.git' }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.source_files = "CircularProgressStepper"

end
