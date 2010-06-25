<?php

	class WOPR_Users extends Zend_DB_Table_Abstract {
		
		protected $_schema = 'wopr';
		protected $_name = 'users';
		protected $_primary = 'user_id';
		protected $_rowClass = 'WOPR_User';
		
	}
	
?>