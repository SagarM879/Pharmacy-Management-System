








<?php


$getPid=mysql_query("SELECT id FROM patients WHERE name='{$pName}'");
	$pIdd=mysql_fetch_array($getPid);
	$pId=$pIdd[0];
	
	$getDetails=mysql_query("SELECT * FROM tempprescri WHERE customer_id='{$c_id}'");
			$file=fopen("recipts/docs/".$c_id.".txt","a+");
				while($itemm=mysql_fetch_array($getDetails))
				{			
				$id=mysql_query("SELECT * FROM services WHERE name='{$itemm['service']}' ");
				$idd=mysql_fetch_array($id);
				fwrite($file, $itemm['service'].";".$itemm['priority'].";".$itemm['cost']."\n");
											
					$count[] = $itemm['cost'];
				}
				$total=array_sum($count);
				fwrite($file, "TOTAL;;".$total."\n");
				 fclose($file);
	$enterInv=mysql_query("INSERT INTO invoices(invoiceNo, patient, amount, servedBy, status) VALUES('{$invoice}', '{$pId}', '{$total}', '{$who}', 'PENDING')");
	
	$enterDetails=mysql_query("SELECT * FROM tempinv WHERE inv='{$invoice}'");
			
				while($itemmm=mysql_fetch_array($enterDetails))
				{			
				$servid=mysql_query("SELECT * FROM services WHERE name='{$itemmm['service']}' ");
				$idServ=mysql_fetch_array($servid);
				$insDet=mysql_query("INSERT INTO invoicedetails(invoice, service) VALUES('{$invoice}', '{$idServ[0]}')");
							
				
				}
				$delet=mysql_query("DELETE FROM tempscri WHERE inv='{$invoice}'");	