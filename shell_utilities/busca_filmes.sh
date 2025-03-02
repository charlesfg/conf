#!/bin/bash
#
#  Formato:
#   
#   """
#   nome 1
#   nome 2
#   ...
#
#   """"
#

# Verifica se o arquivo de entrada foi passado como argumento
if [ $# -ne 1 ]; then
    echo "Uso: $0 <arquivo_de_entradas>"
    exit 1
fi

arquivo="$1"

# Verifica se o arquivo existe
if [ ! -f "$arquivo" ]; then
    echo "Erro: Arquivo '$arquivo' não encontrado!"
    exit 1
fi


LIST_FILE=/Users/charlesgoncalves/list.txt
# Lê o arquivo linha por linha
while IFS= read -r nome; do
    echo "--------- ${nome} -----------"
    grep -A 1 -i "${nome}" ${LIST_FILE}
done < "$arquivo"