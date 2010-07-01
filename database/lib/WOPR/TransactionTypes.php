<?php

	class WOPR_TransactionsTypes extends Zend_DB_Table_Abstract {
		
		protected $_schema = 'wopr';
		protected $_name = 'transactions_types';
		protected $_primary = 'transaction_type_id';
		protected $_rowClass = 'WOPR_TransactionsTypes';
		
	}
	
?>