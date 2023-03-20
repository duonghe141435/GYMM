// Get current date
var currentDate = new Date();

// Get the day, month, and year
var day = currentDate.getDate();
var month = currentDate.getMonth() + 1;
var year = currentDate.getFullYear();


// Update the span with the current date
// startDate.innerHTML = day + "/" + month + "/" + year;



var btnMonthticket = document.getElementById("btn_monthticket");
var btnYearticket = document.getElementById("btn_yearticket");
var btnDayticket = document.getElementById("btn_dayticket");


btnDayticket.addEventListener('click', function(){
    var daystartDate = document.getElementById("day-start-date");
    var dayendDate = document.getElementById("day-end-date");
    dayendDate.innerHTML = daystartDate.innerHTML = day + "/" + month + "/" + year;
});

btnMonthticket.addEventListener('click', function(){
    var monthstartDate = document.getElementById("month-start-date");
    var monthendDate = document.getElementById("month-end-date");
    monthstartDate.innerHTML = day + "/" + month + "/" + year;
    var finishDate = new Date(currentDate.getTime() + (29 * 24 * 60 * 60 * 1000));
    monthendDate.innerHTML = finishDate.getDate() + "/" + (finishDate.getMonth()+1) + "/" + finishDate.getFullYear();
});

btnYearticket.addEventListener('click', function(){
    var yearstartDate = document.getElementById("year-start-date");
    var yearendDate = document.getElementById("year-end-date");
    var time = currentDate.getTime();
    var finishDate;
    if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
        // Nếu năm hiện tại là năm nhuận, cộng 1 ngày
        // daysInYear = 366;
        finishDate = new Date(currentDate.getTime() + (366 * 24 * 60 * 60 * 1000));
    }else{
        finishDate = new Date(currentDate.getTime() + (365 * 24 * 60 * 60 * 1000));
    }


    yearstartDate.innerHTML = day + "/" + month + "/" + year;
    yearendDate.innerHTML = finishDate.getDate() + "/" + (finishDate.getMonth()+1) + "/" + finishDate.getFullYear();
});

function getCurrentTime() {
    var date = new Date();
    var hours = date.getHours();
    var minutes = date.getMinutes();
    var seconds = date.getSeconds();
    return hours + ":" + minutes + ":" + seconds;
}

let btnSave = document.querySelector(".save");

btnSave.addEventListener('click', function(event){

});


