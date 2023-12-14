<%-- 
    Document   : orderthank
    Created on : Dec 12, 2023, 11:15:45 PM
    Author     : Thanh Hai
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Đơn Hàng Đã Đặt Thành Công</title>
    <style>
        /* Thêm CSS để làm đẹp modal */
        .modal {
    display: none;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    padding: 20px;
    background-color: #fff;
    border: 1px solid #ddd;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    z-index: 1000;
    max-width: 400px; /* Điều chỉnh chiều rộng tối đa của modal */
    width: 100%;
}

.modal h2 {
    color: #333;
}

.modal a {
    color: #3498db;
    text-decoration: none;
    margin-right: 10px;
}

.modal a:hover {
    text-decoration: underline;
}

.modal button {
    background-color: #3498db;
    color: #fff;
    padding: 10px 15px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.modal button:hover {
    background-color: #2980b9;
}

/* Thêm hiệu ứng mờ nền */
body::before {
    content: '';
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5);
    display: none;
    z-index: 999;
}

.modal.active {
    display: block;
}

/* Thêm hiệu ứng mở modal */
.modal.active, body::before {
    animation: fadeIn 0.3s;
}


    </style>
</head>
<body>
    <div id="myModal" class="modal">
        <h2>Đơn Hàng Của Bạn Đã Đặt Thành Công!</h2>
        <!-- Thêm nội dung thông báo và liên kết đến trang chính hoặc trang theo dõi đơn hàng nếu cần -->
        <a href="home">Quay lại trang chính</a>
        <button onclick="closeModal()">Đóng</button>
    </div>
    <!-- Thêm JavaScript để điều khiển modal -->
    <script>
        function openModal() {
            document.getElementById('myModal').style.display = 'block';
        }

        function closeModal() {
            document.getElementById('myModal').style.display = 'none';
        }

        // Gọi hàm openModal() khi trang được tải
        window.onload = openModal;
    </script>
</body>
</html>
