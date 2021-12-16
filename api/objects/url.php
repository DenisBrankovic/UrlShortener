<?php
	include_once "../config/database.php"; 
	class Url{
		private $conn;
		private $tableName = "url"; 
		
		public $id;
		public $longUrl;
		public $shortUrl; 
		
		public function __construct($db){
			$this->conn = $db;
		}
		
		function read(){
			
			$query = "SELECT * FROM ".$this->tableName; 
			
			$stmt = $this->conn->prepare($query);
			$stmt->execute();
		  
			return $stmt;
		}
		
		//Gets the newly created object 
		function readNew(){
		  	
			global $message; 
			
			$query = "SELECT * FROM url ORDER BY id DESC LIMIT 1"; 
		  	
			$stmt = $this->conn->prepare($query);
		  	
			$stmt->bindParam(1, $this->id); 
		  			
			$stmt->execute();
		  			
			$row = $stmt->fetch(PDO::FETCH_ASSOC);
		  	
			$this->id = $row['id'];
			$this->longUrl = $row['longUrl'];
			$this->shortUrl = $row['shortUrl'];			
		}
		
		//Deletes an entry based on the id 
		function delete(){
  			
			$query = "DELETE FROM ".$this->tableName." WHERE id = ?";
		  			
			$stmt = $this->conn->prepare($query);
		  			
			$this->id=htmlspecialchars(strip_tags($this->id));
		  			
			$stmt->bindParam(1, $this->id);
		  			
			if($stmt->execute()){
				return true;
			}
  
			return false;
		}
		
		//Checks if the user's url is a real, existing one 
		//by checking if the "200" exists in the response 
		function checkUrlValidity($longUrl){
			
			global $message; 
			
			$headers = @get_headers($longUrl);
						
			if($headers && strpos( $headers[0], '200')) {
				return true; 
			}
			else {
				$message = "Not a valid URL."; 
				return false; 
			}
		}
		
		//Uses a random bytes function to create a 
		//short url by concatenating it to the hard coded
		//domain (local host) name. Also checks if 
		//it already exists in the table. 
		
		function createShortUrl(){
			
			global $message;
			
			$createShort = random_bytes(4);
			$shortUrl = "http://localhost:8080/".bin2hex($createShort); 
			
			$query = "SELECT shortUrl FROM url WHERE shortUrl = '{$shortUrl}'"; 
			
			$clmn = $this->conn->query($query); 
			$clmn->execute();
			$short = $clmn->fetchAll(PDO::FETCH_ASSOC);
			 
			if(!$short){
				return $shortUrl; 
			}else{
				$message = "The generated short url already exists."; 
				return false; 
			}
		}
		
		//Checks if the long url exists in the table 
		function checkLongUrl($longUrl){
			
			global $message;
			
			if(!$this->checkUrlValidity($longUrl)){
				return; 
			}
						
			$query = "SELECT longUrl FROM url WHERE longUrl = '{$longUrl}'";
			
			$clmn = $this->conn->query($query); 
			$clmn->execute();
			$long = $clmn->fetchAll(PDO::FETCH_ASSOC);
			
			if(!$long){
				return $longUrl;
			}else{
				$message = "The long url already exists."; 
				return false; 
			}
		}
		
		//Saves both urls in the table 
		function save(){
			 
			$query = "INSERT INTO ".$this->tableName." SET longUrl=:longUrl, shortUrl=:shortUrl"; 

			$stmt = $this->conn->prepare($query); 
						 
			$this->longUrl = htmlspecialchars(strip_tags($this->longUrl));
				
			$checkedLong = $this->checkLongUrl($this->longUrl);
			$shUrl = $this->createShortUrl();
			
			if($checkedLong && $shUrl){
				$stmt->bindParam(":longUrl", $checkedLong);
				$stmt->bindParam(":shortUrl", $shUrl);
					
				if($stmt->execute()){
					return true;
				}
			}
			return false;
		}
	}
	 

	  