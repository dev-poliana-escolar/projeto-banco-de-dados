# projeto-banco-de-dados

> Nota: para utilizar o Docker sem instalá-lo em sua máquina, basta usar o codespaces do Github. Configure seu usuário no terminal e comece sua jornada.


### 1. Instalação Linux _vs_ Windows

1. Linux: 

    ```bash 
    sudo apt install docker.io
    docker --version   # verificar se instalou corretamente
    ```

    > Nota: Linux Mint (baseado em Ubuntu). Em outras distribuições, o comando de instalação pode variar.
2. Windows:\
    Basta realizar download no site:  https://www.docker.com/


## 2. Manual de utilização

1. Instalar o Docker Compose (Se não houver):

    ```bash 
    sudo apt install docker-compose-v2
    ``` 

2. Subir o container:

    ```bash
    sudo docker compose up -d 
    sudo docker compose stop #para fechar o container sem perder os dados.
    ```

3. Acessar o MySQL dentro do container:

    ```bash
    sudo docker exec -it projeto mysql -u root -p
    ``` 

4. Gerar  ou atualizar um **arquivo** .sql (backup com mysqldump):

    ```bash
    sudo docker exec projeto mysqldump -u root -p nome_database > nome_database.sql
    ``` 

5. **Importar** um arquivo .sql para dentro do container:

    > Se ele estiver dentro de uma pasta, entre nela antes de fazer o comando a seguir:

    ```bash
    sudo docker exec -i projeto mysql -u root -p nome_database < arquivo.sql
    ``` 

6. Salvar o historico de forma dinâmica em cada sessão:

    Utiliza-se comando tee:
    ```bash
    tee /tmp/logs/nome_da_sessao.log
    ``` 

    Encerrar gravação:
    ```bash
    notee
    ``` 
