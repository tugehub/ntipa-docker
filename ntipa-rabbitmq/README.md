### Learning Docker http://docker.io/ by creating a RabbitMQ container.

### To build:

	Spostarsi nella directory e lanciare il comando
    `sudo docker build -t tornabene/ntipa-rabbitmq .`
  
### To run:

    `sudo docker run -d --name rabbitmq.ntipa.it -p 5672:5672 -p 15672:15672 -p 1522:22  tornabene/ntipa-rabbitmq`
    
### To persist your data:

Here we persistently save our data to the host machine's 

 `sudo mkdir -p /opt/ntipa/rabbitmq_data`
 `sudo mkdir -p /opt/ntipa/rabbitmq_log`
 `sudo chmod 777 /opt/ntipa/rabbitmq_data`
 `sudo chmod 777 /opt/ntipa/rabbitmq_log`
    
    -v /opt/ntipa/rabbitmq_log:/data/log -v /opt/ntipa/rabbitmq_data:/data/mnesia
    
`sudo docker run -ti -p 5672:5672 -p 15672:15672 -p 1522:22   -v /opt/ntipa/rabbitmq_log:/data/log -v /opt/ntipa/rabbitmq_data:/data/mnesia  tornabene/ntipa-rabbitmq`