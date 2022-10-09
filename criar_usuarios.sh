#!/bin/bash

# Entrar como root
su root

# Criação de Grupos
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC 

# Visulaizar os grupos criados
cd /
cat etc/group

-- GRP_ADM:x:1004:
-- GRP_VEN:x:1005:
-- GRP_SEC:x:1006:

# Criação de Usuários
## Sem grupo definido
useradd carlos -s /bin/bash -m -c "Usuário Para o Projeto"
useradd maria -s /bin/bash -m -c "Usuário Para o Projeto"
useradd joao -s /bin/bash -m -c "Usuário Para o Projeto"

## Sem sistema shell definido
useradd debora -m -c "Usuário Para o Projeto" -G GRP_VEN
useradd sebastiana -m -c "Usuário Para o Projeto" -G GRP_VEN
useradd roberto -m -c "Usuário Para o Projeto" -G GRP_VEN

## Completo
useradd josefina -m -s /bin/bash -c "Usuário Para o Projeto" -G GRP_SEC
useradd amanda -m -s /bin/bash -c "Usuário Para o Projeto" -G GRP_SEC
useradd rogerio -m -s /bin/bash -c "Usuário Para o Projeto" -G GRP_SEC

# Visualização dos usuários criados
cat etc/passwd

-- maria:x:1001:1001:Usuário Para o Projeto:/home/maria:/bin/bash
-- carlos:x:1002:1002:Usuário Para o Projeto:/home/carlos:/bin/bash
-- joao:x:1003:1003:Usuário Para o Projeto:/home/joao:/bin/bash

-- debora:x:1004:1007:Usuário Para o Projeto:/home/debora:/bin/sh
-- sebastiana:x:1005:1008:Usuário Para o Projeto:/home/sebastiana:/bin/sh
-- roberto:x:1006:1009:Usuário Para o Projeto:/home/roberto:/bin/sh

-- josefina:x:1007:1010:Usuário Para o Projeto:/home/josefina:/bin/bash
-- amanda:x:1008:1011:Usuário Para o Projeto:/home/amanda:/bin/bash
-- rogerio:x:1009:1012:Usuário Para o Projeto:/home/rogerio:/bin/bash

# Visualizando os grupos com seus usuarios
cat etc/group

-- GRP_ADM:x:1004:
-- GRP_VEN:x:1005:debora,sebastiana,roberto
-- GRP_SEC:x:1006:josefina,amanda,rogerio

## Alterando o shell utilizado para o bash
chsh -s /bin/bash debora
chsh -s /bin/bash sebastiana
chsh -s /bin/bash roberto

## Incluindo os usuários em grupos
usermod -G GRP_ADM carlos
usermod -G GRP_ADM maria
usermod -G GRP_ADM joao

## Mudando donos das pastas
chown debora:GRP_VEN ven
chown josefina:GRP_SEC sec
chown carlos:GRP_ADM adm

## Mudando permissões
 chmod 770 adm
 chmod 770 ven
 chmod 770 sec
 chmod 777 publico

## Visualizando as pastas
drwxr-x--x 1 carlos   GRP_ADM 512 Oct  9 15:13 adm
drwxrwxrwx 1 root     root    512 Oct  9 15:13 publico
drwxr-x--x 1 josefina GRP_SEC 512 Oct  9 15:13 sec
drwxr-x--x 1 debora   GRP_VEN 512 Oct  9 15:13 ven

# deletando tudo
## Pastas
rm -d -f adm
rm -d -f sec
rm -d -f ven
rm -d -f publico

## Usuarios

userdel -f carlos 
userdel -f maria 
userdel -f joao 
userdel -f debora 
userdel -f sebastiana 
userdel -f roberto
userdel -f josefina
userdel -f amanda 
userdel -f rogerio 

## Grupos

groupdel GRP_ADM
groupdel GRP_VEN
groupdel GRP_SEC