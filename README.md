# What is this?

Cookbooks that I use for [vagrant](http://vagrantup.com)

# Example Vagrantfile

<pre>
Vagrant::Config.run do |config|
  config.vm.box = "oneiric32"
  config.vm.url = "https://s3.amazonaws.com/mdellanoce-vagrant-boxes/oneiric32.box"

  config.vm.forward_port "http", 80, 8080

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    
    chef.add_recipe "vim"
    chef.add_recipe "nodejs"
		chef.add_recipe "nodejs::canvas"
  end
end
</pre>

If you run:

<pre>
vagrant up
</pre>

... from a directory containing both this Vagrantfile, and this repository
checked out, it will:

* download the base box (if you don't have it already),
* install Vim,
* install Node.js 0.4.12 and NPM
* install the cairo development package (so that [node canvas](https://github.com/LearnBoost/node-canvas) can be installed)