<?php

	class WOPR_Transactions extends Zend_DB_Table_Abstract {
		
		protected $_schema = 'wopr';
		protected $_name = 'Transactions';
		protected $_primary = 'transaction_id';
		protected $_rowClass = 'WOPR_Transacitons';
		
	}
	
?>