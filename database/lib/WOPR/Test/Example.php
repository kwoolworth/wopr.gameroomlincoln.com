<?php

	class WOPR_Test_Example {

		public function helloWorld(){

			return "Hello World!";

		}

		public function getUsers(){

			$users = new WOPR_Users();
			return $users->fetchAll()->toArray();

		}

	}

?>