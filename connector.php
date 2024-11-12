<?php
$con = mysqli_init();
mysqli_ssl_set($con,NULL,NULL, "{path to CA cert}", NULL, NULL);
mysqli_real_connect($conn, "grouo-server.mysql.database.azure.com", "ServerAdmin", "ServerAdmin123", "grouo-database", 3306, MYSQLI_CLIENT_SSL);
