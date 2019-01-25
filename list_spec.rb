require "rspec"
require "rspec-given"
require_relative "list"
require_relative "task"

describe List do
  # Your specs here
  let(:title) {"urgently task to get to"}
  let(:description) {"Walk the beast"}
  let(:tasks) {[Task.new(description)]}
  let(:list) {List.new(title, tasks)}

  context "#initialize" do 
    it "it will initialize the variable of @title and @task" do 
      expect(list).to be_kind_of(List)
    end
  end

  context "#add_task" do
    it "adding task, so increment should be added by 1" do 
      list.add_task("dave")
      expect(list.tasks.include?("dave")).to eq(true)
    end

    it "argument error, receiving more than it needs" do 
      expect{list.add_task("hades" ,"zeus")}.to raise_error(ArgumentError)
    end   
    
    it "receives type error" do 
      expect{list.add_task(1)}.to raise_error(TypeError, 'qwe')
    end
  end

  context "#complete_task" do 
    it "to change the task to completed" do
      list.complete_task(0)
      expect(tasks[0].complete?).to eq(true)
    end
  end 

  context "#delete_task" do 
    it "to delete the task from listing" do 
      list.delete_task(0)
      expect(tasks[0].nil?).to eq(true)
    end
  end 

  context "#completed_tasks" do 
    it "to check if the task is completed" do 
      list.complete_task(0)
      list.completed_tasks
      expect(list.completed_tasks.size).to eq(1)
    end
  end
  
  context "#incomplete_tasks" do 
    it "check for incompleted tasks" do 
      list.completed_tasks
      expect(list.completed_tasks.size).to eq(0)    
    end
  end
end 
