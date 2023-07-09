# Arquitetura Hexagonal
## Introdução a Arquitetura Hexagonal
### Introdução
Arquitetura Hexagonal ou Ports and Adapters Architecture
Há duas complexidades: de Negócio e Técnica (não podemos misturar os dois problemas, pois quando desenvolvemos código, precisamos proteger o negócio colocando limites muito claros do que é problema de negócio para que a complexidade técnica não invada o negócio. Essa separação permite trocar a complexidade por outra solução sem impactar o negócio).

### Ciclo de um projeto
#### Pontos importantes sobre arquitetura
Só trabalhamos com arquitetura de software, pois precisamos manter a qualidade daquilo que está sendo desenvolvido e garantir:
* **Crescimento sustentável:** conforme estamos desenvolvendo software conseguimos garantir que o software seja melhorado sem retrabalho e sem débitos técnicos e gerar valor
  * O débito técnico é um conceito no desenvolvimento de software utilizado para representar o custo implícito de uma implementação ou solução pensada somente no agora, elaborada para suprir demandas atuais, em vez fazer uso de uma abordagem de melhor qualidade.
* **Software precisa se pagar ao passar do tempo:** pois a emprega paga um software para que este retorne mais valor conforme o tempo for passando
* **Software deve ser desenvolvido por pessoas e não pelo framework usado:** isso gera dependência da framework e não pensa no problema
* **Peças precisam ser encaixar e eventualmente substituídas:** conseguir trocar peças sem quebrar todo o software. isso só é possível se o software for bem desenhado.

**LEMBRE-SE! Arquitetura diz respeito com o futuro do software.**

#### Ciclo de vida de muitos projetos
Abaixo a fases são mera simulações de uma solução
##### Fase 1
* Escolhe o banco de dados
* Faz os cadastros da aplicação
* Faz validações
* Cria um servidor web
* Cria controllers (MVC ou outros)
* Views: como vai mostrar os dados
* Autenticação
* Upload de arquivos
Qualquer framework pode resolver isso, pois a maioria do projeto é CRUD com algumas validações.

##### Fase 2
* Adicionar Regras de negócio
* Criação de APIs (talvez para disponibilizar para algum parceiro)
* Consumo de outras APIs
* Autorização (ACL: Access Control List)
* Gerar Relatórios
* Guardar Logs

##### Fase 3
* Mais acessos
* Upgrade de hardware
* Criação de Cache
* API parceiros
* Regras de terceiros
* Relatórios

##### Fase 4
* Mais acessos
* Upgrade de hardware
* BD (Banco de Dados) de relatórios (podem gerar gargalos)
* Comandos para gerar relatórios ou exportar informações
* V2 da API

##### Fase 5
* Escala horizontal
* Sessões (ficavam na mesma máquina e terá que gerar Sessões externas)
* Uploads (em máquinas diferentes também ou em um nuvem, por exemplo, e migrar os uploads antigos e ter regras de assinatura)
* Refatoração para escalar horizontalmente
* Autoscaling
* CI/CD: pipeline de integração contínua e deploy contínuo

##### Fase 6
* GraphQL (dar mais poder ao front-end e gerar APIs a partir de GraphQL)
  * GraphQL é uma linguagem de consulta e ambiente de execução voltada a servidores para as interfaces de programação de aplicações (APIs) cuja prioridade é fornecer exatamente os dados que os clientes solicitam e nada além.
* Bugs constantes (pois está mudando os formatos)
* Logs (os logs estão gravadas em máquinas diferentes e podemos perder logs)
* Integração CRM
  * CRM é a sigla usada para Customer Relationship Management e se refere ao conjunto de práticas, estratégias de negócio e tecnologias focadas no relacionamento com o cliente.
* Migração para React

##### Fase 7
* Inconsistência CRM: ou seja, realizamos uma venda no check out do produto, vamos registrar no CRM, mas por algum problema de comunicação os dados nao foram registrados. Pode ser por indisponibilidade do CRM ou a aplicação não mandou corretamente ou problema temporário na rede.
* Migração para Containers
* Ao migrar para Container precisamos repensar o CI/CD
* Memória (container começa a cair por problemas de memória)
* Logs (pegar logs dos containers)
* Se livrar do legado

