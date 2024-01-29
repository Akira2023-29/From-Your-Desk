document.addEventListener('turbo:load', setupImagePreview);
document.addEventListener('turbo:render', setupImagePreview);

// setupImagePreview関数を作成
function setupImagePreview() {
  const deskInput = document.querySelector('#desk_image');
  const avatarInput = document.querySelector('#avatar_image');
  const itemInput = document.querySelector('#item_image');

  if (deskInput) {
    deskInput.removeEventListener('change', previewImage);
    deskInput.addEventListener('change', previewImage);
  }

  if (avatarInput) {
    avatarInput.removeEventListener('change', previewImage);
    avatarInput.addEventListener('change', previewImage);
  }

  if (itemInput) {
    itemInput.removeEventListener('change', previewImage);
    itemInput.addEventListener('change', previewImage);
  }
}

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