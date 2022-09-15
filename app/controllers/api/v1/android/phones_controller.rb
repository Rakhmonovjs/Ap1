class Api::V1::Android::PhonesController < ApiController
    before_action :set_phone, only: %i[ show ]
    skip_before_action :doorkeeper_authorize!
     before_action :is_admin?
    # GET /phones or /phones.json
    def index
      @phones = Phone.all
      render json: @phones
    end
  
    # GET /phones/1 or /phones/1.json
    def show
        render json: @phones 

    end
  
   
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_phone
        @phone = Phone.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def phone_params
        params.require(:phone)
      end
  end
  