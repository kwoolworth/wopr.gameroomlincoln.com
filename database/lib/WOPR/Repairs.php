<?php

	class WOPR_Repairs extends Zend_DB_Table_Abstract {
		
		protected $_schema = 'wopr';
		protected $_name = 'repairs';
		protected $_primary = 'repair_id';
		protected $_rowClass = 'WOPR_Repairs';
		
	}
	
?>