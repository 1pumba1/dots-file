#!/bin/bash
# Скрипт для получения температуры CPU

temp_path="/sys/class/hwmon/hwmon1/temp1_input"
if [ -f "$temp_path" ]; then
    temp=$(cat "$temp_path")
    temp_c=$((temp / 1000))

    # Выбираем иконку в зависимости от температуры
    if [ "$temp_c" -lt 40 ]; then
        icon=""
    elif [ "$temp_c" -lt 50 ]; then
        icon=""
    elif [ "$temp_c" -lt 60 ]; then
        icon=""
    else
        icon=""
    fi

    echo "$icon $temp_c°C"
else
    # Альтернативный путь
    temp_path2="/sys/class/thermal/thermal_zone0/temp"
    if [ -f "$temp_path2" ]; then
        temp=$(cat "$temp_path2")
        temp_c=$((temp / 1000))
        echo " $temp_c°C"
    else
        echo " N/A"
    fi
fi
