$(document).ready(function () {
    var btn_search = $("#btn-search-user");
    // Thực hiện hành động tìm kiếm tại Danh sách người dùng hệ thống
    btn_search.click(function (e) {
        var input_search = $("#input-search").val();
        // Thực hiện hành động khi thẻ input thay đổi
        if(input_search == ''){
            Swal.fire({
                title: 'Oops...',
                text: 'Bạn cần nhập thông tin vào ô tìm kiếm',
                icon: 'error'
            })
        }else if(input_search.length >= 3){
            $.ajax({
                url: 'http://localhost:8080/admin/user-management/search',
                method: 'GET',
                data: {query: input_search},
                success: function(response) {
                    // Xử lý dữ liệu trả về và hiển thị kết quả tìm kiếm
                    alert("Ok")
                },
                error: function(xhr, status, error) {
                    console.log(error);
                }
            });
        }else {
            Swal.fire({
                title: 'Oops...',
                text: 'Hãy nhập tối thiểu 3 ký tự vào ô input',
                icon: 'error'
            })
        }
    });


});

