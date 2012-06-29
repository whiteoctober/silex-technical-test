# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise32"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"
  config.vm.network :hostonly, "33.33.33.3"
  config.vm.share_folder("v-root", "/vagrant", ".", :nfs => !RUBY_PLATFORM.downcase.include?("w32"))

  config.vm.provision :chef_solo do |chef|
       chef.cookbooks_path = "cookbooks"
       chef.add_recipe "news_setup"
       chef.json.merge!({
           :mysql => {
              :server_root_password => ""
           }
       })
  end
end
