<?php
include_once 'functions/authentication.php';
include_once 'functions/connection.php';
$id = $_GET['id'];
$get_tracking_url = getHostByName(getHostName()) . dirname($_SERVER['PHP_SELF']) . '/tracking.php?id=' . $id;

function getLaundryReceipt(){
    global $db;
    global $id;
    $sql = "SELECT t.id, t.customer_id, t.user_id, t.total, l.kilo, p.price, p.name, c.fullname, p.unit
        FROM transactions AS t
        JOIN laundry AS l ON t.id = l.transaction_id 
        JOIN prices AS p ON l.type = p.id
        JOIN users AS u ON t.user_id = u.id
        JOIN customers AS c ON t.customer_id = c.id
        WHERE t.id = :id";
    $stmt = $db->prepare($sql);
    $stmt->bindParam(':id', $id);
    $stmt->execute();
    $result = $stmt->fetchAll();
    foreach($result as $row){
        ?>
        <tr class="font-monospace">
            <td class="font-monospace text-start mt-0 mb-0" style="font-size: 12px;"><?= $row['name']?></td>
            <th class="font-monospace text-center mt-0 mb-0" style="font-size: 12px;"><?= $row['kilo'].' '.$row['unit']?></th>
            <th class="font-monospace text-center mt-0 mb-0" style="font-size: 12px;">₱<?= number_format($row['price'], 2)?></th>
            <td class="font-monospace text-end mt-0 mb-0" style="font-size: 12px;">₱<?= number_format($row['price'] * $row['kilo'], 2)?></td>
        </tr>
        <?php
    }
}

function getItemsReceipt(){
    global $db;
    global $id;
    $sql = "SELECT e.qty, e.item_id, i.name, i.unit
        FROM items AS i
        JOIN expenditures AS e ON i.id = e.item_id
        WHERE e.transaction_id = :id";
    $stmt = $db->prepare($sql);
    $stmt->bindParam(':id', $id);
    $stmt->execute();
    $result = $stmt->fetchAll();
    foreach($result as $row){
        ?>
        <tr class="font-monospace">
            <td class="font-monospace text-start mt-0 mb-0" style="font-size: 12px;"><?= $row['name']?></td>
            <th class="font-monospace text-center mt-0 mb-0" style="font-size: 12px;"><?= $row['unit']?></th>
            <td class="font-monospace text-end mt-0 mb-0" style="font-size: 12px;"><?= $row['qty']?></td>
        </tr>
        <?php
    }
}

$sql = "SELECT t.id, t.total, l.kilo, p.price, t.amount, c.fullname
FROM transactions AS t
JOIN laundry AS l ON t.id = l.transaction_id 
JOIN prices AS p ON l.type = p.id
JOIN customers AS c ON t.customer_id = c.id
WHERE t.id = :id";
$stmt = $db->prepare($sql);
$stmt->bindParam(':id', $id);
$stmt->execute();
$result = $stmt->fetchAll();

$total = 0;
$customer = '';

foreach($result as $row){
    $total += $row['price'] * $row['kilo'];
    $customer = $row['fullname'];
    $amount = $row['amount'];
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Express Laundry Pala-o || Management System </title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&amp;display=swap">
    <script src="assets/js/qrious.min.js"></script>
    <style>
        body {
            font-family: 'Nunito', sans-serif;
            font-size: 12px;
            background-color: #f5f5f5;
        }

        .card {
            max-width: 600px;
            margin: 20px auto;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
        }

        .card-header {
            text-align: center;
            font-size: 18px;
            font-weight: bold;
            color: #333;
        }

        .font-monospace {
            font-family: 'Courier New', monospace;
        }

        .table {
            width: 100%;
            margin-top: 10px;
        }

        .receipt-footer {
            text-align: right;
            font-size: 14px;
        }

        .qr-code {
            margin-top: 20px;
            text-align: center;
        }

        .bold {
            font-weight: bold;
        }

        .table-bordered th, .table-bordered td {
            border: 1px solid #ddd;
            padding: 8px;
        }

        .table-bordered th {
            background-color: #f8f9fa;
        }
    </style>
</head>

<body onload="window.print()">
    <div class="card">
        <div class="card-header">
            <h4><img src="assets/img/washing-clothes.gif" width="40">&nbsp;Express Laundry Pala-o</h4>
            <p>Quezon Street Palao, Iligan City</p>
            <p>Phone (+63) 967 995 7810</p>
            <p>Date: <?php echo date('Y-m-d')?></p>
            <canvas id="qr-code"></canvas>
        </div>

        <div class="card-body">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th colspan="4" style="text-align: center; font-size: 15px;">Laundry Receipt</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="font-monospace"><strong>CUSTOMER:</strong> <?= $customer ?></td>
                        <td class="font-monospace"></td>
                        <td class="font-monospace text-end"><strong>INVOICE #</strong> <?= $id ?></td>
                        <td class="font-monospace text-end"></td>
                    </tr>
                </tbody>
            </table>

            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="font-monospace text-start"><strong>LAUNDRY</strong></th>
                        <th class="font-monospace text-center"><strong>QUANTITY</strong></th>
                        <th class="font-monospace text-center"><strong>PRICE</strong></th>
                        <th class="font-monospace text-end"><strong>TOTAL</strong></th>
                    </tr>
                </thead>
                <tbody>
                    <?php getLaundryReceipt(); ?>
                </tbody>
            </table>

            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="font-monospace text-start"><strong>ITEM</strong></th>
                        <th class="font-monospace text-center"><strong>UNIT</strong></th>
                        <th class="font-monospace text-end"><strong>QTY</strong></th>
                    </tr>
                </thead>
                <tbody>
                    <?php getItemsReceipt(); ?>
                </tbody>
            </table>

            <table class="table table-bordered">
                <tr>
                    <td class="font-monospace text-end"><strong>TOTAL: </strong>₱<?php echo number_format($total, 2); ?></td>
                </tr>
                <tr>
                    <td class="font-monospace text-end"><strong>AMOUNT PAID: </strong>₱<?php echo number_format($amount, 2); ?></td>
                </tr>
                <tr>
                    <td class="font-monospace text-end"><strong>CHANGE: </strong>₱<?php echo number_format($amount - $total, 2); ?></td>
                </tr>
            </table>
        </div>

        <div class="receipt-footer">
            <strong>THANK YOU FOR CHOOSING US!</strong>
            <p>For inquiries, please visit or call us at the number above.</p>
            <p><strong>Track your order: <a href="<?= $get_tracking_url ?>">Track Here</a></strong></p>
        </div>

        <div class="qr-code">
            <script>
                var qr = new QRious({
                    element: document.getElementById('qr-code'),
                    value: "<?= $get_tracking_url ?>",
                    size: 150
                });
            </script>
        </div>
    </div>
</body>

</html>
