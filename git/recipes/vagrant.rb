user = "vagrant"
source_directory = "/vagrant"
configs = [".gitconfig"]

configs.each do |config|
  source = "#{source_directory}/#{config}"
  destination = "/home/#{user}/#{config}"
  if File.exists? source
    bash "Copy git config" do
      creates destination
      code "cp #{source} #{destination}"
      user user
      group user
    end
    
    file destination do
      mode "644"
    end
  end
end