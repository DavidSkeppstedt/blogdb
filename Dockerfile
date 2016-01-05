FROM ubuntu
MAINTAINER david.skeppstedt@gmail.com

RUN apt-get update && apt-get install -y postgresql postgresql-contrib

USER postgres

RUN mkdir $HOME/code

WORKDIR $HOME/code
COPY ./schema/posts.sql posts.sql
COPY entry.sh entry.sh

RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.3/main/pg_hba.conf

# And add ``listen_addresses`` to ``/etc/postgresql/9.3/main/postgresql.conf``
RUN echo "listen_addresses='*'" >> /etc/postgresql/9.3/main/postgresql.conf

# Expose the PostgreSQL port
EXPOSE 5432

# Add VOLUMEs to allow backup of config, logs and databases
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

ENV PG_MAJOR 9.3
ENV PATH /usr/lib/postgresql/$PG_MAJOR/bin:$PATH


ENTRYPOINT ["./entry.sh"] 
CMD ["postgres"]
