const tabList = document.querySelectorAll('.tabMenu .list li');
const tableContents = document.querySelectorAll('.tabMenu table');
let activeCont = '';

for (var i = 0; i < tabList.length; i++) {
  tabList[i].querySelector('.btn').addEventListener('click', function (e) {
    e.preventDefault();
    for (var j = 0; j < tabList.length; j++) {
      tabList[j].classList.remove('isOn');

      tableContents[j].style.display = 'none';
    }
    this.parentNode.classList.add('isOn');

    activeCont = this.getAttribute('href');
    document.querySelector(activeCont).style.display = 'block';
  });
}