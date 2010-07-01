<?php

	class WOPR_Printers extends Zend_DB_Table_Abstract {
	
		protected $_schema = 'wopr';
		protected $_name = 'printers';
		protected $_primary = 'printer_id';
		protected $_rowClass = 'WOPR_Printers';
		
	}
	
?>