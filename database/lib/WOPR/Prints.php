<?php

	class WOPR_Prints extends Zend_DB_Table_Abstract {
	
		protected $_schema = 'wopr';
		protected $_name = 'prints';
		protected $_primary = 'print_id';
		protected $_rowClass = 'WOPR_Prints';
		
	}
	
?>