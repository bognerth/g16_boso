#!/bin/bash
ssh tb@g16-hh.de 'mkdir /var/www/g16/boso'
ssh tb@g16-hh.de 'mkdir /var/www/g16/boso/shared'
ssh tb@g16-hh.de 'mkdir /var/www/g16/boso/shared/config'
ssh tb@g16-hh.de 'mkdir /var/www/g16/boso/releases'
scp ~/Dropbox/Rails/G16/g16_boso/config/database.yml tb@g16-hh.de:/var/www/g16/boso/shared/config/
scp ~/Dropbox/Rails/G16/g16_boso/config/application.yml tb@g16-hh.de:/var/www/g16/boso/shared/config/
