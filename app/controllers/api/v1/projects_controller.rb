class Api::V1::ProjectsController < Api::V1::ApiController

	def index
		@projects = Project.all
		render json: @projects
	end

	def create
		@project = Project.new(project_params)
		if @project.save
			render json: {
				notice: "Successfully created the project",
				project: @project
			}
		else
			render json: {
				errors: @project.errors.full_messages,
				reason: "validation failed"
			}
		end
	end

	def show
		@project = Project.find(params[:id])
		render json: {
			id: @project.id,
			name: @project.name,
			status: @project.status,
			client: @project.client.name,
			start_date: @project.start_date
		}
	end

	def update
		@project = Project.find(params[:id])
		if @project.update_attributes(project_params)
			render json: {
				notice: "Successfully updated the project",
				project: @project
			}
		else
			render json: {
				errors: @project.errors.full_messages
			}
		end
	end
	def destroy
		@project = Project.find(params[:id])
		@project.destroy
		render json: {
			notice: "Successfully destroyed the project",
			project: {

				name: @project.name
			}
		}
	end

	private
	def project_params
		params[:project].permit(:name, :client_id, :status, :start_date)
	end
end