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

#### Instruções para execução
Todos os passos necessários para criação da instância estão no arquivo main.tf.
As informações abaixo são relevantes para a correta execução do processo:
  # VARIÁVEIS
    > region: variável de entrada que recebe uma região da AWS onde a instância será criada. Os valores permitidos são:
      ap-northeast-1 (Tokyo)
      ap-northeast-2 (Seoul)
      ap-south-1 (Mumbai)
      ap-southeast-1 (Singapore)
      ap-southeast-2 (Sydney)
      ca-central-1 (Canada)
      eu-central-1 (Frankfurt)
      eu-west-1 (Ireland)
      eu-west-2 (London)
      eu-west-3 (Paris)
      sa-east-1 (São Paulo)
      us-east-1 (N. Virginia)
      us-east-2 (Ohio)
      eu-north-1 (Stockholm)
      us-west-1 (N. Carolina)
      us-west-2 (Oregon)
    > ssh_range: variável de entrada que recebe
  # DADOS
  #
