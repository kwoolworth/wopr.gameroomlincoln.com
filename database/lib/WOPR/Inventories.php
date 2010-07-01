<?php

	class WOPR_Inventories extends Zend_DB_Table_Abstract {
	
		protected $_schema = 'wopr';
		protected $_name = 'inventories';
		protected $_primary = 'inventory_id';
		protected $_rowClass = 'WOPR_Inventories';
		
	}
	
?>