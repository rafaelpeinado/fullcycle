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









