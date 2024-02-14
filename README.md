# CURSOS FULLCYCLE
# Observabilidade
## O que é Observabilidade?
Na teoria de controle, a **observabilidade** é definida como uma media de quão bem os estudos internos de um sistema podem ser inferidos a partir do conhecimento das saídas externas desse sistema. Simplificando, observabilidade é quão bem você pode entender seu sistema complexo.

Fonte: https://newrelic.com/blog/best-practices/what-is-observability


## Observabilidade vs Monitoramento
O **monitoramento** e a **observabilidade** são diferentes, porém se complementam.


### Monitoramento
* Nos mostra que há algo de errado: o painel de controle alerta os problemas
* Se baseia em saber com **antecedência** quais sinais desejamos monitorar: quando estamos desenvolvendo um sistema, podemos entender o que é crítico ou não, o que devemos medir ou monitorar, para que quando algo comece a dar errado, podemos identificar antes da falha acontecer

**Obs:** quando falamos de monitoramento temos a oportunidade de encontrar os problemas com antecedência, a partir dos sinais apresentados.


### Observabilidade
* Nos permite perguntar o porquê: podemos deduzir o que está causando o problema a partir da observação do output


## Os 3 Pilares
### Métricas
São números claros e precisos

Por exemplo: o CPU está sendo consumido em 90%, x de memória livre, 10 pods no Kubernetes, x de espaço em disco.

Isso são métricas que são importantes e ajudam a guiar a parte de infraestrutura e aplicação, além de auxiliar no negócio.

#### Dois tipos principais
* métricas técnicas
* métricas de negócio

Citação: quem não mede, não gerencia


### Logs
Mostra o resultado de um determinado evento.

Por exemplo: temos 10 pods do Kubernetes e o sistema escala para 15 e apresenta vários erros. Depois os pods reduzem para 10 novamente. Se não tivermos logs, perdemos informações desses 5 pods que foram removidos.

Ajuda empresas na área de compliance, porém é necessário tomar cuidado com as informações que serão gravadas de acordo com o LGPD.


### Tracing
Ordem de como os eventos foram gerados, pois não adianta saber que temos um erro no momento de executar uma operação, senão sabemos quais foram as operações que aconteceram antes.

Um erro de forma isolada, muitas vezes não vai nos dizer nada, ou seja, tracing permite **rastreabilidade**, mostrando o passo-a-passo de um requisição que entrou até chegar ao output final que terminará em um log.


## Elastic Stack
### Introdução ao Elastic Stack
#### Voltando no Tempo
ELK Stack:
* **Elasticsearch:** é um search engine e analytics - ele analisa e busca os dados de forma muito rápida
* **Logstash:** processador de dados através de pipelines que consegue receber, transformar e enviar dados simultaneamente - os dados são enviados para o Elasticsearch
* **Kibana:** permite usuários a visualizarem os dados do elasticsearch em diversas perspectivas


#### Elasticsearch
* **Search engine e analytics:** uma vez que ele tem dados, ele consegue fazer busca de uma forma muito rápida. Trabalha com esquema de índices, os dados são um JSON e cada item desse consegue compor e fazer buscas, e com essas buscas é possível metrificar
* **Apache Lucene:** foi criado a partir do Apache Lucene. Ou seja, Apache Lucene é o motor principal
* **2010 - Elasticsearch N.V (Elastic):** é uma ferramenta madura e consolidada
* **Rápido**
* **Escalável** 
* **API Rest**
* **Análise e visualização geoespacial:** pode trabalhar com áreas e mapas
* **Application, website e enterprise search:** o que colocar nos índices do Elasticsearch, ele consegue trabalhar para fazer as buscas
* **Logging e analytics:** também faz analíses de logs. O **Kibana** tem uma área específica para fazer acompanhamento de logs
* **Trabalha de forma distribuída através de shards que possuem redudância de dados**
* **Pode escalar milhares de servidores e manipular petabyte de dados**


