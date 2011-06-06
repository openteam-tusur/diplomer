# encoding: utf-8

class DiplomasController < CrudController
  def pdf
    @diploma = Diploma.find(params[:id])
    respond_to do |format|
      format.pdf do
        render :pdf => "#{@diploma}-#{@diploma.student}"
      end
    end
  end
end
