class OrderProductSerializer < ActiveModel::Serializer
  # attributes :id, :total
  def include_user?
    false
  end
end
