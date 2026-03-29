#!/bin/bash
VERMELHO='\033[0;31m'
VERDE='\033[0;32m'
echo -e "$VERDE" "Criando a variável de ambiente para que o vagrant consiga acessar o Windows.\n"
export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS=1


echo -e "$VERDE" "Configuração para conseguir ajustar permissoes do windows.\n"
WSL="[automount]
options="metadata""

echo "$WSL >> /etc/wsl.conf"

echo -e "$VERDE"  "Ajustando a permissão do diretorio ssh.\n"
chmod -R  700 $HOME/.ssh/

echo -e "$VERDE""Ajustando network para o bom funcionamento do virtualbox e vangrant.\n"

sudo sh -c "echo '* 0.0.0.0/0 ::/0' >> /etc/vbox/networks.conf"

echo  -e "$VERDE" "COnfiguração Ok, agora só seguir os demais passos."
