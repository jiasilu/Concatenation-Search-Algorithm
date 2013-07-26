# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.authors       = ["Justin Jia"]
  gem.email         = ["justin@goodinc.com"]
  gem.description   = %q{This is a gem for finding the longest concatenated word in a list}
  gem.summary       = %q{Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "concatenate_words_with_trie"
  gem.require_paths = ["lib"]
  gem.version       = "0.0.1"
end
