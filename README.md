# What is this?

Cookbooks that I use for [vagrant](http://vagrantup.com)

# Example Vagrantfile

<pre>
Vagrant::Config.run do |config|
  config.vm.box = "oneiric32"

  config.vm.forward_port "http", 8000, 8000

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    
    chef.add_recipe "vim"
    chef.add_recipe "ssh::vagrant"
    chef.add_recipe "git::vagrant"
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
* install Node.js with NVM (defaults to 0.4.12), and
* copy any SSH keys present on the host machine so that you can,
for example, use GitHub.