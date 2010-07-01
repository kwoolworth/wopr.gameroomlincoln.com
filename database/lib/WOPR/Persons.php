<?php

	class WOPR_Persons extends Zend_DB_Table_Abstract {
		
		protected $_schema = 'wopr';
		protected $_name = 'persons';
		protected $_primary = 'person_id';
		protected $_rowClass = 'WOPR_Persons';
		
	}
	
?>