require 'rails_helper'

RSpec.describe AdvancementsController, type: :controller do

  before(:all) do
    @user = User.create(email: "boy@scout.com", password: "password", first_name: "Boy", last_name: "Scout", id: 2)
    @advancement = Advancement.create(user_id: 2, id: 3)
  end

  describe "GET #index" do
    before { get :index }

    it { should respond_with(200) }
    it { should render_template('index') }
  end

  describe "GET #show" do
    before { get :show, params: {id: @advancement.id} }
    it { should respond_with(200) }
    it { should render_template('show') }
  end

  describe "GET #new" do
    before { get :new }

    it { should respond_with(200) }
    it { should render_template('new') }
  end

  describe "GET #edit" do
    before { get :edit, params: {id: @advancement.id} }

    it { should respond_with(200) }
    it { should render_template('edit') }
  end

  describe "GET #create" do
    before { @user2 = User.create(email: "boy2@scout.com", password: "password", first_name: "Boy2", last_name: "Scout", id: 3) }
    before { login_with(@user2) }

    before { post :create, params: { advancement: FactoryGirl.attributes_for(:advancement) } }

    it { should respond_with(302) }
    # it { should redirect_to(advancements_path)}
  end
end