### Mais sobre Logstash
#### Logstash
* **Engine coletora de dados em tempo real:** pega dados de múltiplos lugares
* **Iniciou como manipulador de logs:** para trabalhar e organizar os dados e mandar para o Elasticsearch
* **Trabalha com pipelines**
* **Recebe dados de múltiplas fontes**
* **Normaliza e transforma dados:** em tempo real
* **Envia dados para múltiplas fontes**
* **Plugins:** tem uma séria de plugins - porém, tem sido usada cada vez menos


### Sobre o Kibana
#### Kibana
* **Ferramenta de visualização e exploração de dados** do Elasticsearch
* **Usada com:** Logs, Análise de séries, Monitoramento de aplicações e Inteligência operacional. Já tem integração com recursos de machine learning para fazer detecção de anomalias
* Tem a área do desenvolvedor
* **Integrado com Elasticsearch**
* **Agregadores e filtragem de dados**
* **Dashboards**
* **Gráficos interativos**
* **Mapas**

### Beats e Elastic Stack
#### Qual a diferença entre ELK Stack e Elastic Stack?
##### Beats
* Beats foi anunciado em 2015
* *Lightweight data shipper*: resumidamente é um integrador de dados leve
 * **Obs:** cada vez mais nós temos mais lugares para pegar informações e de todos os formatos. E, por padrão, o ELK Stack estava trabalhando apenas com o Logstash e ele dá trabalho.
* Agente Coletor de dados: o Beats pode pegar essas informações e mandar pro Logstash ou até mesmo diretamente para o Elasticsearch. 
 * **Obs:** raramente é mandado para o Logstash. E ele está caindo em desuso
* Integrado facilmente com Elasticsearch ou Logstash
* **São tipos de Beats:** Logs, Métricas, Network data, Audit Data, Uptime Monitoring
 * **Obs:** Se for pegar logs de um arquivo texto, é usado o **Filebeat**. Se quiser uma métrica, **Metricbeat**.
* Pode criar o próprio Beat

Ou seja, a diferença entre o ELK Stack e o Elastic Stack é que o Elastic Stack possui os Beats. 

**Camadas Elastic Stack**
-------- KIBANA -------
---- ELASTICSEARCH ----
-- BEATS -- LOGSTASH --

#### Elastic
* É o nome da empresa que está por trás das soluções - **Todas as soluções são Open Source**, porém existem alguns plugins que são licenciados pela Elastic.
* Cloud Solution
* Oferecem plugins e recursos licenciados
* Produtos: 
 * APM: Application Performance Monitoring (usado para observabilidade)
 * Maps
 * Site search
 * Enterprise search
 * App Search
 * Infrastructure


