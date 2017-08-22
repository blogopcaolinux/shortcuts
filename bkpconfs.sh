#!/bin/bash
## Script elaborado por Morvan ##
March=`echo $MACHTYPE | cut -c8-13`
Mdia=`date +%Y%m%d`
arq=$HOSTNAME.confs.$Mdia.zip
com1="locate"
com2="zip"
para="-r -9 -@"
echo -e "\a\033[01;34mSalvando Dados no Arquivo\033[01;31m $arq \a\033[01;00mcom Arquitetura \033[01;31m$March\033[01;00m"
# localiza e salva os .conf e os .ini, etc
$com1 .conf | grep /etc/ | $com2 $arq $para >> $arq.log
$com1 .ini | grep /etc/ | $com2 $arq $para >> $arq.log
$com1 .rules | grep /etc/ | $com2 $arq $para >> $arq.log
$com1 .sh | grep ".sh$" | grep /home/morvan | $com2 $para $arq >> $arq.log
$com1 /etc/{fstab,default/grub,hostname} | $com2 $para $arq >> $arq.log
if [ $March != "redhat" ] ; then # Salva Dados de Debian Like
 $com1 /etc/apt/sources.list | $com2 $para $arq >> $arq.log
else # salva dados a la RH
 $com1 /etc/yum.repos.d/* | $com2 $para $arq >> $arq.log
fi
exit
