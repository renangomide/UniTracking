# UniTracking

Este projeto é um sistema de controle de faltas desenvolvido com Next.js no front-end e Flask no back-end. Ele permite que professores registrem as faltas dos alunos e os alunos possam visualizar e contestar essas faltas.

## Pré-requisitos

Para rodar este projeto localmente, você precisará ter instalado:

- **Git** - Para clonar o repositório.
- **Node.js** - Para rodar o front-end (Next.js).
- **Python** - Para rodar o back-end (Flask).
- **npm** ou **yarn** - Para gerenciar os pacotes do Node.js.
- **pip** - Para instalar os pacotes do Python.

## Como rodar o projeto

Siga os passos abaixo para clonar e rodar o projeto na sua máquina:

### 1. Clonar o repositório

Abra o terminal e digite o seguinte comando para clonar o repositório:

```bash
git clone https://github.com/renangomide/UniTracking.git
```
### 2. Navegar para a pasta do projeto
Entre na pasta do projeto que foi clonada com o seguinte comando:

```bash
cd repo-do-projeto
```
### 3. Configuração do Front-end
Instalar as dependências
Na pasta raiz do projeto, execute o seguinte comando para instalar as dependências do front-end:

```bash
npm install

// Se preferir usar yarn

yarn install
```
Rodar o servidor de desenvolvimento do Next.js
Após instalar as dependências, inicie o servidor de desenvolvimento do Next.js com o comando:

```bash
npm run dev

// ou com yarn

yarn dev
```

O projeto será executado em modo de desenvolvimento. Abra o navegador e acesse http://localhost:3000 para visualizar a aplicação.

### 4. Configuração do Back-end
Instalar o ambiente virtual do Python
No diretório do projeto, crie um ambiente virtual para o Python:
```bash
python -m venv venv
```
Ative o ambiente virtual:
 Windows: 
```bash
venv\Scripts\activate
```
Mac/Linux:
```bash
source venv/bin/activate
```
Instalar as dependências do Flask
Com o ambiente virtual ativo, instale as dependências do Flask utilizando o pip:
```bash
pip install -r requirements.txt
```
Rodar o servidor Flask
Após instalar as dependências, inicie o servidor Flask com o comando:

```bash
flask run
```
O servidor Flask rodará em http://localhost:5000.

### 5. Acessar a Aplicação
Com ambos os servidores (front-end e back-end) rodando, acesse o projeto através do navegador em http://localhost:3000.

## Comandos Úteis:

-npm run dev / yarn dev: Inicia o servidor de desenvolvimento do Next.js.

-flask run: Inicia o servidor do Flask.

-npm install / yarn install: Instala as dependências do Node.js.

-pip install -r requirements.txt: Instala as dependências do Python.

## Tecnologias Utilizadas:

-Next.js para o front-end.

-Flask para o back-end.

-TypeScript para o front-end.

-Python no back-end.

