<?php
//Send utf-8 header before any output
header('Content-Type: text/html; charset=utf-8'); 
?>
<!DOCTYPE html>
<html>
	<head>
		<title>Database Management project</title>
	</head>	
	<body>
		<h4>Select empno, title, name, appointment, payment_type, rate, appointment_date, currency_symbol, total_cost, specialist, bill, treatment, deptno, picture,picture_path from emp </h4>
		<table border="1">		
			<tr>
				<td><h2>Patient No.</h2></td>
				<td><h2>Title</h2></td>
				<td><h2>Name</h2></td>
				<td><h2>Appointment type</h2></td>
				<td><h2>Payment type</h2></td>
				<td><h2>Small payment rate</h2></td>
				<td><h2>Appointment Date</h2></td>
				<td><h2>Payment Currency</h2></td>
				<td><h2>Total cost</h2></td>
				<td><h2>Specialist</h2></td>
				<td><h2>Bill</h2></td>
				<td><h2>Treatment</h2></td>
				<td><h2>deptno</h2></td>
				<td><h2>Picture</h2></td>
				<td><h2>Picture_path</h2></td>
			</tr>
			<?php			
				$host = "localhost";
				$user = "root";
				$password = "";
				$database = "g00359990";				
				
				$query = "Select empno, title, name, appointment, payment_type, rate, appointment_date, currency_symbol, total_cost, specialist, bill, treatment, deptno, picture,picture_path from emp";
				//Connect to the database
				$connect = mysqli_connect($host,$user,$password,$database) or die("Problem connecting.");
				//Set connection to UTF-8
				mysqli_query($connect,"SET NAMES utf8");
				//Select data
				$result = mysqli_query($connect,$query) or die("Bad Query.");
				mysqli_close($connect);

				while($row = $result->fetch_array())
				{		
					echo "<tr>";
					echo "<td><h2>" .$row['empno'] . "</h2></td>";
					echo "<td><h2>" .$row['title'] . "</h2></td>";
					echo "<td><h2>" .$row['name'] . "</h2></td>";
					echo "<td><h2>" .$row['appointment'] . "</h2></td>";
					echo "<td><h2>" .$row['payment_type'] . "</h2></td>";
					echo "<td><h2>" .$row['rate'] . "</h2></td>";
					echo "<td><h2>" .$row['appointment_date'] . "</h2></td>";
					echo "<td><h2>" .$row['currency_symbol'] . "</h2></td>";
					echo "<td><h2>" .$row['total_cost'] . "</h2></td>";
					echo "<td><h2>" .$row['specialist'] . "</h2></td>";
					echo "<td><h2>" .$row['bill'] . "</h2></td>";
					echo "<td><h2>" .$row['treatment'] . "</h2></td>";
					echo "<td><h2>" .$row['deptno'] . "</h2></td>";
					echo "<td><h2><img src=image_emp.php?empno=".$row['empno']." width=80 height=80/></h2></td>";
					echo "<td><h2><img src=HTTP://".$host.$row['picture_path'] . " width=140 height=140/></h2></td>";
				    echo "</tr>";
				}
			?>
		<table>
	</body>
</html>