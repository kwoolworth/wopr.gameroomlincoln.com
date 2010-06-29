# Virtual host configuration

<VirtualHost *:80>
	
	ServerName @:domain@
	DocumentRoot @:path@/applications
	RewriteEngine On
	RewriteCond %{HTTP_HOST} ^@:domain@$ [NC]
	RewriteRule ^/$ "/kiosk/" [R,NC,L]
	RewriteRule ^/([^/\.]+)$ "/kiosk/$1" [R,NC,L]
	RackEnv production
	
	<Directory @:path@/applications>
		AllowOverride All
		Options -Indexes
		Order Allow,Deny
		Allow from All
	</Directory>
	
	Alias /database/ @:path@/database/public/
	<Directory "@:path@/database/public/">
		PassengerEnabled Off
		AllowOverride All
		Order Allow,Deny
		Allow from 127.0.0.1
		<IfModule mod_rewrite.c>
			RewriteEngine On
			RewriteCond %{REQUEST_FILENAME} -s [OR]
		    RewriteCond %{REQUEST_FILENAME} -l
			RewriteRule ^.*$ - [NC,L]
			RewriteRule ^.*$ /database/index.php [NC,L]
		</IfModule>
	</Directory>
	
	RackBaseURI /devices
	<Directory @:path@/applications/devices>
		Options -MultiViews
	</Directory>
	
	RackBaseURI /error
	<Directory @:path@/applications/error>
		Options -MultiViews
	</Directory>
	
	RackBaseURI /inventory
	<Directory @:path@/applications/inventory>
		Options -MultiViews
	</Directory>
	
	RackBaseURI /kiosk
	<Directory @:path@/applications/kiosk>
		RackBaseURI /kiosk
		Options -MultiViews
	</Directory>
	
	RackBaseURI /repairs
	<Directory @:path@/applications/repairs>
		Options -MultiViews
	</Directory>
	
	RackBaseURI /reports
	<Directory @:path@/applications/reports>
		Options -MultiViews
	</Directory>
	
	RackBaseURI /sales
	<Directory @:path@/applications/sales>
		Options -MultiViews
	</Directory>
	
	RackBaseURI /settings
	<Directory @:path@/applications/settings>
		Options -MultiViews
	</Directory>
	
	RackBaseURI /themes
	<Directory @:path@/applications/themes>
		Options -MultiViews
	</Directory>
	
	RackBaseURI /timeclock
	<Directory @:path@/applications/timeclock>
		Options -MultiViews
	</Directory>
	
</VirtualHost>