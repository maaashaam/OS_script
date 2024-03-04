#!/bin/bash

help() {
    echo "You need to enter the number from 1 to 500 and script will generate the given number of lines"  #функция help, которая описывает работу скрипта
}

while getopts ":h" opt; #ожидает -h и записывает в переменную opt опцию из командной строки
do
  case $opt in 
    h) help #если в переменную передали -h, то выполнится help
    exit
  esac
done

echo "Enter the number: " #просим ввести число

read number #записываем число в переменную number

if [ -z "$number" ] #проверка на пустоту
then
  echo "Error: empty number" #если переменная пустая, выводим ошибку
  exit
fi

if [[ $number -ge 1 && $number -le 500 ]] #если число находится в диапазоне от 1 до 500
then
  for ((i=1;i<=$number;i++))
  do
    random_str=$(pwgen 3 1) #генерируем рандомную строку длиной 3 символа
    echo "dir_${random_str}_${i}" #печатаем строку из задания
  done
else
  echo "Error: number is out of range" #если число не входит в диапазон печатаем ошибку
fi