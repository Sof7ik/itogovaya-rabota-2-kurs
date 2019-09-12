<?php
	//Запуск сессий;
	session_start();
	$nm =$_SESSION['username'];
	//если пользователь не авторизован

	if (!(isset($_SESSION['username'])) || $_SESSION['role'] !=4) {
		//идем на страницу авторизации 
		echo '<meta http-equiv="refresh" content="0;index.php">';
		exit;
	}
	require_once 'connection.php';
	include_once 'includes.php';
?>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="styles/style_director.css">
	<meta charset="utf-8">
	<title>Экран кладовщика</title>
</head>
<body>

<h1>Вы на экране кладмена!</h1>

<p style="font-size: 30px; color: red; border: 3px solid silver; font-weight: bold; background-color: blue;">Кнопка выхода<br><span style="margin-left: 10px;">|</span><br>\ /

<form id="log-out" method="GET" action="logout.php"> 
	<input type="submit" name="exit-button" id="e-button" value=""> 
</form>

</p>

</body>
</html>