#!/bin/bash

echo "Initiating server configuration..."

echo "Creating diretories..."
mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

echo "Creating user groups..."
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Creating users..."
useradd carlos     -c "Carlos - Administracao" -s /bin/bash -m -p $(openssl passwd pass123)
useradd maria      -c "Maria - Administracao"  -s /bin/bash -m -p $(openssl passwd pass123)
useradd joao       -c "Joao - Administracao"   -s /bin/bash -m -p $(openssl passwd pass123)
useradd debora     -c "Debora - Vendas"        -s /bin/bash -m -p $(openssl passwd pass123)
useradd sebastiana -c "Sebastiana - Vendas"    -s /bin/bash -m -p $(openssl passwd pass123)
useradd roberto    -c "Roberto - Vendas"       -s /bin/bash -m -p $(openssl passwd pass123)
useradd josefina   -c "Josefina - Seguranca"   -s /bin/bash -m -p $(openssl passwd pass123)
useradd amanda     -c "Amanda - Seguranca"     -s /bin/bash -m -p $(openssl passwd pass123)
useradd rogerio    -c "Rogerio - Seguranca"    -s /bin/bash -m -p $(openssl passwd pass123)

echo "Associating users to groups..."
usermod -g GRP_ADM carlos
usermod -g GRP_ADM maria
usermod -g GRP_ADM joao
usermod -g GRP_VEN debora
usermod -g GRP_VEN sebastiana
usermod -g GRP_VEN roberto
usermod -g GRP_SEC josefina
usermod -g GRP_SEC amanda
usermod -g GRP_SEC rogerio

echo "Defining directories owners..."
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

echo "Defining directories permissions..."
chmod 777 /publico
chmod 770 /adm
chmod 770 /ven
chmod 770 /sec

echo "Done"
