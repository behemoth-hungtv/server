class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :gender # trả về cái mà chúng ta muốn
end
