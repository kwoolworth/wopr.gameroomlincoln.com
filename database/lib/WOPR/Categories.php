<?php

	class WOPR_Categories extends Zend_DB_Table_Abstract {
	
		protected $_schema = 'wopr';
		protected $_name = 'categories';
		protected $_primary = 'category_id';
		protected $_rowClass = 'WOPR_Categories';
		
	}
	
?>