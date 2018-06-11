<?php
$servername = "localhost";
$username = "root";
$password = "";

// Create connection
$conn = new mysqli($servername, $username, $password);

if ($conn->connect_error) 
{
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

<form method="post" name="">
    Employer      : <select class="form-dropdown validate[required]" style="width:150px" id="employerId" name="employerId">
                    <?php
                    $menu=" ";
                  
                    $sql="SELECT employerId, account FROM employer"; //selection query
                    $rs = mysqli_query($conn, $sql);//odbc_exec($conn,$sql);
                  
                    if (mysqli_num_rows($rs) > 0) 
                    {
                        // output data of each row
                        while($row = mysqli_fetch_assoc($rs)) 
                        {
                            $menu .= "<option value=".$row['employerId'].">" . $row['account']. "</option>";
                        }
                    }
                    echo $menu;                

                    ?>
                    </select><br>
    Description      : <input type="text" style="width:250px" name="desc"><br>
    Status           : <select class="form-dropdown validate[required]" style="width:150px" id="status" name="status">
					   <option value="draft" >Draft</option>
					   <option value="published" >Published</option>
	                   </select><br>
    <button name="submitJob" type="submit" >Post JOB</button>
</form>


<?php
$servername = "localhost";
$username = "root";
$password = "";

// Create connection
$conn = new mysqli($servername, $username, $password);

if ($conn->connect_error) 
{
    die("Connection failed: " . $conn->connect_error);
}

mysqli_select_db($conn,"mx100_revised");

    if (isset($_POST['submitJob']))
    {          
        $employerId=$_POST['employerId'];
        $description=$_POST['desc'];
        $status=$_POST['status'];

        date_default_timezone_set("Asia/Jakarta");
   		$date = date("m/d/Y");
   		$final = strtotime($date);
   		$time_posted = date("Y-m-d", $final);

        $sql2 = "INSERT INTO `jobpost` (`jobpostId`, `employerId`, `description`, `datePost`, `status`) VALUES (NULL, $employerId, '$description', '$time_posted', '$status')";
        echo "ERROR: Could not able to execute $sql2";
        $query = mysqli_query($conn, $sql2) or die(mysqli_error($conn));
        
        if($query)
        {
        	echo "Records inserted successfully.";

        } 
        else
        {
        	echo "ERROR: Could not able to execute $sql2";
            echo $mysqli->error;
        }
        
    }

    mysqli_close($conn);
?>

</body>
</html>


