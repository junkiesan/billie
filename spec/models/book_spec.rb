require 'rails_helper'

RSpec.describe Book, type: :model do
  subject { 
    described_class.new(title: "Harry Potter",
                        author: "J.K. Rowling",
                        genre: "Fantastic",
                        description: "Harry PotterHarry PotterHarry PotterHarry PotterHarry PotterHarry PotterHarry PotterHarry Potter",
                        user_id: User.new(email: "potter@gmail.com", password: "123456")
                        )
   }
  context "#initialize" do
    it { expect(subject).to be_valid }

    it "title should be valid" do
      subject.title = nil
      expect(subject).to_not be_valid
    end 

    it "author should be valid" do
      subject.author = nil
      expect(subject).to_not be_valid
    end 

    it "genre should be valid" do
      subject.genre = nil
      expect(subject).to_not be_valid
    end 

    it "description should be valid" do
      subject.description = nil
      expect(subject).to_not be_valid
    end 
  end

  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
  end

  describe 'validations' do
    context 'it validates title' do
      it { is_expected.to validate_presence_of(:title) }
    end
    context 'it validates author' do
      it { is_expected.to validate_presence_of(:author) }
    end
    context 'it validates genre' do
      it { is_expected.to validate_presence_of(:genre) }
    end
    context 'it validates description' do
      it { is_expected.to validate_presence_of(:description) }
    end
  end

  p FactoryBot.create :book
end
