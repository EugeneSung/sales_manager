class Client < ActiveRecord::Base
  belongs_to :user
  has_many :orders


  def slug
    username.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    self.all.detect {|s| slug == s.slug}
  end

end
