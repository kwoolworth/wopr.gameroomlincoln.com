<?php

	class WOPR_CreditCardReaders extends Zend_DB_Table_Abstract {
	
		protected $_schema = 'wopr';
		protected $_name = 'credit_card_readers';
		protected $_primary = 'credit_card_reader_id';
		protected $_rowClass = 'WOPR_CreditCardReaders';
		
	}
	
?>