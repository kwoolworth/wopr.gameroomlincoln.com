<?php

	class WOPR_Locations extends Zend_DB_Table_Abstract {
		
		protected $_schema = 'wopr';
		protected $_name = 'locations';
		protected $_primary = 'location_id';
		protected $_rowClass = 'WOPR_Locations';
		
	}
	
?>