package 'build-essential'
package 'python-software-properties'
package 'libssl-dev'
package 'libreadline-dev'
package 'git-core'
package 'curl'

bash "Add NodeJS repository" do
	code "add-apt-repository ppa:chris-lea/node.js -y && apt-get update -y"
	not_if "test -f /etc/apt/sources.list.d/chris-lea-node_js*"
end

package 'nodejs'
package 'nodejs-dev'

npm = "/root/npm"
npm_bin = "/usr/bin/npm"

git npm do
	user "root"
  repository "git://github.com/isaacs/npm.git"
	not_if "test -f #{npm_bin}"
end

bash "Install NPM" do
	creates npm_bin
	cwd npm
	code "make install"
end

directory npm do
  recursive true
  action :delete
end
