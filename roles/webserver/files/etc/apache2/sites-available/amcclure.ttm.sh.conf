<VirtualHost *:80>
    ServerAdmin amcclure@ttm.sh
    ServerName amcclure.ttm.sh
    DocumentRoot /var/www/amcclure
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
    <Directorymatch "^/.*/\.git/">
                Order deny,allow
                Deny from all
        </Directorymatch>
</VirtualHost>

#    <IfModule mod_ssl.c>
#    <VirtualHost *:443>
#    ServerAdmin amcclure@ttm.sh
#    ServerName amcclure.ttm.sh
#    DocumentRoot /var/www/amcclure
#    ErrorLog ${APACHE_LOG_DIR}/error.log
#    CustomLog ${APACHE_LOG_DIR}/access.log combined
#    <Directorymatch "^/.*/\.git/">
#                Order deny,allow
#                Deny from all
#        </Directorymatch>
#    SSLCertificateFile /etc/letsencrypt/live/amcclure.ttm.sh/fullchain.pem
#    SSLCertificateKeyFile /etc/letsencrypt/live/amcclure.tt.sh/privkey.pem
#    Include /etc/letsencrypt/options-ssl-apache.conf
#    </VirtualHost>
#    </IfModule>