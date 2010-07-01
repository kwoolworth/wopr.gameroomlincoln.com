<?php

	class WOPR_Scans extends Zend_DB_Table_Abstract {
	
		protected $_schema = 'wopr';
		protected $_name = 'scans';
		protected $_primary = 'scan_id';
		protected $_rowClass = 'WOPR_Scans';
		
	}
	
?>