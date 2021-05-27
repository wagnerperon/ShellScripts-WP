#!/bin/bash

# ########################################################################
# Nome: RelatorioMaquina.sh						
#									
# Autor: Wagner Peron 
# Data: 27/05/2021
#				
# Descrição: O script gera um relatório com as principais informações do servidor
#
# Uso: ./RelatorioMaquina.sh						
# #########################################################################

# VARIAVEIS
HOSTNAME=$(hostname)
DATA=$(date)
ATIVA=$(uptime -s)
KERNEL=$(uname -r)
CORE=$(cat /proc/cpuinfo | grep "cpu cores" | cut -c13-)
MODELO=$(cat /proc/cpuinfo |grep "model name"|head -n1|cut -c14-)
PARTICOES=$(df -h|egrep -v '(tmpfs|udev)')
MEMORIA=$(expr $(cat /proc/meminfo |grep "MemTotal"|tr -d ' '|cut -d: -f2|tr -d kB) / 1024)


clear
echo "=================================================================="
echo "Relatório da Máquina: $HOSTNAME"
echo "Data/Hora: $DATA"
echo "=================================================================="
echo 
echo "Máquina Ativa desde: $ATIVA"
echo
echo "Versão do Kernel: $KERNEL"
echo
echo "CPUs:"
echo "Quantidade de CPUs/Core: $CORE"
echo "Modelo da CPU: $MODELO"
echo
echo "Memória Total: $MEMORIA MB"
echo
echo "Partições:"
echo "$PARTICOES"
echo
echo "=================================================================="
