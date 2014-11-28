### Learning Docker http://docker.io/ by creating a RabbitMQ container.

### To build:

	Spostarsi nella directory e lanciare il comando
    sudo docker build -t tornabene/ntipa-rabbitmq .
  
### To run:

    sudo docker pull tornabene/ntipa-rabbitmq
    sudo docker run -d --name rabbitmq.ntipa.it -p 5672:5672 -p 15672:15672 -p 1522:22  tornabene/ntipa-rabbitmq
    
### To persist your data:

Here we persistently save our data to the host machine's ``/opt/ntipa/rabbitmq`` directory.

    sudo mkdir -p /opt/ntipa/rabbitmq_data
    chmod 777 /opt/ntipa/rabbitmq_data
sudo docker run  --name rabbitmqamia -p 5672:5672 -p 15672:15672 -p 1522:22  -v /opt/ntipa/rabbitmq_data:/var/lib/rabbitmq/ntipa -d tornabene/ntipa-rabbitmq