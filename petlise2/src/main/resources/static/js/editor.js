var toolbarOptions = [
	[{ size: ['small', false, 'large', 'huge'] }],
	[{ font: [] }],
	['bold', 'italic', 'underline', 'strike'],
	['blockquote', 'code-block'],
	[{ align: [] }],
	[{ list: 'ordered' }, { list: 'bullet' }],
	[{ indent: '-1' }, { indent: '+1' }],
	[{ color: [] }, { background: [] }],
	['image']
];

var quill = new Quill('#editor', {
	modules: {
		toolbar: toolbarOptions
	},
	placeholder:
		'내용을 입력해주세요\n\n* 저작권 침해, 음란, 청소년 유해물, 기타 위법자료 등을 게시할 경우 게시물은 경고 없이 삭제됩니다.',
	theme: 'snow'
});

quill.getModule('toolbar').addHandler('image', function() {
	handleImage();
});

function handleImage() {
	const input = document.createElement('input');

	input.setAttribute('type', 'file');
	input.setAttribute('accept', 'image/*');
	input.click();

	input.addEventListener('change', function() {
		const file = input.files?.[0];
		if (!file) return;

		const formData = new FormData();
		formData.append('image', file);

		$.ajax({
			url: "/api/image-upload",
			type: "post",
			data: formData,
			enctype: 'multipart/form-data',
			contentType: false,
			processData: false,
			success: function(data) {
				const url = `https://storage.googleapis.com/${data}`;

				const range = quill.getSelection();
				quill.insertEmbed(range.index, 'image', url);
			},
			error: function(error) {
				console.log(error);
			}
		})
	})
}