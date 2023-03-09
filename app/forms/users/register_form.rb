module Users
  class RegisterForm < BaseForm
    attr_accessor :name, :password

    validates :name, presence: true
    validates :password, presence: true, format: /\A[^ ]{6,}\z/

    validate :uniqueness_name

    private

    def uniqueness_name
      errors.add(:name, 'already taken!') if User.exists?(name:)
    end
  end
end
