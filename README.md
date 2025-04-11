## Criando o laboratorio de estudos com vagrant e virtualbox no wsl2

* Primeiro instale o [vagrant](https://www.vagrantup.com/downloads)
* Instale o [virtual box](https://www.virtualbox.org/wiki/Downloads)
* Instale o [git](https://git-scm.com/download/)
* Acesse o WSL em um diretorio de sua preferencia clone o repo
* Faça o Download do repositorio com as configurações de ambiente.* - Achei melhor criar 4 vms com a mesma distribuição para facilitar, mas pode usar oque for melhor para seu ambiente.
* No meu caso os ips da minha rede são 192.168.*(ajuste se necessário)
* No meu caso preferi usar a imagem do rockylinux/9
* Vagrant up
* Só usar

s



- By default Vagrant will not access features available on the Windows system from within the WSL. This means the VirtualBox and Hyper-V providers will not be available. To enable Windows access, which will also enable the VirtualBox and Hyper-V providers, set the VAGRANT_WSL_ENABLE_WINDOWS_ACCESS environment variable
[LINK](https://developer.hashicorp.com/vagrant/docs/other/wsl)

export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS=1

Como root no wsl criar o arquivo e conteúdo abaixo.

vim /etc/vbox/networks.conf
~~~~
* 0.0.0.0/0 ::/0
~~~~

Problemas para acesso ao ssh após o processo dar sucesso
https://www.reddit.com/r/bashonubuntuonwindows/comments/ovmlk3/unable_to_change_permissions_of_a_file_using/?tl=pt-br

ajjustar permissão das pastas:

755

https://forums.virtualbox.org/viewtopic.php?t=104671
