RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is invalid without a valid email' do
      Fabricate.build :user, email: 'name@mail.com' do |user|
        user.valid?
        explect(user).to model_have_error_on_field :error
      end
    end
  end
end
