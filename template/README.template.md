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

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a. Precisa ter maiúscula, minúscula e número, com pelo menos 8 caracteres

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b. Guarde essa senha para poder conectar no Redshift           

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

<img src="https://raw.github.com/fesousa/dataops-lab5/master/images/Imagem23.png" height='200'/>




<div class="footer">
    &copy; 2022 Fernando Sousa
    <br/>
    {{update}}
</div>