##### Fase 8
* Microsserviços
* DB compartilhado (comunicação de microsserviços)
* Problemas com tracing (um microsserviço acessou outro que acessou outro que deu problema na aplicação e não conseguimos identificar o responsável por isso)
* Lentidão (pois existe dupla latência)
* Custo elevado

##### Fase 9
* Kubernetes
* Reformulação do CI/CD
* Mensageria (filas)
* Perda de mensagens
* Contratar Consultorias

As fases são uma breve comparação de como os sistemas são desenvolvidos. E as vezes os problemas não são os DEVs, mas sim o planejamento de arquitetura.

### Reflexões importantes
#### Principais problemas
* **Falta visão de futuro:** sempre pensar que o sistema pode crescer
* **Limites bem definidos:** por exemplo, a framework não se misture com banco de dados ou que os problemas técnicos não se misture com as regras de negócio
* **Troca e adição de componentes:** não ser capaz de adicionar ou trocar alguns componentes, pode significar que o sistema está bem acoplado
* **Escala:** não pensar em questões de escalabilidade, principalmente horizontalmente e isso deve ser pensado desde o começo do planejamento e desenvolvimento
* **Otimizações frequentes:** necessidades de novas features e estes podem gerar débitos técnicos
* **Preparado para mudanças:** principalmente mudanças bruscas, por exemmplo, a empresa trocou a gateway de pagamento e conseguimos chavear um endpoint para um GraphQL ou mudanças de CRM. Quando atingimos essa maturidade geramos **camadas anticorrupção**, que são mudanças que não afetam o negócio


#### Reflexões
* Está sendo doloroso para o developer? (atualiza um software ou que este continue sendo desenvolvido?)
* Os problemas poderiam ter sido evitados? 
* O software está se pagando? (mesmo com todas essas mudanças?)
* Será que a relação com o cliente está boa? (durante todo o processo)
* Cliente terá prejuízo com a brusca mudança arquitetural? (por exemplo, com mudança para microsserviços. O orçamento pode triplicar. Modernidade nem sempre é importante)
* Em qual momento tudo se perdeu? (em que parte do processo? Geralmente a perda é diária)
* Se uma pessoa nova entrasse na equipe, esta pessoa julgaria os deves que fizeram tudo isso? (a culpa nem sempre é do dev)


