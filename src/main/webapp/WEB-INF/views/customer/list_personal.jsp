<%--
  Created by IntelliJ IDEA.
  User: a5nam
  Date: 4/6/2023
  Time: 9:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<section class="wrapper">
    <div class="container-fostrap">
        <div>
            <h1 class="heading">
                Tập với PT
            </h1>
        </div>
        <div class="content">
            <div class="container">
                <div id="show-ticket-trainer">
                    <div class="row" id="shows">
                        <c:forEach items="${tickets}" var="tickets">
                            <c:if test="${tickets.tt_id == 2}">
                                <div class="col-xs-12 col-sm-4">
                                    <div class="card" id="open_modal">
                                        <h4 class="ticketsPersonal_id" style="display: none" aria-readonly="true">${tickets.t_id}</h4>
                                        <a class="img-card">
                                            <img src="https://1.bp.blogspot.com/-Bii3S69BdjQ/VtdOpIi4aoI/AAAAAAAABlk/F0z23Yr59f0/s640/cover.jpg" />
                                        </a>
                                        <div class="card-content">
                                            <h4 class="card-title">
                                                <a> ${tickets.t_name}</a>
                                            </h4>
                                            <p class="">
                                                - Số người tham đã tham gia: <br/>
                                                - loại vé <br/>
                                                - Thời gian sử dụng: ${tickets.t_total_days} Ngày<br/>
                                                <c:forEach items="${allTicketTrainer}" var="allTicketTrainer">
                                                <c:if test="${(tickets.t_id) == (allTicketTrainer.ticket_id)}">
                                            <td class="text-center">- Giá vé: <span class="class-price">${allTicketTrainer.t_price_min}</span> - <span class="class-price">${allTicketTrainer.t_price_max}</span></td><br/>
                                            </c:if>
                                            </c:forEach>
                                            - Có hỗ trợ huấn luyện viên cá nhân <br/>
                                            </p>
                                        </div>

                                        <div class="card-read-more">
                                            <a onclick="handleOpenModal(this)" tid=${tickets.t_id} t_name="${tickets.t_name}" t_total_day=${tickets.t_total_days}
                                                    class="btn btn-link btn-block bookInTicketPersonal" type="button" data-bs-toggle="modal" data-bs-target="#trainerModal">
                                            Mua vé ngay
                                            </a>
                                            <div class="modal fade" id="trainerModal">
                                                <div class="modal-dialog"  style="max-width: 82%;">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <p class="text-dark h2 text-center">Mua vé</p>
                                                        <div class="modal-body">
                                                            <div class="py-5">
                                                                <div class="container">
                                                                    <p id="title_ticket_form" class="text-dark h2 text-center"></p>
                                                                    <p hidden style="display: none" id="ticket_personal_id"></p>
                                                                    <div class="form-group">
                                                                        <div class="row d-flex justify-content-center">
                                                                            <label class="form-label col-sm-2 mt-3" for="total_day">Tổng số ngày:</label>
                                                                            <div class="col-sm-6">
                                                                                <input type="text" class="form-control" id="total_day" readonly required/>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group">
                                                                        <div class="row d-flex justify-content-center">
                                                                            <label class="form-label col-sm-2 mt-3" for="start_date">Ngày bắt đầu:</label>
                                                                            <div class="col-sm-6">
                                                                                <input type="date" class="form-control" id="start_date" readonly/>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group">
                                                                        <div class="row d-flex justify-content-center">
                                                                            <label class="form-label col-sm-2 mt-3" for="stop_date">Ngày kết thúc:</label>
                                                                            <div class="col-sm-6">
                                                                                <input type="date" class="form-control" id="stop_date" readonly required/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <div class="row d-flex justify-content-center">
                                                                            <label class="form-label col-sm-2 mt-3" for="pt_name">Chọn HLV:</label>
                                                                            <div class="col-sm-6">
                                                                                <select class="form-select"  id="pt_name" style="width: 82%;float:left;">
                                                                                        <%--<option disabled selected hidden>Chọn HLV</option>--%>
                                                                                </select>
                                                                                <button type="button" style="text-align: center; float:right;" class="btn btn-primary">Lịch trình</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>



                                                                    <div class="form-group">
                                                                        <div class="row d-flex justify-content-center">
                                                                            <label class="form-label col-sm-2 mt-3">Giá gói:</label>
                                                                            <div class="col-sm-6" id="parentPrice">
                                                                                    <%--<input type="number" min="1" class="form-control" id="price" readonly required/>--%>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group">
                                                                        <div class="row d-flex justify-content-center">
                                                                            <label class="form-label col-sm-2 mt-3" for="experienceYear">Số năm kinh nghiệm của PT:</label>
                                                                            <div class="col-sm-6" id="experienceYear">
                                                                                    <%--<input type="number" class="form-control" id="year" readonly required/>--%>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group">
                                                                        <div class="row d-flex justify-content-center">
                                                                            <button onclick="handleBooking()" style="background: #d8d8da;border-color: #d8d8da; width: 730px; margin-left: 20px; margin-right: 20px; margin-top: 10px;"
                                                                                    id="btnShedule"  class="btn btn-primary btn-block mt-5">
                                                                                Mua vé ngay
                                                                            </button>
                                                                            <a id="getPrice" style="display: none"></a>
                                                                                <%--<a onclick="handleBooking()" class="btn btn-link btn-block bookInModal" type="button" data-bs-toggle="modal" style="background: #d8d8da; max-width: 730px">--%>
                                                                                <%--Mua vé ngay--%>
                                                                                <%--</a>--%>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <%--//code js lấy date hiện tại--%>
    <%--<script>--%>
    <%--// var today = new Date();--%>
    <%--// var dd = String(today.getDate()).padStart(2, '0');--%>
    <%--// var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!--%>
    <%--// var yyyy = today.getFullYear();--%>
    <%--// today = yyyy + '-' + mm + '-' + dd;--%>
    <%--// document.getElementById("start_date").value = today;--%>

    <%--// var inputValue = document.getElementById("total_day").value;--%>
    <%--// var nextYear = new Date();--%>
    <%--// nextYear.setDate(today.getDate() + total_day);--%>
    <%--// var nextYearDate = nextYear.getDate();--%>
    <%--// var nextYearMonth = nextYear.getMonth() + 1;--%>
    <%--// var nextYearYear = nextYear.getFullYear();--%>
    <%--// var nextYearDateStr = nextYearDate.toString().padStart(2, '0');--%>
    <%--// var nextYearMonthStr = nextYearMonth.toString().padStart(2, '0');--%>
    <%--// var nextYearStr = nextYearYear + '-' + nextYearMonthStr + '-' + nextYearDateStr;--%>
    <%--// var dateInput = document.getElementById("start_date");--%>
    <%--// dateInput.value = nextYearStr;--%>
    <%--</script>--%>
    <script>
        // click "Mua vé ngay"
        function handleOpenModal(event) {
            // document.getElementById("stop_date")
            document.getElementById("title_ticket_form").innerText = event.getAttribute("t_name");
            document.getElementById("ticket_personal_id").innerText = event.getAttribute("tid");
            document.getElementById("total_day").value = event.getAttribute("t_total_day") + " Ngày";

            // hiển thị ngày hiện tại và lấy total day để cộng với ngày hiện tại để tính end_date
            var today = new Date();
            var year_today = today.getFullYear();
            var month_today = today.getMonth() + 1;
            var day_today = today.getDate();
            var current = year_today + '-' + (month_today < 10 ? '0' : '') + month_today + '-' + (day_today < 10 ? '0' : '') + day_today;
            document.getElementById("start_date").value = current;

            var nextYear = new Date();
            var total_day_ticket = event.getAttribute("t_total_day");
            var num = parseInt(total_day_ticket);
            nextYear.setDate(today.getDate() + num);
            var year = nextYear.getFullYear();
            var month = nextYear.getMonth() + 1;
            var day = nextYear.getDate();
            <%--var dateText = `${year}-${month < 10 ? '0' : ''}${month}-${day < 10 ? '0' : ''}${day}`;--%> // do phiên bản JavaScript không hỗ trợ chúng nên có thể nối các chuỗi bằng toán tử +
            var dateText = year + '-' + (month < 10 ? '0' : '') + month + '-' + (day < 10 ? '0' : '') + day;
            document.getElementById("stop_date").value = dateText;
        }

        var end_date_ticket_pt;
        // click vào mua ở modal
        function handleBooking() {
            var prices = document.getElementById("getPrice").innerHTML;
            console.log("giá: " + prices);
            var ticket_id = sessionStorage.getItem("ticket_id");
            var end_date_ticket = sessionStorage.getItem("end_date_ticket");
            var ticket_pt_id = document.getElementById("ticket_personal_id").textContent;

            if (ticket_id != null) {
                Swal.fire('Bạn đã thêm ticket vào giỏ thành công', '', 'success');
                window.location.href = '<c:url value="/CustomerUser/saveTickerUser?" />' + "ticket_id=" + ticket_id + "&end_date_ticket=" + end_date_ticket + "&price=" + prices+ "&ticket_pt_id=" + ticket_pt_id + "&end_date_ticket_personal=" + end_date_ticket_pt;
                sessionStorage.removeItem('ticket_id');
                sessionStorage.removeItem('end_date_ticket');
            }else {
                Swal.fire('Bạn đã thêm ticket vào giỏ thành công', '', 'success');
                window.location.href = '<c:url value="/CustomerUser/saveTickerUser?" />' + "ticket_id=" + 0 + "&end_date_ticket=" + 0 + "&price=" + prices+ "&ticket_pt_id=" + ticket_pt_id + "&end_date_ticket_personal=" + end_date_ticket_pt;
            }
        }

        $(document).ready(function () {
            $("#show-ticket-trainer").on('click', '.bookInTicketPersonal', function (){
                var ids = $(this).parent().siblings(".ticketsPersonal_id").text();
                $.ajax(
                    {
                        type: "GET",
                        contentType: false,
                        url: "/customer/booking/checkEndDateTicket?"  + "ticket_type_id=" + 2,
                        success: function (resultAPI) {
                            // lấy end date để lưu vào database
                            end_date_ticket_pt = resultAPI;
                            if (resultAPI === ""){
                                loadDataTicketTrainer(ids);
                            }else{
                                Swal.fire({
                                    title: 'Bạn có tiếp tục mua vé tập với PT không?',
                                    showDenyButton: true,
                                    confirmButtonText: 'Có',
                                    denyButtonText: 'Không',
                                    icon: 'question',
                                    text: 'Bạn đã có vé tập với PT',
                                }).then((result) => {
                                    if(result.isConfirmed){
                                    loadDataTicketTrainer(ids);
                                }else if (result.isDenied) {
                                    // document.getElementById("trainerModal").style.display = "none";
                                    // removeChild(trainerModal);
                                    //  document.getElementById("trainerModal").classList.add("hidden");   // đều ko dc
                                    // đóng modal có id = trainerModal
                                    $('#trainerModal').modal('hide');
                                    var show = document.getElementById("shows");
                                    show.scrollIntoView();
                                }
                            })
                            }
                        },

                        error: function () {
                            Swal.fire('Lỗi hệ thống', '', 'warning')
                        }
                    });
            })
        });

        function loadDataTicketTrainer(ids) {
            $.ajax({
                type : "GET",
                // contentType: false,
                url: '<c:url value="/customer/BookingTicketTrainer?" />' + "ids=" + ids,
                success: function (result) {

                    // lấy thẻ có id = pt_name
                    var name = document.getElementById("pt_name");
                    var price = document.getElementById("parentPrice");
                    var experience = document.getElementById("experienceYear");


                    //để xóa nội dung cũ của thẻ có id = pt_name
                    name.innerHTML = "";
                    price.innerHTML = "";
                    experience.innerHTML = "";

                    // tạo 1 option
                    var optionHLV = document.createElement("option");
                    optionHLV.innerText = "Chọn HLV";
                    optionHLV.disabled = true;
                    optionHLV.selected = true;
                    optionHLV.hidden = true;
                    name.appendChild(optionHLV);

                    result.forEach(function(trainer) {

                        //tạo option
                        var trainer_name = document.createElement("option");
                        trainer_name.id = trainer.tp_id;
                        // set text cho thẻ
                        trainer_name.innerText = trainer.u_full_name;
                        console.log(trainer.u_full_name);
                        //chèn vào bên trong một thẻ cha đã tồn tại trên trang web
                        name.appendChild(trainer_name);

                        //bắt sự kiện khi hội viên chọn option
                        name.addEventListener("change", function() {
                            var selectedOption = this.options[this.selectedIndex];
                            if (selectedOption.id == trainer.tp_id) {
                                price.innerHTML = "";
                                experience.innerHTML = "";

                                var optionHLV = document.createElement("option");
                                optionHLV.innerText = "Chọn HLV";
                                optionHLV.disabled = true;
                                optionHLV.selected = true;
                                optionHLV.hidden = true;
                                name.appendChild(optionHLV);

                                var trainer_price = document.createElement("input");
                                // để set class cho thẻ cộng vs trainer.u_id + trainer.tp_price để thẻ không bị duplicate
                                trainer_price.classList = "form-control " + trainer.u_id + trainer.tp_price;
                                // để set id cho thẻ cộng vs trainer.u_id + trainer.tp_price để thẻ không bị duplicate
                                trainer_price.id = "trainerPrice" + trainer.u_id + trainer.tp_price;
                                trainer_price.readOnly = true;
                                trainer_price.required = true;
                                trainer_price.type = "number";
                                // set value cho input để hieent thị data
                                trainer_price.value =  trainer.tp_price;
                                trainer_price.style.display = "inline";
                                price.appendChild(trainer_price);
                                document.getElementById("getPrice").innerText = trainer.tp_price;

                                var trainer_experience = document.createElement("input");
                                trainer_experience.classList = "form-control " + trainer.u_id + trainer.t_experience;
                                trainer_experience.id = "trainerExperience" + trainer.u_id + trainer.t_experience;
                                trainer_experience.readOnly = true;
                                trainer_experience.required = true;
                                trainer_experience.type = "number";
                                trainer_experience.value = trainer.t_experience;
                                trainer_experience.style.display = "inline";
                                experience.appendChild(trainer_experience);
                            }
                        });
                    });
                },
                error: function (error) {
                    Swal.fire('Lỗi hệ thống', '', 'warning')
                    console.log(error);
                }
            });
        }

    </script>
</section>



