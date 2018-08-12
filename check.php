<?php
include('connect_db.php');
session_start();
if(isset($_POST['customer_id']))
{
$c_id=$_POST['customer_id'];
	$cname=$_POST['customer_name'];
	$age=$_POST['age'];
	$sex=$_POST['sex'];
	$postal=$_POST['postal_address'];
	$phone=$_POST['phone'];
	
	$_SESSION['custId']=$c_id;
	$_SESSION['custName']=$cname;
	$_SESSION['age']=$age;
	$_SESSION['sex']=$sex;
	$_SESSION['postal_address']=$postal;
	$_SESSION['phone']=$phone;
						
}

if(isset($_POST['drug_name']))
{
	$drug=$_POST['drug_name'];
	$strength=$_POST['strength'];
	$dose=$_POST['dose'];
	$quantity=$_POST['quantity'];
	$sql=mysql_query("INSERT INTO tempPrescri(customer_id,customer_name,age,sex,postal_address,phone,drug_name,strength,dose,quantity)
						VALUES('{$_SESSION['custId']}','{$_SESSION['custName']}','{$_SESSION['age']}','{$_SESSION['sex']}','{$_SESSION['address']}','{$_SESSION['phone']}','{$drug}','{$strength}','{$dose}','{$quantity}')");
						
						$_SESSION['quantity']=$quantity;
	$get_cost=mysql_query("SELECT cost FROM stock WHERE drug_name='{$drug}'");
	$cost=mysql_fetch_array($get_cost);
	$tot=$quantity*$cost[0];
	
	$file=fopen("receipts/docs/".$_SESSION['custId'].".txt", "a+");
	fwrite($file, $drug.";".$strength.";".$dose.";".$quantity.";".$cost[0].";".$tot."\n");
	fclose($file);
	echo "<table width=\"100%\" border=1>";
        echo "<tr> 
		<th>Drug</th> 
		<th>Strength </th>
		<th>Dose</th>
		<th>Quantity </th></tr>";
        // loop through results of database query, displaying them in the table
		 $result = mysql_query("SELECT * FROM tempPrescri")or die(mysql_error());
        while($row = mysql_fetch_array($result)) 
		{
                // echo out the contents of each row into a table
                echo "<tr>";
                
				echo '<td>' . $row['drug_name'] . '</td>';
				echo '<td>' . $row['strength'] . '</td>';
				echo '<td>' . $row['dose'] . '</td>';
				echo '<td>' . $row['quantity'] . '</td>';
				}

}

if(isset($_POST['invoice_no']))
{
$invoice=$_POST['invoice_no'];

	$receipt=$_POST['receipt_no'];
	$amount=$_POST['amount'];
	$payment=$_POST['payment_type'];
	$serial=$_POST['serial_no'];
	
	$_SESSION['receiptNo']=$receipt;
	$_SESSION['amount']=$amount;
	$_SESSION['paymentType']=$payment;
	$_SESSION['serialNo']=$serial;
$getDetails=mysql_query("SELECT invoice,drug,cost,quantity FROM invoice_details WHERE invoice='{$invoice}'");
$getQuantity=mysql_query("SELECT quantity FROM invoice_details WHERE invoice_id='{$invoice}'");
$file=fopen("receipts/docs/".$_SESSION['invoiceNo'].".txt", "w");
	
	
	echo "<table width=\"100%\" border=1>";
        echo "<tr> 
		
		<th>Drug </th>
		<th>Unit cost</th>
		<th>Quantity </th>
		<th>Total Cost(Ksh.)</th></tr>";
while($item5=mysql_fetch_array($getDetails))
			{
			$getDrug=mysql_query("SELECT drug_name FROM stock WHERE stock_id='{$item5['drug']}'");
						
			$drug=mysql_fetch_array($getDrug);
			$qtty=mysql_fetch_array($getQuantity);
			$tot=$item5['cost']*$item5['quantity'];
			$total[]=$tot;
			fwrite($file, $drug[0].";".$item5['cost'].";".$item5['quantity'].";".$tot.";\n");	
				
				echo "<tr>";
                echo '<td>' . $drug[0] . '</td>';
				echo '<td align="right">' . number_format($item5['cost'],2) . '</td>';
				echo '<td align="right">' . $item5['quantity'] . '</td>';
				echo '<td align="right">' . number_format($tot,2). '</td>';
				echo "</tr>";
						
			}
	$zote=array_sum($total);
echo "<tr>";
                echo '<td><strong>TOTAL</strong></td>';
				echo '<td></td>';
				echo '<td></td>';
				echo '<td align="right">' . number_format($zote,2) . '</td>';
				echo "</tr>";	
fwrite($file, "TOTAL;;;".$zote.";\n");
fclose($file);
echo "</table>"; 				
}
?>