# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ruby_protobuf}
  s.version = "0.4.11"
  s.authors = ["MATSUYAMA Kengo", "ANDO Yasushi", "Paul Ingles", "matsukaz"]
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.executables = ["rprotoc"]
  s.files = ["README.txt"] + Dir.glob("lib/**/*.rb") + Dir.glob("bin/*")
  s.has_rdoc = true
  s.homepage = %q{http://github.com/matsukaz/ruby_protobuf}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Protocol Buffers for Ruby}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
