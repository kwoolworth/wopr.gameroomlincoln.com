<?php

	class WOPR_Drawers extends Zend_DB_Table_Abstract {
	
		protected $_schema = 'wopr';
		protected $_name = 'drawers';
		protected $_primary = 'drawer_id';
		protected $_rowClass = 'WOPR_Drawers';
		
	}
	
?>