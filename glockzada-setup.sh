#!/data/data/com.termux/files/usr/bin/bash

BASE_DIR="$(pwd)"
SCRIPTS_DIR="$BASE_DIR/Scripts"
TUTORIAL_LINK="https://t.me/videoglockzada7"

GRUPOS=(
"https://t.me/kzpuxadas"
"https://t.me/+AYRxtHkDHPsyMzQx"
"https://t.me/+u7T2N9DAsBczMGUx"
"https://t.me/+zK9z1I4AUaIyNDJh"
"https://t.me/DEVSOLUTIONSVENDAS"
)

# Cores
RED='\033[1;31m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
PURPLE='\033[1;35m'
YELLOW='\033[1;33m'
NC='\033[0m'

abrir_link() {
if command -v termux-open-url >/dev/null 2>&1; then
termux-open-url "$1"
else
xdg-open "$1"
fi
}

bomb_insana() {

tput civis

for i in 3 2 1; do
clear
echo -e "${YELLOW}"
echo ""
echo "        💣 $i"
sleep 0.8
done

for i in {1..4}; do
clear
echo -e "${RED}"
echo "    💥💥💥💥💥💥💥"
echo "  💥💥💥💥💥💥💥💥💥"
echo "    💥💥💥💥💥💥💥"
sleep 0.1
done

clear
echo -e "${PURPLE}⚡ glockzada7 ⚡"
sleep 1.3

tput cnorm
}

instalar_permissoes() {

pkg update -y >/dev/null 2>&1
pkg install termux-api -y >/dev/null 2>&1
termux-setup-storage >/dev/null 2>&1

}

install_requirements() {

echo -e "${CYAN}Instalando dependências...${NC}"

pkg install -y git python nodejs curl wget ffmpeg jq nano unzip zip tor >/dev/null 2>&1

python -m pip install --upgrade pip >/dev/null 2>&1
pip install requests flask cryptography pillow psutil >/dev/null 2>&1

echo -e "${GREEN}Tudo instalado.${NC}"
sleep 1
}

menu_grupos() {
while true
do
clear
echo -e "${CYAN}Grupos Telegram parceiros:${NC}"
echo ""

for i in "${!GRUPOS[@]}"; do
num=$((i+1))
echo "$num - ${GRUPOS[$i]}"
done

echo ""
echo "9 - Abrir TODOS"
echo "0 - Voltar"
echo ""

read -p "Escolha: " g

if [ "$g" = "9" ]; then
for grupo in "${GRUPOS[@]}"; do
abrir_link "$grupo"
sleep 1
done
read -p "ENTER para voltar"
elif [ "$g" = "0" ]; then
break
else
index=$((g-1))
abrir_link "${GRUPOS[$index]}"
read -p "ENTER para voltar"
fi
done
}

executar_script() {

clear
echo "Scripts disponíveis:"
echo ""

ls "$SCRIPTS_DIR"
echo ""

read -p "Digite o nome do script: " script

if [ -f "$SCRIPTS_DIR/$script" ]; then

cd "$SCRIPTS_DIR" || exit

echo -e "${GREEN}Executando...${NC}"
sleep 1

case "$script" in
*.py) python "$script" ;;
*.js) node "$script" ;;
*.sh) bash "$script" ;;
*) bash "$script" ;;
esac

cd "$BASE_DIR"
read -p "ENTER para voltar"

else
echo -e "${RED}Script não encontrado.${NC}"
sleep 2
fi
}

menu_scripts() {

while true
do
clear

TOTAL=$(ls "$SCRIPTS_DIR" 2>/dev/null | wc -l)

echo -e "${CYAN}===========================${NC}"
echo -e "${PURPLE}     Glockzada7 Panel${NC}"
echo -e "${CYAN}===========================${NC}"
echo ""
echo -e "${GREEN}Scripts encontrados:${NC} $TOTAL"
echo ""
echo "1 - Listar scripts"
echo "2 - Executar script"
echo "3 - Abrir tutorial"
echo "4 - Grupos parceiros"
echo "0 - Sair"
echo ""

read -p "Escolha: " op

case $op in

1)
clear
ls "$SCRIPTS_DIR"
read -p "ENTER para voltar"
;;

2)
executar_script
;;

3)
clear
echo "Abrindo tutorial..."
sleep 1
abrir_link "$TUTORIAL_LINK"
read -p "ENTER para voltar"
;;

4)
menu_grupos
;;

0)
exit
;;

*)
echo "Opção inválida"
sleep 1
;;

esac

done
}

bomb_insana
instalar_permissoes
install_requirements

if [ ! -d "$SCRIPTS_DIR" ]; then
echo "Erro: pasta Scripts não encontrada."
exit
fi

menu_scripts