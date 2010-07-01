<?php

	class WOPR_Addresses extends Zend_DB_Table_Abstract {
	
		protected $_schema = 'wopr';
		protected $_name = 'addresses';
		protected $_primary = 'address_id';
		protected $_rowClass = 'WOPR_Addresses';
		
	}
	
?>