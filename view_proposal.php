<?php
$servername = "localhost";
$username = "root";
$password = "";

// Create connection
$conn = new mysqli($servername, $username, $password);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
mysqli_select_db($conn,"mx100_revised"); //set the database name
?>

<!DOCTYPE html>
<html>
<head>
    <title>MX100</title>
</head>
<body>
<?php
$sql="SELECT * FROM  submitdata";

$result = mysqli_query($conn, $sql);

// products array
$products_arr=array();
$products_arr["records"]=array();

while($row = mysqli_fetch_array($result)) 
{
	//echo $row['employerId'];
	//echo $row['description'];
	//echo $row['datePost'];
	//echo $row['status'];

	extract($row);
 
    $product_item=array(
            "submitdataId" => $submitdataId,
            "jobpostId" => $jobpostId,
            "freelancerId" => $freelancerId
        );
    array_push($products_arr["records"], $product_item);
}
echo json_encode($products_arr);
?>

	</body>
	</html>