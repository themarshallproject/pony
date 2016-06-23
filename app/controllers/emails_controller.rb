class EmailsController < ApplicationController
  before_action :set_email, only: [:show, :edit, :update, :destroy, :render_html, :render_preview]

  before_action {
    authorize!
  }

  def render_html
    render html: @email.render
  end

  def render_preview
    render inline: @email.render
  end

  def live_preview
    template = Template.find_by(id: params[:template_id])
    if template.nil?
      render json: { message: 'Invalid Template'}, status: 422 and return false
    end

    email = Email.new(template: template, content: params[:content])
    render json: {
      html: email.render
    }
  end

  # GET /emails
  # GET /emails.json
  def index
    @emails = Email.all
  end

  # GET /emails/1
  # GET /emails/1.json
  def show
  end

  # GET /emails/new
  def new
    @email = Email.new
  end

  # GET /emails/1/edit
  def edit
  end

  # POST /emails
  # POST /emails.json
  def create
    @email = Email.new(email_params)

    respond_to do |format|
      if @email.save
        format.html { redirect_to edit_email_path(@email), notice: 'Email was successfully created.' }
        format.json { render :show, status: :created, location: @email }
      else
        format.html { render :new }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emails/1
  # PATCH/PUT /emails/1.json
  def update
    respond_to do |format|
      if @email.update(email_params)
        format.html { redirect_to edit_email_path(@email), notice: 'Email was successfully updated.' }
        format.json { render :show, status: :ok, location: @email }
      else
        format.html { render :edit }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emails/1
  # DELETE /emails/1.json
  def destroy
    @email.destroy
    respond_to do |format|
      format.html { redirect_to emails_url, notice: 'Email was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email
      @email = Email.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_params
      params.require(:email).permit(:template_id, :title, :content)
    end
end
