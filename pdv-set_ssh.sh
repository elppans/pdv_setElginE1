#!/bin/bash

# Acesso facilitado ao IP fornecido manualmente.
# NÃO depende do Script principal

# Verifica se o primeiro parâmetro foi fornecido
if [ -z "$1" ]; then
    echo "Você não forneceu nenhum valor."
    exit 1
fi

ipssh="$1"
sshpass -p zanthus ssh -o StrictHostKeyChecking=no user@"$ipssh"
