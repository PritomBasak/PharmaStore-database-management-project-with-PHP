<?php

include('config.php');

if (isset($_POST['submit']))
{
$id=$_POST['id'];
$name=mysqli_real_escape_string($db, $_POST['med_name']);
$price=mysqli_real_escape_string($db, $_POST['price']);
$quant=mysqli_real_escape_string($db, $_POST['quantity']);

mysqli_query($db,"UPDATE medicine SET med_name='$name', price='$price' ,quantity='$quant' WHERE med_id='$id'");

header("Location:index.php");
}


if (isset($_GET['id']) && is_numeric($_GET['id']) && $_GET['id'] > 0)
{

$id = $_GET['id'];
$result = mysqli_query($db,"SELECT * FROM medicine WHERE med_id=".$_GET['id']);

$row = mysqli_fetch_array($result);

if($row)
{

$id = $row['med_id'];
$name = $row['med_name'];
$price = $row['price'];
$quant=$row['quantity'];
}
else
{
echo "No results!";
}
}
?>


<!DOCTYPE >
<html>
<head>
<title>Edit medicine</title>
</head>
<body>


<center>
<form action="" method="post" action="edit.php">
<input type="hidden" name="id" value="<?php echo $id; ?>"/>

<table border="1">
<tr>
<td colspan="2"><b><font color='Red'>Edit medicine Records </font></b></td>
</tr>
<tr>
<td width="179"><b><font >medicine Name<em>*</em></font></b></td>
<td><label>
<input type="text" name="med_name" value="<?php echo $name; ?>" />
</label></td>
</tr>

<tr>
<td width="179"><b><font color='#FF876D'>Price<em>*</em></font></b></td>
<td><label>
<input type="text" name="price" value="<?php echo $price ?>" />
</label></td>
</tr>

<tr>
<td width="179"><b><font color='#FF876D'>Quantity<em>*</em></font></b></td>
<td><label>
<input type="text" name="quantity" value="<?php echo $quant;?>" />
</label></td>
</tr>

<tr align="Right">
<td colspan="2"><label>
<input type="submit" name="submit" value="Edit medicine Records">
</label></td>
</tr>
</table>
</form>
</center>
</body>
</html>
