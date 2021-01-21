require 'rails_helper'
  
  describe 'validation' do
    it 'is valid with all attributes' do
      expect(FactoryBot.build(:task)).to be_valid
    end
    
    it 'is invalid without title' do
      task = Task.new(title: nil)
      task.valid?
      expect(task.errors[:title]).to include("can't be blank") 
    end
    
    it 'is invalid without status' do
      task = Task.new(status: nil)
      task.valid?
      expect(task.errors[:status]).to include("can't be blank")
    end
    
    it 'is invalid with a duplicate title' do
      user = User.create(:user)
      user.tasks.create(:task)
      new_task = user.tasks.build(:task)
      new_task.valid?
      expect(new_task.errors[:title]).to include("has already been taken")
    end

    it 'is valid with another title' do end
  end
