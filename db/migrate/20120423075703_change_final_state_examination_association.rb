class ChangeFinalStateExaminationAssociation < ActiveRecord::Migration
  def self.up
    FinalStateExamination.find_each do |final_state_examination|
      if final_state_examination.title?
        discipline = Discipline.find_or_create_by_title(final_state_examination.title)
        discipline.update_attributes! :eng_title => final_state_examination.eng_title

        final_state_examination.update_attributes! :discipline_id => discipline.id, :discipline_term => discipline.title, :title => nil
      else
        puts "FinalStateExamination with id #{final_state_examination.id} hasn't title"
      end
    end
  end

  def self.down
  end
end
