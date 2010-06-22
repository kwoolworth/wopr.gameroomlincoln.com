<?php
	
	// Include the Cycle Framework
	require_once('Cycle/Cycle.php');
	
	// Create Cycle instance and set Cycle Framework options
	$cycle = Cycle::getInstance();
	$cycle->configure(array(
		'base_url' => '/database/',
		'app_path' => realpath(dirname(__FILE__) . '/../'),
		'views_path' => 'views/',
		'layout' => 'layouts/layout.php',
	));
	
	$cycle->setup('setup');
		function setup($cycle) {
			//Do pre-dispatch setup here!
		}
		
	// Declare routes
	$cycle->route('/','index');
		function index($cycle) {
			return $cycle->render('pages/index.php');
		}
			
	$cycle->teardown('teardown');
		function teardown($cycle) {
			//Do post-dispatch teardown here!
		}
				
	// Run the application
	$cycle->run();
	
?>