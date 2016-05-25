VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	
	# you need this box added to your local repository by this command
	# > vagrant box add debian_modelo http://esec-server/deploy/vagrant/boxes/debian-jessie-32-bit.box
	
	config.vm.box = "debian_modelo"
	config.vm.provision "shell", path: "scripts/provision_script.sh"
	#config.vm.network "private_network", ip: "192.168.2.48"
	
	config.vm.define "jenkins" do |jenkins|
		config.vm.provider "virtualbox" do |v|
			v.name = "jenkins"
			v.memory = 2048
			v.cpus = 2
		end	
		
		jenkins.vm.provision "shell" do |s|
			# replace Windows line endings with Unix line endings
			s.binary = true
		end
		
		jenkins.vm.hostname = "jenkins"
		jenkins.vm.synced_folder "scripts", "/vagrant/scripts"
		
		# Jboss
		jenkins.vm.network :forwarded_port, host: 8080, guest: 8080	
		jenkins.vm.network :forwarded_port, host: 8443, guest: 8443
		jenkins.vm.network :forwarded_port, host: 9999, guest: 9999
		jenkins.vm.network :forwarded_port, host: 9990, guest: 9990
		jenkins.vm.network :forwarded_port, host: 9000, guest: 9000
		#ssh from eclipse
		jenkins.vm.network :forwarded_port, host: 22, guest: 22
		#debug jboss
		jenkins.vm.network :forwarded_port, host: 8787, guest: 8787
	end


end