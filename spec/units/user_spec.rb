require 'user'
require 'reset_test_database'

describe User do
  describe '#add' do
    it 'stores email and name' do
      PG.connect(dbname: 'makersbnb_test')

      user = User.add(name: 'Hannah', email: 'test@gmail.com', password: 'password123')

      expect(user.name).to eq 'Hannah'
      expect(user.email).to eq 'test@gmail.com'
    end
  end

  describe '#exist' do
    it 'returns true if the email entered is attached to an account' do
      PG.connect(dbname: 'makersbnb_test')

      User.add(name: 'Hannah', email: 'test@gmail.com', password: 'password123')

      expect(User.exist?('test@gmail.com', 'password123')).to eq true
    end
  end
end
