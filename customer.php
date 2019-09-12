<?php
	//Запуск сессий;
	session_start();
	$nm =$_SESSION['username'];

	//если пользователь не авторизован

	if (!(isset($_SESSION['username'])) || $_SESSION['role'] !=1) {
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
	<link rel="stylesheet" type="text/css" href="styles/style_customer.css">
	<meta charset="utf-8">
	<title>Экран заказчика</title>
</head>
<body>

<div class="header">

	<ul>

		<li><a href="#">СПИСОК ТКАНЕЙ</a></li>
		<li><a href="#">СПИСОК ФУРНИТУРЫ</a></li>

	</ul>

	<form id="log-out" method="GET" action="logout.php"> 
		<input type="submit" name="exit-button" id="e-button" value=""> 
	</form>

</div>

<div class="main-info"> 

	<div class="cloth">

		<?php

			$countCloth = mysqli_query($connection, "SELECT cloth.name, cloth.color, cloth.image, cloth.cost FROM `cloth`;");
			$countClothResult = mysqli_fetch_assoc($countCloth);
		?>

		<div class="item">

			<p> <?php echo $countClothResult['name'] . ' ' .$countClothResult['color']?> </p>
			<?php echo '<img class="image" src="/img/' . $countClothResult['image'] . '"'?>
			<br>
			<p> <?php echo $countClothResult['cost'] ?> </p>

		</div>

	</div>


	<div class="furniture">

		<?php

			$countCloth = mysqli_query($connection, "SELECT cloth.name, cloth.color, cloth.image, cloth.cost FROM `cloth`;");
			$countClothResult = mysqli_fetch_assoc($countCloth);
		?>

		<div class="item">

			<p> <?php echo $countClothResult['name'] . ' ' .$countClothResult['color']?> </p>
			<?php echo '<img class="image" src="/img/' . $countClothResult['image'] . '"'?>
			<br>
			<p> <?php echo $countClothResult['cost'] ?> </p>

		</div>

		<div class="item">

			<p> <?php echo $countClothResult['name'] . ' ' .$countClothResult['color']?> </p>
			<?php echo '<img class="image" src="/img/' . $countClothResult['image'] . '"'?>
			<br>
			<p> <?php echo $countClothResult['cost'] ?> </p>

		</div>

	</div>

</div>

</body>
</html>