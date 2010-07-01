<?php

	class WOPR_Phones extends Zend_DB_Table_Abstract {
	
		protected $_schema = 'wopr';
		protected $_name = 'phones';
		protected $_primary = 'phone_id';
		protected $_rowClass = 'WOPR_Phones';
		
	}
	
?>