Chart.defaults.global.animation.duration = 2000;
Chart.defaults.global.title.display = false;
Chart.defaults.global.defaultFontColor = '#71748c';
Chart.defaults.global.defaultFontSize = 13;

Chart.defaults.scale.gridLines.zeroLineColor = '#3b3d56';
Chart.defaults.scale.gridLines.color = '#3b3d56';
Chart.defaults.scale.gridLines.drawBorder = false;

Chart.defaults.global.legend.labels.padding = 0;
Chart.defaults.global.legend.display = false;

Chart.defaults.scale.ticks.fontSize = 12;
Chart.defaults.scale.ticks.fontColor = '#71748c';
Chart.defaults.scale.ticks.padding = 30;

Chart.defaults.global.responsive = true;
Chart.defaults.global.maintainAspectRatio = false;

let today_count = 0;
let yesterday_count = 0;
let two_days_ago_count = 0;
let three_days_ago_count = 0;
let four_days_ago_count = 0;
let five_days_ago_count = 0;
let six_days_ago_count = 0;

const today = new Date();
const day = today.getDate();
const yesterday = new Date(today.setDate(day - 1));
const two_days_ago = new Date(today.setDate(day - 2));
const three_days_ago = new Date(today.setDate(day - 3));
const four_days_ago = new Date(today.setDate(day - 4));
const five_days_ago = new Date(today.setDate(day - 5));
const six_days_ago = new Date(today.setDate(day - 6));

$(document).ready(function () {
  $.ajax({
    url: `/admin/userchart`,
    type: 'get',
    dataType: 'json',
    async: false,
    success: function (data) {
      let dataTable = data;

      for (let i = 0; i < dataTable.length; i++) {

        if (getDay(new Date()) == getDay(dataTable[i].created_at)) today_count++;
        else if (getDay(yesterday) == getDay(dataTable[i].created_at)) yesterday_count++;
        else if (getDay(two_days_ago) == getDay(dataTable[i].created_at)) two_days_ago_count++;
        else if (getDay(three_days_ago) == getDay(dataTable[i].created_at)) three_days_ago_count++;
        else if (getDay(four_days_ago) == getDay(dataTable[i].created_at)) four_days_ago_count++;
        else if (getDay(five_days_ago) == getDay(dataTable[i].created_at)) five_days_ago_count++;
        else if (getDay(six_days_ago) == getDay(dataTable[i].created_at)) six_days_ago_count++;
      }
      new Chart(document.getElementById('myChart'), {
        type: 'line',
        data: {
          labels: [
            getDay(six_days_ago),
            getDay(five_days_ago),
            getDay(four_days_ago),
            getDay(three_days_ago),
            getDay(two_days_ago),
            getDay(yesterday),
            getDay(new Date())
          ],
          datasets: [
            {
              label: '신규 회원가입 수',
              data: [
                six_days_ago_count,
                five_days_ago_count,
                four_days_ago_count,
                three_days_ago_count,
                two_days_ago_count,
                yesterday_count,
                today_count
              ],
              backgroundColor: 'transparent',
              borderColor: '#ffb100',
              lineTension: 0,
              borderWidth: 3
            }
          ]
        },
        options: {
          interaction: {
            intersect: false,
            mode: 'index'
          },
          scales: {
            xAxes: [
              {
                gridLines: {
                  display: false
                }
              }
            ],
            yAxes: [
              {
                gridLines: {
                  color: '#E0E0E0',
                  drawBorder: false
                },
                ticks: {
                  stepSize: dataTable.length <= 35 ? 2 : 5
                }
              }
            ]
          }
        }
      });
    },
    error: function (error) {
      console.log(error);
    }
  });
});
