FROM rabbitmq:4.1-management

RUN apt-get update
RUN apt-get install -y curl unzip

RUN curl -L "https://github.com/noxdafox/rabbitmq-message-deduplication/releases/download/0.7.1/plugins-rmqv4.1.x-erl27-elx1.18.zip" -o /tmp/rabbitmq_dedup.zip
RUN unzip /tmp/rabbitmq_dedup.zip -d /plugins
RUN rm /tmp/rabbitmq_dedup.zip

RUN chown rabbitmq:rabbitmq /plugins/rabbitmq_message_deduplication-0.7.1.ez
RUN rabbitmq-plugins enable --offline rabbitmq_message_deduplication
