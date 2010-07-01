<?php

	class WOPR_Stores extends Zend_DB_Table_Abstract {
		
		protected $_schema = 'wopr';
		protected $_name = 'stores';
		protected $_primary = 'store_id';
		protected $_rowClass = 'WOPR_Stores';
		
	}
	
?>