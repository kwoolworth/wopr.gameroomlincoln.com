<?php

	// Include the configuration file
	require_once(realpath(dirname(__FILE__) . '/../inc/config.php'));
	
	// Create Cycle instance and set Cycle Framework options
	$cycle = Cycle::getInstance();
	$cycle->configure(array(
		'base_url' => '/database/',
		'app_path' => realpath(dirname(__FILE__) . '/../'),
		'views_path' => 'views/',
		'layout' => 'layouts/layout.php',
	));
		
	// Declare routes
	$cycle->route('/','index');
		function index($cycle) {
			return $cycle->render('pages/index.php');
		}
	
	$cycle->route('/example','example');
		function example($cycle) {
			$server = new Zend_Json_Server();
			$server->setClass('WOPR_Example');
			return $cycle->send($server->handle(), Cycle_Response::JSON);
		}
				
	// Run the application
	$cycle->run();
	
?>