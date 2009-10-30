module Braspag
  module Rails
    module FormHelper
      def braspag_confirmation(&block)
        render :layout => "braspag/confirmation", &block
      end

      def braspag_form(&block)
        render :layout => "braspag/form", &block
      end
    end
  end
end

module ActionView
  class Base
    include Braspag::Rails::FormHelper
  end
end
