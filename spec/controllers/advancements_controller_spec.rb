require 'rails_helper'

RSpec.describe AdvancementsController, type: :controller do

  # before(:all) do
  #   @user = User.create(email: "boy@scout.com", password: "password", first_name: "Bob", last_name: "Billy")
  #   @advancement = Advancement.create(user_id: @user.id)
  # end

  describe "GET #index" do
    before { get :index }

    it { should respond_with(200) }
    it { should render_template('index') }
  end

  # describe "GET #show" do
  #   @user = User.create(email: "boy@scout.com", password: "password", first_name: "Bob", last_name: "Billy")
  #   @advancement = Advancement.create(user_id: @user.id)
  #   before { get :show, params: {id: @advancement.id} }
  #
  #   it { should respond_with(200) }
  #   it { should render_template('show') }
  # end

  describe "GET #new" do
    before { get :new }

    it { should respond_with(200) }
    it { should render_template('new') }
  end

  # describe "GET #edit" do
  #   before { get :edit }
  #
  #   it { should respond_with(200) }
  #   it { should render_template('edit') }
  # end


end
