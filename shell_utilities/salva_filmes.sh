#!/bin/bash
#
#  Formato:
#   
#   """
#   
#   <nome1> 
#   <url1>
#   <nome2> 
#   <url2>
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

# Lê o arquivo linha por linha
while IFS= read -r nome && IFS= read -r url; do
    # Remove espaços do nome
    nome_formatado=$(echo "$nome" | tr -d ' ')

    # Extrai a extensão do arquivo da URL
    extensao="${url##*.}"

    # Define o nome do arquivo final
    arquivo_saida="${nome_formatado}.${extensao}"

    echo "Baixando: $url"
    echo "Salvando como: $arquivo_saida"

    # Baixa o arquivo com o nome correto
    wget -O "$arquivo_saida" "$url"

done < "$arquivo"