COPY vacinas
FROM 's3://dataops-impacta-dados-fernandosousa/vacinas.csv'
IAM_ROLE 'arn:aws:iam::735521398911:role/LabRole'
CSV
DELIMITER ';'
IGNOREHEADER 1
REGION 'us-east-1';