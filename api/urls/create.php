<?php 
	header("Access-Control-Allow-Origin: *");
	header("Content-Type: application/json; charset=UTF-8");
	header("Access-Control-Allow-Methods: POST");
	header("Access-Control-Max-Age: 3600");
	header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
		
	include_once "../config/database.php";	
	include_once "../objects/url.php"; 
	
	$message = "Short url created."; 
	$database = new Database();
	$db = $database->connect();
	  
	$url = new Url($db);
		
	$data = json_decode(file_get_contents("php://input"));
	
	if(!empty($data->longUrl)){
		
		$url->longUrl = $data->longUrl;
		
		if($url->save()){
			$url->readNew(); 
			
			if($url->longUrl != null){
		
			$urlArray = array(
				"id" =>  $url->id,
				"longUrl" => $url->longUrl,
				"shortUrl" => $url->shortUrl,
			);
		}
			http_response_code(200); 
			
			echo json_encode($urlArray); 
			
		}else{
			http_response_code(503);
			echo json_encode(array("message" => $message));
		}
	}else{
		http_response_code(404);
		echo json_encode(array("message" => "Not found."));
	}
	
	
	 
		