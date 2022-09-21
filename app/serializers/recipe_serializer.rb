class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title, :user_id, :instructions, :minutes_to_complete

  belongs_to :user
end
