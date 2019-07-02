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
