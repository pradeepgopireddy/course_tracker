class Api::V1::ClientsController < Api::V1::ApiController
	def index
		@clients = Client.all
		render json: @clients #multiple objects return as array of  hashes (json)
	end
	#post - localhost:3000/api/v1/clients
	def create
		@client = Client.new(client_params)
		if @client.save
			render json: @client # single object return as hash (json)
		else
			render json: { errors: @client.errors.full_messages, reason: "validation failed"} # error in saving, return as a hash (json)
		end
	end
	#get - localhost:3000/api/v1/clients/:id
	def show
		@client = Client.find(params[:id])
		render json: @client 
	end
	#patch - localhost:3000/api/v1/clients/:id
	def update
		@client = Client.find(params[:id])
		if @client.update_attributes(client_params)
			render json: {
				notice: "Successfully updated the client",
				client: @client
			}
		else
			render json: {
				errors: @client.errors.full_messages,
				reason: "validation failed"
			}
		end
	end
	#delete - localhost:3000/api/v1/clients/:id
	def destroy
		@client = Client.find(params[:id])
		@client.destroy
		render json: {
			notice: "Successfully deleted the client",
			client: {
				id: @client.id,
				name: @client.name
			} 
		}
	end

	private
	def client_params
		params[:client].permit(:name, :email, :company)
	end
end