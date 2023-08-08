let page = 1;

$(document).ready(function () {
  ajaxData(page);
});

function ajaxData(page) {
  
    var xhr = new XMLHttpRequest();
    var url = 'http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic';
    var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + '5kTczAnUCFz4l%2BW%2BMvfc2YntVC36c4UOTxbpLzEPG1N1DQ5qStpMlahJjdq71by6HZo3ez8kwe1kFCs3TBlNWw%3D%3D';
    queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10');
    queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent(page);
    queryParams += '&' + encodeURIComponent('_type') + '=' + encodeURIComponent('json');
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
      if (this.readyState == 4) {
        let response = JSON.parse(this.responseText).response.body;
        let item = response.items.item;
        let totalCount = response.totalCount / 1.5;

        pagination(page, totalCount);
        
        let tbody = document.getElementById('contentsWrap');
        tbody.innerHTML = item
          .map(el => `
          	<div>
              <div class="imgWrap"><img src="${el?.popfile}" /></div>
              <div class="infoWrap">
		        <p>${el?.noticeNo}</p>
              	<div>
              	  <p>${el?.kindCd.split('] ')[1]}</p>
	              <p>${el?.sexCd == 'M' 
	                ? '<span class="material-symbols-outlined" style="color: blue;">male</span>' 
	                : '<span class="material-symbols-outlined" style="color: red;">female</span>'}
	              </p>
              	</div>
              	<div class="cate">
		          <p>${el?.age}</p>
		          <p>${el?.colorCd}</p>
		          <p>${el?.weight}</p>
			      <p>${el?.processState}</p>
		        </div>
              	<div class="address">
	              <p>${el?.careAddr}</p>
	              <p>${el?.careNm}</p>
	              <p>${el?.careTel}</p>
              	</div>
	          </div>
            </div>`
          ).join('');
      }
    };

    xhr.send('');
  
}
