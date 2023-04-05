
// Get the modal and the <span> element that closes it
var modal = document.getElementById("myModal");
var modalBook = document.getElementById("myModalBook");
var span = document.getElementsByClassName("close")[0];
var span1 = document.getElementsByClassName("close")[1];
// Get all the table cells
var cells = document.getElementsByTagName("td");
// Loop through the cells and add the click event listener
for (var i = 0; i < cells.length; i++) {
    cells[i].addEventListener("click", function() {


        // Populate the modal with the data
        //document.getElementById("modal-text").textContent = data;

        // Display the modal
        //if(chua mua ve)
        //modal.style.display = "block";
        //modalBook.style.display = "none";
        //else if(da mua ve)
        if(this.classList.contains("past"))  {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Bạn không thể đặt lịch vào những ngày đã qua!',
            })
        }
        else{
            modalBook.style.display = "none";
            modal.style.display = "block";
        }
        console.log(cells[i].value);

    });
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}
span1.onclick = function() {
    modalBook.style.display = "none";
}




const yearSelect = document.getElementById('year-select');
const weekSelect = document.getElementById('week-select');

// Lấy ngày hiện tại
const now = new Date();

// Tạo danh sách các tuần
function createWeekOptions(selectedYear) {
    const numberOfWeeks = getNumberOfWeeks(selectedYear);
    const weeks = [];

    for (let i = 1; i <= numberOfWeeks; i++) {
        const startDate = getStartDateOfWeek(selectedYear, i);
        const stopDate = getStopDateOfWeek(selectedYear, i);
        weeks.push({ number: i, startDate, stopDate });
    }

    return weeks;
}

let dayT = 0 ;
// Xử lý sự kiện change trên year-select
yearSelect.addEventListener('change', function() {
    // Xóa tất cả các tùy chọn hiện có trong week-select
    weekSelect.innerHTML = '';

    // Lấy giá trị năm được chọn
    const selectedYear = yearSelect.value;

    // Tạo danh sách các tuần
    const weeks = createWeekOptions(selectedYear);

    const dateSelectStop = null;
    // Thêm các tùy chọn mới vào week-select
    weeks.forEach(week => {
        const dateSelectStop = week.stopDate.getMonth();
    const option = document.createElement('option');
    option.value = week.number;
    let day = week.startDate.getDate() ;
    let month = week.startDate.getMonth()+1;
    // console.log(week.startDate.getDate() + "-"+ week.startDate.getMonth()+1);
    // console.log();
    option.innerHTML = `Từ (${week.startDate.getDate()}/${week.startDate.getMonth()+1}) đến (${week.stopDate.getDate()}/${week.stopDate.getMonth()+1})`;
    option.setAttribute("data-timeFirst", `${week.startDate.getDate()}` + '/' + `${week.startDate.getMonth()+1}` );
    const stopDateOfWeek = getStartDateOfWeek(selectedYear, week.number);
    const dayStopW = new Date(stopDateOfWeek.getTime() + 7 * 86400000);

    if (now.getTime() > week.startDate.getTime() && now.getTime() < dayStopW.getTime()) {
        option.setAttribute("selected", true);
    }

    weekSelect.appendChild(option); // Thêm option vào weekSelect
});
    const dateTime = weekSelect.firstChild.getAttribute('data-timeFirst').split("/");
    innerTable(selectedYear,dateTime[1], dateTime[0] )

});
function innerTable(year, month, day){
    const dateText = `${year}-${month < 10 ? '0' : ''}${month}-${day < 10 ? '0' : ''}${day}`;
    const weekDates = getWeekDates(dateText);
    for (let i = 0; i <= 6; i++) {
        const d = document.getElementById(i);
        d.innerHTML = weekDates[i];
    }
}


// Kích hoạt sự kiện change trên year-select để tạo danh sách tuần mặc định khi load lần đầu
const event = new Event('change');
yearSelect.dispatchEvent(event);
window.addEventListener('load', function() {
    yearSelect.dispatchEvent(event);
});


var currentYear = new Date().getFullYear();
var yearList = '';
for (var i = -2; i <= 1; i++) {
    var year1 = currentYear + i;
    yearList += '<option value="' + year1 + '">' + year1 + '</option>';
    if(year1===currentYear){
        yearList = yearList.replace('>' + year1 + '<', ' selected="selected">' + year1 + '<');
    }
}
document.getElementById("year-select").innerHTML = yearList;


function getNumberOfWeeks(year) {
    const firstDayOfYear = new Date(year, 0, 1);
    // const daysOffset = (8 - firstDayOfYear.getDay()) % 7; // lấy số ngày offset từ thứ hai
    // const firstMondayOfYear = new Date(year, 0, 1 + daysOffset);
    // const numberOfDays = Math.round((now - firstMondayOfYear) / 86400000);
    // return Math.ceil(numberOfDays / 7);
    const daysOffset = (8 - firstDayOfYear.getDay()) % 7; // lấy số ngày offset từ thứ hai
    const firstMondayOfYear = new Date(year, 0, 1 + daysOffset);
    const lastDayOfYear = new Date(year, 11, 31); // Lấy ngày cuối cùng của năm
    const numberOfDays = Math.round((lastDayOfYear - firstMondayOfYear) / 86400000) + 1; // Cộng thêm một để tính cả ngày cuối cùng của năm
    return Math.ceil(numberOfDays / 7);
}

