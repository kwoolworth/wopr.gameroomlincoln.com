<?php

	class WOPR_Messages extends Zend_DB_Table_Abstract {
	
		protected $_schema = 'wopr';
		protected $_name = 'messages';
		protected $_primary = 'message_id';
		protected $_rowClass = 'WOPR_Messages';
		
	}
	
?>