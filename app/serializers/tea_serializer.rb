class TeaSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description, :temperature, :brew_time, :price
end
