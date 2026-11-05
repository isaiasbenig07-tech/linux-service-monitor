#!/bin/bash
# ==============================================================================
# Script: monitor.sh
# Descrição: Verifica a conectividade de rede e salva o status em log.
# ==============================================================================

LOG_FILE="status_servicos.log"
DATA=$(date "+%Y-%m-%d %H:%M:%S")

echo "--- VERIFICAÇÃO EM $DATA ---" >> $LOG_FILE

# 1. Testar Conectividade com a Internet (DNS do Google)
if ping -c 1 8.8.8.8 > /dev/null 2>&1; then
    echo "[OK] Conectividade com a Internet: ATIVA" >> $LOG_FILE
else
    echo "[ERRO] Conectividade com a Internet: FALHOU" >> $LOG_FILE
fi

# 2. Testar Resolução de Nome (DNS)
if nslookup google.com > /dev/null 2>&1; then
    echo "[OK] Resolução de DNS: FUNCIONANDO" >> $LOG_FILE
else
    echo "[ERRO] Resolução de DNS: FALHOU" >> $LOG_FILE
fi

echo "Verificação concluída. Resultado gravado em $LOG_FILE"
