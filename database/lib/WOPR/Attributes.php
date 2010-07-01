<?php

	class WOPR_Attributes extends Zend_DB_Table_Abstract {
	
		protected $_schema = 'wopr';
		protected $_name = 'attributes';
		protected $_primary = 'attribute_id';
		protected $_rowClass = 'WOPR_Attributes';
		
	}
	
?>