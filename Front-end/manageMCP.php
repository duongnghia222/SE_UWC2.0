<?php
require_once 'connection.php';
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý MCP</title>
    <link rel="stylesheet" type="text/css" href="./css/Task.css">
    <link rel="stylesheet" type="text/css" href="./css/bar.css">
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
                <li class="message select">
                    <i class="ti-map"></i>
                    <a href="manageMCP.php?sort=id&search=&page=1">
                        MCP
                    </a>
                </li>
                <li class="manage">
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
            <div class="container">
                <div class="nav_sort">
                    <!-- Nav pills -->
                    <form class="form-inline" action="" method="GET">
                        <select type="sort" class="form-control mb-2 mr-sm-2" id="sort" name="sort">
                            <option value="id" <?php if (isset($_GET['sort']) && $_GET['sort'] == "id") {
                                                    echo "selected";
                                                } ?>>ID</option>
                            <option value="capacity" <?php if (isset($_GET['sort']) && $_GET['sort'] == "capacity") {
                                                            echo "selected";
                                                        } ?>>Sức chứa</option>
                            <option value="current" <?php if (isset($_GET['sort']) && $_GET['sort'] == "current") {
                                                        echo "selected";
                                                    } ?>>Lượng hiện tại</option>
                            <option value="status" <?php if (isset($_GET['sort']) && $_GET['sort'] == "status") {
                                                        echo "selected";
                                                    } ?>>Trạng thái</option>
                            <option value="location" <?php if (isset($_GET['sort']) && $_GET['sort'] == "location") {
                                                            echo "selected";
                                                        } ?>>Địa điểm</option>
                        </select>
                        <input type="text" class="form-control mb-2 mr-sm-2" name="search">
                        <button type="submit" class="btn btn-primary mb-2">Sort</button>
                    </form>
                </div>
                <div class="button">
                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModalCollector">
                        Thêm MCP <i class="ti-plus" style="font-size:12px;padding:2px; font-weight:bold;"></i>
                    </button>
                </div>
            </div>
            <!-- Tab panes -->
            <div class="tab-content">
                <!-- <div class="tab-pane container active" id="Collector"> -->
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Sức chứa</th>
                                <th>Lượng hiện tại</th>
                                <th>Trạng thái</th>
                                <th>Địa điểm</th>
                                <th>Vĩ độ</th>
                                <th>Kinh độ</th>
                                <th>Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $sort_option = $_GET['sort'];
                            $query = "SELECT * from `mcp` order by $sort_option";
                            if (isset($_GET["search"]) && !empty($_GET["search"])) {
                                $sort_option = $_GET['sort'];
                                $str = $_GET['search'];
                                $query = "SELECT * from `mcp` where $sort_option REGEXP '$str+' order by $sort_option";
                            }
                            $result = mysqli_query($conn, $query);
                            while ($r = mysqli_fetch_assoc($result)) {
                            ?>
                                <tr>
                                    <td><?php echo $r['id']; ?></td>
                                    <td><?php echo $r['capacity']; ?></td>
                                    <td><?php echo $r['current']; ?></td>
                                    <td><?php echo $r['status']; ?></td>
                                    <td><?php echo $r['location']; ?></td>
                                    <td><?php echo $r['latitude']; ?></td>
                                    <td><?php echo $r['longtitude']; ?></td>
                                    <td>
                                        <a name="id" href="editMCP.php?ID=<?php echo $r['id']; ?>" class="btn btn-primary">Sửa</a>
                                        <a name="id" href="deleteMCP.php?ID=<?php echo $r['id']; ?>" onclick="return confirm('Bạn có muốn xóa MCP này?')" class="btn btn-danger">Xóa</a>
                                    </td>
                                </tr>
                            <?php
                            }
                            ?>
                        </tbody>
                    </table>
                <!-- </div> -->
            </div>
        </div>
        <!-- Tabs content -->

    </div>
    </div>
</body>
<!-- The Modal -->
<div class="modal fade" id="myModalCollector">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Thêm MCP mới</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <form action="newMCP.php" method="post">
                    <div class="form-group">
                        <label for="capacity">Sức chứa</label>
                        <div class="container">
                            <input class="form-control" id="capacity" name="capacity">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="current">Lượng hiện tại</label>
                        <div class="container">
                            <input class="form-control" id="current" name="current">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="location">Địa điểm</label>
                        <div class="container">
                            <input class="form-control" id="location" name="location">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="latitude">Vĩ độ</label>
                        <div class="container">
                            <input class="form-control" id="latitude" name="latitude">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="longtitude">Kinh độ</label>
                        <div class="container">
                            <input class="form-control" id="longtitude" name="longtitude">
                        </div>
                    </div>
                    <button value="1" name="type" id="type" onclick="return confirm('Xác nhận thêm MCP?')" type="submit" class="btn btn-primary">Submit</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </form>
            </div>
        </div>
    </div>
</div>
</html>