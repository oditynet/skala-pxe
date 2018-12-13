su vstoradmin&&psql -d vstoradmin&&update users set password=\'$pbkdf2-sha256$29000$7x2jVKqVknIOQUhJSWkNAQ$VPLGZaDlyISRcSK258yy6JpgfNR40uQ8ZuxEwitM/Gw\' where id=1;
