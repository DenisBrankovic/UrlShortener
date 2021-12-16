<?php
	class Database{
		  
		private $host = "localhost";
		private $db_name = "shortener";
		private $username = "root";
		private $password = "";
		public $conn;
		  
		public function connect(){
	  
			$this->conn = null;
	  
			try{
				$this->conn = new PDO("mysql:host=".$this->host.";dbname=".$this->db_name, $this->username, $this->password);
				$this->conn->exec("set names utf8");
			}catch(PDOException $exception){
				echo "Connection error: " . $exception->getMessage();
			}
	  
			return $this->conn;
		}
	}
	// $db = new Database();
	
	// $conn = $db->connect();
	
	// $query = "insert into url values(null, 'longUrl', 'shortUrl')";
	
	// if($conn->exec($query)){
		// echo "Done!";
	// }else{
		// echo "Not done."; 
	// }