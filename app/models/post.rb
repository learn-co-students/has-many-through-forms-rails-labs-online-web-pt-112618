class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories
  # could refactor a reject_if here to make sure no duplicate categories?

  def categories_attributes=(category_hashes)
    category_hashes.each do |i, category_attributes|
        category = Category.find_or_create_by(name: category_attributes[:name])
        if !self.categories.include?(category)
        #self.categories << category
          self.post_categories.build(category: category)
        end
    end
  end

end
