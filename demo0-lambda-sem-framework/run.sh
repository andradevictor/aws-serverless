# 1º passo criar o arquivo de politicas de seguracao
# 2º criar role de seguranca na aws (iam)

aws iam create-role \
    --role-name lambda-exemplo \
    --assume-role-policy-document file://politicas.json    \
    | tee logs/role.log

# 3º criar arquivo com conteúdo e zipar
zip function.zip index.js

aws lambda create-function \
    --function-name hello-cli \
    --zip-file fileb://function.zip \
    --handler index.handler \
    --runtime nodejs14.x \
    --role arn:aws:iam::663566764760:role/lambda-exemplo \
    | tee logs/lambda-create.log

# 4º Invoke lambda
aws lambda invoke \
    --function-name hello-cli \
    --log-type Tail \
    logs/lambda-exec.log

# -- atualizar, zipar
zip function.zip index.js

aws lambda update-function-code \
    --zip-file fileb://function.zip \
    --function-name hello-cli \
    --publish \
    | tee logs/lambda-update.log

# remover
aws lambda delete-function \
    --function-name hello-cli

aws iam delete-role \
    --role-name lambda-exemplo