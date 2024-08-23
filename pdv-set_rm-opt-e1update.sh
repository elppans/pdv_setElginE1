#!/bin/bash
# shellcheck disable=SC1078,SC1079,SC2013,SC2140
# shellcheck source=/dev/null

# Verifica se o primeiro parâmetro foi fornecido
if [ -z "$1" ]; then
    echo "Você não forneceu nenhum valor. Por favor, insira um valor para o usuario."
    exit 1
fi

if [ -z "$2" ]; then
    echo "Você não forneceu nenhum valor. Por favor, insira um valor para a senha."
    exit 1
fi

IP_DIR="$HOME/.ip"
IP_FILE="$IP_DIR/ip.txt"
IP_OK_FILE="$IP_DIR/ip_ok.txt"
IP_OFF_FILE="$IP_DIR/ip_off.txt"

mkdir -p "$IP_DIR"

# Se o parâmetro foi fornecido, atribui-o à variável 'user'
user="$1"
passwd="$2"
export user
export passwd

# Executar comandos via SSH, usando IP atribuido ao arquivo ip_OK.txt
for IP in $(cat "$IP_OK_FILE"); do
    ./ssh-keyscan.sh "$IP" &>>/dev/null
    echo "$IP"
    sshpass -p "$passwd" ssh -o StrictHostKeyChecking=no "$user"@"$IP" \
        "
        # cmd
if [ -d /opt/pdv_e1update ]; then
        echo ""$passwd"" | sudo -S rm -rf /opt/pdv_e1update &>>/dev/null
        echo "..."
        sleep 2
        if [ -d /opt/pdv_e1update ]; then
        echo "..?"
        fi
else
        echo "..!"
fi
        # cmd
        "
done
