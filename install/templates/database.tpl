<?php
	
	$db = new Zend_Db_Adapter_Pdo_Mysql(array(
	    'host'     => '@:host@',
	    'username' => '@:username@',
	    'password' => '@:password@',
	    'dbname'   => 'wopr'
	));
	
?>