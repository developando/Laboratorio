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


# informações adicionais

Instalação de plugins (opcional):
- `vagrant plugin install vagrant-vbguest`
- `vagrant plugin list`

Sincronização de pastas — usando **rsync** (recomendado no Windows)
- O `Vagrantfile` foi configurado para usar `rsync`:
  `machine.vm.synced_folder "C:/Users/welli/Documents", "/data", type: "rsync", rsync__auto: true`
- Comandos úteis:
  - `vagrant up` (faz sync inicial)
  - `vagrant rsync` (sincroniza manualmente)
  - `vagrant rsync-auto` (observa alterações e sincroniza automaticamente)
- Observações:
  - `rsync` é *one-way* (host → guest); alterações no guest NÃO voltam ao host automaticamente.
  - No Windows, tenha um binário `rsync` no PATH (usar WSL: `sudo apt install rsync`, Git Bash ou cwRsync).

Alternativa: usar **vboxsf** (VirtualBox shared folders)
- Requer **Guest Additions** instaladas no guest.
- Plugin útil: `vagrant-vbguest` (tenta instalar as Guest Additions automaticamente):
  - `vagrant plugin install vagrant-vbguest`
- Se o plugin falhar com erro Ruby `File.exists?`, use uma versão anterior estável ou aplique o _workaround_:
  - Downgrade para 0.31.0:
    - `vagrant plugin uninstall vagrant-vbguest`
    - `vagrant plugin install vagrant-vbguest --plugin-version "0.31.0"`
  - Ou edite o arquivo indicado substituindo `File.exists?` por `File.exist?` para corrigir rapidamente.

Se quiser, eu adiciono instruções para instalar `rsync` no seu Windows (WSL ou cwRsync) ou um snippet para automatizar a instalação de `kernel-devel` e Guest Additions no `provision.sh`.