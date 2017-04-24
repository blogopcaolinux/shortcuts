#!/bin/bash
## Script elaborado por Morvan ##
arq=$HOSTNAME.confs.zip
March=`echo $MACHTYPE | cut -c8-13`
echo "Salvando Dados no Arquivo $arq com Arquitetura $March"
# localiza e salva os .rules, .conf e os .ini
locate .rules | grep /etc/ | zip $arq -@ -9
locate .conf | grep /etc/ | zip $arq -@ -9
locate .ini | grep /etc/ | zip $arq -@ -9
zip $arq -r  -9 /etc/{fstab,default/grub,hostname}
if [ $March != "redhat" ] ; then # Salva Dados de Debian Like
   zip $arq -r  -9 /etc/apt/sources.list 
else # salva dados a la RH
   zip $arq -r  -9 /etc/yum.repos.d/*
fi
exit
