class StudentsController < ApplicationController
  
    before_action :set_student, only: %i[show edit update destroy]
    def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  # Creating new student
  def create
    @student = Student.new(
      # first_name: params[:student] [:first_name],
      # last_name: params[:student] [:last_name],
      # email: params[:student] [:email]
      student_params
    )

    if @student.save()
      redirect_to students_path
    else
      render :new
    end
  end

  # View new student
  def show
    set_student
    if @student.nil?
      flash[:alert] = "Student not found."
      redirect_to students_path # Redirect to the index page or another appropriate page
    end
  end

  def edit 
    set_student
  end

  def update 
    set_student
   if  @student.update(student_params)
    redirect_to student_path(@student)
   else
    render :edit
   end
  end
  def destroy
    set_student
    if @student
      @student.destroy
      redirect_to students_path
    else
      flash[:alert] = "Student not found."
      redirect_to students_path 
    end
  end


  #   Requirement params
  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email)
  end
  def set_student
    @student = Student.find_by(id: params[:id])
  end
end
