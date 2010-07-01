<?php

	class WOPR_Items extends Zend_DB_Table_Abstract {
	
		protected $_schema = 'wopr';
		protected $_name = 'items';
		protected $_primary = 'item_id';
		protected $_rowClass = 'WOPR_Items';
		
	}
	
?>