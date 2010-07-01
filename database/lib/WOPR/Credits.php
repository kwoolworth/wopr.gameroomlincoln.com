<?php

	class WOPR_Credits extends Zend_DB_Table_Abstract {
		
		protected $_schema = 'wopr';
		protected $_name = 'credits';
		protected $_primary = 'credit_id';
		protected $_rowClass = 'WOPR_Credits';
		
	}
	
?>