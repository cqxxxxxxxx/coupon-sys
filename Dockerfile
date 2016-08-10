
FROM java:openjdk-7-jdk

MAINTAINER kison@xiaohuodui

#tomcat7
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME


ENV TOMCAT_MAJOR 7
ENV TOMCAT_VERSION 7.0.70
#优化 tomcat7 下载
ENV TOMCAT_TGZ_URL http://mirrors.aliyun.com/apache/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz

RUN set -x \
	&& curl -fSL "$TOMCAT_TGZ_URL" -o tomcat.tar.gz \
	&& tar -xvf tomcat.tar.gz --strip-components=1 \
	&& rm bin/*.bat \
	&& rm tomcat.tar.gz*

#替换server.xml
RUN  rm $CATALINA_HOME/conf/server.xml
ADD  docker/server.xml $CATALINA_HOME/conf/server.xml

#coupon-api command
ARG APP_MODULE
ENV APP_MODULE ${APP_MODULE}

RUN echo $APP_MODULE

RUN     rm -rf $CATALINA_HOME/webapps/* \
        && rm -rf $CATALINA_HOME/work/*

ADD  $APP_MODULE/target/*.war $CATALINA_HOME/webapps/ROOT.war

RUN cd $CATALINA_HOME/webapps && ls -al

EXPOSE 8080
CMD ["catalina.sh", "run"]