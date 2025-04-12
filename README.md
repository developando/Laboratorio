## Criando o laboratorio de estudos com vagrant e virtualbox no wsl2

* Primeiro instale o [vagrant](https://www.vagrantup.com/downloads)
* Instale o [virtual box](https://www.virtualbox.org/wiki/Downloads)
* Instale o [git](https://git-scm.com/download/) 
* Para que o vagrant consiga realizar alterações no windows exporte a variavel abaixo:

* **By default Vagrant will not access features available on the Windows system from within the WSL. This means the VirtualBox and Hyper-V providers will not be available. To enable Windows access, which will also enable the VirtualBox and Hyper-V providers, set the VAGRANT_WSL_ENABLE_WINDOWS_ACCESS environment variable.**
[vagrant](https://developer.hashicorp.com/vagrant/docs/other/wsl) 

~~~~
export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS=1
~~~~

* Acesse o WSL em um diretorio de sua preferencia clone o repo.
* Faça o Download do repositorio com as configurações de ambiente.* - Achei melhor criar 4 vms com a mesma distribuição para facilitar, mas pode usar oque for melhor para seu ambiente.
* No meu caso os ips da minha rede são 192.168.*(ajuste se necessário)
* No meu caso preferi usar a imagem do rockylinux/9
* Vagrant up
* Só usar

# Em caso de erros seguir conforme abaixo.
### Problemas com rede do [virtualbox](https://forums.virtualbox.org/viewtopic.php?t=104671).
Como root no wsl criar o arquivo e conteúdo abaixo.

sudo vim /etc/vbox/networks.conf
~~~~
 * 0.0.0.0/0 ::/0
~~~~

### Problemas para acesso ao ssh após o processo dar sucesso
[Explicação](https://www.reddit.com/r/bashonubuntuonwindows/comments/ovmlk3/unable_to_change_permissions_of_a_file_using/?tl=pt-br)

1. Crie o arquivo /etc/wsl.conf como root.
2. Coloque o conteudo.
~~~~
[automount]
options="metadata"
~~~~
3.Ajustar permissão das pastas ./ssh do seu diretorio home
~~~~
chmod -R 700
~~~~
