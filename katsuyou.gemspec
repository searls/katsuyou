require_relative "lib/katsuyou/version"

Gem::Specification.new do |spec|
  spec.name = "katsuyou"
  spec.version = Katsuyou::VERSION
  spec.authors = ["Justin Searls"]
  spec.email = ["searls@gmail.com"]

  spec.summary = "Conjugates Japanese verbs"
  spec.homepage = "https://github.com/searls/katsuyou"
  spec.license = "GPL-3.0-only"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage

  spec.files = Dir.chdir(File.expand_path("..", __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
