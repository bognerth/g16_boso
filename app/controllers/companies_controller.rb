class CompaniesController < ApplicationController

  before_filter :authorize #, except: [:index, :show]
  
  def index
    if @current_user.edit?
      if params[:filter]
        @companies = Company.where(params[:filter].to_sym => true)
      else
        @companies = Company.order(:title)
      end
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @companies }
        format.csv { render text: @companies.to_csv }
        format.xls
      end
    else
      @companies = Company.where(:interested => true)
      render "index2"
    end
  end

  def import
    Company.import(params[:file])
    redirect_to root_url, notice: "Datei importiert."
  end

  def destroy_table
    Company.delete_all
    redirect_to root_url, notice: "Tabelle Betriebe wurde geleert."
  end

  def show
    @company = Company.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company }
    end
  end

  # GET /companies/new
  # GET /companies/new.json
  def new
    if params[:company_id]
      company_hash = {}
      c = Company.where(id: params[:company_id]).first
      Company.accessible_attributes.each do |att|
        company_hash[att] = c[att.to_sym] unless att.empty?
      end
      @company = Company.new(company_hash)
    else
      @company = Company.new
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @company }
    end
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(params[:company])

    respond_to do |format|
      if @company.save
        format.html { redirect_to companies_url, notice: 'Company was successfully created.' }
        format.json { render json: @company, status: :created, location: @company }
      else
        format.html { render action: "new" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /companies/1
  # PUT /companies/1.json
  def update
    @company = Company.find(params[:id])

    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html { redirect_to companies_url, notice: 'Company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company = Company.find(params[:id])
    @company.destroy

    respond_to do |format|
      format.html { redirect_to companies_url }
      format.json { head :no_content }
    end
  end
end