function getStartDateOfWeek(year, weekNumber) {
    const firstDayOfYear = new Date(year, 0, 1);
    const daysOffset = (8 - firstDayOfYear.getDay()) % 7; // lấy số ngày offset từ thứ hai
    const firstMondayOfYear = new Date(year, 0, 1 + daysOffset);
    const startDateOfWeek = new Date(firstMondayOfYear.getTime() + (weekNumber - 1) * 7 * 86400000);
    return startDateOfWeek;
}

function getStopDateOfWeek(year, weekNumber) {
    const startDateOfWeek = getStartDateOfWeek(year, weekNumber);
    const stopDateOfWeek = new Date(startDateOfWeek.getTime() + 6 * 86400000);
    return stopDateOfWeek;
}


//table
const currentDate = new Date();
const year = currentDate.getFullYear();
const month = currentDate.getMonth() + 1;
const day = currentDate.getDate();
const dateText = `${year}-${month < 10 ? '0' : ''}${month}-${day < 10 ? '0' : ''}${day}`;
const fromToText = `${month < 10 ? '0' : ''}${month}-${day < 10 ? '0' : ''}${day}`;
function getWeekDates(dateString) {
    var days = [];
    var date = new Date(dateString);
    var dayOfWeek = date.getDay()-1;
    var start = new Date(date);
    var today = date;
    start.setDate(date.getDate() - dayOfWeek)+1; // Lấy ngày đầu tiên của tuần
    var end = new Date(start);
    end.setDate(start.getDate() + 6);

    for (var i = 0; i <= 6; i++) {
        var day = new Date(start);
        day.setDate(start.getDate() + i);
        var dayOfWeek = day.toLocaleDateString('vi-VN', { weekday: 'long' });
        var dayOfMonth = day.getDate();
        var month = day.toLocaleDateString('vi-VN', { month: 'short' });
        var year = day.getFullYear();
        var dateString = `${dayOfWeek} <br/> ${dayOfMonth} ${month} ${year}`;
        var table = document.getElementsByTagName("table")[0];
        var rows = table.getElementsByTagName("tr");
        if(day.getDate()===today.getDate() && day.getMonth()===today.getMonth() && day.getFullYear()===today.getFullYear()){

            for(j=0;j<rows.length-1;j++){
                var cells = rows[j+1].getElementsByTagName("td");
                cells[i].classList.add("today");
            }
        }else if(day<today){
            for(j=0;j<rows.length-1;j++){
                var cells = rows[j+1].getElementsByTagName("td");
                cells[i].classList.add("past");
            }
        }
        days.push(dateString);
    }
    return days;
}

var weekDates = getWeekDates(dateText);
for (var i = 0; i <= 6; i++) {
    var d = document.getElementById(i);
    d.innerHTML = weekDates[i];
}


const dateInput = document.getElementById("date-input");
dateInput.value = dateText;


var mySelect = document.getElementById("ticket_type_buyTicket");
var perJoinLab = document.getElementById("num");
var perJoinIn = document.getElementById("num1");
var timePracIn = document.getElementById("timePracIn");
var timePracLab = document.getElementById("timePracLab");
var dateSta = document.getElementById("date-input");

// Bắt sự kiện "change" của select modal
mySelect.addEventListener("change", function() {
    // Lấy giá trị được chọn
    var selectedValue = mySelect.value;

    // Nếu giá trị là "HLV nhóm", hiển thị phần tử
    if (selectedValue === "nh") {
        perJoinLab.removeAttribute('hidden');
        perJoinIn.removeAttribute('hidden');
        timePracIn.removeAttribute('hidden');
        timePracLab.removeAttribute('hidden');
        dateSta.setAttribute('readonly', true);
        dateInput.value = null; // dùng để lấy ngày bắt đầu từ data base
    }
    // Ngược lại, nếu giá trị là "cá nhân", ẩn phần tử
    else if (selectedValue === "cn") {
        perJoinLab.setAttribute('hidden',true);
        perJoinIn.setAttribute('hidden',true);
        timePracIn.setAttribute('hidden', true);
        timePracLab.setAttribute('hidden', true);
        dateSta.removeAttribute('readonly');
        dateInput.value = dateText;
        // dateSta.setAttribute('readonly', false);
        // myElement.style.display = "none";
        // myElement1.style.display = "none";
    }
});
document.getElementById("week-select").addEventListener("change", function() {
    const selectedDate = new Date();
    const year = yearSelect.value;
    let dateFirst = this.options[this.selectedIndex].getAttribute('data-timeFirst');
    const month = dateFirst.split("/")[1];
    const day = dateFirst.split("/")[0];

    const dateText = `${year}-${month < 10 ? '0' : ''}${month}-${day < 10 ? '0' : ''}${day}`;
    const weekDates = getWeekDates(dateText);
    for (let i = 0; i <= 6; i++) {
        const d = document.getElementById(i);
        d.innerHTML = weekDates[i];
    }
    console.log(selectedDate);
});

