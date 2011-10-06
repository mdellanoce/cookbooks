# What is this?

Cookbooks that I use for [vagrant](http://vagrantup.com)

# Example Vagrantfile

<pre>
Vagrant::Config.run do |config|
  config.vm.box = "nodejs"
  config.vm.box_url = "http://files.vagrantup.com/lucid32.box"

  config.vm.forward_port "http", 80, 8080

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    
    chef.add_recipe "vim"
    chef.add_recipe "nodejs"
    
    chef.json.merge!({
      :nodejs => {
        :versions => ["0.4.12"]
      }
    })
  end
end
</pre>