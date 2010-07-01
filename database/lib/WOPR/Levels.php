<?php

	class WOPR_Levels extends Zend_DB_Table_Abstract {
		
		protected $_schema = 'wopr';
		protected $_name = 'levels';
		protected $_primary = 'level_id';
		protected $_rowClass = 'WOPR_Levels';
		
	}
	
?>