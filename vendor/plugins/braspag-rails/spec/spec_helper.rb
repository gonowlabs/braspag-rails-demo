$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'rubygems'
require 'braspag/rails'
require 'spec'
require 'ruby-debug'
require 'braspag'

require 'rspec_hpricot_matchers'
Spec::Runner.configure do |config|
  config.include(RspecHpricotMatchers)
end

def form_from_partial(name)
  file = File.expand_path(File.dirname(__FILE__) + "/../app/views/braspag/_#{name}.html.erb")
  Tilt::ERBTemplate.new(file).render(self) do
    "<input name='custom'>"
  end
end

require 'erb'
require 'tilt'
require 'action_view'
include ActionView::Helpers::FormHelper
include ActionView::Helpers::FormTagHelper
include ActionView::Helpers::UrlHelper
include ActionView::Helpers::TagHelper
include ActionView::Helpers::TextHelper
include ActionView::Helpers::RecordIdentificationHelper
include ActionView::Helpers::DateHelper
include ActionView::Helpers::CaptureHelper

def output_buffer=(buffer)
  @_out_buf = buffer
end
def output_buffer
  @_out_buf
end
def protect_against_forgery?; end

class ApplicationController
  def params
    "params"
  end
end

require File.join(File.dirname(__FILE__), '..', 'app', 'controllers', 'braspag_controller')

RAILS_ENV = "test"
RAILS_ROOT = File.join(File.dirname(__FILE__))
