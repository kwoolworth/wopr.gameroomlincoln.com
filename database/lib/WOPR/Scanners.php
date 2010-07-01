<?php

	class WOPR_Scanners extends Zend_DB_Table_Abstract {
	
		protected $_schema = 'wopr';
		protected $_name = 'scanners';
		protected $_primary = 'scanner_id';
		protected $_rowClass = 'WOPR_Scanners';
		
	}
	
?>