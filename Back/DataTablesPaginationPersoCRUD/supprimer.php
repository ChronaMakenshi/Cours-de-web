<?php
include "config.php";
$id = $_GET["id"];
$stmt = $conn->prepare(" DELETE FROM personne WHERE id = :id ");
$stmt->bindValue(":id", intval($id), PDO::PARAM_INT);
$stmt->execute();
header("Location:index.php");
?>