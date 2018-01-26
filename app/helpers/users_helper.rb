module UsersHelper
  def gravatar_url(user, options = { size: 80 })
    # emailを小文字に
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size] # サイズを引数のサイズに変更
    "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}&d=mm"
  end
end
