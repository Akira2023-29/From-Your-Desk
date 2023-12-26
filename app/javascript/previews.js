// 画像ファイルを選択した際にその画像をプレビュー表示。

// 第一引数：イベント名。第二引数；イベント発生時に実行する関数。
document.addEventListener('turbo:load', (event) => {
  // id=desk_imageの要素が存在する場合、input変数に格納しchangeイベントリスナーを追加。
  const deskInput = document.querySelector('#desk_image');
  // id=avatar_imageの要素が存在する場合、input変数に格納しchangeイベントリスナーを追加。
  const avatarInput = document.querySelector('#avatar_image');

  if (deskInput) {
    // ユーザーが新しい画像を選択するたびにpreviewImage関数を呼す。(第一引数：イベント名。第二引数；イベント発生時に実行する関数。)
    deskInput.addEventListener('change', previewImage);
  }

  if (avatarInput) {
    // ユーザーが新しい画像を選択するたびにpreviewImage関数を呼す。(第一引数：イベント名。第二引数；イベント発生時に実行する関数。)
    avatarInput.addEventListener('change', previewImage);
  }
});

// previewImage関数を定義。ユーザーが新しい画像を選択するたびに呼び出される。
function previewImage(event) {
  // イベントが発生した要素（この場合<input要素>をtarget定数に格納。
  const target = event.target;
  // 選択されたファイル（<input>要素のfiles配列の最初の要素）をfileという定数に格納。
  const file = target.files[0];
  // 新しいFileReaderオブジェクトを作成し、readerという定数に格納。このFileReaderオブジェクトは、ファイルのデータを読み込むために使用される。
  const reader = new FileReader();

  // FileReaderオブジェクトのonloadendプロパティを、新しい関数に設定。この関数はFileReaderがファイルの読み込みを終了したときに呼び出される。
  reader.onloadend = function () {
    const preview = document.querySelector("#preview");
    // preview要素が存在する場合、そのsrc属性をFileReaderの結果（読み込んだファイルのデータURL）に設定。これにより、選択された画像のプレビューが表示される。
    if (preview) {
      preview.src = reader.result;
    }
  }

  // 選択されたファイルが存在する場合、FileReaderにそのファイルをデータURLとして読み込むように指示。これにより、reader.onloadend関数が呼び出され、プレビューが表示される。
  if (file) {
    reader.readAsDataURL(file);
  }
}