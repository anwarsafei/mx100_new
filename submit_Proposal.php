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
    Job             : <select class="form-dropdown validate[required]" style="width:150px" id="jobid" name="jobid">
                    <?php
                    $menu=" ";
                  
                    $sql="SELECT jobpostId, description FROM jobpost"; //selection query
                    $rs = mysqli_query($conn, $sql);//odbc_exec($conn,$sql);
                  
                    if (mysqli_num_rows($rs) > 0) 
                    {
                        // output data of each row
                        while($row = mysqli_fetch_assoc($rs)) 
                        {
                            $menu .= "<option value=".$row['jobpostId'].">" . $row['description']. "</option>";
                        }
                    }
                    echo $menu;                

                    ?>
                    </select><br>
    Freelancer      : <select class="form-dropdown validate[required]" style="width:150px" id="freelancerid" name="freelancerid">
                    <?php
                    $menu=" ";
                  
                    $sql="SELECT freelancerId, account FROM freelancer"; //selection query
                    $rs = mysqli_query($conn, $sql);//odbc_exec($conn,$sql);
                  
                    if (mysqli_num_rows($rs) > 0) 
                    {
                        // output data of each row
                        while($row = mysqli_fetch_assoc($rs)) 
                        {
                            $menu .= "<option value=".$row['freelancerId'].">" . $row['account']. "</option>";
                        }
                    }
                    echo $menu;                

                    ?>
                    </select><br>
    <button name="submitProposal" type="submit" >Post Proposal</button>
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


    if (isset($_POST['submitProposal']))
    {          
        $jobid=$_POST['jobid'];
        $freelancerid=$_POST['freelancerid'];

/*
        $sqlCek = "SELECT totalPoint FROM pointusage WHERE freelancerid=$freelancerid";
        $resultCek = mysqli_query($conn, $sql)or die(mysqli_error($conn));
        $rowCek = mysqli_fetch_array($result);
        echo $rowCek[totalPoint];
*/

        $sql2 = "INSERT INTO `submitdata` (`submitdataid`, `jobpostId`, `freelancerId`) VALUES (NULL, $jobid, $freelancerid)";
        $query = mysqli_query($conn, $sql2)or die(mysqli_error($conn));

/*
        date_default_timezone_set("Asia/Jakarta");
        $date = date("m/d/Y");
        $final = strtotime($date);
        $time_posted = date("Y-m-d", $final);


        $sqlPoint= "UPDATE `pointusage` SET dateModified='$time_posted', totalPoint=''";
*/      
        if($query)
        {
            echo "Records inserted successfully.";
        } 
        else
        {
            echo "ERROR: Could not able to execute $sql2";
        }
        
    }

    mysqli_close($conn);
?>

</body>
</html>


