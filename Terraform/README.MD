### Desafio 01: Infrastructure-as-code - Terraform

#### Motivação
Recursos de infraestrutura em nuvem devem sempre ser criados utilizando gerenciadores de configuração, como Terraform, garantindo que todo recurso possa ser versionado e recriado de forma facilitada.

#### Objetivo
Criar uma instância t2.micro (AWS) Linux utilizando Terraform.
A instância deve ter aberta somente às portas 80 e 443 para todos os endereços
A porta SSH (22) deve estar acessível somente para um range /24.
Inputs: A execução do projeto deve aceitar dois parâmetros:
O IP ou range necessário para a liberação da porta SSH
A região da cloud em que será provisionada a instância
Outputs: A execução deve imprimir o IP público da instância

#### Extras
Pré-instalar o docker na instância que suba automaticamente a imagem do Apache, tornando a página padrão da ferramenta visualizável ao acessar o IP público da instância
Utilização de módulos do Terraform

### Instruções para execução
Todos os passos necessários para criação da instância estão no arquivo main.tf.
As informações abaixo são relevantes para a correta execução do processo:

#### Chave de Acesso
As credenciais de acesso à console do AWS precisam ser configuradas previamente, pois nenhuma informação sensível, como secret key ou access key, estão explicitamente configuradas no arquivo main.tf.

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
  * amis: mapeamento de imagens do sistema operacional Amazon Linx para as regiões suportadas.
#### Dados
  * aws_vpc: configuração feita para se usar sempre a VPC default da região selecionada.
  * template_cloudinit_config: template do cloud-init para com instruções a serem executadas no primeiro boot da instância.

A chave pública RSA para acesso à instância deve ser aplicada no recurso "aws_key_pair", ajustando-se o conteúdo da chave como valor para a chave "public_key".

O comando abaixo deve ser usado para a criação dos recursos:<br>
  > $ terraform apply -var region=<region> -var ssh_range=<ssh_cidr>
