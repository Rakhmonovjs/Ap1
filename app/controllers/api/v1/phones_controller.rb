class Api::V1::PhonesController < ApiController
    before_action :set_phone, only: %i[ show edit update destroy ]
    # before_action :authenticate_user!
  
    # GET /phones or /phones.json
    def index
      @phones = Phone.all
      render json: @phones
    end
  
    # GET /phones/1 or /phones/1.json
    def show
    end
  
    # GET /phones/new
    def new
      @phone = Phone.new
    end
  
    # GET /phones/1/edit
    def edit
    end
  
    # POST /phones or /phones.json
    def create
        @phone = Phone.new(phone_params)
          if @phone.save
            # format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
            render json: @phone, status: :created, location: @phone
          else
            # format.html { render :new, status: :unprocessable_entity }
            render json: @phone.errors, status: :unprocessable_entity
          end
        end
  
    # PATCH/PUT /phones/1 or /phones/1.json
    def update
        if @phone.update(phone_params)
      render json: @phone
    else
      render json: @phone.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /phones/1 or /phones/1.json
    def destroy
        @phone.destroy
        
        if @phone.destroy
          head :no_content
        end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_phone
        @phone = Phone.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def phone_params
        params.require(:phone).permit(:title, :body)
      end
  end
  