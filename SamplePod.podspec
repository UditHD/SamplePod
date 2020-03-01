Pod::Spec.new do |s|
s.name         = "SamplePod"
s.version      = "0.0.1"
s.summary      = "sample pod use"
s.homepage     = "https://github.com/UditHD/SamplePod"
s.license      = "MIT"
s.author       = { "Udit" => "Udit" }
s.platform     = :ios, "10.0"
s.source       = { :git => 'https://github.com/UditHD/SamplePod.git', :tag => "#{s.version}" }
s.source_files  = "SamplePod/**/*.{h,m,swift}"
s.preserve_paths = "Resources/*.lproj"
end
