<?php

	class WOPR_RepairsStatuses extends Zend_DB_Table_Abstract {
		
		protected $_schema = 'wopr';
		protected $_name = 'repairs_statuses';
		protected $_primary = 'repair_status_id';
		protected $_rowClass = 'WOPR_RepairsStatuses';
		
	}
	
?>