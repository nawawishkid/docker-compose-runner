

## TODO
- [ ] Create Apache2 vhost automatically
    - [ ] Create vhost config file in /etc/apache2/sites-available
    - [ ] Map hostname by appending the name into /etc/hosts
- [ ] Create nginx config file automatically
- [ ] 

## Types
- [ ] Single network, single host
- [ ] Single network, multiple vhosts
- [ ] Multiple networks expose to nginx which exposes to public

## Stack
- [x] Apache2
- [x] PHP-FPM
- [ ] NGINX
- [x] MySQL
- [ ] MariaDB
- [ ] OpenSSL
- [ ] MemCached
- [ ] Redis

## Containers configs
- PHP-FPM
    

## Apps setup
- WordPress
    - Login as www-data
    - Download location
    - WordPress version
    - Database name, username, password, host
    - Admin name, password, email
    - plugins
    - themes
    - Data import

## Docker Manager (dm)
- [x] list all project
- [x] dm compose delete <compose-name>; delete when compose is running?
- [x] Check duplicate compose name before building
- [ ] If compose up multiple project, apache will use the same port. Use nginx as a single proxy which connect the internet with all compose networks.
- [ ] Try using env variables for default version of php and mysql instead of hardcode it.
- [x] Able to create custom docker-compose.yml template
- [ ] Template is docker-compose.yml template and service volumes directories for all services in network
- [ ] Able to up/down all available projects with --all
- [ ] Able to configure dm via dm.conf file

## Issues
- [x] Duplicate compose project name when using `dm compose build <name> --override`

## Compose directories
```
- compose/
    - projects/
        - example1/
            - conf/
                - apache/
                - php-fpm/
                - mysql/
            - app/
            - docker-compose.yml
        - example2/
            - conf/
                - apache/
                - php-fpm/
                - mysql/
            - app/
            - docker-compose.yml
    - templates/
        - default/
            - services/
            - compose-template.yml
            - template-var/?
                - default?
        - example/
            - conf/
                - apache/
                - php-fpm/
                - mysql/
            - app/
            - template.yml
        - wordpress/
        - laravel/
        - magento/
- log/
    - dm/
- lib/
    - dm/
- cache/
    - dm/
- dm
- README.md
```