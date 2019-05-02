class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories

  def categories_attribute=(category_attributes)
    category_attributes.values.each do |category_attribute|

      #Do not create category if it does not have name
      if category_attribute[:name].present?
        category = Categori.find_or_create_by(category_attribute)

        #Do not create duplicate
        if !self.categories.include?(category)
          #joint model - this build category
          self.post_categories.build(category: category)
        end
      end
    end

  end




end
