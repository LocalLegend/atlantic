class RunnerSerializer
  include JSONAPI::Serializer

  set_type :runner  # optional
  set_id :id # optional

  set_key_transform :camel_lower

  attributes :id,
             :team,
             :sex,
             :old,
             :utmb_url,
             :race_count,
             :race_last,
             :rating

  attribute :first_name do |object|
    object.first_name.capitalize
  end

  attribute :last_name do |object|
    object.last_name.capitalize
  end

  attribute :sex do |object|
    object.sex == 'H' ? 'М' : 'Ж'
  end
end
