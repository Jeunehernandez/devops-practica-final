FROM ubuntu:20.04

# Establece el frontend no interactivo para evitar prompts durante la instalación
ENV DEBIAN_FRONTEND=noninteractive

# Instala Apache y el paquete tzdata para la zona horaria
RUN apt-get update && \
    apt-get install -y apache2 tzdata && \
    ln -fs /usr/share/zoneinfo/America/Mexico_City /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata

# Copia el archivo HTML al directorio de Apache
COPY ./index.html /var/www/html/index.html

# Establece la zona horaria como variable de entorno
ENV TZ=America/Mexico_City

# Comando para mantener Apache en ejecución en primer plano
CMD ["apache2ctl", "-D", "FOREGROUND"]
