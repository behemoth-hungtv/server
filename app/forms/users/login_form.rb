module Users
  class LoginForm < BaseForm
    attr_accessor :name, :password

    validates :name, presence: true
    validates :password, presence: true, format: /\A[^ ]{6,}\z/
  end
end