### Iniciando com Elasticsearch e Kibana
* [Elastic](https://www.elastic.co/pt/)
* [Github com Exemplos do Elastic](https://github.com/elastic/examples)

#### docker-compose.yml
São configurados dois serviços: Elasticsearch e Kibana
* Elasticsearch:
 * volumes: criamos uma pasta **elasticsearch_data** para ficar no nosso computador. Ou seja, toda vez que subir o Elasticsearch, não vamos perder os dados.
 * networks: criou uma rede de **observability**, pois depois teremos outra aplicação que precisará se comunicar com a mesma rede que o Elasticsearch para conseguir monitorar

* Kibana: 
 * environment: são variáveis de ambiente importantes: URL e HOST, que é onde o Kibana vai acessar os dados do Elasticsearch:
  * Obs: o  http://**elasticsearch**:9200 vem do nome do serviços e a porta padrão do Elasticsearch é o 9200 e o Kibana 5601

**docker-compose up -d** para subir os serviços
**docker logs elasticsearch** para ver os logs e se o elasticsearch já subiu
Entrar no **localhost:5601** para entrar no Kibana


### Para usuários Linux
Olá pessoal, tudo bem?

Nós modificamos as variáveis de ambiente do ElasticSearch no docker-compose.yaml, descrito na aula "Iniciando com Elasticsearch e Kibana", para ficar compatível com o ambiente Linux. As modificações estão no repositório

https://github.com/codeedu/fc2-observabilidade-elastic

Antes de executar o docker-compose up, crie a rede observability com o comando
```bash
$ docker network create observability 
```

Também é necessário criar a pasta elasticsearch_data no fc2-observabilidade-elastic na máquina local manualmente para evitar erro de permissionamento
```bash
$ mkdir elasticsearch_data
```

Na pasta /beats/metric execute o seguinte comando:
```bash
$ sudo chown root metricbeat.yml 
```

Caso ocorra o erro 
```
bootstrap check failure [1] of [1]: max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]
```

Execute o comando 
```bash
sysctl -w vm.max_map_count=262144
```

### Visão geral do Kibana
O Kibana já tem sessões específicas para tratar de Observabilidade, sendo eles:
* Logs
* Metrics
* APM: referente ao tracing - Application Performance Monitoring
* Uptime: coloca todos os serviços que queremos monitorar e fará HTTP Requests para esses serviços, dando ping, etc, para verificar se o serviço está online e caso não esteja, coloca alguns alertas.

O Kibana está mostrando o **Fleet** que é uma versão beta ainda e não pode ser usado em produção ainda (até o momento do vídeo)
**Fleet** garante que com um único **Beat** seja possível fazer tudo.

Se quiser saber se existe algum dado no Elasticsearch e vai na aba **Discover** do **Analytics**.

O Elasticsearch trabalha com índices. Esses índices vão gerando vários arquivos.
Devemos criar **index patterns** para que o Kibana possa percorrer esses arquivos.


### Metricbeat
Nos ajuda a ter uma visão geral de todas as métricas que conseguimos trabalhar

[Github Arquivo de Configuração Metricbeat](https://github.com/elastic/examples/blob/master/Reference/Beats/metricbeat.example.yml)

* Vamos usar o [metricbeat.yml](./elastic-stack/fc2-observabilidade-elastic/beats/metric/metricbeat.yml)
  * vamos pegar as informações dos módulos docker e do elasticsearch
  * no [docker-compose.yaml](./elastic-stack/fc2-observabilidade-elastic/docker-compose.yaml), na configuração do metricbeat precisamos usar o user root para conseguir acessar e ler o volume informado, além disso, o volumes iremos informar o docker da máquina local para o container, assim estaremos lendo o docker da máquina local

volumes:
**As informações do Docker ficam no docker.sock**
Compartilhar o docker.sock do meu computador:para o contêiner
- /var/run/docker.sock:/var/run/docker.sock
E compartilhar o arquivo metricbeat.yml. Aqui vai pegar nosso arquivo e substituir o arquivo padrão do servidor
- ./beats/metric/metricbeat.yml:/usr/share/metricbeat/metricbeat.yml

Para verificar se o dado está sendo enviado e adicionar essa métrica devemos ir em Home -> Add data -> Docker metrics -> Module status -> Check data

Em Metrics eu posso selecionar show Docker Containers e verificaremos o que está sendo executado no Docker


### Uptime e Heartbeat
* **Heartbeat:** Ajuda a monitorar se a aplicação está ou não de pé

[O que é ICMP?](https://aws.amazon.com/pt/what-is/icmp/)


### Configurando APM
* **Application Performance Monitoring (APM):** nos permite trabalhar com rastreabilidade

* [apm-server.yml](./elastic-stack/fc2-observabilidade-elastic/apm/apm-server.yml):
  * o parâmetro rum (Real User Monitoring) nos ajuda a gerar rastreabilidade do backend para o frontend


### APM na prática
[Get started with application traces and APM](https://www.elastic.co/guide/en/observability/current/traces-get-started.html)

* O RUM consegue associar a chamada do frontend com o backend

### Logs no APM
* [LOGGING](./elastic-stack/fc2-observabilidade-elastic/app/codeprogress/settings.py)


### Configurando nginx
**Filebeat:** passamos as URLs que queremos que faça o monitoramento e toda vez que tivermos uma modificação naquele conteúdo, ele manda para o ElasticSearch


### Configurando Filebeat
Os arquivos quando baixa o Filebeat tem o nome com final .disabled. Quando fazemos a ativação com filebeat modules enable nginx, igual no arquivo [entrypoint.sh](./elastic-stack/fc2-observabilidade-elastic/nginx/entrypoint.sh)


### Fazendo deploy na Elastic Cloud
[Elastic Cloud](https://www.elastic.co/pt/cloud)

### Configurando Filebeat na Elastic Cloud
É possível fazer a configuração pelo CloudID no arquivo do filebeat.yml no parâmetros cloud.id e cloud.auth e basta fazer o build da imagem do Docker e ele irá subir o dashboard no Kibana

### Integrando serviços na Elastic Cloud
É possível mandar alertas para Teams, e-mail, etc


## Prometheus
[Repositório do módulo](https://github.com/codeedu/fc2-prometheus)

### Prometheus
[Prometheus](https://prometheus.io/) é usado principalmente quando falado de Kubernetes

### Conceitos iniciais
* "From metrics to insight"
* Power your metrics and alerting with a leading open-source monitoring solution."

* "Prometheus é um toolkit de monitoramento e alerta de sistema open-source"
* Criado pela SoundCloud
* Faz parte da Cloud Native Computing Foundation

* **Dados dimensionais:** geralmente pegamos dados crus como "quantos acessos?", no Prometheus conseguimos informações com percentil, agrupamentos etc
* **Consultas poderosas**
* **Fácil visualização dos dados em conjunto com o Grafana:** Não visualizamos os dados do Prometheus, no Prometheus. usamos outros dashboards, como o Grafana
* **Storage eficiente**
* **Simples**
* **Alerta inteligente:** é possível encadear alerta
* **Diversidade de clients e integrações**

### Dinâmica de funcionamento
Uma forma de enviar os dados é:
* **Aplicação** tem um **Agent** que de tempos em tempos faz um **push** para o **Serviço Monitor**
  * Elastic Stack funciona assim

A outra:
* Temos um **Serviço Monitor** que de tempos em tempos faz um **pull** da **Aplicação** e esses dados são enviados
  * Prometheus funciona assim


### Prometheus vs pull
Prometheus --- pull via http a cada x segundos --> Aplicação (endpoint /metrics)
  * Temos que adaptar a aplicação ao formato do Prometheus


### Dinâmica dos exporters
Informações relevantes so negócio
* Quantidade de compras
* Tempo de resposta no processo de compra
* Quantidade de usuários logados
* Utilização de uma feature

Como fazer isso no 
* MySQL
* nginx ./ Apache
* Servidor Linux
* etc

#### Exportes
Prometheus --- pull via http a cada 15s --> Exporter (/metrics) -----> Server Linux
* 15s é um número arbitrário


### Arquitetura do Prometheus
[Architecture](https://prometheus.io/docs/introduction/overview/#architecture)
<img src="https://prometheus.io/assets/architecture.png">

O Prometheus server é separado em 3 principais componentes Retrieval, TSDB, HTTP Server
* **TSDB (principal):** Time series database é um componente onde faz o processo de armazenamento das informações no formato de séries e por isso é muito rápido para consulta.
* **Retrieval:** orquestra o processo de receber as informações que foram coletadas e mandar para o banco de dados do Prometheus.
* **HTTP Server**

* **Service Discovery:** por exemplo, quando um pod novo é criado, o Prometheus consegue acessar e pegar informações desse novo pod, isso evita a necessidade de ficar adicionando e removendo informações manualmente

* **Pushgateway:** supondo que uma aplicação não é executada a todo momento ou poucas vezes, os dados dessa aplicação são enviadas para o pushgateway e depois o Prometheus captura essas informações. 

* **Alertmanager:** O sistema de alertas tem que se conectar com o Prometheus


### Trabalhando com dados
#### Armazenamento
* TSDB (Time series Database)
* Armazenamento de dados que mudam conforme o tempo
* Labels para propriedade específicas de uma determinada métrica (error_type=500)
* Otimização específica para esse caso de uso, garantindo mais performance do que bancos de dados convencionais
* Quanto mais novos os dados, mais precisão

| Timestamp  | Erro 500 |
| :--------: | :------: |
| 1569419430 |    12    |
| 1569419436 |    15    |
| 1569419450 |    17    |

Para entender a tabela, não significa que 1569419430 teve 12 erros e 1569419436 15 erros, na verdade quer dizer que entre 1569419430 e 1569419436 teve mais 3 erros, pois o erro é cumulativo conforme o tempo


### Tipos de métricas
4 tipos de métricas

#### Counter
* Valor incremental
* Prometheus consegue absorver falhas no caso esse número tenha um eventual reset
* Exemplos:
  * Quantidade de visitas em um site
  * Quantidade de vendas
  * Quantidade de erros

#### Gauge
* Valor pode possuir variações com o tempo
* Aumentar / Diminuir / Estabilizar
* Exemplos:
  * Quantidade de usuários online
  * Quantidade de servidores ativos


### Histogram
* Distribuição de frequência
* Medicação é baseado em amostrar
* Consegue agregar valores

### Summary
* Muito similar ao histogram
* Com summary os valores são calculados no servidor da aplicação não no Prometheus
* Bom para aproximação de valores
* Ex: request duration
* De forma geral, é muito mais comum utilizar histogram


### PromQL
* Prometheus Query Language (SQL do Prometheus)
* Exemplo:
  * http_requests_total
  * rate(http_requests_total[5m])
  * http_requests_total{status!~"4..."}


### Tour no prometheus.io
[Documentação Prometheus](https://prometheus.io/)

### Executando prometheus pela primeira vez
[prometheus.yml](./prometheus/fc2-prometheus/prometheus.yml)

### Visão geral do dashboard padrão
* http://localhost:9090
* http://localhost:9090/targets (Status -> Targets)
* prometheus_http_requests_total
* prometheus_http_requests_total{handler="/metrics"}
* rate(prometheus_http_requests_total{handler="/metrics"}[5m])

### Utilizando cAdvisor
[cAdvisor](https://prometheus.io/docs/guides/cadvisor/)
* Container Advisor
* http://localhost:8080/containers/


### Apresentando o Grafana
* http://localhost:3000
* Home -> Connections -> Data sources -> prometheus
  * **Connection:** http://prometheus:9090
* [Grafana](https://grafana.com/)
* [Grafana Dashboards](https://grafana.com/grafana/dashboards/?search=cadvisor)
  * Copiar o ID do Dashboard
  * http://localhost:3000/dashboard/import

Podemos alterar a Query clicando em edit no gráfico do Dashboard


### Preparando ambiente Golang
go mod init github.com/codeedu/fc2-prometheus
docker exec -it app bash

### Criando métrica do tipo Gauge
go run main.go
curl localhost:8181/metrics

### Trabalhando com Counter
[main.go](./prometheus/fc2-prometheus/main.go)

### Criando histogram
[main.go](./prometheus/fc2-prometheus/main.go)

### Ativando novo target no Prometheus
Inserir novo job no [prometheus.yml](./prometheus/fc2-prometheus/prometheus.yml)


### Criando dashboard usando Gauge
Home do Grafana -> Dashboard -> New Dashboard -> Add visualization
Metric goapp_online_users
Thresholds - para definir limites


### Adicionando painel Counter
Painel do tipo Stat


### Painel com Histogram
for i in {1..10}; do curl localhost:8181/contact; done

goapp_http_request_duration_bucket{le="+Inf"}
* **le:** less or equal
* **+Inf:** até o valor máximo

em Legend trocar por custom e escrever {{handler}} para aparecer o nome do handler


### Configurando alerta no Grafana
Home do Grafana -> Alerting -> Contact points -> Add contact point

No Telegram iniciar uma conversa com o BotFather
https://api.telegram.org/bot<id>/getUpdates

### Disparando alarmes
No dashboard, editar o painel e ir em alerta
