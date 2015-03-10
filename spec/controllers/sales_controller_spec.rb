require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe SalesController, type: :controller do
  
  # This should return the minimal set of attributes required to create a valid
  # Sale. As you add validations to Sale, be sure to
  # adjust the attributes here as well.

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SalesController. Be sure to keep this updated too.
  let(:valid_session) { {} }
  before(:each) { login_user }

  describe "GET index" do
    it "assigns all sales as @sales" do
      sale = create(:sale)
      get :index, {}
      expect(assigns(:sales)).to eq([sale])
    end
  end

  describe "GET show" do
    it "assigns the requested sale as @sale" do
      sale = create(:sale)
      get :show, {:id => sale.to_param}
      expect(assigns(:sale)).to eq(sale)
    end
  end

  describe "GET new" do
    it "assigns a new sale as @sale" do
      get :new, {}
      expect(assigns(:sale)).to be_a_new(Sale)
    end
  end

  describe "GET edit" do
    it "assigns the requested sale as @sale" do
      sale = create(:sale)
      get :edit, {:id => sale.to_param}
      expect(assigns(:sale)).to eq(sale)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Sale" do
        product = create(:product)
        expect {
          post :create, {:product_id => product.id}
        }.to change(Sale, :count).by(1)
      end

      it "assigns a newly created sale as @sale" do
        product = create(:product)
        post :create, {:product_id => product.id}
        expect(assigns(:sale)).to be_a(Sale)
      end

      it "responds correctly to a new sale" do
        product = create(:product)
        post :create, {:product_id => product.id}
        expect(response.status).to eq(200)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved sale as @sale" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Sale).to receive(:save).and_return(false)
        post :create, {:sale => { "product_id" => "invalid value" }}
        expect(assigns(:sale)).to be_a_new(Sale)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Sale).to receive(:save).and_return(false)
        post :create, {:sale => { "product_id" => "invalid value" }}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested sale" do
        product = create(:product)
        sale = create(:sale)
        # Assuming there are no other sales in the database, this
        # specifies that the Sale created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        product_2 = create(:product)
        expect_any_instance_of(Sale).to receive(:update).with({ "product_id" => product_2.id.to_s })
        put :update, {:id => sale.to_param, :product_id => product_2.id.to_s }
      end

      it "assigns the requested sale as @sale" do
        sale = create(:sale)
        put :update, {:id => sale.to_param, :sale => attributes_for(:sale)}
        expect(assigns(:sale)).to eq(sale)
      end

      it "redirects to the sale" do
        sale = create(:sale)
        put :update, {:id => sale.to_param, :sale => attributes_for(:sale)}
        expect(response).to redirect_to(sale)
      end
    end

    describe "with invalid params" do
      it "assigns the sale as @sale" do
        sale = create(:sale)
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Sale).to receive(:save).and_return(false)
        put :update, {:id => sale.to_param, :sale => { "product_id" => "invalid value" }}
        expect(assigns(:sale)).to eq(sale)
      end

      it "re-renders the 'edit' template" do
        sale = create(:sale)
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Sale).to receive(:save).and_return(false)
        put :update, {:id => sale.to_param, :sale => { "product_id" => "invalid value" }}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested sale" do
      sale = create(:sale)
      expect {
        delete :destroy, {:id => sale.to_param}
      }.to change(Sale, :count).by(-1)
    end

    it "redirects to the sales list" do
      sale = create(:sale)
      delete :destroy, {:id => sale.to_param}
      expect(response).to redirect_to(sales_url)
    end
  end

end
