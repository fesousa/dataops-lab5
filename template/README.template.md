# DataOps - Laboratório 5

Armazenamento com Redshift

As instruções do laboratório estão em português. Para alterar o idioma, procure a opção na barra inferior do console AWS.


## Objetivos

*   Criar um banco de dados de Data Warehouse no RedShift 
*   Carregar dados no RedShift a partir do S3
*   Consultar dados usando um cliente SQL



## Arquitetura da solução

<img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem1.png" width='100%'/>


## Criar um Cluster no Amazon Redshift

1.	Acesse seu ambiente da AWS

2.	Procure na barra superior pelo serviço `Redshift` e clique no serviço para abrir

3.	Clique no botão  <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem2.png" height='25'/> (talvez precise rolar a página um pouco para baixo)

4.	Na tela de criação do cluster preencha os seguintes campos:

    4.1.	`Identificador do cluster`: `dataops-cluster`

    4.2.	Em <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem6.png" height='25'/> selecione <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem4.png" height='25'/>

    4.3.	Em <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem7.png" height='25'/> coloque <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem5.png" height='25'/>

    4.3.	Na seção <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem8.png" height='25'/> coloque uma senha no campo <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem63.png" height='25'/>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a. Precisa ter maiúscula, minúscula e número, com pelo menos 8 caracteres

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b. Guarde essa senha para poder conectar no Redshift           

5.	Na seção <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem9.png" height='25'/>

    5.1. Clique em <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem10.png" height='25'/> 
    
    5.2. Selecione <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem11.png" height='25'/>

    5.3. Clique em <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem12.png" height='25'/>

6. Clique em <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem20.png" height='25'/>


7.	Veja o cluster sendo criado na tela

<img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem23.png" width='100%'/>

8.	O cluster estará disponível quando a coluna `Status` mostrar `Available`.

9. Quando o cluster estiver disponível (`Available`), selecione o checkbox na linha do clister criado

<img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem67.png" width='100%' />

10. Clique em <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem68.png" height='25'/> na parte superior da tabela e depois em <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem69.png" height='25'/>

    10.1. Se não estiver habilitado, atualize a página

11. Na nova janela, selecione `Ativar recurso Publicamente acessível` e depois em <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem70.png" height='25'/>

<img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem71.png" height='300'/>



## Configurar o grupo de segurança (security group)

O grupo de segurança utilizado no cluster (default) não possibilita o acesso de fora da AWS. Vamos configurá-lo para permitir o acesso de qualquer local

1.	Procure na barra superior pelo serviço `VPC` e clique no serviço para abrir

2.	Na tela da VPC, clique na opção <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem64.png" height='25'/> no menu lateral esquerdo

3.	Na lista de grupos de segurança mostrada, selecione o item que tem a coluna <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem65.png" height='25'/> com o valor `default`

<img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem24.png" width='100%' />
 
4.	Na parte inferior, abra a aba <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem25.png" height='25'/>

5.	Clique em <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem26.png" height='25'/>

6.	Na nova tela, clique em <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem27.png" height='25'/> para inserir uma nova regra
 

<img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem28.png" width='100%'/>

7.	Na segunda regra (recém adicionada) configure:

    7.1. Tipo: <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem29.png" height='25'/>

    7.2. Origem: <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem30.png" height='25'/>. Essa regra permite a conexão no Redshift (TCP na porta 5439) de qualquer lugar (0.0.0.0/0)
    
    7.3. Clique em <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem31.png" height='25'/>

## Conectar no Redshift com um cliente SQL


