module Spree
  module Admin
    class AdjustmentsController < ResourceController
      belongs_to 'spree/order', :find_by => :number
      destroy.after :reload_order
      skip_before_filter :load_resource, :only => [:toggle_state, :edit, :update, :destroy]

      def edit
        find_adjustment
        super
      end

      def update
        find_adjustment
        super
      end

      def destroy
        find_adjustment 
        super
      end

      private
      def find_adjustment
        # Need to assign to @object here to keep ResourceController happy
        @adjustment = @object = parent.all_adjustments.find(params[:id])
      end

      def reload_order
        @order.reload
      end
    end
  end
end