### Arquitetura vs Design de software
#### Arquitetura vs Design
[Citação de Elemar Júnior](https://eximia.co/quais-sao-as-diferencas-entre-arquitetura-e-design-de-software/)
"Atividades relacionadas a arquitetura de software são sempre de design. Entretanto, nem todas atividade de design são sobre arquitetura. O objetivo primário da arquitetura de software é garantir que os atributos de qualidade, restrições de alto nível e os objetivos do negócio, sejam atendidos pelo sistema. Qualquer decisão de design que não tenha relação com este objetivo não é arquitetural. Todas as decisões de design para um componente que não sejam “visíveis” fora dele, geralmente, também não são."

Sendo assim, arquitetura está em um nível mais alto que design.

**SOLID:** são regras de design de software: ou seja, como fazer no momento que estamos criando uma classe, como vamos fazer para ela ter uma úncia responsabilidade, como trabalhar com injeção de dependências. E isso não tem nada a ver com software.

Algumas vezes algumas decisões de design podem impactar nas decições arquiteturais.

Arquitetura é uma visão abstrata. Além disso, faz garante a entrega do software com qualidade.
Design normalmente é padronizar como resolver um problema e funcionar, por exemplo, como usar um laço for.

### Apresentando arquitetura Hexagonal
#### Arquitetura Hexagonal ou "Ports and Adapters"
[Citação de Cockburn](https://alistair.cockburn.us/hexagonal-architecture/)
Allow an application to equally be driven by users, programs, automated test or batch scripts, and to be developed and tested in isolation from its eventual run-time devices and databases.

Ou seja, podemos criar um software que consigamos isolar os sistemas, pessoas, scripts e comandos possam acessar esse software e como esse software possa acessar eventos externos.

**Obs.:** opinião pessoal do curso: o termo "Arquitetura" Hexagonal está mais ligado com deciões de design de software do que necessariamente com arquitetura.

A aplicação no centro tem vários adapters e esses adapters têm conexões com **objetos externos**. Os objetos externos podem ser uma aplicação, um usuário, entre outros. Ou seja, a aplicação acessa o adaptador e o adaptador acessa a aplicação. 

A maior parte do problema é que a maioria das coisas viram uma coisa só. O banco de dados está dentro da aplicação, uma outra aplicação fica dentro da aplicação, as telas de usuário e etc.

Na arquitetura hexagonal nós criamos portas para acessar os adaptadores externo a minha aplicação para comunicar com a aplicação.

### Dinâmica da arquitetura
* **Definição de limites e proteção nas regras da aplicação:** define complexidade de negócio e separa da complexidade técnica, definindo limites muito claros
* **Componentização e desacoplamento:** garante troca de componentes com facilidade
**Podemos componentizar:**
  * Logs
  * Cache
  * Upload
  * Banco de Dados
  * Comandos
  * Filas
  * HTTP / APIs / GraphQL
* **Facilidade na implantação de microsserviços:** uma vez que os sistemas monolíticos com uma separação muito clara é muito mais fácil quebrar esse sistema em outros sistemas, pois é tudo desacoplado

#### Lógica Básica 
Cliente (esquerdo) -> Aplicação (centro) -> Servidor (direito)
**Aplicação:** a complexidade de negócio fica no centro do hexágono
**Cliente:** qualquer coisa que queira acessar a aplicação, ou seja, pode ser um command-line interface (CLI), web server, gRPC, Kafka, RabbitMQ, entre outros
  * O **gRPC** é uma estrutura de código aberto e alto desempenho criada pelo Google. O gRPC segue amplamente a semântica HTTP sobre HTTP/2 e, assim permite que você use o streaming full-duplex, possibilitando a comunicação entre diferentes sistemas via conexão de rede. 
  * **RabbitMQ** é um servidor de mensageria de código aberto (open source) desenvolvido em Erlang, implementado para suportar mensagens em um protocolo denominado Advanced Message Queuing Protocol (AMQP). Ele possibilita lidar com o tráfego de mensagens de forma rápida e confiável, além de ser compatível com diversas linguagens de programação, possuir interface de administração nativa e ser multiplataforma.
**Servidor:** banco de dados, Redis, Filesystem, Lambda, infraestrutura etc

* [Imagem sobre Lógica Básica](https://github.com/rafaelpeinado/fullcycle/tree/feature/arquitetura-hexagonal/assets/logica-basica-1.png)

* [Imagem exemplo sobre Arquitetura Hexagonal e Interfaces](https://github.com/rafaelpeinado/fullcycle/tree/feature/arquitetura-hexagonal/assets/logica-basica-2.png)

* [Imagem exemplo Prático sobre Arquitetura Hexagonal e Interfaces](https://github.com/rafaelpeinado/fullcycle/tree/feature/arquitetura-hexagonal/assets/logica-basica-3.png)


#### Dependency Inversion Principle
É princípio do SOLID chamado Princípio de Inversão de Dependência que garante a separação dos ambientes conforme exemplos acima.

* Módulos de alto nível não devem depender de módulos de baixo nível. Ambos devem depender de abstrações.
* Abstrações não devem depender de detalhes. Detalhes devem depender de abstrações.

Ou seja, o acomplamento não deve existir de uma forma forte. Nâo podemos desenvolver uma aplicação de baixo nível que seja dependente do adaptador. Essa aplicação deve depende de uma abstração e essa abstração interage com o adapatador.

Toda vez que temos uma classe que for instanciada dentro de outra classe, nós geramos um acoplamento forte. A inversão que fazemos é uma inversão de controle. Ou seja, a classe que vai utilizar a classe que seria instanciada recebe essa classe no construtor e, desta forma, pode utilizar a classe injetada, mas essa classe não pode ser uma classe concreta no construtor. Então no construtor é injetada a Interface.

### Hexagonal vs Clean vs Onion
#### Observações
* Na Arquitetura Hexagonal não há padrão estabelecido de como o código deve ser organizado
* Clean Architecture não é a mesma coisa que a Arquitetura Hexagonal, mas seguem o mesmo critério que é seperar o centro (interna) da aplicação da parte externa.
* A principal diferença entre Clean, Onion e Hexagonal é que eles definem quais são as camadas que devem ser utilizadas na parte interna e externa.
* Clean e Onion vieram depois da Hexagonal
* A Hexagonal não define o centro, só a ideia do princípio de fazer a separação 



