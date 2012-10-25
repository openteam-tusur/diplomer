class AcademicRecordsController < CrudController
  def show
    show!{
      @course = @academic_record.courses.new
    }
  end
end
