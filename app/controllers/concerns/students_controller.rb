class StudentsController < ApplicationController
    def index
        @students = Student.all
    end

    def new
        @student = Student.new
    end

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
    def show
        @student = Student.find_by(id: params[:id])
      
        if @student.nil?
          flash[:alert] = "Student not found."
          redirect_to students_path # Redirect to the index page or another appropriate page
        end
      end
      
    private 
    def student_params
    params.require(:student).permit(:first_name, :last_name, :email)
    end
end
