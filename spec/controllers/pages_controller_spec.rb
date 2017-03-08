require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe "GET #index" do
    before { get :index }
    it { should respond_with(200) }
    it { should render_template('index') }
  end
  describe "GET #troop" do
    before { get :troop }
    it { should respond_with(200) }
    it { should render_template('troop') }
  end
  describe "GET #patrol" do
    before { get :patrol }
    it { should respond_with(200) }
    it { should render_template('patrol') }
  end
end
