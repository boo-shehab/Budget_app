require 'rails_helper'

RSpec.describe Entity, type: :model do
  user = User.create(name: 'test', email: 'ahmed@gmail.com', password: 'ahmed')
  subject { Entity.new(author_id: user.id, name: 'hello', amount: 3) }
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'amount should be present' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'amount greater than zero' do
    subject.amount = -1
    expect(subject).to_not be_valid
  end

  it 'amount should be integer' do
    subject.amount = 'a'
    expect(subject).to_not be_valid
  end
end
