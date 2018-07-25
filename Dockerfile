FROM linode/lamp
MAINTAINER john@mccr.ae

EXPOSE 80

COPY default.css /var/www/html
COPY img /var/www/html/img
COPY index.html /var/www/html
COPY LexInfo-en.owl /var/www/html
COPY LexInfo.owl /var/www/html
COPY lmf.owl /var/www/html
COPY ontologies /var/www/html/ontologies
COPY ontology /var/www/html/ontology
COPY owl2.owl /var/www/html
RUN rm /etc/apache2/sites-enabled/example.com.conf
ADD 000-default.conf /etc/apache2/sites-available/
RUN ln -s /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-enabled/000-default.conf
RUN chmod -R a+r /var/www/html

CMD service apache2 start && sleep infinity
