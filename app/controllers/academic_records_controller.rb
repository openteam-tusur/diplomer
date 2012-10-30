class AcademicRecordsController < CrudController
  def show
    show!{
      @course = @academic_record.courses.new
    }
  end

  def pdf
    @academic_record = AcademicRecord.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "#{@academic_record}-#{@academic_record.student}",
          :stylesheets => ["print_academic_records"]
      end
    end
  end

  def debug
    @academic_record = AcademicRecord.find(params[:id])
    respond_to do |format|
      format.html
    end
  end
end
