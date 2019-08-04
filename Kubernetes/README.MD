### Desafio 02: Kubernetes

#### Motivação
Kubernetes atualmente é a principal ferramenta de orquestração e deployment de containers utilizado no mundo, práticamente tornando-se um padrão para abstração de recursos de infraestrutura.

Todos nossos serviços são containerizados e distribuídos em clusters para cada ambiente, sendo assim é importante que as aplicações sejam adaptáveis para cada ambiente e haja controle via código dos recursos kubernetes através de seus manifestos.

#### Objetivo
Existe um subdiretório app com um aplicação bem simples, seu objetivo é:

- Construir a imagem docker da aplicação
- Criar os manifestos de recursos kubernetes para rodar a aplicação (deployments, services, ingresses, configmap e qualquer outro que você considere necessário)
- Criar um script para a execução do deploy em uma única execução.
- A aplicação deve ter seu deploy realizado com uma única linha de comando em um cluster kubernetes local
- Todos os pods devem estar rodando
- A aplicação deve responder à uma URL específica configurada no ingress;

#### Extras
- Utilizar Helm HELM
- Divisão de recursos por namespaces
- Utilização de health check na aplicação
- Fazer com que a aplicação exiba seu nome ao invés de "Olá, candidato!"

#### Notas
Pode se utilizar o Minikube ou Docker for Mac/Windows para execução do desafio e realização de testes.

A aplicação sobe por default utilizando a porta 3000 e utiliza uma variável de ambiente $NAME

Não é necessário realizar o upload da imagem Docker para um registro público, você pode construir a imagem localmente e utilizá-la diretamente.

### Instruções para execução
O processo de building e deploy da aplicação se dá através do script runApp.sh. Como pré-requisito, o Kubernetes deve estar instalado e em execução. Após fazer o clone do repositório, acessar o diretório ./Kubernetes e executar o comando:
> ./runAs.sh

O script executará os seguintes passos:
1. Build de uma imagem baseada no node:slim conforme os arquivos no diretório ./app
2. Criar recurso para Ingress a partir de uma imagem do haproxy-ingress
3. Criar os recursos necessários para o deploy da aplicação: Deployment, Service e Ingress
4. Exibir a URL para acesso à aplicação

#### Arquivos
Além dos arquivos originais (app.js e package.json), os seguintes arquivos compõem a solução:
* runApp.sh: script para preparação do ambiente e deploy da aplicação
* queroedu-app.yaml: arquivo com as definições dos recursos do ambiente
* app/Dockerfile: arquivo docker com definições para o build da imagem

#### Referências
##### Docker Documentation - Dockerifle Reference (https://docs.docker.com/engine/reference/builder/)
##### Concepts - Kubernetes (https://kubernetes.io/docs/concepts/)
##### Inplementing an HAProxy Ingress Controller (https://www.haproxy.com/documentation/hapee/1-9r1/traffic-management/kubernetes-ingress-controller/)
