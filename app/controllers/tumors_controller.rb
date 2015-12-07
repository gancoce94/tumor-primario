class TumorsController < ApplicationController
  before_action :set_tumor, only: [:show, :edit, :update, :destroy]
  include Clasificar
  # GET /tumors
  # GET /tumors.json

  def index
    @tumors = Tumor.all    
  end

  # GET /tumors/1
  # GET /tumors/1.json
  def show
  end

  # GET /tumors/new
  def new
    @tumor = Tumor.new
  end

  # GET /tumors/1/edit
  def edit
  end

  # POST /tumors
  # POST /tumors.json
  def create
    tp = tumor_params
    tp[:tipo_tumor], ad = tipo(tp)
    @tumor = Tumor.new(tp)

    respond_to do |format|
      if @tumor.save
        format.html { redirect_to @tumor, notice: 'Tumor was successfully created.'+ad }
        format.json { render :show, status: :created, location: @tumor }
      else
        format.html { render :new }
        format.json { render json: @tumor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tumors/1
  # PATCH/PUT /tumors/1.json
  def update
    tp = tumor_params
    tp[:tipo_tumor], ad = tipo(tp)
    respond_to do |format|
      if @tumor.update(tp)
        format.html { redirect_to @tumor, notice: 'Tumor was successfully updated.'+ad }
        format.json { render :show, status: :ok, location: @tumor }
      else
        format.html { render :edit }
        format.json { render json: @tumor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tumors/1
  # DELETE /tumors/1.json
  def destroy
    @tumor.destroy
    respond_to do |format|
      format.html { redirect_to tumors_url, notice: 'Tumor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tumor
      @tumor = Tumor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tumor_params
      params.require(:tumor).permit(:edad, :genero, :tipo_histologico, :grado_tumor, :hueso, :medula_osea, :pulmon, :pleura, :peritoneum, :higado, :cerebro, :piel, :cuello, :supraclavicular, :axilar, :mediastino, :abdominal, :tipo_tumor, :name, :email)
    end
end
