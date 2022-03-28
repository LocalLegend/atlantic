class Runner
  include Aws::Record
  include ActiveModel::Validations

  set_table_name(ENV['DYNANODB_TABLE_NAME_RUNNERS'])

  integer_attr :id, hash_key: true
  string_attr :team

  string_attr :first_name
  string_attr :last_name
  string_attr :sex
  string_attr :old
  string_attr :nationality_code
  string_attr :nationality_label

  string_attr :utmb_url

  integer_attr :race_count, default_value: 0
  string_attr :race_last
  integer_attr :rating, default_value: 0

  validates :id, presence: { message: 'require' }

  validates :first_name, presence: { message: 'require' }
  validates :first_name, format: {  with: /\A[a-zA-Z]{2,50}\z/,
                                    code: :invalid_first_name_format,
                                    message: 'not_valid_format',
  }
  validates :first_name, length: { in: 2..50, message: 'must_be:2..50' }

  validates :last_name, presence: { message: 'require' }
  validates :last_name, length: { minimum: 2, maximum: 50, message: 'must_be:2..50' }
  validates :last_name, format: {  with: /\A[a-zA-Z]{2,50}\z/,
                                   code: :invalid_last_name_format,
                                   message: 'not_valid_format',
}

  validates :utmb_url, length: { minimum: 10, maximum: 240, message: 'must_be:10..240' }

  # def self.all
  # Runner.scan.map do |m|
  #   p "#{m.first_name} #{m.last_name} = #{m.rating}"
  # end
  # end

  def self.locallegends
    Runner.scan({
      table_name: ENV['DYNANODB_TABLE_NAME_RUNNERS'],

      filter_expression: '#team = :team',
      expression_attribute_names: {
        '#team' => 'team',
      },
      expression_attribute_values: {
        ':team' => 'locallegend',
      },
    })
  end
end
