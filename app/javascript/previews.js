// 画像ファイルを選択した際にその画像をプレビュー表示。
window.addEventListener('DOMContentLoaded', (event) => {
  document.querySelector('#desk_image').addEventListener('change', previewImage);
});

function previewImage(event) {
  const target = event.target;
  const file = target.files[0];
  const reader = new FileReader();

  reader.onloadend = function () {
    const preview = document.querySelector("#preview");
    if (preview) {
      preview.src = reader.result;
    }
  }

  if (file) {
    reader.readAsDataURL(file);
  }
}
