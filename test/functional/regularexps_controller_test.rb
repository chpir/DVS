require 'test_helper'

class RegularexpsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Regularexp.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Regularexp.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Regularexp.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to regularexp_url(assigns(:regularexp))
  end
  
  def test_edit
    get :edit, :id => Regularexp.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Regularexp.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Regularexp.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Regularexp.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Regularexp.first
    assert_redirected_to regularexp_url(assigns(:regularexp))
  end
  
  def test_destroy
    regularexp = Regularexp.first
    delete :destroy, :id => regularexp
    assert_redirected_to regularexps_url
    assert !Regularexp.exists?(regularexp.id)
  end
end
