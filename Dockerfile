FROM mediawiki:1.43

# Install required packages
RUN apt-get update && apt-get install -y \
    unzip \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Download and install Citizen skin
RUN wget -O /tmp/citizen.zip https://github.com/StarCitizenTools/mediawiki-skins-Citizen/archive/refs/heads/main.zip && \
    unzip /tmp/citizen.zip -d /var/www/html/skins/ && \
    mv /var/www/html/skins/mediawiki-skins-Citizen-main /var/www/html/skins/Citizen && \
    rm /tmp/citizen.zip && \
    chown -R www-data:www-data /var/www/html/skins/Citizen
