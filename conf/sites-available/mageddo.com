server {
	listen 80;
	root /usr/share/nginx/www;
	index index.php index.html index.htm;
	server_name example.com;
	location / {
		try_files $uri $uri/ /index.html;
	}
	location ~ \.php$ {
		try_files $uri =404;
		fastcgi_pass unix:/var/run/php5-fpm.sock;
		fastcgi_index index.php;
		fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
		include fastcgi_params;
		
	}
}