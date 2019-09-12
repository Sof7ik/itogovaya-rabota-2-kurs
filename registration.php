<?php

session_start();

if (isset($_SESSION['username'])) {

	if ($_SESSION['role'] == 1)
	echo '<meta http-equiv="refresh" content="0;customer.php">';
	exit();

	if ($_SESSION['role'] == 2)
	echo '<meta http-equiv="refresh" content="0;manager.php">';
	exit();

	if ($_SESSION['role'] == 3)
	echo '<meta http-equiv="refresh" content="0;director.php">';
	exit();

	if ($_SESSION['role'] == 4)
	echo '<meta http-equiv="refresh" content="0;kladman.php">';
	exit();
}

require_once 'connection.php';
include_once 'includes.php';
	
$userLogin = $_POST['userLogin'];
$userPassword = $_POST['userPassword'];
$userPasswordSecond = $_POST['userPasswordSecond'];
$userNickname = $_POST['userNickname'];
$loginSubmit = $_POST['loginSubmit'];

?>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="styles/style_auth.css">
	<meta charset="utf-8">
	<title>РЕГИСТРАЦИЯ</title>
</head>
<body>

	<div class="wrapper">

		<h1>РЕГИСТРАЦИЯ</h1>

		<?php

			if (isset($loginSubmit)) {

				if ($userPassword == $userPasswordSecond) {

					if (preg_match("/[A-Z, А-Я]/", $userPassword)) {
						$checkPassword1 = true;
					}

					else {
						echo '<p class="warning">НЕТ ЗАГЛАВНЫХ БУКВ!</p>';
					}

					if (preg_match("/[0-9]/", $userPassword)) {
						$checkPassword2 = true;
					}

					else {
						echo '<p class="warning">НЕТ ЦИФР!</p>';
					}

					if (preg_match("/[!@#№$%^&?*]/", $userPassword)) {
						$checkPassword3= true;
					}

					else {
						echo '<p class="warning">НЕТ СПЕЦ. СИМВОЛОВ!</p>';
					}

					if (strlen($userPassword) >=6) {
						$checkPassword4 = true;
					}

					else {
						echo '<p class="warning">ПАРОЛЬ СЛИШКОМ КОРОТКИЙ!</p>';
					}

					if ($checkPassword1 == true && $checkPassword2 == true && $checkPassword3 == true && $checkPassword4 == true) {

						$registration = mysqli_query($connection, "INSERT INTO `user` (`login`, `password`, `role`, `nickname`) VALUES ('$userLogin', '$userPassword', '1', '$userNickname');");
					}

				}

				else {
					echo "<p class='warning'>Введенные пароли не совпадают!</p>";
				}	
			}
		?>

		<form action="" method="POST">
			<input type="text" name="userLogin" placeholder="Введите свой логин здесь" required autofocus class="inputText" autocomplete="off">
			<input type="text" name="userPassword" placeholder="Введите свой пароль здесь" required style="margin-top: 15px;" class="inputText">
			<input type="text" name="userPasswordSecond" placeholder="Введите свой пароль еще раз здесь" required style="margin-top: 15px;" class="inputText">
			<input type="text" name="userNickname" placeholder="Введите свой ник здесь" required style="margin-top: 15px;" class="inputText" autocomplete="off">
			<input type="submit" name="loginSubmit" value="ЗАРЕГИСТРИРОВАТЬСЯ!" id="loginButton" class="buttons">
		</form>

		<?php 

			if ($registration == true) {
				echo "<p style='border: 1px solid #4c6cf9; padding: 10px 15px; font-size: 20px; font-weight: bold'>Привет, " . $userNickname . "! Вы успешно зарегистрировались! Сейчас вы будете перенаправлены на страницу авторизации!</p>";
				echo '<meta http-equiv="refresh" content="8;index.php">';
			}

		?>

			<h1>УЖЕ В НАШИХ РЯДАХ???</h1>
			<a href="index.php" class="buttons">ВОЙДИ ТОГДА!</a>

	</div>

</body>
</html>