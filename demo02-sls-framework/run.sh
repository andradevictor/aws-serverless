# instalar
npm install -g serverless

#sls inicializar
sls

#sempre fazer deploy antes de tudo para verificar se está tudo ok com o ambiente
sls deploy

#invocar na AWS
sls invoke -f hello

#invocar local
sls invoke local -f hello --log

#configurar dashboard
