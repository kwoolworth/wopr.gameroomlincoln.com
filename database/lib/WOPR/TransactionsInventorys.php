<?php

	class WOPR_TransactionsInventories extends Zend_DB_Table_Abstract {
		
		protected $_schema = 'wopr';
		protected $_name = 'transactions_inventories';
		protected $_primary = 'ti_transaction_id';
		protected $_rowClass = 'WOPR_TransactionsInventories';
		
	}
	
?>