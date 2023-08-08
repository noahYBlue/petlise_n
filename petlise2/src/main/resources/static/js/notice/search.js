function debounce(callback, limit) {
  let timer;

  return function () {
    clearTimeout(timer);
    timer = setTimeout(() => {
      page = 1;

      callback(this.value, page);
    }, limit);
  };
}

searchInput.addEventListener(
  'keyup',
  debounce((value, page) => {
    ajaxData(value, page);
  }, 300)
);
