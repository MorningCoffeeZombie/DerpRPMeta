<?php

	if (!defined('PHP_VERSION_ID')) {
	    $version = explode('.', PHP_VERSION);

	    define('PHP_VERSION_ID', ($version[0] * 10000 + $version[1] * 100 + $version[2]));
	}

	$canrun = true;
	$runmsg = '<b style="color: darkgreen;">Your PHP installation is able to run Prometheus</b>';
	$extra = '';

	if (PHP_VERSION_ID < 50400) {
		$php = 'Your PHP version does NOT support Prometheus';
		$canrun = false;
		$extra .= 'Your PHP version does not support short arrays or short echoing';
	} else {
		$php = 'Your PHP version supports Prometheus';
	}

	$fopen = ini_get('allow_url_fopen') ? '<b style="color: darkgreen;">Yes</b>' : '<b style="color: darkred;">No</b>';
	if( !ini_get('allow_url_fopen') ) {
		$canrun = false;
		$extra .= 'You will not be able to sign in because url_allow_fopen is disabled in your php.ini. Get your host to enable it';
	} 

	$curl = function_exists('curl_version') ? '<b style="color: darkgreen;">Yes</b>' : '<b style="color: darkred;">No</b>';
	if(!function_exists('curl_version')){
		$canrun = false;
	}

	$xml = function_exists('simplexml_load_file') ? '<b style="color: darkgreen;">Yes</b>' : '<b style="color: darkred;">No</b>';
	if(!function_exists('simplexml_load_file')){
		$canrun = false;
	}

	$mbstring = function_exists('mb_convert_encoding') ? '<b style="color: darkgreen;">Yes</b>' : '<b style="color: darkred;">No</b>';
	if(!function_exists('mb_convert_encoding')){
		$extra .= 'You will not be able to successfully edit the frontpage/news because you are missing <b>mbstring</b>';
	}

	$pdo = class_exists('PDO') ? '<b style="color: darkgreen;">Yes</b>' : '<b style="color: darkred;">No</b>';
	if(!class_exists('PDO')){
		$extra .= 'You will not be able to connect to the database because you are missing <b>PDO</b>';
		$canrun = false;
	}
	
	$w = stream_get_wrappers();
	$https_wrapper = in_array('https', $w) ? '<b style="color: darkgreen;">Yes</b>' : '<b style="color: darkred;">No</b>';
	if(!in_array('https', $w)){
		$extra .= '<br>The <b>HTTPS wrapper</b> is not enabled in your php.ini configuration. You will not be able to sign in';
		$canrun = false;
	}

	$openssl = extension_loaded('openssl') ? '<b style="color: darkgreen;">Yes</b>' : '<b style="color: darkred;">No</b>';
	if(!extension_loaded('openssl') ){
		$extra .= '<br>The <b>OpenSSL</b> is not loaded. You will not be able to sign in';
		$canrun = false;
	}

	if(!$canrun){
		$runmsg = '<b style="color: darkred;">Your PHP installation is NOT able to run Prometheus</b>';
	}

?>

<!DOCTYPE html>
<html>
<head>
	<title>Prometheus checker</title>

	<style type="text/css">
		body {
			background: #1d1d1d;
			color: gray;
			text-align: center;
			padding-top: 80px;
		}
	</style>
</head>
	<body>
		<?php echo $php; ?><br>
		Curl: <?php echo $curl; ?><br>
		PHP-XML: <?php echo $xml; ?><br>
		MBString: <?php echo $mbstring; ?><br>
		PDO: <?php echo $pdo; ?><br>
		url_allow_fopen: <?php echo $fopen; ?><br>
		OpenSSL: <?php echo $openssl; ?><br>
		HTTPS wrapper: <?php echo $https_wrapper; ?><br>
		<br>
		<?php echo $runmsg; ?><br>
		<?php echo $extra; ?>
	</body>
</html>