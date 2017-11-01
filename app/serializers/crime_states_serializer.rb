class CrimeStatesSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :cities do
    @object.cities.order(:id)
  end
end
