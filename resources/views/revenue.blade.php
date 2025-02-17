<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Danh sách tài khoản</title>
    
    <!-- Load Axios -->
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
    </style>
</head>
<body>

    <h1>Danh Sách Tài Khoản</h1>
    
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Tên</th>
                <th>Doanh số</th>
            </tr>
        </thead>
        <tbody id="userTable">
            <tr><td colspan="2">Đang tải...</td></tr>
        </tbody>
    </table>

    <script>
        async function fetchUsers() {
            try {
                const response = await axios.get(`/api/users/revenues`);
                const users = response.data.data;

                const userTable = document.getElementById('userTable');
                userTable.innerHTML = '';
                
                if (users.length === 0) {
                    userTable.innerHTML = "<tr><td colspan='2'>Không có tài khoản nào!</td></tr>";
                    return;
                }

                users.forEach(user => {
                    console.log(user)
                    const row = `<tr>
                                    <td>${user.id}</td>
                                    <td>${user.name}</td>
                                    <td>${user.revenue}đ</td>
                                </tr>`;
                    userTable.innerHTML += row;
                });

            } catch (error) {
                console.error("Lỗi khi lấy danh sách tài khoản:", error);
                document.getElementById('userTable').innerHTML = "<tr><td colspan='2'>Không thể tải dữ liệu!</td></tr>";
            }
        }

        document.addEventListener("DOMContentLoaded", fetchUsers);
    </script>

</body>
</html>
