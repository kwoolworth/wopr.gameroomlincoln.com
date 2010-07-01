<?php

	class WOPR_Times extends Zend_DB_Table_Abstract {
		
		protected $_schema = 'wopr';
		protected $_name = 'times';
		protected $_primary = 'time_id';
		protected $_rowClass = 'WOPR_Times';
		
	}
	
?>