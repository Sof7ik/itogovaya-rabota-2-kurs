<?php
	//Запуск сессий;
	session_start();
	$nm =$_SESSION['username'] ;
	//если пользователь не авторизован

	if (!(isset($_SESSION['username'])) || $_SESSION['role'] !=3) {
		//идем на страницу авторизации
		echo '<meta http-equiv="refresh" content="0;index.php">';
		exit;
	};
	require_once 'connection.php';
	include_once 'includes.php';
?>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="styles/style_director.css">
	<meta charset="utf-8">
	<title>Экран директора</title>
</head>
<body>

<h1>Вы на экране директора!</h1>

<br>
<br>
<br>

<p style="font-size: 40px; color: red; border: 3px solid silver; font-weight: bold; background-color: blue;">Кнопка выхода<br><span style="margin-left: 20px;">|</span><br>\ /</p>

<br>

<form id="log-out" method="GET" action="logout.php"> 
	<input type="submit" name="exit-button" id="e-button" value=""> 
</form>

<?php
	$count = mysqli_query($connection, "SELECT cloth.name, cloth.color, cloth.picture FROM `cloth`;");
	$countResult = mysqli_fetch_assoc($count);
?>

	<div class="cloth">

		<?
		echo $countResult['name'];
		echo '<img style="width: 40" src=img/' .  $countResult['picture'] . '>';
		?>

	</div>


</body>
</html>