<?php

	class WOPR_Kiosks extends Zend_DB_Table_Abstract {
	
		protected $_schema = 'wopr';
		protected $_name = 'kiosks';
		protected $_primary = 'kiosk_id';
		protected $_rowClass = 'WOPR_Kiosks';
		
	}
	
?>