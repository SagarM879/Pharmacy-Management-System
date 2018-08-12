<?php
require_once('tcpdf/config/lang/eng.php');
require_once('tcpdf/tcpdf.php');
include('connect_db.php');
session_start();
		$invoice_no=$_SESSION['invoice_no'];
		$amount=$_SESSION['amount'];
		$payType=$_SESSION['payType'];
		$serial_no=$_SESSION['serial_no'];
if(isset($_POST['tuma']))
{
	$invNo=$_POST['invoice_no'];
	$receipt=$_POST['receipt_no'];
	$amount=$_POST['amount'];
	$pType=$_POST['payment_type'];
	$serial=$_POST['serial_number'];
$t=time("r");
$user=$_SESSION['username'];
$time=date("l\, F d Y\, h:i:s A", $t);
$invoiceNo=$_SESSION['invoice'];
$c_id=$_SESSION['custId'];
$cname=$_SESSION['custName'];
$recNo=$_SESSION['recNo'];
}
else
{header('Location: payment.php');
exit;}

$getCid=mysql_query("SELECT customer_id FROM prescription WHERE invoice_id='{$invNo}' ");
$getName=mysql_query("SELECT customer_name FROM invoice WHERE invoice_id='{$invNo}' ");
$details1=mysql_fetch_array($getName); 
$details=mysql_fetch_array($getCid);

	
	$sqlP=mysql_query("INSERT INTO receipts(reciptNo,customer_id,total,payType,serialno,served_by)
				VALUES('{$recNo}','{$details['customer_id']}','{$amount}','{$pType}','{$serial}','{$_SESSION['username']}')  ");




class MYPDF extends TCPDF {

	// Load table data from file
	public function LoadData($file) {
		// Read file lines
		$lines = file($file);
		$data = array();
		foreach($lines as $line) {
			$data[] = explode(';', chop($line));
		}
		return $data;
	}

	// Colored table
	public function ColoredTable($header,$data) {
		// Colors, line width and bold font
		$this->SetFillColor(255, 255, 255);
		$this->SetTextColor(0);
		$this->SetDrawColor(255, 255,255);
		$this->SetLineWidth(0);
		$this->SetFont('', 'B');
		// Header
		//$w = array(30,15,9,15,);
		$w = array(40,10,20,20);
		$num_headers = count($header);
		for($i = 0; $i < $num_headers; ++$i) {
			$this->Cell($w[$i], 5, $header[$i], 1, 0, 'L', 'R');
		}
		$this->Ln();
		// Color and font restoration
		$this->SetFillColor(255, 255, 255);
		$this->SetTextColor(0);
		$this->SetFont('');
		// Data
		$fill = 0;
	
		foreach($data as $row) {
			$this->Cell($w[0], 4, $row[0], 'LR', 0, 'L', $fill);
			$this->Cell($w[1], 4, number_format($row[1],2), 'LR', 0, 'R', $fill);
			$this->Cell($w[2], 4, $row[2], 'LR', 0, 'L', $fill);
			$this->Cell($w[3], 4, number_format($row[3],2), 'LR', 0, 'R', $fill);
			$this->Ln();
			$fill=!$fill;
		}
		$this->Cell(array_sum($w), 0, '', 'T');
	}
	
}


$pdf = new MYPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_INVOICE_FORMAT, true, 'UTF-8', false);


$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('Pharm Sys');
$pdf->SetTitle('Receipt');
$pdf->SetSubject('Payment');
$pdf->SetKeywords('TCPDF, PDF, example, test, guide');

//$pdf->SetHeaderData(PDF_RECEIPT_LOGO, PDF_RECEIPT_LOGO_WIDTH, PDF_RECEIPT_TITLE, PDF_HEADER_STRING, array(0,0,0), array(0,0,0));
//$pdf->setHeaderFont(Array(PDF_FONT_NAME_RECEIPT, '', PDF_FONT_SIZE_RECEIPT));
//$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

$pdf->setPrintHeader(false);
$pdf->setPrintFooter(false);

$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);


$pdf->SetMargins(PDF_INVOICE_LEFT, PDF_INVOICE_TOP, PDF_INVOICE_RIGHT);
$pdf->SetHeaderMargin(PDF_INVOICE_HEADER);
$pdf->SetFooterMargin(PDF_INVOICE_FOOTER);


$pdf->SetAutoPageBreak(TRUE, PDF_INVOICE_BOTTOM);


$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);


$pdf->setLanguageArray($l);


$pdf->SetFont('times', '', 10, '', true);

$pdf->AddPage();
$spacing = -0.01;
$stretching = 75;
$pdf->setFontStretching($stretching);
				$pdf->setFontSpacing($spacing);
$titling= <<<EOD
<strong> <font style="font-size:11">Pharmacy Sys</font> </strong> <br> <strong>Official Receipt</strong><br>
Student Center Ground Floor,<br> P.O. Box Private Bag Kabarak, India <br> Tel: +254 702 937 925 <br> E-mail: pharmacysys@gmail.com 
<br>-----------------------------------------
EOD;
$header = array('Drug','Price.', 'Qtty' ,'Cost(Kshs.)');
$ddt=<<<EOD
$time   
EOD;
$html = <<<EOD
<br>-----------------------------------------
EOD;


$data = $pdf->LoadData('receipts/docs/'.$recNo.'.txt');
$pdf->writeHTMLCell($w=0, $h=0, $x='', $y='', $titling, $border=0, $ln=1, $fill=0, $reseth=true, $align='C', $autopadding=true);
$pdf->writeHTMLCell($w=0, $h=0, $x='', $y='', $ddt, $border=0, $ln=1, $fill=0, $reseth=true, $align='L', $autopadding=true);
$pdf->writeHTMLCell($w=0, $h=0, $x='', $y='', $html, $border=0, $ln=1, $fill=0, $reseth=true, $align='', $autopadding=true);

$pdf->ColoredTable($header, $data);

$pdf->SetY(-10);
		
		$pdf->Cell(0, 0, 'You were served by: '.strtoupper($user), 0, false, 'L', 0, '', 0, false, 'T', 'M');

$pdf->Output('receipts/printouts/'.$details1['customer_name'].'-receipt.pdf','F');
unlink('receipts/docs/'.$recNo.'.txt');
unset($_SESSION['custId'], $_SESSION['custName'], $_SESSION['age'], $_SESSION['sex'], $_SESSION['postal_address'], $_SESSION['phone']);
header('Location: receipts/printouts/'.$details1['customer_name'].'-receipt.pdf');
exit;

?>