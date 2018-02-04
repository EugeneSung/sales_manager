class User < ActiveRecord::Base
  has_secure_password
  has_many :orders
  has_many :clients

  def slug
    username.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    self.all.detect {|s| slug == s.slug}
  end

end
