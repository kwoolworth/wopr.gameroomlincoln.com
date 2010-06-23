<?php

	// Add lib folder to include path
	set_include_path(get_include_path() . PATH_SEPARATOR . realpath(dirname(__FILE__) . '/../lib'));

	// Include the Cycle Framework
	require_once('Cycle/Cycle.php');

	// Include the Zend Framework
	require_once('Zend/Loader/Autoloader.php');
	$autoloader = Zend_Loader_Autoloader::getInstance();
	$autoloader->registerNamespace('WOPR_');

	// Include database connection file
	if(file_exists(realpath(dirname(__FILE__) . '/../inc/database.php'))){
		require_once(realpath(dirname(__FILE__) . '/../inc/database.php'));
	} else {
		throw new Exception('Database configuration cannot be found.');
	}

?>