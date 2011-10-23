cookbooks = 'cookbooks.tar.gz'

task :default => [cookbooks]

file cookbooks => `git ls-files`.split("\n") do
  sh "git archive --format=tar --prefix=cookbooks/ master | gzip > #{cookbooks}"
end
