<?php
define("DB_SERVER", "localhost:3306");
define("DB_USERNAME", "ServerAdmin");
define("DB_PASSWORD", "ServerAdmin123");
define("DB_NAME", "drugdb");

$db = new mysqli(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);

?>