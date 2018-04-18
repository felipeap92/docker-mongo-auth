# This is the base image which determines from which Docker image the container should derive.
FROM mongo

MAINTAINER <Felipe de Assis Pinto> felipeap92@yahoo.com.br

#Copy scripts into the docker image.
ADD run.sh /run.sh
ADD set_mongodb_password.sh /set_mongodb_password.sh

#Changes scripts permissions to be executable.
RUN chmod +x /run.sh
RUN chmod +x /set_mongodb_password.sh

#Executes "run.sh" script.
CMD ["/run.sh"]