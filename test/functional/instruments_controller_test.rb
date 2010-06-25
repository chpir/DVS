require 'test_helper'

class InstrumentsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Instrument.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Instrument.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Instrument.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to instrument_url(assigns(:instrument))
  end
  
  def test_edit
    get :edit, :id => Instrument.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Instrument.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Instrument.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Instrument.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Instrument.first
    assert_redirected_to instrument_url(assigns(:instrument))
  end
  
  def test_destroy
    instrument = Instrument.first
    delete :destroy, :id => instrument
    assert_redirected_to instruments_url
    assert !Instrument.exists?(instrument.id)
  end
end
