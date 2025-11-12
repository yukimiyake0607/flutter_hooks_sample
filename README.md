# ここで使用するHook

## useState

ローカル状態管理

## useEffect

副作用処理

## useMemorized

重い計算結果のキャッシュ（useEffectの依存配列なしバージョン的な使い方）

## useTextEditingController

TextFieldのコントローラー管理（自動dispose）

## useAnimantionController

アニメーション制御（自動dispose）

## useFocusNode

フォーカス制御（自動dispose）

## useScrollController

スクロール制御（自動dispose）

- useScrollControllerを用意
- useEffectでスクロールされるたびに実行するメソッドと、addListenerを使用してリスナーを登録、removeListenerで削除
- 検知したいListViewにscrollControllerを追加

これで、検知したいListViewでスクロールが起きるたびにaddListenerで登録したメソッドが実行される

## useCallback

関数のメモ化（パフォーマンス最適化）

## useTabController

タブ管理

## usePageController

ページビュー管理

## useListenable / useValueListenable

Listenable監視
