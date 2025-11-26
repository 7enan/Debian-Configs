#!/bin/bash

# Verifica se algum player está tocando algo
if playerctl status 2>/dev/null | grep -q "Playing"; then
    # Se estiver tocando, não faz nada (tela não desliga)
    exit 1
else
    # Se não estiver tocando, permite que o swayidle continue
    exit 0
fi
