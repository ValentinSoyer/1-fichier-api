lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'un_fichier_api/version'

Gem::Specification.new do |spec|
  spec.name          = 'un_fichier_api'
  spec.version       = UnFichierApi::VERSION
  spec.authors       = ['Valentin Soyer']
  spec.email         = ['valent.soyer@gmail.com']
  spec.summary       = %q{Provide a simple way to use the 1Fichier API (https://1fichier.com/api.html).}
  spec.homepage      = 'https://github.com/ValentinSoyer/1-fichier-api'
  spec.license       = 'MIT'

  spec.metadata['homepage_uri']    = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_dependency 'activesupport', '~> 6.1.0'
  spec.add_dependency 'faraday', '~> 1.2.0'
end
