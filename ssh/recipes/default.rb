user = "vagrant"
ssh = "/var/ssh"
keys = ["id_rsa", "id_rsa.pub"]

keys.each do |key|
  source = "#{ssh}/#{key}"
  destination = "/home/#{user}/.ssh/#{key}"
  if File.exists? source
    bash "Copy private key" do
      creates destination
      code "cp #{source} #{destination}"
      user user
      group user
    end
    
    file destination do
      mode "600"
    end
  end
end