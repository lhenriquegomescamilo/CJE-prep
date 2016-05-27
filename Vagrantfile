VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	
	config.vm.box = "sincerely/trusty64"
	config.vm.provision "shell", path: "scripts/provision_script.sh"
	
	config.vm.define "jenkins" do |jenkins|
		config.vm.provider "virtualbox" do |v|
			v.name = "jenkins"
			v.memory = 2048
			v.cpus = 2
		end	
		
		jenkins.vm.hostname = "jenkins"
		jenkins.vm.synced_folder "scripts", "/vagrant/scripts"
		
		# Tomcat
		jenkins.vm.network :forwarded_port, host: 8080, guest: 8080
		
	end


end
