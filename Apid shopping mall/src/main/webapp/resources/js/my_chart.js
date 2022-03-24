

const ctx = document.getElementById('myChart').getContext('2d');

// 두번째 그래프
const earning = document.getElementById('earning').getContext('2d');

const gselltop = $("#top").attr("data-gsell");
const gsellbottom = $("#bottom").attr("data-gsell");
const gselldress = $("#dress").attr("data-gsell");
const gsellouter = $("#outer").attr("data-gsell");
const gcategorytop = $("#top").attr("data-category");
const gcategorybottom = $("#bottom").attr("data-category");
const gcategorydress = $("#dress").attr("data-category");
const gcategoryouter = $("#outer").attr("data-category");


const myChart = new Chart(ctx, {
    //이부분이 chart 타입 변하게 하는 부분 
    type: 'polarArea',
    data: {
        // 이게 나오는 이름
        labels: ["top","bottom","dress","outer" ],
        datasets: [{
            label: 'Traffic Source',
            // 이부분이 labels의 수치
            data: [gselltop, gsellbottom, gselldress, gsellouter],
            backgroundColor: [
                'rgba(255, 99, 132, 0.7)',
                'rgba(54, 162, 235, 0.7)',
                'rgba(255, 206, 86, 0.7)',
                'rgba(75, 192, 192, 0.7)'
                // 'rgba(153, 102, 255, 0.2)',
                // 'rgba(255, 159, 64, 0.2)'
            ],

            // borderColor: [
            //     'rgba(255, 99, 132, 1)',
            //     'rgba(54, 162, 235, 1)',
            //     'rgba(255, 206, 86, 1)',
            //     'rgba(75, 192, 192, 1)',
            //     'rgba(153, 102, 255, 1)',
            //     'rgba(255, 159, 64, 1)'
            // ],


            // borderWidth: 1
        }]
    },
    options: {
        // 이렇게 써야 크기가 바뀐다. 
       responsive: true,
    }
});


const January = $("#1").attr("data-sum");
const February = $("#2").attr("data-sum");
const March = $("#3").attr("data-sum");
const April = $("#4").attr("data-sum");
const May = $("#5").attr("data-sum");
const June = $("#6").attr("data-sum");
const July = $("#7").attr("data-sum");
const August = $("#8").attr("data-sum");
const September = $("#9").attr("data-sum");
const October = $("#10").attr("data-sum");
const November = $("#11").attr("data-sum");
const December = $("#12").attr("data-sum");

console.log(January);
console.log(February);
console.log(March);

const myChart2 = new Chart(earning, {
    type: 'bar',
    data: {
        labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        datasets: [{
            label: '월 매출현황',
			            data : [ January, February, March, April, May, June, July, August,
					September, October, November, December],
            backgroundColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235,1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
        }]
    },
    options: {
        responsive: true,
    }
});
