server {
	# Ports to listen on
	listen 80;
	listen [::]:80;

	# Server name to listen for
	server_name multisite-subdirectory.com;

	# Path to document root
	root /sites/multisite-subdirectory.com/public;

	# File to be used as index
	index index.php;

	#send logs to global aggregate logs
	error_log /var/log/nginx/error.log warn;
	access_log /var/log/nginx/access.log;

	# Site specific logs.
	access_log /sites/multisite-subdirectory.com/logs/access.log;
	error_log /sites/multisite-subdirectory.com/logs/error.log;

	# Default server block rules
	include global/server/defaults.conf;

	# Multisite subdirectory install
	include global/server/multisite-subdirectory.conf;

	# LetsEncrypt acme-challenge
	location ^~ /.well-known/acme-challenge {
        root /sites/letsencrypt/public;
        try_files $uri $uri/ =404;
    }

	location / {
		try_files $uri $uri/ /index.php?$args;
	}

	location ~ \.php$ {
		try_files $uri =404;
		include global/fastcgi-params.conf;

		# Use the php pool defined in the upstream variable.
        # See global/php-pool.conf for definition.
        fastcgi_pass   $upstream;
	}

    # Rewrite robots.txt
    rewrite ^/robots.txt$ /index.php last;
}

# Redirect www to non-www
server {
	listen 80;
	listen [::]:80;
	server_name www.multisite-subdirectory.com;

	return 301 $scheme://multisite-subdirectory.com$request_uri;
}
