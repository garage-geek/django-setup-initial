#!/bin/bash

if [ $1 ]
then
    project_name=$1

    echo ""
    echo -e "\e[32m###############################################################################################\e[0m"
    echo -e "\e[32m# CRIANDO DIRETÓRIO ###########################################################################\e[0m"
    echo -e "\e[32m###############################################################################################\e[0m"
    echo ""

    mkdir $project_name
    cd $project_name

    echo ""
    echo -e "\e[32m###############################################################################################\e[0m"
    echo -e "\e[32m# CRIANDO VIRTUALENV ##########################################################################\e[0m"
    echo -e "\e[32m###############################################################################################\e[0m"
    echo ""

    virtualenv env -p python3
    . env/bin/activate

    echo ""
    echo -e "\e[32m###############################################################################################\e[0m"
    echo -e "\e[32m# INSTALANDO DJANGO ###########################################################################\e[0m"
    echo -e "\e[32m###############################################################################################\e[0m"
    echo ""

    pip install django

    echo ""
    echo -e "\e[32m###############################################################################################\e[0m"
    echo -e "\e[32m# INICIANDO PROJETO ###########################################################################\e[0m"
    echo -e "\e[32m###############################################################################################\e[0m"
    echo ""

    django-admin startproject --template https://github.com/cosmunsoftwares/django-boilerplate-api/archive/master.zip $project_name .

    find ./ -type f -exec sed -i s/project_name/$project_name/g {} \;

    pip install -r requirements_dev.txt

    cp contrib/env-sample .env

    echo ""
    echo -e "\e[32m###############################################################################################\e[0m"
    echo -e "\e[32m# REMOVENDO setup.py ##########################################################################\e[0m"
    echo -e "\e[32m###############################################################################################\e[0m"
    echo ""

    # rm setup.py

    echo ""
    echo -e "\e[32m##############################################################################################\e[0m"
    echo -e "\e[32m# VERIFICANDO PROJETO ########################################################################\e[0m"
    echo -e "\e[32m##############################################################################################\e[0m"
    echo ""

    python manage.py test

    echo ""

    python manage.py check

    echo ""
    echo -e "\e[32m##############################################################################################\e[0m"
    echo -e "\e[32m# Finalizado #################################################################################\e[0m"
    echo -e "\e[32m##############################################################################################\e[0m"
    echo ""

else
    echo -e "\e[31m##############################################################################################\e[0m"
    echo -e "\e[31m# INFORME O NOME DO PROJETO ##################################################################\e[0m"
    echo -e "\e[31m##############################################################################################\e[0m"
fi
