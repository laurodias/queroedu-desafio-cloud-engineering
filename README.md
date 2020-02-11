# Desafio Quero Educação - Cloud Engineering

### Como entregar estes desafios
Você deve realizar o fork deste projeto e fazer o push no seu próprio repositório e enviar o link como resposta ao recrutador que lhe enviou o teste, junto com seu LinkedIn atualizado.

A implementação deve ficar na pasta correspondente ao desafio. Fique à vontade para adicionar qualquer tipo de conteúdo que julgue útil ao projeto, alterar/acrescentar um README com instruções de como executá-lo, etc.

### Extras
- Descreva o processo de resolução dos desafios;
- Descreva como utilizar a sua solução;
- Sempre considerar melhores práticas como se fosse um ambiente de produção;

### Prazo
Você tem 5 dias após o recebimento do desafio para completa-lo.

#### Boa sorte

### Instruções para execução - Desafio 01
Todos os passos necessários para criação da instância estão no arquivo main.tf.
As informações abaixo são relevantes para a correta execução do processo:

#### Chave de Acesso
As credenciais de acesso à console da AWS precisam ser configuradas previamente, pois nenhuma informação sensível, como secret key ou access key, estão explicitamente configuradas no arquivo main.tf.

#### Variáveis
  * region: variável de entrada que recebe uma região da AWS onde a instância será criada. Os valores permitidos são:<br>
    ap-northeast-1 (Tokyo)<br>
    ap-northeast-2 (Seoul)<br>
    ap-south-1 (Mumbai)<br>
    ap-southeast-1 (Singapore)<br>
    ap-southeast-2 (Sydney)<br>
    ca-central-1 (Canada)<br>
    eu-central-1 (Frankfurt)<br>
    eu-west-1 (Ireland)<br>
    eu-west-2 (London)<br>
    eu-west-3 (Paris)<br>
    sa-east-1 (São Paulo)<br>
    us-east-1 (N. Virginia)<br>
    us-east-2 (Ohio)<br>
    eu-north-1 (Stockholm)<br>
    us-west-1 (N. Carolina)<br>
    us-west-2 (Oregon)<br>

  * ssh_range: variável de entrada que recebe um endereço de rede CIDR classe C (/24).
  * amis: mapeamento de imagens do sistema operacional Amazon Linux para as regiões suportadas.
#### Dados
  * aws_vpc: configuração feita para se usar sempre a VPC default da região selecionada.
  * template_cloudinit_config: template do cloud-init com instruções a serem executadas no primeiro boot da instância.

A chave pública RSA para acesso à instância deve ser aplicada no recurso "aws_key_pair", ajustando-se o conteúdo da chave como valor para a chave "public_key".

O comando abaixo deve ser usado para a criação dos recursos:<br>
  > $ terraform apply -var region=\<region\> -var ssh_range=\<ssh_cidr\>

#### Referências
##### Provider: AWS - Terraform by HashiCorp (https://www.terraform.io/docs/providers/aws/index.html)

### Instruções para execução - Desafio 02
O processo de building e deploy da aplicação se dá através do script runApp.sh. Como pré-requisito, o Kubernetes deve estar instalado e em execução. Após fazer o clone do repositório, acessar o diretório ./Kubernetes e executar o comando:
> ./runApp.sh

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
