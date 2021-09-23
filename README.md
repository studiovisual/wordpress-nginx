# WordPress Nginx - Studio Visual

Esse repositório contém as configurações do NGINX recomendadas para uso em instalações do Wordpress.

Alguns ajustes dentro da configuração foram inseridos visando ajustar a performance base do NGINX.

Essa configuração une as configurações adicionais do [nerrad/wordpress-nginx](https://github.com/nerrad/wordpress-nginx/tree/test-merge-le-phpup) e do repositório original [deliciousbrains/wordpress-nginx](https://github.com/deliciousbrains/wordpress-nginx)

É recomendado fortemente realizar a leitura da documentação do repositório original [deliciousbrains/wordpress-nginx](https://github.com/deliciousbrains/wordpress-nginx) e posteriormente do [nerrad/wordpress-nginx](https://github.com/nerrad/wordpress-nginx/tree/test-merge-le-phpup).

Essas configurações foram criadas para uso em conjunto com o Ansible, porém servem como referência para outras instalações.

## Requisitos

Essa configuração foi testada até o momento com o seguintes ambientes:

| Sistema Operacional       | Versão do PHP | Versão do NGINX |
|---------------------------|---------------|-----------------|
| `Ubuntu Server 20.04 LTS` | `PHP 7.4`     | `1.19`          |

As seguintes extensões do PHP foram instaladas, de acordo com a necessidade da instalação do Wordpress:

| Versão do PHP | php-cli | common | curl | dev | fpm | gd | mbstring | mysql | opcache | xml | xmlrpc | zip | imagick |
|---------------|---------|--------|------|-----|-----|----|----------|-------|---------|-----|--------|-----|---------|
| 7.4           | *       | *      | *    | *   | *   | *  | *        | *     | *       | *   | *      | *   | *       |

Conforme novos ambientes forem testados com suas respectivas versões e pacotes serão listados aqui.