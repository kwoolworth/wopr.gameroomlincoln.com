<?php

	class WOPR_Applications extends Zend_DB_Table_Abstract {
		
		protected $_schema = 'wopr';
		protected $_name = 'applications';
		protected $_primary = 'application_id';
		protected $_rowClass = 'WOPR_Applications';
		
	}
	
?>