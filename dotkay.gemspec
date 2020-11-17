# coding: utf-8

Gem::Specification.new do |s|
  s.name          = "dotkay"
  s.version       = "1.0"
  s.authors       = ["Kay"]
  s.email         = ["kalyanvk@gmail.com"]

  s.summary       = %q{Hmmm... trying to get my github pages working.}
  s.homepage      = "https://github.com/dotkay"
  s.license       = "MIT"

  s.files         = `git ls-files -z`.split("\x0").select do |f|
    f.match(%r{^(assets|_layouts|_includes|_sass|LICENSE|README|CHANGELOG)}i)
  end

  s.add_runtime_dependency "jekyll", "~> 3.3"
  s.add_runtime_dependency "jekyll-archives", "~> 2.1"
  s.add_runtime_dependency "jekyll-paginate", "~> 1.1"
  s.add_runtime_dependency "jekyll-sitemap", "~> 1.0"

  s.add_development_dependency "bundler", "~> 2.1.4"
  s.add_development_dependency "rake"
end
