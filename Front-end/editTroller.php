<?php
$edit = $_GET['ID'];
require_once 'connection.php';
$editTroller = "SELECT * from troller where troller_id='$edit'";
$result = mysqli_query($conn, $editTroller);
$row = mysqli_fetch_assoc($result);
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Troller</title>
    <link rel="stylesheet" type="text/css" href="./css/bar.css">
    <link rel="stylesheet" type="text/css" href="./css/edit.css">
    <link rel="stylesheet" type="text/css" href="./assets/font_icon/themify-icons-font/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
    <div id="container">
    <div id="navBar">
            <div class="logo">
                <img src="./assets/img/logo.png" alt="logo">
                <p class="title">UWC 2.0</p>
            </div>
            <ul class="navList">
                <li class="main">
                    <i class="ti-book"></i>
                    <a href="index.php">
                        Trang chủ
                    </a>
                </li>
                <li class="task">
                    <i class="ti-pencil-alt"></i>
                    <a href="Task.php?sort=id&search=&page=1">
                        Nhiệm vụ
                    </a>
                </li>
                <li class="employee">
                    <i class="ti-user"></i>
                    <a href="employee.php?sort=username&search=&page=1">
                        Nhân viên
                    </a>
                </li>
                <li class="message">
                    <i class="ti-comments"></i>
                    <a href="chat.php">
                        Tin nhắn
                    </a>
                </li>
                <li class="message">
                    <i class="ti-map"></i>
                    <a href="manageMCP.php?sort=id&search=&page=1">
                        MCP
                    </a>
                </li>
                <li class="manage select">
                    <i class="ti-truck"></i>
                    <a href="manageVehicle.php?sort=id&search=&page=1">
                        Phương tiện
                    </a>
                </li>
                <li class="info">
                    <i class="bi bi-box-arrow-right"></i>
                    <a href="logout.php">
                        Đăng xuất
                    </a>
                </li>
            </ul>
        </div>
        <div id="topbar">
            <div id="greeting">
                <h2>Chào buổi sáng</h2>
                <h4>Hy vọng bạn có một ngày làm việc tốt lành</h4>
            </div>
            <ul class="topbar_list">
                <li class="search">
                    <i class="bi bi-search"></i>
                </li>
                <li class="notify">
                    <i class="bi bi-bell"></i>
                </li>
                <li class="user">
                    <img src="./assets/img/user1.png" alt="">
                </li>
                <li class="role">
                    <p class="role"><b>Quản trị viên</b></p>
                </li>
            </ul>
        </div>
        <div id="content">
            <form action="updateTroller.php" method="post">
                <input type="hidden" value="<?php echo $edit ?>" name="id" id="id">
                <div class="form-group">
                    <label for="area">Khu vực</label>
                    <input class="form-control" id="area" name="area" value="<?php echo $row['area']; ?>">
                </div>
                <div class="form-group">
                    <label for="state">Người điều khiển</label>
                    <div class="form-group">
                        <div class="container">
                            <div class="form-group">
                                <select name="empName" id="empName" class="post form-control">
                                    <?php
                                    $sql = "SELECT username from employee where employee.role = 'janitor'";
                                    $i = 0;
                                    $empList = array();
                                    if ($result = mysqli_query($conn, $sql)) {
                                        while ($row = mysqli_fetch_array($result)) {
                                            $empList[] = $row['username'];
                                            echo $empList[$i];
                                    ?>
                                            <option><?php echo $empList[$i]; ?></option>
                                    <?php
                                            $i++;
                                        }
                                    }
                                    ?>
                                </select>
                            </div>
                        </div>
                    </div>
                    <button onclick="return confirm('Bạn muốn lưu thay đổi?')" type="submit" class="btn btn-primary">Submit</button>
                    <a href="manageVehicle.php?sort=ID&search=" class="btn btn-danger">Cancel</a>
                </div>
            </form>
        </div>
    </div>
</body>

</html>