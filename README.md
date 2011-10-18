# What is this?

Cookbooks that I use for [vagrant](http://vagrantup.com)

# Example Vagrantfile

<pre>
ssh_dir = File.join(ENV['HOME'], '.ssh')

Vagrant::Config.run do |config|
  config.vm.box = "nodejs"
  config.vm.box_url = "http://files.vagrantup.com/lucid32.box"

  config.vm.forward_port "http", 80, 8080

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    
    chef.add_recipe "vim"
    chef.add_recipe "ssh::vagrant"
    chef.add_recipe "git::vagrant"
    chef.add_recipe "cairo"
    chef.add_recipe "nodejs"
    
    chef.json.merge!({
      :nodejs => {
        :versions => ["0.4.12"]
      }
    })
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