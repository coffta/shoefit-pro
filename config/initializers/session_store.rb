# セッションの有効期限を1日に設定
Rails.application.config.session_store :cookie_store, expire_after: 1.day