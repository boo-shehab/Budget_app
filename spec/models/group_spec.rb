require 'rails_helper'

RSpec.describe Group, type: :model do
  user = User.create(name: 'test', email: 'ahmed@gmail.com', password: 'ahmed')
  subject { Group.new(user_id: user.id, name: 'group', icon: 'icon') }

  before { subject.save }

  it 'name should be present' do
    expect(subject).to_not be_valid
  end

  it 'icon should be present' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end
end
