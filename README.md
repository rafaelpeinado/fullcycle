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

volumes:
**As informações do Docker ficam no docker.sock**
Compartilhar o docker.sock do meu computador:para o contêiner
- /var/run/docker.sock:/var/run/docker.sock
E compartilhar o arquivo metricbeat.yml. Aqui vai pegar nosso arquivo e substituir o arquivo padrão do servidor
- ./beats/metric/metricbeat.yml:/usr/share/metricbeat/metricbeat.yml

Na tela principal no localhost:5601, entrar em Menu -> Observability -> Metrics -> View setup instructions -> 


### Uptime e Heartbeat

