COPY vacinas
FROM 's3://dataops-dados-nomesobrenome/vacinas.csv'
IAM_ROLE 'arn:aws:iam::ID_CONTA:role/LabRole'
CSV
DELIMITER ';'
IGNOREHEADER 1
REGION 'us-east-1';