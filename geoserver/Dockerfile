FROM tomcat:9.0-jre11-openjdk-slim

LABEL maintainer="ByteRoad <support@byteroad.net>"

ENV GEOSERVER_VERSION 2.22.2
ENV GEOSERVER_DATA_DIR /var/local/geoserver
ENV GEOSERVER_GWC_DIR /var/local/geoserver-gwc
ENV GEOSERVER_INSTALL_DIR /usr/local/geoserver
ENV GEOSERVER_EXT_DIR /var/local/geoserver-exts
ENV TOMCAT_INSTALL_DIR /usr/local/tomcat

# Fonts
RUN echo "deb http://httpredir.debian.org/debian stretch contrib" >> /etc/apt/sources.list
RUN set -x \
    && apt-get update \
    && apt-get install -yq unzip \
    && apt-get install -yq ttf-mscorefonts-installer \
    && apt-get install -y --no-install-recommends libfontconfig1 \
    && rm -rf /var/lib/apt/lists/*

# Adding Updated Marlin plugin
ADD lib/marlin-0.9.4.5-Unsafe-OpenJDK11.jar /usr/local/tomcat/lib/marlin-0.9.4.5-Unsafe-OpenJDK11.jar

# GeoServer
ADD conf/geoserver.xml /usr/local/tomcat/conf/Catalina/localhost/geoserver.xml
ADD conf/server.xml /usr/local/tomcat/conf/server.xml
RUN mkdir ${GEOSERVER_DATA_DIR} \
    && mkdir ${GEOSERVER_GWC_DIR} \
    && mkdir ${GEOSERVER_INSTALL_DIR} \
    && cd ${GEOSERVER_INSTALL_DIR} \
    && wget http://sourceforge.net/projects/geoserver/files/GeoServer/${GEOSERVER_VERSION}/geoserver-${GEOSERVER_VERSION}-war.zip \
    && unzip geoserver-${GEOSERVER_VERSION}-war.zip \
    && unzip geoserver.war \
    && mv data/* ${GEOSERVER_DATA_DIR} \
    && rm -rf geoserver-${GEOSERVER_VERSION}-war.zip geoserver.war target *.txt

# CORS
RUN sed -i '\:</web-app>:i\
<filter>\n\
    <filter-name>CorsFilter</filter-name>\n\
    <filter-class>org.apache.catalina.filters.CorsFilter</filter-class>\n\
    <init-param>\n\
        <param-name>cors.allowed.origins</param-name>\n\
        <param-value>*</param-value>\n\
    </init-param>\n\
    <init-param>\n\
        <param-name>cors.allowed.methods</param-name>\n\
        <param-value>GET,POST,HEAD,OPTIONS,PUT</param-value>\n\
    </init-param>\n\
</filter>\n\
<filter-mapping>\n\
    <filter-name>CorsFilter</filter-name>\n\
    <url-pattern>/*</url-pattern>\n\
</filter-mapping>' ${GEOSERVER_INSTALL_DIR}/WEB-INF/web.xml

# Tomcat env
ENV CATALINA_OPTS " -Xms768m -Xmx1560m --patch-module java.desktop=/usr/local/tomcat/lib/marlin-0.9.4.5-Unsafe-OpenJDK11.jar \
    -server -XX:+UseG1GC -XX:NewSize=48m -XX:-UsePerfData -XX:SoftRefLRUPolicyMSPerMB=36000 -Djava.awt.headless=true \
    -DGEOSERVER_DATA_DIR=${GEOSERVER_DATA_DIR} -Dorg.geotools.referencing.forceXY=true -Dsun.java2d.renderer.useThreadLocal=false "

# Create tomcat user to avoid root access.
RUN addgroup --gid 1099 tomcat && useradd -m -u 1099 -g tomcat tomcat \
    && chown -R tomcat:tomcat . \
    && chown -R tomcat:tomcat ${GEOSERVER_DATA_DIR} \
    && chown -R tomcat:tomcat ${GEOSERVER_INSTALL_DIR} \
    && chown -R tomcat:tomcat ${TOMCAT_INSTALL_DIR}

ADD start.sh /usr/local/bin/start.sh
ENTRYPOINT [ "/bin/sh", "/usr/local/bin/start.sh"]

VOLUME ["${GEOSERVER_DATA_DIR}", "${GEOSERVER_EXT_DIR}", "${GEOSERVER_GWC_DIR}"]

EXPOSE 8080