1.	Acesse [https://dbeaver.io/download](https://dbeaver.io/download), baixe e instale o software DBeaver compatível com seu sistema operacional. DBeaver é um software cliente para bancos de dados que consegue conectar com diferentes bancos de dados SQL e NoSQL

2.	Abra o DBeaver instalado

<img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem32.png" width='100%'/>

3.	Feche a janela `Tip of the day`

4.	Uma nova janela para criar uma conexão será aberta (`Connect to a database`). Caso não veja a janela, clique em <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem33.png" height='25'/> no canto superior esquerdo

<img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem34.png" height='350'/>

5.	Na janela `Connect to a database` comece a escrever `Redshift` no campo de pesquisa para filtrar, selecione a opção do Redshift e depois em <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem35.png" height='25'/>

<img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem36.png" height='350'/>

6.	Volte ao console da AWS e verifique se o cluster já está disponível (<img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem37.png" height='25'/>). Caso ainda não esteja, aguarde mais um pouco. Você pode clicar em <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem38.png" height='25'/> para atualizar o status. Quando estiver disponível, faça o seguinte:

    6.1. Clique no nome do cluster para abrir as configurações (link na primeira coluna da lista de clusters)

    <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem39.png" width='100%'/>

    <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem40.png" width='100%'/>

    6.2. Em <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem41.png" height='25'/> procure por <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem66.png" height='25'/> e clique em <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem42.png" height='25'/> para copiar a localização do cluster. Você deve copiar algo parecido com o seguinte: `dataops-cluster.cicvf35nr49i.us-east-1.redshift.amazonaws.com:5439/dev`

7.	Volte para o DBeaver, na tela de configuração de conexão (Connection Settings) e configure o seguinte:

    <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem43.png" height='380'/>

    7.1. Host/Instance: localização do cluster copiada no passo anterior, até antes do `:`. Deve ser algo parecido com o seguinte: `dataops-cluster.cicvf35nr49i.us-east-1.redshift.amazonaws.com`

    7.2. Password: Senha criada para o cluster na primeira parte deste laboratório

    7.3. Clique em <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem44.png" height='25'/> para testar as configurações. Você deve receber uma mensagem parecida com essa:

    <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem45.png" height='350'/>
 
    7.4. Clique em <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem46.png" height='25'/> para fechar a mensagem

    7.5. Clique em <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem47.png" height='25'/>

    7.6. Se tiver problemas para conectar, verifique os passos novamente, principalmente em relação ao grupo de segurança, a permissão para acesso público e a senha criada. Se o problema ainda persistir, tente criar novamente o cluster com outro nome ou reiniciar a ssenha (procure a opção no Redshift).

8.	Você verá a conexão criada ao lado esquerdo. Clique na seta ao lado do nome da conexão para conectar

<img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem48.png" height='350'/>


## Importar dados do S3

1.	No DBeaver, clique com o botão direito no banco de dados `dev` na conexão criada anteriormente e selecione a opção `SQL Editor` --> `Open SQL script`.

<img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem49.png" height='350'/>

2.	Uma nova área será aberta a direita para escrever scripts SQL

3.	Crie uma nova tabela para receber os dados de vacinas, executando o seguinte script:


```sql
${code/vacinas.sql}
```

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.1.Para executar no DBeaver, clique em <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem51.png" height='25'/> ao lado esquerdo do script. Você deve receber um resultado parecido com o seguinte abaixo do script:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem52.png" height='350'/>


5.	O próximo passo é importar os dados do arquivo CSV que coletamos no último lab e incluímos no S3

6.	Abra uma nova aba de script no DBeaver

7.	Execute o seguinte script:

```sql
${code/import.sql}
```

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7.1. Lembre-se de trocar:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * `nomesobrenome` pelo seu bucket (criado no [Laboratório 1](https://github.com/fesousa/dataops-lab1))

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * `ID_CONTA` pelo id da sua conta da AWS

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * `input/vacinas.sql` por um arquivo que exista no S3

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7.2. O Comando COPY é um comando do Redshift que faz a cópia de um arquivo de dados ou do DynamoDB para uma tabela do Redshift. A sintaxe básica é:

```sql
${code/copy.sql}
```

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;No exemplo foi colocado para autorização o IAM Role 'arn:aws:iam::ID_CONTA:role/LabRole' (mesmo que foi associado ao cluster Redshift).

Para os parâmetros utilizamos:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*	CSV: formato do arquivo

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*	DELIMITER `;`: caractere (;) delimitador das colunas no arquivo CSV

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*	IGNOREHEADER 1: ignorar a primeira linha (cabeçalho)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*	REGION `us-east-1``: região do Bucket e do Redshift

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7.3.Se a importação obtiver sucesso, você deve receber um resultado parecido com este:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem53.png" height='350'/>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7.4.Se acontecer algum erro, faça as seguintes verificações:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*	Verifique se as colunas da tabela criada estão de acordo com o que está no arquivo CSV do S3. Pode ter acontecido alguma alteração no padrão do arquivo, e precisa ser acertado no comando `CREATE TABLE`. Se houver diferença, remova a tabela e crie novamente com os campos corretos

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*	Para saber detalhes do erro, abra uma nova aba de consulta e consulte a tabela de erros: `select * from stl_load_errors`


 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7.5. Agora você pode fazer consultas SQL na tabela vacinas do Redshift

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7.6. Por exemplo, abra um novo script SQL e conte a quantidade de vacinas aplicadas por sexo biológico

```sql
${code/count_vacinas.sql}
```

## Executar queries no Console do Amazon Redshift

1.	Volte ao console do Redshift na AWS

2.	No menu lateral, clique em `Editor de consultas v2`

<img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem54.png" height='500'/>
 
3. Clique no seu cluster, na lateral esquerda, para conectar

<img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem72.png" width='100%'/>

4.	Na janela de configuração da conexão configure:

    4.1. Selecione `Temporary credentials`

    4.2. User name: awsuser

    4.3. Clique em <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem56.png" height='25'/>

5.	Utilize o editor de texto ao lado direito para executar consultas e instruções SQL. Por exemplo: `select * from vacinas`


## Faça você mesmo
1.	Execute a coleta de dados do [Laboratório 4](https://github.com/fesousa/dataops-lab4) novamente para poder atualizar os dados do Acre (AC). Pegue os dados mais recentes e completos em ]https://opendatasus.saude.gov.br/dataset/covid-19-vacinacao/resource/5093679f-12c3-4d6b-b7bd-07694de54173](https://opendatasus.saude.gov.br/dataset/covid-19-vacinacao/resource/5093679f-12c3-4d6b-b7bd-07694de54173)

2.	Execute mais uma vez a coleta de dados do [Laboratório 4](https://github.com/fesousa/dataops-lab4), agora para coletar os dados de Tocantins (TO), que está neste link: [https://opendatasus.saude.gov.br/dataset/covid-19-vacinacao/resource/5093679f-12c3-4d6b-b7bd-07694de54173](https://opendatasus.saude.gov.br/dataset/covid-19-vacinacao/resource/5093679f-12c3-4d6b-b7bd-07694de54173)

3.	Faça a importação para o Redshift novamente para os dois arquivos (AC e TO). Lembre-se de remover os registros anteriores do Redshift para não duplicar

4.	Execute algumas consultas para verificar se os dados foram importados corretamente.

## Finalização do Laboratório e Pausar Cluster Redshift

2.	Quando finalizar, lembre-se de pausar o cluster para não gastar recursos. O cluster Redshift tem um custo alto.

    2.1. Volte a lista dos clusters (Clique em Clusters no lado esquedo)

    2.2. Selecione o cluster criado em aula

    2.3. Clique em `Ações` e então em `Pausar`

    2.4. Na nova tela, clique em `Pausar agora`

    2.5. Verifique se o cluster foi pausado




<div class="footer">
    &copy; 2023 Fernando Sousa
    <br/>
    {{update}}
</div>