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

3.	Clique no botão  <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem2.png" height='25'/>

4.	Na tela de criação do cluster preencha os seguintes campos:

    4.1.	`Cluster identifier`: `dataops-impacta-cluster`

    4.2.	Selecione a opção `Production`

    <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem3.png" height='130'/>
 
    4.3.	Em <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem6.png" height='25'/> selecione <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem4.png" height='25'/>

    4.4.	Em <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem7.png" height='25'/> coloque <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem5.png" height='25'/>

    4.5.	Na seção <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem8.png" height='25'/> coloque uma senha no campo <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem63.png" height='25'/>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a. Precisa ter maiúscula, minúscula e número, com pelo menos 8 caracteres

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b. Guarde essa senha para poder conectar no Redshift           

5.	Abra a seção <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem9.png" height='25'/>

    5.1.	Em <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem10.png" height='25'/> selecione <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem11.png" height='25'/>

    5.2.	Clique em <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem12.png" height='25'/>

6.	Em  <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem13.png" height='25'/>  desmarque a opção <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem14.png" height='25'/>

<img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem15.png" height='70'/>
 

7.	Abra e seção <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem16.png" height='25'/> que apareceu

8.	Configure a opção <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem17.png" height='25'/> para  <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem18.png" height='25'/>
 
<img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem19.png" height='100'/>

9.	Clique em <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem20.png" height='25'/>

    9.1.	Se receber a mensagem de erro `Vpc associated with db subnet group does not exist`, crie um primeiro cluster com a opção <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem21.png" height='25'/>  de <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem22.png" height='25'/> habilitada, e depois crie um novo cluster com as configurações do lab. O primeiro cluster pode ser deletado.

10.	Veja o cluster sendo criado na tela

<img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem23.png" height='170'/>

11.	O cluster estará disponível quando a coluna `Status` mostrar `Available`. Enquanto isso, vamos configurar o acesso e baixar o cliente SQL

## Configurar o grupo de segurança (security group)

O grupo de segurança utilizado no cluster (default) não possibilita o acesso de fora da AWS. Vamos configurá-lo para permitir o acesso de qualquer local

1.	Procure na barra superior pelo serviço `VPC` e clique no serviço para abrir

2.	Na tela da VPC, clique na opção <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem64.png" height='25'/> no menu lateral esquerdo

3.	Na lista de Security Groups mostrada, selecione o item que tem a coluna <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem65.png" height='25'/> com o valor `default`

<img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem24.png" height='170'/>
 
4.	Na parte inferior, abra a aba <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem25.png" height='25'/>

5.	Clique em <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem26.png" height='25'/>

6.	Na nova tela, clique em <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem27.png" height='25'/> para inserir uma nova regra
 

<img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem28.png" height='170'/>

7.	Na segunda regra (recém adicionada) configure:

    7.1. Type: <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem29.png" height='25'/>

    7.2. Source: <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem30.png" height='25'/>. Essa regra permite a conexão no Redshift (TCP na porta 5439) de qualquer lugar (0.0.0.0/0)
    
    7.3. Clique em <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem31.png" height='25'/>

## Conectar no Redshift com um cliente SQL


1.	Acesse [https://dbeaver.io/download](https://dbeaver.io/download), baixe e instale o software DBeaver compatível com seu sistema operacional. DBeaver é um software cliente para bancos de dados que consegue conectar com diferentes bancos de dados SQL e NoSQL

2.	Abra o DBeaver instalado

<img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem32.png" height='350'/>

3.	Feche a janela `Tip of the day`

4.	Uma nova janela para criar uma conexão será aberta (`Connect to a database`). Caso não veja a janela, clique em <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem33.png" height='25'/>

<img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem34.png" height='350'/>

5.	Na janela `Connect to a database` comece a escrever `Redshift` no campo de pesquisa para filtrar, selecione a opção do Redshift e depois em <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem35.png" height='25'/>

<img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem36.png" height='350'/>

6.	Volte ao console da AWS e verifique se o cluster já está disponível (<img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem37.png" height='25'/>). Caso ainda não esteja, aguarde mais um pouco. Você pode clicar em <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem38.png" height='25'/> para atualizar o status. Quando estiver disponível, faça o seguinte:

    6.1. Clique no nome do cluster para abrir as configurações (link na primeira coluna da lista de clusters)

    <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem39.png" height='280'/>

    <img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem40.png" height='350'/>

<div class="footer">
    &copy; 2022 Fernando Sousa
    <br/>
    
Last update: 2022-03-20 17:55:24
</div>