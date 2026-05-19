module PostsHelper
  # マークダウンをHTMLに変換する処理
  def markdown(text)
    # 変換時のオプションを設定
    options = {
      filter_html: true,  # 悪意のあるHTMLタグを埋め込まれないようにする
      hard_wrap:   true,  # 改行をそのまま反映
      link_attributes: { rel: 'nofollow', target: "_blank" }
    }

    extensions = {
      autolink:           true, # URLを自動でリンク化する
      no_intra_emphasis:  true, # 単語内の_を強調とみなさないようにする
      fenced_code_blocks: true, # '''で囲むコードブロックを有効にする
      space_after_headers: true # #の後にスペースを必須にする
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    # 安全なHTMLとして出力
    sanitize(markdown.render(text)).html_safe
  end
end
