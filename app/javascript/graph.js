// chartkickライブラリからChartkickというオブジェクトをインポート
import Chartkick from "chartkick"

// グラフの描画をトリガーする関数
function triggerCharts() {
    //  windowオブジェクト（ブラウザでのグローバルオブジェクト）にChartkickが存在するかをチェック
    if (window.Chartkick) {
        // Chartkick.eachChartメソッドを使って、ページ上のすべてのChartkickグラフに対して特定の処理を行う。ここでは、それぞれのグラフに対して無名関数が実行される。
        Chartkick.eachChart( function(chart) {
        // redrawメソッドを呼び出して、グラフを再描画する。これは、グラフのデータが更新されたときや、グラフを含むDOMが変更されたときにグラフが正しく表示されるようにするために使われる。
        chart.redraw();
        });
    }
}

// Turboのページ遷移が完了したときにグラフを再描画する
document.addEventListener('turbo:load', triggerCharts);
// documentにイベントリスナーを追加している。turbo:loadというイベントが発火したときに、triggerCharts関数を実行するように設定している。
// これにより、Turboを使用しているページでナビゲーションが行われた際に自動的にグラフが再描画されるようになる。