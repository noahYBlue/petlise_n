function pagination(page, totalCount) {
  const lastPage = Math.ceil(totalCount / 10);

  var pageLimit = 10;
  var startPage = parseInt((page - 1) / pageLimit) * pageLimit + 1;

  document.getElementById('pagination').innerHTML = `
	${startPage <= 10
      ? `<div class="prev">`
      : `<div class="prev" id="fisrtActive">`}
	  <div class="first prevArrow"></div>
	  <div class="first prevArrow"></div>
	</div>
	${startPage <= 10 
	  ? `<div class="prev">` 
	  : `<div class="prev" id="prevActive">`}
	  <div class="prevArrow"></div>
	</div>
	${new Array(10).fill(1).map((_, index) =>
      index + startPage <= lastPage
        ? `<div class="pageNumber${index + startPage == page ? ' active' : ''}" id="${index + startPage}">${`${index + startPage}`}</div>`
        : ''
    ).join('')}
	${startPage + 10 <= lastPage
      ? `<div class="next" id="nextActive">`
      : `<div class="next">`}
	  <div class="nextArrow"></div>
	</div>
	${startPage + 10 <= lastPage
      ? `<div class="next" id="lastActive">`
      : `<div class="next">`}
	  <div class="last nextArrow"></div>
	  <div class="last nextArrow"></div>
	</div>
	`;

  const pageNums = document.querySelectorAll('.pageNumber');

  pageNums.forEach(cell => {
    cell.addEventListener('click', e => {
      let children = e.target.parentElement.children;

      for (var i = 0; i < children.length; i++) {
        e.target.parentElement.children[i].classList.remove('active');
      }

      e.currentTarget.classList.add('active');
      page = Number(e.target.id);

      ajaxData(page);
    });
  });

  const prev = document.getElementById('prevActive');
  const next = document.getElementById('nextActive');

  if (prev) {
    prev.addEventListener('click', () => {
      page = Math.floor(page / 10);

      ajaxData(page);
    });
  }
  if (next) {
    next.addEventListener('click', () => {
      page = Math.ceil(page / 10) * 10 + 1;

      ajaxData(page);
    });
  }

  const first = document.getElementById('fisrtActive');
  const last = document.getElementById('lastActive');

  if (first) {
    first.addEventListener('click', () => {
      page = 1;

      ajaxData(page);
    });
  }
  if (last) {
    last.addEventListener('click', () => {
      page = lastPage;

      ajaxData(page);
    });
  }
}
