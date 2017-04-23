class PostasController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /postas
  # GET /postas.json
  def index
    @postas = Post.all
  end

  # GET /postas/1
  # GET /postas/1.json
  def show
  end

  # GET /postas/new
  def new
    @post = Post.new
  end

  # GET /postas/1/edit
  def edit
  end

  # POST /postas
  # POST /postas.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /postas/1
  # PATCH/PUT /postas/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postas/1
  # DELETE /postas/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to postas_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
