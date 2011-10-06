package 'build-essential'
package 'python-software-properties'
package 'libssl-dev'
package 'libreadline-dev'
package 'git-core'
package 'curl'

user = "vagrant"
home = "/home/#{user}"
nvm = "source #{home}/.nvm/nvm.sh; nvm"

git "#{home}/.nvm" do
  repository "git://github.com/creationix/nvm.git"
  user user
  group user
end

file "#{home}/.bashrc" do
  content ". ~/.nvm/nvm.sh"
end

node[:nodejs][:versions].each do |nodejs_version|
  bash "installing node.js #{nodejs_version}" do
    creates "#{home}/.nvm/v#{nodejs_version}"
    user user
    group user
    cwd home
    environment 'HOME' => home
    code "#{nvm} install v#{nodejs_version}"
  end
end

bash "set default node.js version" do
  user user
  group user
  code "#{nvm} alias default v#{node[:nodejs][:versions].first}"
end