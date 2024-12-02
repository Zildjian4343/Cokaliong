<?php
$currentPage = basename($_SERVER['PHP_SELF']);
if ($_SESSION['level'] == '0') { // Admin Level
    ?>
    <li class="nav-item">
        <a class="nav-link <?= ($currentPage == 'index.php') ? 'active' : ''; ?>" href="index.php">
            <i class="fas fa-home"></i><span>Admin Dashboard</span>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link <?= ($currentPage == 'transaction.php') ? 'active' : ''; ?>" href="transaction.php">
            <i class="fas fa-wallet"></i><span>Transaction</span>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link <?= ($currentPage == 'customer.php') ? 'active' : ''; ?>" href="customer.php">
            <i class="fas fa-users"></i><span>Customers</span>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link <?= ($currentPage == 'queue.php') ? 'active' : ''; ?>" href="queue.php">
            <i class="fas fa-tasks"></i><span>Laundry Status</span>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link <?= ($currentPage == 'expedinture.php') ? 'active' : ''; ?>" href="expedinture.php">
            <i class="fas fa-file-invoice-dollar"></i><span>Expenses</span>
        </a>
        <a class="nav-link <?= ($currentPage == 'supply.php') ? 'active' : ''; ?>" href="supply.php">
            <i class="fas fa-boxes"></i><span>Supply</span>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link <?= ($currentPage == 'sales.php') ? 'active' : ''; ?>" href="sales.php">
            <i class="fas fa-chart-line"></i><span>Sales</span>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link <?= ($currentPage == 'staff.php') ? 'active' : ''; ?>" href="staff.php">
            <i class="fas fa-user-tie"></i><span>Staff</span>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link <?= ($currentPage == 'profile.php') ? 'active' : ''; ?>" href="profile.php">
            <i class="fas fa-cog"></i><span>Settings</span>
        </a>
    </li>
    <?php
} else { // Staff Level
    ?>
    <li class="nav-item">
        <a class="nav-link <?= ($currentPage == 'index.php') ? 'active' : ''; ?>" href="index.php">
            <i class="fas fa-home"></i><span>STAFF Dashboard</span>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link <?= ($currentPage == 'transaction.php') ? 'active' : ''; ?>" href="transaction.php">
            <i class="fas fa-wallet"></i><span>Transaction</span>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link <?= ($currentPage == 'customer.php') ? 'active' : ''; ?>" href="customer.php">
            <i class="fas fa-users"></i><span>Customers</span>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link <?= ($currentPage == 'queue.php') ? 'active' : ''; ?>" href="queue.php">
            <i class="fas fa-tasks"></i><span>Laundry Status</span>
        </a>
    </li>
    <?php
}
?>
